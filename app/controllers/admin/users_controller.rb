class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, only: %i[index new create]
  before_action :authenticate_user_or_admin!, except: %i[index new create]
  before_action :set_user, only: %i[edit update destroy]

  layout "admin"

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/:id/edit
  def edit
  end

  # GET /admin/profile
  def profile
    @object = current_user
  end

  # GET /admin/change_password
  def change_password
    if admin_updating_other_user_password?
      handle_admin_password_update
    else
      @object = current_user
    end
  end

  # PATCH /admin/update_profile
  def update_profile
    if current_user.update(profile_params)
      redirect_to admin_profile_path, notice: "Perfil actualizado correctamente"
    else
      @object = current_user
      render :profile, status: :unprocessable_entity
    end
  end

  # PATCH /admin/update_password
  def update_password
    if admin_updating_other_user_password?
      handle_admin_password_update
    else
      handle_own_password_update
    end
  end

  # POST /admin/users
  def create
    @user = User.new(user_params)
    @user.role = "editor"

    if create_user_with_temp_password
      redirect_to admin_users_url, notice: "Editor #{@user.name} creado. Solicita cambiar el password después de compartírselo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH /admin/users/:id
  def update
    if @user.update(user_params)
      redirect_with_update_notice
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/users/:id
  def destroy
    if @user == current_user
      redirect_to admin_users_url, notice: "No se puede eliminar tu usuario."
    else
      @user.destroy
      redirect_to admin_users_url, notice: "El usuario ha sido eliminado."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :www, :avatar)
  end

  def profile_params
    params.require(:user).permit(:name, :email, :bio, :www, :avatar)
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  # Verifica si un admin está actualizando la contraseña de otro usuario
  def admin_updating_other_user_password?
    current_user.admin? && params[:id] && params[:id].to_i != current_user.id
  end

  # Maneja la actualización de contraseña por un admin para otro usuario
  def handle_admin_password_update
    @user = User.find(params[:id])
    @password = generate_temp_password

    if update_user_password(@user, @password)
      set_password_flash_messages(@password, @user.email)
      redirect_to admin_users_url, notice: "Contraseña del editor #{@user.name} actualizada. Solicita cambiar el password después de compartírselo."
    else
      handle_password_update_error
    end
  end

  # Maneja la actualización de contraseña del usuario logueado
  def handle_own_password_update
    if current_user.update_with_password(password_params)
      redirect_to admin_profile_path, notice: "Contraseña actualizada correctamente"
    else
      @object = current_user
      render :change_password, status: :unprocessable_entity
    end
  end

  # Crea un usuario con contraseña temporal
  def create_user_with_temp_password
    @password = generate_temp_password
    @user.password = @password
    @user.password_confirmation = @password

    if @user.save
      set_password_flash_messages(@password, @user.email)
      true
    else
      false
    end
  end

  # Genera una contraseña temporal
  def generate_temp_password
    SecureRandom.hex(10)
  end

  # Actualiza la contraseña de un usuario
  def update_user_password(user, password)
    user.password = password
    user.password_confirmation = password
    user.save
  end

  # Establece los mensajes flash para contraseñas temporales
  def set_password_flash_messages(password, email)
    flash[:tmp_password] = password
    flash[:editor_mail] = email
  end

  # Maneja errores en la actualización de contraseña
  def handle_password_update_error
    if action_name == "change_password"
      redirect_to admin_users_url, notice: "Error al actualizar la contraseña."
    else
      @object = @user
      render :change_password, status: :unprocessable_entity
    end
  end

  # Redirige con el mensaje apropiado según el usuario actualizado
  def redirect_with_update_notice
    if @user == current_user
      redirect_to admin_profile_path, notice: "Tu perfil ha sido actualizado."
    else
      redirect_to admin_users_url, notice: "El usuario ha sido actualizado."
    end
  end
end

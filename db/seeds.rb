# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clean up existing data in correct order
puts "\n=== Cleaning up existing data ==="
Program.destroy_all
Page.destroy_all
User.destroy_all
puts "✓ Existing data cleaned up"

# Create admin user
def create_admin(mail, pass)
  admin = User.new(
    email: mail,
    password: pass,
    password_confirmation: pass,
    role: "admin"
  )
  
  if admin.save!
    puts "✓ Admin user created: #{admin.email}"
  else
    puts "✗ Error creating admin: #{admin.errors.full_messages.join(', ')}"
  end
end

# Create static pages
def create_static(category, title, slug, content)
  page = Page.new(
    number: 0,
    lang: "es",
    slug: slug,
    category: category,
    title: title,
    content: content,
    og_title: title,
    og_description: content.slice(0..160),
    keywords: "",
    published: true,
    restricted: true,
    user: User.find_by_email("admin@example.com")
  )
  
  if page.save
    puts "✓ Static page created: #{title}"
  else
    puts "✗ Error creating page #{title}: #{page.errors.full_messages.join(', ')}"
  end
end

# Create error pages
def create_error(title, slug, content, og_description)
  page = Page.new(
    number: 0,
    lang: "es",
    slug: slug,
    category: "errors",
    title: title,
    content: content,
    og_title: title,
    og_description: og_description,
    og_image: "",
    keywords: "",
    published: true,
    restricted: true,
    user: User.find_by_email("admin@example.com")
  )
  
  if page.save
    puts "✓ Error page created: #{title}"
  else
    puts "✗ Error creating error page #{title}: #{page.errors.full_messages.join(', ')}"
  end
end

puts "\n=== Creating base data ==="

# Create admin user
create_admin('admin@example.com', 'colmena#2024')

# Create static pages
create_static('static', 'Aviso de Privacidad', 'privacidad', Faker::Hacker.say_something_smart)

# Create error pages
create_error('Página no encontrada', '404', 'La página a la que intentas acceder no existe, se ha movido o se ha eliminado.', '')
create_error('Petición no resuelta', '422', 'La petición no pudo ser procesada. Por favor, reintenta de nuevo más tarde.', '')
create_error('Error de Servidor', '500', 'Ha ocurrido un error en servidor. Por favor, reintenta de nuevo más tarde.', '')
create_error('Offline', 'offline', 'Estás desconectado. Verifica tu conexión wifi, datos móviles o cable lan.', '')

# Create user session pages
create_static('users', 'Crear Cuenta', 'sign_up', 'Completa los siguientes campos para crear tu cuenta.')
create_static('users', 'Iniciar Sesión', 'sign_in', 'Escribe tu mail y contraseña para acceder a la plataforma.')
create_static('users', 'Confirmación de Cuenta', 'confirmation', 'Para acceder a la plataforma necesitas primero confirmar tu cuenta, escribe tu email para recibir las instrucciones de confirmación.')
create_static('users', 'Recuperar Cuenta', 'reset_password', 'Ingresa tu e-mail para recibir un correo de recuperación.')
create_static('users', 'Desbloquear Cuenta', 'unlock', 'Ingresa tu e-mail para recibir instrucciones para desbloquear tu cuenta.')

puts "\n=== Base data creation completed ==="

# Load the base setup task
Rake::Task['setup:base'].invoke

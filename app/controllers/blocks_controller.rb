class BlocksController < ApplicationController
  before_action :set_topic
  before_action :set_block, only: [:edit, :update, :destroy]

  def new
    @block = @topic.blocks.build(number: @topic.next_block_number)
    render partial: 'form', locals: { block: @block }
  end

  def create
    @block = @topic.blocks.build(block_params)

    if @block.save
      render partial: 'block', locals: { block: @block }
    else
      render json: { errors: @block.errors }, status: :unprocessable_entity
    end
  end

  def edit
    render partial: 'form', locals: { block: @block }
  end

  def update
    if @block.update(block_params)
      render partial: 'block', locals: { block: @block }
    else
      render json: { errors: @block.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @block.destroy
    head :no_content
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_block
    @block = @topic.blocks.find(params[:id])
  end

  def block_params
    params.require(:block).permit(:title, :description, :block_type, :number)
  end
end 
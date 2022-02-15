class CitizenController < ApplicationController
  def index
    render Citizens::Index.new(params: index_params).call
  end

  def show
    render Citizens::Show.new(params: show_params).call
  end

  def create
    render Citizens::Create.new(params: create_params).call
  end

  def update
    render Citizens::Update.new(params: update_params).call
  end

  private

  def index_params
    params.permit(:offset)
  end

  def show_params
    params.permit(:id)
  end

  def create_params
    params.permit(:name, :cpf, :cns, :email, :birth_date, :phone, :picture, :status)
  end

  def update_params
    params.permit(:id, :name, :cpf, :cns, :email, :birth_date, :phone, :picture, :status)
  end
end

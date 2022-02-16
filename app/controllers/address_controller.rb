class AddressController < ApplicationController
  def show
    render Addresses::Show.new(params: show_params).call
  end

  def create
    render Addresses::Create.new(params: create_params).call
  end

  def update
    render Addresses::Update.new(params: update_params).call
  end

  private

  def show_params
    params.permit(:id)
  end

  def create_params
    params.permit(:citizen_id, :zipcode, :street, :second_line, :district, :city, :state, :ibge)
  end

  def update_params
    params.permit(:id, :zipcode, :street, :second_line, :district, :city, :state, :ibge)
  end
end

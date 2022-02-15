class Citizen < ApplicationRecord
  validates :name, :cpf, :cns, :email, :birth_date, :phone, :picture, :status, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates_format_of :name, with: /\A[^0-9`!@#$%\^&*+_=]+\z/

  validates_with Validators::Cpf
  validates_with Validators::Cns

  enum status: [ :active, :inactive ]

  has_one :address
end

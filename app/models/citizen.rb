class Citizen < ApplicationRecord
  validates :name, :cpf, :cns, :email, :birth_date, :phone, :picture, :status, presence: true

  validates :cpf, :cns, :email, uniqueness: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates_format_of :name, with: /\A[^0-9`!@#$%\^&*+_=]+\z/
  validates_format_of :phone, with: /\(?[0-9]{11}/

  validates_with Validators::Cpf
  validates_with Validators::Cns

  enum status: %i[active inactive]

  has_one :address

  mount_uploader :picture, PictureUploader
end

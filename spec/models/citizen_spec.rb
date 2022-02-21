require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe 'presence validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:picture) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'uniqueness validations' do
    it { is_expected.to validate_uniqueness_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cns) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'email format validations' do
    it { should allow_value('mock@gmail.com').for(:email) }
    it { should_not allow_value('this is not an email').for(:email) }
  end

  describe 'name format validations' do
    it { should allow_value('John Doe').for(:name) }
    it { should_not allow_value('mock@gmail.com').for(:name) }
  end

  describe 'phone format validations' do
    it { should allow_value('21999888777').for(:phone) }
    it { should_not allow_value('+5521999888777').for(:name) }
    it { should_not allow_value('999888777').for(:name) }
  end

  describe 'cpf validations' do
    let(:citizen) { Citizen.new(
      name: 'John',
      cns: '143260943590009',
      email: 'john@gmail.com',
      birth_date: '1993-01-01',
      phone: '21999888777',
      picture: File.new("#{Rails.root}/spec/spec.jpg"),
      status: 0
    )}

    it "expects the citizen to be invalid - cpf isn't a number" do
      citizen.cpf = 'this is a string'

      expect(citizen.valid?).to eq(false)
    end

    it "expects the citizen to be invalid - cpf doesn't contain only numbers" do
      citizen.cpf = '370.555.910-90'

      expect(citizen.valid?).to eq(false)
    end

    it 'expects the citizen to be invalid - cpf number is no good' do
      citizen.cpf = 37055591091

      expect(citizen.valid?).to eq(false)
    end

    it 'expects the citizen to be valid' do
      citizen.cpf = 37055591090

      expect(citizen.valid?).to eq(true)
    end
  end

  describe 'cns validations' do
    let(:citizen) { Citizen.new(
      name: 'John',
      cpf: '37055591090',
      email: 'john@gmail.com',
      birth_date: '1993-01-01',
      phone: '21999888777',
      picture: File.new("#{Rails.root}/spec/spec.jpg"),
      status: 0
    )}

    it "expects the citizen to be invalid - cns isn't a number" do
      citizen.cpf = 'this is a string'

      expect(citizen.valid?).to eq(false)
    end

    it "expects the citizen to be invalid - cns doesn't contain only numbers" do
      citizen.cpf = '143 2609 4359 0009'

      expect(citizen.valid?).to eq(false)
    end

    it 'expects the citizen to be invalid - cns number is no good' do
      citizen.cpf = 143260943590001

      expect(citizen.valid?).to eq(false)
    end

    it 'expect the citizen to be valid' do
      citizen.cns = 143260943590009

      expect(citizen.valid?).to eq(true)
    end
  end

  describe 'status validations' do
    it { should define_enum_for(:status).with_values([:active, :inactive]) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:address) }
  end
end

require 'rails_helper'
require 'rack/test'

RSpec.describe 'Citizen', type: :request do
  include Rack::Test::Methods

  describe 'request all of the citizens' do

    it 'expects to return 200' do
      get '/citizen'
      expect(last_response).to be_successful
    end
  end

  describe 'create a citizen' do
    it 'expects to return 200' do
      VCR.use_cassette("synopsis") do
        post '/citizen',
          name: 'John Doe',
          cpf: '45245881080',
          cns: '176174872300004',
          email: 'johndoe@gmail.com',
          birth_date: '1993-01-01',
          phone: '21999888777',
          picture: Rack::Test::UploadedFile.new("#{Rails.root}/spec/spec.jpg"),
          status: 'active'
      end
      expect(last_response).to be_successful
    end
  end
end
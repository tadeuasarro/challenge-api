class ApplicationController < ActionController::API
  include ComteleSdk

  private

  API_KEY = '12df0620-241f-4c58-88b8-4106323b2297'.freeze

  def notification
    TextMessageService.new(API_KEY).send('66998', message, [params[:phone]])
  end

  def message
    "Olá #{params[:name]} sua conta foi atualizada em nosso site!"
  end
end

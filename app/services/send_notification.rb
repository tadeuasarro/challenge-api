class SendNotification
  include ComteleSdk

  def call
    TextMessageService.new(API_KEY).send('66998', 'Olá mundo!', ['21999854417'])
  end

  private

  API_KEY = '12df0620-241f-4c58-88b8-4106323b2297'.freeze
end

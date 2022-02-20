class Base
  def initialize(params:)
    @params = params
  end

  def call
    { json: result, status: :ok }
  # rescue StandardError => e
  #   { json: e, status: :bad_request }
  end

  private

  attr_reader :params

  def id
    params[:id]
  end
end

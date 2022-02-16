module Addresses
  class Create < Base
    def result
      Address.create!(params)
    end
  end
end

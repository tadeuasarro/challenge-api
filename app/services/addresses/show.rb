module Addresses
  class Show < Base
    def result
      Address.find(id)
    end
  end
end

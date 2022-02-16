module Addresses
  class Update < Base
    def result
      Address.find(id).update(params)
    end
  end
end

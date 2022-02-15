module Citizens
  class Create < Citizens::Base
    private

    def result
      Citizen.create!(params)
    end
  end
end

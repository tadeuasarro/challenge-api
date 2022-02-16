module Citizens
  class Create < Base
    private

    def result
      Citizen.create!(params)
    end
  end
end

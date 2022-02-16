module Citizens
  class Update < Base
    private

    def result
      Citizen.find(id).update(params)
    end
  end
end

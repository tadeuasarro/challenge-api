module Citizens
  class Show < Citizens::Base
    private

    def result
      Citizen.find(params[:id])
    end
  end
end

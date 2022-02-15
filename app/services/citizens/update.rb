module Citizens
  class Update < Citizens::Base
    private

    def result
      Citizen.find(params[:id]).update(params)
    end
  end
end

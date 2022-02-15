module Citizens
  class Index < Citizens::Base
    private

    def result
      Citizen.all.order(:name).limit(1).offset(offset)
    end

    def offset
      params[:offset].to_i - 1
    end
  end
end

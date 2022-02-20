module Citizens
  class Update < Base
    private

    def result
      Citizen.find(id).update(clean_params)
    end

    def clean_params
      {
        name: params[:name],
        cpf: params[:cpf].gsub(/[-.]/, ''),
        cns: params[:cns].gsub(/[ ]/, ''),
        email: params[:email],
        phone: params[:phone].gsub(/[() ]/, ''),
        birth_date: params[:birth_date]
      }
    end
  end
end

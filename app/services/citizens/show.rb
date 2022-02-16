module Citizens
  class Show < Base
    private

    def result
      {
        id: citizen.id,
        name: citizen.name,
        cpf: cpf,
        cns: cns,
        email: citizen.email,
        phone: phone,
        birth_date: birth_date,
        address_id: citizen.address&.id
      }
    end

    def citizen
      @citizen ||= Citizen.find(id)
    end

    def cpf
      number = citizen.cpf.to_s.split('')

      "#{number.shift(3).join}.#{number.shift(3).join}.#{number.shift(3).join}-#{number.shift(2).join}"
    end

    def cns
      number = citizen.cns.to_s.split('')

      "#{number.shift(3).join} #{number.shift(4).join} #{number.shift(4).join} #{number.shift(4).join}"
    end

    def phone
      number = citizen.phone.to_s.split('')

      "(#{number.shift(2).join}) #{number.shift(3).join} #{number.shift(3).join} #{number.shift(3).join}"
    end

    def birth_date
      citizen.birth_date.strftime('%d/%m/%Y')
    end
  end
end

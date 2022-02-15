module Validators
  class Cpf < ActiveModel::Validator
    private

    def validate(record)
      record.errors.add :base, 'Invalid CPF' unless cpf_valid?(record.cpf)
    end

    def cpf_valid?(cpf)
      "#{first_digit(cpf)}#{second_digit(cpf)}" == cpf.to_s.slice(9, 11)
    end

    def first_digit(cpf)
      first_nine = cpf.to_s.slice(0, 9)

      base = 10
      sum = 0

      first_nine.chars.each do |char|
        sum += (char.to_i * base)
        base -= 1
      end

      return 0 if (sum % 11).zero? || (sum % 11) == 1

      11 - (sum % 11)
    end

    def second_digit(cpf)
      first_ten = cpf.to_s.slice(0, 10)

      base = 11
      sum = 0

      first_ten.chars.each do |char|
        sum += (char.to_i * base)
        base -= 1
      end

      return 0 if (sum % 11).zero? || (sum % 11) == 1

      11 - (sum % 11)
    end
  end
end

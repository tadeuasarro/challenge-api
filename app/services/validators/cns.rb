module Validators
  class Cns < ActiveModel::Validator
    # private

    def validate(record)
      record.errors.add :base, 'Invalid CNS' unless cns_valid?(record.cns.to_s)
    end

    def cns_valid?(cns)
      return false unless cns.length == 15

      second_scenario(cns) || first_scenario(cns)
    end

    def first_scenario(cns)
      first_eleven = cns.slice(0, 11)

      base = 15
      sum = 0

      first_eleven.chars.each do |char|
        sum += (char.to_i * base)
        base -= 1
      end

      dv = 11 - (sum % 11)

      dv = 0 if dv == 11

      if dv == 10
        "#{first_eleven}001#{11 - ((sum + 2) % 11)}" == cns
      else
        "#{first_eleven}000#{dv}" == cns
      end
    end

    def second_scenario(cns)
      base = 15
      sum = 0

      cns.chars.each do |char|
        sum += (char.to_i * base)
        base -= 1
      end

      (sum % 11).zero?
    end
  end
end

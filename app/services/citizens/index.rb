module Citizens
  class Index < Base
    private

    PER_PAGE = 3

    def result
      {
        pages: pages,
        list: citizens.order(:name).offset(offset).limit(PER_PAGE)
      }
    end

    def citizens
      @citizens ||= Citizen.all
    end

    def offset
      (params[:offset].to_i) * PER_PAGE
    end

    def pages
      last_page = (citizens.count / PER_PAGE)

      last_page -= 1 if (citizens.count % PER_PAGE).zero?

      (0..last_page).to_a
    end
  end
end

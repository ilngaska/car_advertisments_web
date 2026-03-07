# frozen_string_literal: true

module Cars
  class Sorter
    SORT_MAP = {
      'year_asc' => { year: :asc, id: :desc },
      'year_desc' => { year: :desc, id: :desc },
      'price_asc' => { price: :asc, id: :desc },
      'price_desc' => { price: :desc, id: :desc },
      'date_added_asc' => { date_added: :asc, id: :desc }
    }.freeze

    def self.call(scope, sort_param)
      order_logic = SORT_MAP.fetch(sort_param, { date_added: :desc, id: :desc })

      scope.filter_sort_by(order_logic)
    end
  end
end

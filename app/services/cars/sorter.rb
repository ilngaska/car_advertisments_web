# frozen_string_literal: true

module Cars
  class Sorter
    SORT_MAP = {
      'year_asc' => { year: :asc, id: :desc },
      'year_desc' => { year: :desc, id: :desc },
      'price_asc' => { price: :asc, id: :desc },
      'price_desc' => { price: :desc, id: :desc },
      'created_at_asc' => { created_at: :asc, id: :desc },
      'created_at_desc' => { created_at: :desc, id: :desc }
    }.freeze

    def self.call(scope, sort_param)
      order_logic = SORT_MAP.fetch(sort_param, { created_at: :desc, id: :desc })

      scope.filter_sort_by(order_logic)
    end
  end
end

# frozen_string_literal: true

module Cars
  class Searcher
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params || {}
    end

    def call
      results = Car.all
      return results if @params.blank?

      results = apply_make_and_model(results)
      results = apply_year_range(results)
      apply_price_range(results)
    end

    private

    def apply_make_and_model(results)
      results = results.filter_by_make(@params[:make]) if @params[:make].present?
      results = results.filter_by_model(@params[:model]) if @params[:model].present?
      results
    end

    def apply_year_range(results)
      results = results.filter_by_year_from(@params[:year_from]) if @params[:year_from].present?
      results = results.filter_by_year_to(@params[:year_to]) if @params[:year_to].present?
      results
    end

    def apply_price_range(results)
      results = results.filter_by_price_from(@params[:price_from]) if @params[:price_from].present?
      results = results.filter_by_price_to(@params[:price_to]) if @params[:price_to].present?
      results
    end
  end
end

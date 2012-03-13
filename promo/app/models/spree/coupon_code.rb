module Spree
  class CouponCode < ActiveRecord::Base
    belongs_to :promotion, :foreign_key => 'activator_id'
    has_many :adjustments, :as => :source

    scope :by_number, lambda { |number| where(:number => number) }

    def used_count
      adjustments.nil? ? 0 : adjustments.select{|a| a.adjustable.state == 'complete'}.size
    end

    def used_up?
      !!usage_limit and used_count >= usage_limit
    end

    def expired?
      !!expires_at and expires_at <= Time.now
    end
  end
end

Spree::User.class_eval do
  attr_accessor :signup_promo_code
  attr_accessible :signup_promo_code
end

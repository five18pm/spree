Deface::Override.new(:virtual_path => "spree/shared/_user_form",
                     :name => "add_promos_to_login_extras",
                     :insert_after => "[data-hook='signup_below_password_fields']",
                     :partial => "spree/shared/promos",
                     :disabled => false)

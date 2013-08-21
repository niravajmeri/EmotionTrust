class Player < ActiveRecord::Base
  attr_accessible :country, :email, :gender, :name, :login_status, :admin_status
end

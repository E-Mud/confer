class App < ApplicationRecord
  belongs_to :account
  belongs_to :creator, class_name: 'User'
end

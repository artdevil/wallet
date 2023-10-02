class Transfer < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true
end

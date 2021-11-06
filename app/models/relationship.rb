class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Customer"##belongs_to :変更したい親モデル名, class_name: "元々の親モデル名"
  belongs_to :following, class_name: "Customer"
end

class Group < ActiveRecord::Base
	validates :title, presence: true
	has_many :posts
	# 原本以為是 belongs_to :user，但rails101 提供以下寫法
	belongs_to :owner, class_name: "User", foreign_key: :user_id
	def editable_by?(user)
    user && user == owner
  end
  has_many :group_users
  has_many :members, through: :group_users, source: :user
end

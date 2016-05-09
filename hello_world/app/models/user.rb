class User < ActiveRecord::Base
	has_many :games
	has_many :votes
	has_many :game_users, :class_name=>"GameUser"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable





end
 
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :init

  has_many :daily_activities, dependent: :destroy
  has_many :foods, through: :daily_activities
  has_many :exercises, through: :daily_activities


  
  def init
    self.food_goal = 2000
    self.exercise_goal = 600 
  end
end

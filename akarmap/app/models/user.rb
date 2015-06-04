class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :advertises

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable      
end



class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :index, Advertise
    can :show, Advertise
    
    
    if user.is_admin?
    can :new, Advertise
    can :create, Advertise
	  can :edite, Advertise
	  can :update, Advertise
	  can :destroy, Advertise

    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:create, :todo, :done], Task unless user.id.nil?
    can [:destroy, :finish], Task do |task|
      task.try(:user) == user
    end
    can :update, Task do |task|
      task.try(:user) == user && task.complete == false
    end
    can :home, Task 
  end
end

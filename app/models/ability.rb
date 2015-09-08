class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

  can :manage, [Idea, Comment] do |x|
    x.user == user
  end

  can :destroy, [Like] do |x|
    x.user == user
  end
end
end

#
# The first argument to `can` is the action you are giving the user permission to do.
# If you pass :manage it will apply to every action. Other common actions here are
# :read, :create, :update and :destroy.
#
# The second argument is the resource the user can perform the action on. If you pass
# :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
#
# The third argument is an optional hash of conditions to further filter the objects.
# For example, here the user can only update published articles.
#
#   can :update, Article, :published => true
# See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
class Ability
  include CanCan::Ability

  def initialize(account)
    account ||= Account.new # guest user
 

    can_access_garden(account)

    if account.admin
      can :visit_admin_space, :all      
      can :manage, [Plant, Family]
    else
      #what about create new?
      can [:read], [Plant, Family]
      can :calculate_harvest_time, Plant

    end
  end

  private
  def can_access_garden(account)
    #    puts "can_acces_garden: account = #{account.username}"
    can :read, Garden
    can :manage, Garden, :account_id => account.id
    
    can :read, Bed
    can :manage, Bed, :garden => {:account_id => account.id}
  end

end


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
    can :manage, Garden, :account => account
    
    can :read, Bed
    can :manage, Bed, :garden => {:account_id => account.id}
  end

end


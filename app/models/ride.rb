class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if attraction.tickets > user.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif attraction.tickets > user.tickets
  	 "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      ticket_update = user.tickets - attraction.tickets
      happiness_update = user.happiness + attraction.happiness_rating
      nausea_update = user.nausea + attraction.nausea_rating
      user.update(:happiness => happiness_update, :nausea => nausea_update, :tickets => ticket_update)
      "Thanks for riding the " + "#{attraction.name}!"
    end
  end

end


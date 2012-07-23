class Comment < ActiveRecord::Base
  attr_accessible :text, :ticket_id, :user, :state_id

  before_create :set_previous_state
  after_create :set_ticket_state
  after_create :creator_watches_ticket

  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, class_name: "State"

  delegate :project, :to => :ticket

  validates :text, :presence => true

  private
    def set_previous_state
      self.previous_state = ticket.state
    end

    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end

    def creator_watches_ticket
      ticket.watchers << user
    end
end

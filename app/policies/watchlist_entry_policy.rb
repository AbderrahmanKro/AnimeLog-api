class WatchlistEntryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def update?
    # Only the user who created the watchlist entry can update it
    record.user == user
  end
end

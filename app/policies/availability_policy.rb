class AvailabilityPolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def new?
    true
  end

  def create?
    new?
  end
  def update?
    edit?
  end

  def destroy?
    true
    # record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

class BookingPolicy < ApplicationPolicy

  def show?
    a = is_teacher?
    b = is_owner_or_admin?
    (a || b)
  end

  def approve?
    is_teacher?
  end

  def new?
    true
  end

  def cancel?
    a = is_teacher?
    b = is_owner_or_admin?
    (a || b)
  end

  def complete?
    is_teacher?
  end

  def create?
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def is_owner_or_admin?
    record.user == user || user.admin
  end

  def is_teacher?
    record.teacher == user.teacher
  end

  def is_admin?
    user.admin
  end

end

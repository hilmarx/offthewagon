class TeacherPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def update?
    is_owner_or_admin?
  end

  def destroy?
    is_admin?
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

  def is_admin?
    user.admin
  end
end

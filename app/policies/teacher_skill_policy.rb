class TeacherSkillPolicy < ApplicationPolicy

  def update?
    is_owner_or_admin?
  end

  def new?
    is_owner_or_admin?
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
    record.teacher.user == user || user.admin
    # - record: the teacherskill passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
end

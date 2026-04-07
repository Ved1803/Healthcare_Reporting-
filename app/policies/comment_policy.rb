class CommentPolicy < ApplicationPolicy
  def create?
    return false unless user.present?

    # Doctor can comment only on own report
    return true if user.doctor? && record.report.user_id == user.id

    # Reviewer can comment only when submitted
    return true if user.reviewer? && record.report.submitted? or user.reviewer? && record.report.under_review?

    # Admin can always comment
    return true if user.admin?

    false
  end

  def update?
    user.doctor? && record.report.draft? && record.user_id == user.id
  end

  def show?
    true
  end

  def index?
    true
  end
end

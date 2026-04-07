class ReportPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.doctor?
  end

  def submit?
    user.doctor? && record.draft?
  end

  def start_review?
    user.reviewer? && record.submitted?
  end

  def approve?
    user.admin? && (record.submitted? || record.under_review?)
  end

  def reject?
    user.admin? && (record.submitted? || record.under_review?)
  end
end
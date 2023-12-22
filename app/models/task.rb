# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#  code        :string
#
class Task < ApplicationRecord
  # Relationships
  belongs_to :category
  belongs_to :user
  has_many :participating_users, class_name: 'Participant'
  has_many :participants, through: :participating_users, source: :user
  has_many :notes

  # Vaidations
  validates :name, :description, :participating_users,  presence: true
  validates :name, uniqueness: { case_sensitive: false }

  ## Custom validations
  validate :due_date_validity

  # Callbacks (signals)
  before_create :create_code
  after_create :send_email

  # Nested attributes when creating an object
  accepts_nested_attributes_for :participating_users, allow_destroy: true

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end

  def create_code
    self.code = "#{user_id}#{Time.now.to_i.to_s(36)}#{SecureRandom.hex(8)}"
  end

  def send_email
    (participants + [user]).each do |u|
      ParticipantMailer.with(user: u, task: self).new_task_email.deliver
    end
  end

end

# == Schema Information
#
# Table name: workflow_states
#
#  id                       :integer          not null, primary key
#  name                     :string
#  workflow_type_version_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  is_initial_state         :boolean          default(FALSE)
#

class WorkflowState < ApplicationRecord
  belongs_to :workflow_type_version
  has_many :possible_transitions, class_name: "Transition", foreign_key: "from_state_id"
  validates :name, :workflow_type_version, presence: true
end

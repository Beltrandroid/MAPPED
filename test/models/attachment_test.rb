# == Schema Information
#
# Table name: attachments
#
#  id                     :integer          not null, primary key
#  title                  :string
#  content_type           :string
#  content                :binary
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  workflow_transition_id :integer
#

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  test "max size of attachment is 500k" do
    wt = workflow_transitions(:one)
    attachment = Attachment.new(workflow_transition: wt)
		assert attachment.valid?
    attachment.content = '0' * Attachment::MAX_SIZE
    assert attachment.valid?
    attachment.content += '0'
    assert_not attachment.valid?
    assert_includes  attachment.errors[:content], I18n.t('validations.attachment_max_size')
  end
end

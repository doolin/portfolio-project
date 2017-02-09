require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'title' do
    it 'displays title' do
      expect(helper.title('foo')).to eq ('')
    end
  end
end

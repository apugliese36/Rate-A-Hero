require 'spec_helper'
require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:review_id).when(1) }
  it { should_not have_valid(:review_id).when(nil, '') }

  it { should have_valid(:value).when(1, 0, -1) }
  it { should_not have_valid(:value).when(nil, '') }
end

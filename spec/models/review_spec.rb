require 'rails_helper'
require 'spec_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:rating).when(3) }
  it { should_not have_valid(:rating).when(nil, '') }

  review = Review.new
  review.rating = 5

  it { expect(review.rating).to be_between(1, 5).inclusive }
end

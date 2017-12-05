require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when('John') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Pugliese') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('jpug@gmail.com') }
  it { should_not have_valid(:email)
    .when(nil, '', 'asdf', 'usersr.com', 'user@com') }

  it { should have_valid(:username).when('apple134') }
  it { should_not have_valid(:username).when(nil, '') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end

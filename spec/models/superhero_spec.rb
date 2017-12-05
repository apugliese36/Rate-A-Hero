require 'spec_helper'
require 'rails_helper'
require_relative '../../app/models/superhero'

describe Superhero do
  it { should have_valid(:name).when('Magneto') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:superpower).when('Bend metal') }
  it { should_not have_valid(:superpower).when(nil, '') }

  it { should have_valid(:backstory).when('very sad') }
  it { should_not have_valid(:backstory).when(nil, '') }

  it { should have_valid(:image_url).when('magneto.com') }
  it { should_not have_valid(:image_url).when(nil, '') }
end

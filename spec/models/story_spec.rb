require 'spec_helper'

describe Story do
  before do 
    @story = Story.new
  end

  it { should belong_to(:user) }
  it { should have_many(:phrases) }
  it { should have_many(:characters) }
  it { should have_many(:followers) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:blurb) }
  it { should validate_presence_of(:character_count) }
  it { should_not allow_value(8).for(:character_count) }
  it { should allow_value(6).for(:character_count) }
  it { should_not allow_value('x' * 251).for(:title) }
  it { should allow_value('x' * 249).for(:title) }
  it { should_not allow_value('x' * 2501).for(:blurb) }
  it { should allow_value('x' * 2499).for(:blurb) }

  it "should know if a user is a follower of this story" do 
    user = mock_model(User)
    @story.stub_chain(:followers).and_return([user])
    @story.follower?(user).should be_true
  end

  it "should be considered full when it hits the character count" do 
    @story.character_count = 6
    @story.stub_chain(:followers, :count).and_return(7)
    @story.full?.should be_true
  end
end

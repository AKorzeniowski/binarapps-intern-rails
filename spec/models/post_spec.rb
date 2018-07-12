require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { create(:author) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'attributes' do
    it 'should have proper attributes' do
      expect(subject.attributes).to include('title', 'content', 'author_id')
    end
  end

  describe 'scopes' do      
    let(:post1) { create(:post) }
    let(:post2) { create(:post, title: 'Drugi post') }

    before do
      Timecop.freeze(Time.now - 1.hour)
      post1
      Timecop.return
    end

    it 'should have old scope' do
      expect(Post.old).to include(post1)
      expect(Post.old).not_to include(post2)
    end
  end

  describe 'relations' do
    it { should belong_to(:author) } 
    it { should have_many(:comments) } 
  end
end
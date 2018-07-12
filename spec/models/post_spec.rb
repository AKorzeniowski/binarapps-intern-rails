require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @author = Author.create(name: 'test', surname: 'test')
  end

  it 'should have proper attributes' do
    expect(subject.attributes).to include('title', 'content', 'author_id')
  end

  it 'should require title, content and author presence' do
    expect(Post.new).not_to be_valid
    expect(Post.new(title: 'Testowy tytuł')).not_to be_valid
    expect(Post.new(title: 'Testowy tytuł', content: 'Testowy content')).not_to be_valid
    expect(Post.new(title: 'Testowy tytuł', content: 'Testowy content', author_id: @author.id)).to be_valid
  end

  it 'should validate length of content' do
    long_content = ''
    512.times { long_content << 'x' }

    expect(Post.new(title: 'Testowy tytuł', content: 'Too short', author_id: @author.id)).not_to be_valid
    expect(Post.new(title: 'Testowy tytuł', content: long_content, author_id: @author.id)).not_to be_valid

    expect(Post.new(title: 'Testowy tytuł', content: 'Prawidłowy content', author_id: @author.id)).to be_valid
  end

  it 'should have one author' do
    t = Post.reflect_on_association(:author)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'should have many comments' do
    t = Post.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end
end
require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'should have proper attributes' do
    expect(subject.attributes).to include('name', 'surname', 'age')
  end

  it 'should require name and surname presence' do
    expect(Author.new).not_to be_valid
    expect(Author.new(name: 'test')).not_to be_valid
    expect(Author.new(name: 'test', surname: 'test')).to be_valid
  end

  it 'should have old scope' do
    author1 = Author.create(name: 'test', surname: 'test', age: 20)
    author2 = Author.create(name: 'test', surname: 'test', age: 55)

    expect(Author.old).to include(author2)
    expect(Author.old).not_to include(author1)
  end

  it 'should set age to 25 if none was given' do
    author = Author.create(name: 'test', surname: 'test')
    expect(author.age).to eq(25)
  end

  it 'should have many posts' do
    t = Author.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end

  it 'shoud have a working #fullname method' do
    author = Author.new(name: 'Autor', surname: 'Testowy')
    expect(author.fullname).to eq('Autor Testowy')
  end
end
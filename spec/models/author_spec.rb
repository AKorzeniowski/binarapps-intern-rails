require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:surname) }
  end

  describe 'attributes' do
    it 'should have proper attributes' do
      expect(subject.attributes).to include('name', 'surname', 'age')
    end
  end

  describe 'scopes' do
    let (:author1) { Author.create(name: 'test', surname: 'test', age: 20) }
    let (:author2) { Author.create(name: 'test', surname: 'test', age: 55) }

    it 'should have old scope' do
      expect(Author.old).to include(author2)
      expect(Author.old).not_to include(author1)
    end
  end

  describe 'callbacks' do
    let (:author) { Author.create(name: 'test', surname: 'test') }
    it 'should set age to 25 if none was given' do
      expect(author.age).to eq(25)
    end
  end

  describe 'relations' do
    it { should have_many(:posts) } 
  end

  describe '#fullname' do
    let (:author) { Author.create(name: 'Autor', surname: 'Testowy') }
    it 'shoud have a working #fullname method' do
      expect(author.fullname).to eq('Autor Testowy')
    end
  end
end
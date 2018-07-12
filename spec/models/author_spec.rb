require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'should have proper attributes' do
    expect(Author.new.attributes).to include('name', 'surname', 'age')
  end
end
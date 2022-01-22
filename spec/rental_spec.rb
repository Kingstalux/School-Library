require_relative './spec_helper'

describe Rental do
  before :each do
    @book = Book.new('Harry Potter', 'J K Rowlings')
    @person = Person.new(14)
    @date = '01/22/2022'
    @rental = Rental.new(@date, @book, @person)
  end

  context 'create a Rental instance' do
    it 'takes three parameters and returns a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end

    describe '#date' do
      it 'get date of rental' do
        expect(@rental.date).to eql @date
      end
    end
  end
end

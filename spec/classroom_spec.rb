require_relative './spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('A')
  end

  context 'create a Classroom instance' do
    it 'takes one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    describe '#students' do
      it 'new classroom should have no students' do
        expect(@classroom.students).to match_array([])
      end
    end
  end
end

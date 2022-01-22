require_relative './spec_helper'

describe Student do
    before :each do
        @student = Student.new(23, "A", "King")
    end

    context "create a student instance" do

        it "takes two to four parameters and returns a Student object" do
            expect(@student).to be_an_instance_of Student
        end

        describe "#classroom" do
        it "returns the correct classroom" do
            expect(@student.classroom).to eql "A"
        end
    end

    end
end
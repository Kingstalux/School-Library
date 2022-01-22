require_relative './spec_helper'

describe Teacher do
    before :each do
        @teacher = Teacher.new("Doctor", 44, "Rose")
    end

    context "create a teacher instance" do

        it "takes two to three parameters and returns a Teacher object" do
            expect(@teacher).to be_an_instance_of Teacher
        end

        describe "#specialization" do
        it "returns the correct specialization" do
            expect(@teacher.specialization).to eql "Doctor"
        end
    end
    end
end
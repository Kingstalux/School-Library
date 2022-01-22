require_relative './spec_helper'

describe Person do
    context "create a person instance" do

        it "takes one to three parameters and returns a Person object" do
            person = Person.new(23)
            expect(person).to be_an_instance_of Person
        end

        describe "#name" do
        it "returns the correct name" do
            person = Person.new(44, "Rose")
            expect(person.name).to eql "Rose"
        end
    end
    end
end
require 'spec_helper'

describe User do
  
	let(:user)  { User.new }
	let(:user2) { User.new }
	describe "#initialize" do

		context "happy path" do
			it "should save to the database" do
				user.email = "some@example.com"
				user.password = "password"
				user.first_name = "Happy"
				user.last_name = "Rabbit"
				user.save.should eq true
			end
		end
	
		context "sad path" do
			it "should not save without data" do
				user.save.should eq false
			end

			it "should not save without first_name" do
				user.email = "some@example.com"
				user.password = "password"
				user.last_name = "Rabbit"
				user.save.should eq false
			end

			it "should not save without last_name" do
				user.email = "some@example.com"
				user.password = "password"
				user.first_name = "Happy"
				user.save.should eq false
			end
		
			it "should not save with a non-unique email" do
				user.email = "some@example.com"
				user.password = "password"
				user.save

				user2.email = "some@example.com"
				user2.password = "password"
				user2.save.should eq false
			end

		end
	end
end

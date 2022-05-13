require 'rails_helper'

RSpec.describe "Vampire", type: :model do
  describe "Create vampire Validations" do
    it "must contain a name" do
        vampire = Vampire.create age: 174, enjoys: "Blood, duh.",
        image:"https://media.wired.com/photos/5932937926780e6c04d2cc73/191:100/w_1280,c_limit/vampire.jpg"
        expect(vampire.errors[:name]).to_not be_empty
    end
    it "must contain an age" do
        vampire = Vampire.create name: "Spike", enjoys: "Blood, duh.",
        image:"https://media.wired.com/photos/5932937926780e6c04d2cc73/191:100/w_1280,c_limit/vampire.jpg"
        expect(vampire.errors[:age]).to_not be_empty

    end
    it "must contain an enjoys" do
        vampire = Vampire.create name: "Spike", age: 174,
        image:"https://media.wired.com/photos/5932937926780e6c04d2cc73/191:100/w_1280,c_limit/vampire.jpg"
        expect(vampire.errors[:enjoys]).to_not be_empty
    end
    it "must contain an image" do
        vampire = Vampire.create name: "Spike", age: 174, enjoys: "Blood, duh."
        expect(vampire.errors[:image]).to_not be_empty
    end
    it 'is not valid if enjoys is less than 10 characters' do
        vampire = Vampire.create name: "Spike", age: 174, enjoys: "Blood",
        image:"https://media.wired.com/photos/5932937926780e6c04d2cc73/191:100/w_1280,c_limit/vampire.jpg"
        expect(vampire.errors[:enjoys]).to_not be_empty
    end
 end
end


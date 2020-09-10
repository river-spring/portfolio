require 'rails_helper'

RSpec.describe Shelf, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
   context "データが正しく保存される" do
	  before do
	  	@shelf = User.new(
	  		name: "test"
	  		outline: "test"
	  		)
	  end
	  it "正しく新規登録ができる" do
	  	expect(@user).to be_valid
	  end
	end
end

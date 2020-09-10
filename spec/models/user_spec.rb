require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "データが正しく保存される" do
	  before do
	  	@user = User.new
	  	@user.name = "テスト太郎"
	  	@user.user_id = "test0"
	  	@user.email = "zzz@zzz"
	  	@user.password = "000000"
	  	@user.save
	  end
	  it "正しく新規登録ができる" do
	  	expect(@user).to be_valid
	  end
	end
	context "データが正しく保存されない" do
		before do
			@user = User.new
			@user.name = ""
			@user.user_id = "test0"
			@user.email = "zzz@zzz"
	  		@user.password = "000000"
	  		@user.save
	  	end
	  	it "nameが入力されていないので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new(
	  			name: "a" * 21,
				user_id: "test0",
				email: "yyy@@yyy",
				password:"999999")
	  		@user.save
	  	end
	  	it "nameが20文字以上なので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new
			@user.name = "テスト太郎"
			@user.user_id = ""
			@user.email = "zzz@zzz"
	  		@user.password = "000000"
	  		@user.save
	  	end
	  	it "user_idが入力されていないので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new(
	  			name: "テスト花子",
				user_id: "test",
				email: "yyy@@yyy",
				password:"999999")
	  		@user.save
	  	end
	  	it "user_idが5文字以下なので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new(
	  			name: "テスト花子",
				user_id: "t" * 13,
				email: "yyy@@yyy",
				password:"999999")
	  		@user.save
	  	end
	  	it "user_idが12文字以上なので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new(
	  			name: "テスト花子",
				user_id: "テストだよ",
				email: "yyy@@yyy",
				password:"999999")
	  		@user.save
	  	end
	  	it "user_idが半角英数字以外なので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
	  		@user = User.new(
	  			name: "テスト花子",
				user_id: "test0",
				email: "yyy@@yyy",
				password:"999999")
	  		@user.save
			@user2 = User.new(
				name: "テスト太郎",
				user_id:"test0",
				email: "zzz@zzz",
				password:"000000")
	  	end
	  	it "user_idが重複しているので保存できない" do
	  		expect(@user2.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new(
	  			name: "テスト花子",
				user_id: "テストだよ",
				email: "yyy@@yyy",
				password:"ああああああ")
	  		@user.save
	  	end
	  	it "passwordが半角英数字以外なので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	  	before do
			@user = User.new(
	  			name: "テスト花子",
				user_id: "test0",
				email: "yyy@@yyy",
				password:"999999",
				introduction: "a" * 301)
	  		@user.save
	  	end
	  	it "introductionが300文字以上なので保存できない" do
	  		expect(@user).to be_invalid
	  		expect(@user.valid?).to eq(false)
	  	end
	end
end

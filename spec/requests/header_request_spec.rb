require 'rails_helper'

RSpec.describe "Headers", type: :request do
	describe 'ヘッダーのテスト' do
  		describe 'ログインしていない場合' do
  			before do
  				visit root_path
  			end
  		end
  	end

end

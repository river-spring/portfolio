require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "Users::Users", type: :request do
	describe 'ユーザー認証のテスト' do
		describe 'ユーザー新規登録' do
			before do
				visit new_user_registration_path
			end
			context '新規登録画面に遷移' do
				it '新規登録に成功する' do
					fill_in 'user[name]', with: 'テストたろう'
					fill_in 'user[user_id]', with: 'test0'
					fill_in 'user[email]', with: 'zzz@zzz'
			        fill_in 'user[password]', with: '000000'
			        fill_in 'user[password_confirmation]', with: '000000'
			        click_button '登録'

			        expect(page).to have_content 'アカウント登録が完了しました。'
			    end
			    it '新規登録に失敗する' do
					fill_in 'user[name]', with: ''
					fill_in 'user[user_id]', with: ''
					fill_in 'user[email]', with: ''
			        fill_in 'user[password]', with: ''
			        fill_in 'user[password_confirmation]', with: ''
			        click_button '登録'

			        expect(page).to have_content 'してください'
			    end
			end
		end
		describe 'ユーザーログイン' do
			let(:user) {User.create(name: "テスト太郎", user_id: "test0", email: "zzz@zzz", password: "000000")}
			before do
				visit new_user_session_path
			end
			context 'ログイン画面に遷移' do
				let(:test_user) { user }
				it 'ログインに成功する' do
					fill_in 'user[user_id]', with: test_user.user_id
        			fill_in 'user[password]', with: test_user.password
        			click_button 'Log in'

       				expect(page).to have_content 'ログインしました。'
				end
				it 'ログインに失敗する' do
					fill_in 'user[user_id]', with: ''
        			fill_in 'user[password]', with: ''
        			click_button 'Log in'

       				expect(current_path).to eq(new_user_session_path)
				end
			end
		end
	end

	describe 'ユーザーのテスト' do
		let(:user) { User.create(name: "テスト一郎", user_id: "test8", email: "xxx@xxx", password: "888888") }
		let!(:test_user2) { User.create(name: "テスト花子", user_id: "test9", email: "yyy@yyy", password: "999999") }
		let!(:shelf) { Shelf.create(name: "テスト棚", outline: "test", user_id: user) }
		before do
			visit new_user_session_path
		    fill_in 'user[user_id]', with: user.user_id
		    fill_in 'user[password]', with: user.password
		    click_button 'Log in'
		end
		describe 'サイドバーのテスト' do
			context 'リンク先の確認' do
				it 'マイページリンクが表示される' do
					visit users_user_path(user)
					expect(page).to have_link "マイページ" , href: users_user_path(user)
				end
				it 'フレンドリンクが表示される' do
					visit users_user_path(user)
					expect(page).to have_link "フレンド" , href: users_user_friends_path(user_id: user)
				end
				it 'グループリンクが表示される' do
					visit users_user_path(user)
					expect(page).to have_link "グループ" , href: users_groups_path
				end
				it 'ユーザー検索リンクが表示される' do
					visit users_user_path(user)
					expect(page).to have_link "ユーザー検索" , href: search_path
				end
			end
		end

		describe '編集のテスト' do
			context '自分の編集画面への遷移' do
				it '遷移できる' do
					visit edit_users_user_path(user)
					expect(current_path).to eq('/users/users/' + user.id.to_s + '/edit')
				end
			end
			context '他人の編集画面への遷移' do
			    it '遷移できない' do
			        visit edit_users_user_path(test_user2)
			        expect(current_path).to eq('/users/users/' + test_user2.id.to_s)
			    end
    		end
		end
	end
end

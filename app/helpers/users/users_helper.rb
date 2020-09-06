module Users::UsersHelper
	# デバイスのエラーメッセージ出力メソッド
  def devise_sign_up_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

  def devise_sign_in_error_message
    # ログインページ初回読み込み時、ユーザーIDがnilのため、メッセージを表示させない。
    return "" if resource.user_id == nil
    # ログインできずに、同じページへリダイレクトされた時のメッセージ
    if params["user"]["user_id"] == "" && params["user"]["password"] == ""
      msg = "ユーザーIDとパスワードを入力してください。"
    elsif params["user"]["user_id"] == ""
      msg = "ユーザーIDを入力してください。"
    elsif params["user"]["password"] == ""
      msg = "パスワードを入力してください。"
    else
      msg = "ユーザーIDもしくはパスワードが間違っています。"
    end
    html = ""
    # エラーメッセージ用のHTMLを生成
    html += <<-EOF
      <div class="error_field alert alert-danger" role="alert">
        <p class="error_msg">#{msg}</p>
      </div>
    EOF
    html.html_safe
  end
end

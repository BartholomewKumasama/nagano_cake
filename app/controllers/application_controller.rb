class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path    # ログイン後に遷移するpathを設定
    when Public
      root_path # ログイン後に遷移するpathを設定
    end
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定(publicブランチ統合後は別のリンクに変更)
  end
end
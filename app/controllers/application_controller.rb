class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url # admin_urlを参照する

  def admin_url
    request.fullpath.include?("/admin") #pathにadminが含まれているページは、adminでログインしないと見れない設定
  end

end

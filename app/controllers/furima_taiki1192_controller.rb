class FurimaTaiki1192Controller < ApplicationController
  def index
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
  end
end

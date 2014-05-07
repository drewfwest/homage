class ChangeUserOauthSecretToOauthVerifier < ActiveRecord::Migration
  def change
    rename_column :users, :oauth_secret, :oauth_verifier
  end
end

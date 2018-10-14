json.extract! player, :id, :username, :uuid, :user_enabled, :admin_disabled, :created_at, :updated_at
json.url player_url(player, format: :json)

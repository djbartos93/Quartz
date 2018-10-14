module PlayersHelper

def mojangAPI(username)
  url = "https://api.mojang.com/users/profiles/minecraft/#{username}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  uuid = JSON.parse(response.id)["id"]
end

end

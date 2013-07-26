def parse_omniauth(omniauth_hash)
  {
    name:   omniauth_hash['info']['name'],
    image:  omniauth_hash['info']['image'],
    token:  omniauth_hash['credentials']['token'],
    secret: omniauth_hash['credentials']['secret']
  }
end

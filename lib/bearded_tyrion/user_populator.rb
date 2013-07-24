class BeardedTyrion::UserPopulator
  class << self
    def populate_from_session(session_auth)
      BeardedTyrion::User.new session_auth
    end

    def populate_from_oauth(omniauth_hash)
      BeardedTyrion::User.new({
        name:   omniauth_hash['info']['name'],
        image:  omniauth_hash['info']['image'],
        token:  omniauth_hash['credentials']['token'],
        secret: omniauth_hash['credentials']['secret']
      })
    end
  end
end

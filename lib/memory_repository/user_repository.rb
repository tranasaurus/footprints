require 'memory_repository/models/user'
require 'memory_repository/base_repository'
require './lib/repository'

module MemoryRepository
  class UserRepository
    include BaseRepository

    def new(attrs = {})
      MemoryRepository::User.new(attrs)
    end

    def create(attrs = {})
      user = new(attrs)
      save(user)
      user
    end

    def find_by_email(email)
      records.values.find { |r| r.email == email }
    end

    def find_by_id(id)
      records.values.find { |r| r.id == id }
    end

    def find_by_uid(uid)
      records.values.find { |r| r.uid == uid }
    end

    def find_by_login(login)
      records.values.find { |r| r.login == login }
    end
  end
end

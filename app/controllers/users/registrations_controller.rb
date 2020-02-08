class Users::RegistrationsController < Device::RegistrationsController
    def build_resource(hash={})
        hash[:uid] = User.create_unique_string
        super
    end
end

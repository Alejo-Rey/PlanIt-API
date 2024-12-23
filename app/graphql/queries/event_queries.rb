module Queries
  module EventQueries
    def self.included(base)
      base.field :events, [Types::EventType], null: false, description: "Fetch all events"

      base.define_method(:events) do
        Event.all
      end

      # Consulta para obtener un evento por ID
      base.field :event, Types::EventType, null: true, description: "Fetch a specific event by ID" do
        argument :id, GraphQL::Types::ID, required: true
      end

      base.define_method(:event) do |id:|
        Event.find_by(id: id)
      end
    end
  end
end

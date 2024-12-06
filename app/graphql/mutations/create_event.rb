# frozen_string_literal: true

module Mutations
  class CreateEvent < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true
    argument :event_date, String, required: true

    type Types::EventType

    def resolve(title:, description:, latitude:, longitude:, event_date:)
      Event.create!(
        title: title,
        description: description,
        latitude: latitude,
        longitude: longitude,
        event_date: event_date
      )
    end
  end
end

class ChatController < ApplicationController
  include Tubesock::Hijack

  def chat
    hijack do |tubesock|
      tubesock.onopen do
        tubesock.send_data message: { content:  "Hello, friend" }
      end

      tubesock.onmessage do |data|
        m = Message.create data[:message]
        tubesock.send_data message: { content: "You said: #{m.content}" }
      end

    end
  end
end

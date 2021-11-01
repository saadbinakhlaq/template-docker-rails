require 'active_support/concern'

module FacebookApi
  extend ActiveSupport::Concern

  def facebook_wall_post
    return if self.facebook_post_id.present?

    @graph = Koala::Facebook::API.new("EAADZBflusYhYBAMAHgKTGyUnoAGGZBddJRhYPMSRRyev1DbGBAMKZCp9aZAwZAZCGiBXE09c5p6cMhpQjj5PsdQ2njZC8TZC9YmIIrRrfmMucHGpxlQgBQXn5EREPch5OyJIO1ZAf4TpWJRW82ToqnpdzNS1w0BqDa3AR2TZAmNyWHxzslT0sDyxa5ZBXQKmAR9v7yxS0ALgyBUQ0rijckcbtVQ")

    response = @graph.put_picture(self.media_url, {:caption => self.summary})
    self.update(facebook_post_id: response["id"])
  end
end

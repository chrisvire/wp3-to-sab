module MSPhotoStory
  class Rect
    attr_accessor :left, :top, :width, :height
  end

  class Transition
    attr_accessor :type, :use_manual_duration, :duration, :with_prev_image
  end

  class Image
    attr_accessor :motions, :transitions

  end




  class VisualUnit
    attr_accessor :duration, :type, :transitions, :image
  end

  class Project
    attr_accessor :visual_units
    def initialize(xml)
      parser = Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.to_sym })
      project = parser.parse(xml)[:MSPhotoStoryProject]
      debug(project)
    end
  end

end
module PicSieve
  class Pictures
    attr_accessor :source, :pictures

    def add(picture)
      @pictures << picture
    end

    def first
      pictures.first
    end

    def initialize
      @pictures = []
    end

    def last
      pictures.last
    end
  end
end

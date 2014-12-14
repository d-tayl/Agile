class StaticpagesController < ApplicationController
  def home
    @title = "Home"
  end

  def abouttheclub
    @title = "About the club"
  end

  def howtojoin
        @title = "How to join"
  end

  def whatyouneed
    @title = "What you need"
  end

  def clubmatters
    @title = "Club matters"
  end

  def howtogetthere
    @title = "How to get there"
  end

  def croquetlinks
    @title = "Useful croquet links"
  end
end

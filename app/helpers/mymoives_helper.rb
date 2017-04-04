module MymoivesHelper
  def render_mymoive_description(mymoive)
    simple_format(mymoive.description)
  end
end

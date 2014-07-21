class Step1ControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.random
  end

  def message(st)
    st.text = 'Hi, I\'m a step.  Just move along... move along'
    st.frame = 'b3:k11'
    st.font = font.large
    st.number_of_lines = 0
  end
end

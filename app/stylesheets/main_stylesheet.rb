class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def hello_world(st)
    st.frame = {t: 10, w: 200, h: 100}
    st.centered = :horizontal
    st.text_alignment = :center
    st.text = 'Enjoy Custom Controller Transitions'
    st.color = color.battleship_gray
    st.font = font.medium
    st.number_of_lines = 0
  end

  def load_normal(st)
    st.frame = "a2:e4"
    st.text = 'Load Normal'
    st.background_color = color.relaxed_blue
    st.corner_radius = 20
  end

  def load_special(st)
    st.frame = "h2:l4"
    st.text = 'Load Special'
    st.background_color = color.relaxed_orange
    st.corner_radius = 20
  end

end

module Step2CellStylesheet
  def step2_cell_height
    80
  end

  def step2_cell(st)
    # Style overall cell here
    st.background_color = color.random
  end

  def cell_label(st)
    st.color = color.black
  end
end

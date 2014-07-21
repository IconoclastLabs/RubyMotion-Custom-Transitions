class Step2Controller < UITableViewController

  STEP2_CELL_ID = "Step2Cell"

  def viewDidLoad
    super

    load_data

    rmq.stylesheet = Step2ControllerStylesheet

    view.tap do |table|
      table.delegate = self
      table.dataSource = self
      rmq(table).apply_style :table
    end
  end

  def load_data
    @data = 0.upto(rand(100)).map do |i| # Test data
      {
        name: %w(Lorem ipsum dolor sit amet consectetur adipisicing elit sed).sample,
        num: rand(100),
      }
    end
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.step2_cell_height
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row]

    cell = table_view.dequeueReusableCellWithIdentifier(STEP2_CELL_ID) || begin
      rmq.create(Step2Cell, :step2_cell, reuse_identifier: STEP2_CELL_ID).get

      # If you want to change the style of the cell, you can do something like this:
      #rmq.create(Step2Cell, :step2_cell, reuse_identifier: STEP2_CELL_ID, cell_style: UITableViewCellStyleSubtitle).get
    end

    cell.update(data_row)
    cell
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end
end

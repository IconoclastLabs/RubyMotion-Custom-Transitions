class Step1Controller < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = Step1ControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here
    nav_next_button = UIBarButtonItem.new
    nav_next_button.title = 'Next'
    nav_next_button.target = self
    nav_next_button.action = 'next_step'
    self.navigationItem.rightBarButtonItem = nav_next_button
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCancel, target:self, action:'close')

    rmq.append(UILabel, :message)
  end

  def next_step
    self.navigationController.pushViewController(Step2Controller.new, animated: true)
  end

  def close
    dismissModalViewControllerAnimated(true)
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




class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @hello_world_label = rmq.append(UILabel, :hello_world).get
  end

  def init_nav
    self.title = 'Controller Animations'

    rmq.append(UIButton, :load_normal).on(:tap) do |sender|
      p "Normal Clicked"
      @step ||= UINavigationController.alloc.initWithRootViewController(Step1Controller.new)
      self.presentViewController(@step, animated:true, completion:nil)
    end


    rmq.append(UIButton, :load_special).on(:tap) do |sender|
      p "Special Clicked"
      @step ||= UINavigationController.alloc.initWithRootViewController(Step1Controller.new)
      @transition = CustomTransition.new
      @step.delegate = @transition
      self.presentViewController(@step, animated:true, completion:nil)
    end
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




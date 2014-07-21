class CustomTransition
  attr_accessor :from_vc, :to_vc
  PADDING = 1.5

  def initialize (duration = 0.5)
    @duration = duration
  end

  # Required by iOS7 UIViewControllerAnimatedTransitioning
  def transitionDuration transitionContext
    @duration
  end

  # Required by iOS7 UIViewControllerAnimatedTransitioning
  def animateTransition transitionContext

    # Customization
    from_options = {
      duration: @duration,
      completion: -> (did_finish, q) {
        # get outa hea!
        @from_vc.view.removeFromSuperview
      }
    }

    # Using RMQ canned animation
    rmq(@from_vc).drop_and_spin(from_options)

    # Customization
    to_options = {
      duration: @duration,
      completion: -> (did_finish, q) {
        transitionContext.completeTransition(true)
      }
    }

    # Add new controller
    transitionContext.containerView.addSubview(@to_vc.view)

    # Animate in with RQM canned animation
    rmq(@to_vc).land_and_sink_and_throb(to_options)

  end

  # Navigation controller delegate
  def navigationController(navigationController, animationControllerForOperation:operation, fromViewController:from_vc, toViewController:to_vc)
    @operation = operation
    @from_vc = clear_background(from_vc)
    @to_vc = clear_background(to_vc)

    self
  end


  def clear_background(vc)
    vc.view.backgroundColor = rmq.color.clear
    vc.view.backgroundView = nil if vc.view.is_a?(UITableView)

    vc
  end


end
class CustomTransition

  def initialize (duration = 1.0)
    @duration = duration
  end

  # Required by iOS7 UIViewControllerAnimatedTransitioning
  def transitionDuration transitionContext
    @duration
  end

  def animateTransition transitionContext

    #Animate existing layer away + remove
    rmq(@from_vc.view).animate(
      duration: @duration/2,
      animations: ->(cq) {
        cq.style do |st|
          st.opacity = 0
          st.rotation = 180
        end
      },
      completion: -> (did_finish, q) {
        # clear on out
        @from_vc.view.removeFromSuperview
      }
    )

    # First add our new subview
    transitionContext.containerView.addSubview(@to_vc.view)
    #start it off
    rmq(@to_vc.view).style do |st|
      st.opacity = 0.1
      st.scale = 8.0
    end

    # Animate new view into place + completeTransition
    rmq(@to_vc.view).animate(
      duration: @duration,
      animations: ->(cq) {
        cq.style do |st|
          st.opacity = 1.0
          st.scale = 1.0
        end
      },
      completion: -> (did_finish, q) {
        #relinquish animation state
        transitionContext.completeTransition(true)
      }
    )


  end

  # Navigation controller delegate
  def navigationController(navigationController, animationControllerForOperation:operation, fromViewController:from_vc, toViewController:to_vc)
    @operation = operation
    @from_vc = from_vc
    @to_vc = to_vc

    self
  end

end
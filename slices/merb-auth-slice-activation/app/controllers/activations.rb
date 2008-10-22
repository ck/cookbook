class MerbAuthSliceActivation::Activations <  MerbAuthSliceActivation::Application

  private
  def redirect_after_activation
    redirect "/", :message => {:notice => "Activation Successful"}
  end

end # MerbAuthSliceActivation::Activations

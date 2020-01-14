class ShowPresenter
  def initialize(response)
    @response = response
    @state    = @response["data"]["attributes"]["state"]
  end

  def status
    return 'info'    if @state == 'new'
    return 'success' if @state == 'approved'
    return 'danger'  if @state == 'rejected'
    return 'warning' if @state == 'observed'
  end

  def info
    return 'Su solicitud fue creada como nueva' if @state == 'new'
    return 'Su solicitud fue aprovada'          if @state == 'approved'
    return 'Su solicitud fue rechazada'         if @state == 'rejected'
    return 'Su solicitud esta en observacion'   if @state == 'observed'
  end

  def state
    @state
  end
end
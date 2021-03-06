jQuery ->
  ###*
  # Binding to the click event of the add_new_date_type button to dynamically
  # add the appropriate field and html for handling this new type of date.
  ###
  $(document).on('click', '#add_new_date_type', (event) ->
    #empty the warning by default to reevaluate if there should be one on each
    #button click
    $(".warning-anchor").empty()
    event.preventDefault()

    selected_option = $('#new_date_type').find('option:selected').first()
    type = selected_option.val()

    if !type
      #Variable assignment and necessary string manipulation
      select_date_notice = '<div class="alert alert-info alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> You must select a valid date type. </div>'
      $('.warning-anchor').append(select_date_notice)
      return

    notice = '<div class="alert alert-info alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> That date field already exists </div>'
    type_label = selected_option.data('label')
    date_created = $(".form-group.generic_work_date_created")
    html = html_manipulation(date_created.clone(), type, type_label)

    html.find("ul.listing li:not(:last-child)").remove()

    #append and managing fields
    $('.warning-anchor').append(notice) if $('.generic_work_'+type).length > 0
    $('#date_wrapper').append(html) if $('.generic_work_'+type).length == 0
    $('.form-group.generic_work_'+type).manage_fields()

    html.find('.input-group-btn:first').remove() if html.find('.input-group-btn').length == 2

    $('#new_date_type').find("option[value='" + type + "']").hide()
    first_option_val = $('#new_date_type').find("option").first().val()
    $('#new_date_type').val(first_option_val)
    #bind_all_datepickers()
  )

  ###*
  # Binding to the click event of any input field, detecting if it is a field
  # that should have datepicker enabled, rebind all datepickers, and show
  # "this" one.
  ###
  $(document).on('click', 'input[type="text"]', (event) ->
    if $(this).parents('.form-group').find('.date-picker-enabled').length > 0
      bind_all_datepickers()
      $(this).datepicker('show')
      return
  )

  ###*
  # Function to ensure all datepicker input fields are bound. This takes into
  # account that date fields are dynamically added and need to have be cleansed
  # of previous bindings, data, and to be assigned a unique ID.
  ###
  bind_all_datepickers = () ->
    $('.date-picker-enabled')
      .parents(".form-group")
      .find("input[type=text]")
      .each((i) ->
        $(this).removeClass('hasDatepicker')
          .removeData('datepicker')
          .unbind()
          .attr('id', 'datepicker_' + i)
          .datepicker({dateFormat: 'yy-mm-dd'})
      )
    return


  html_manipulation = (html, type, type_label) ->
    html.removeClass('generic_work_date_created').addClass('generic_work_'+type)
    html.find('#generic_work_date_created_help').attr('id', 'generic_work_'+type+'_help')
    html.find('input.generic_work_date_created').removeClass('generic_work_date_created').addClass('generic_work_'+type).attr('name', "generic_work["+type+"][]").attr("id", "generic_work_"+type).val('')
    html.find('.date-header-label').text(type_label)
    html.find('.input-group-btn:last > .add').unbind()
    return html

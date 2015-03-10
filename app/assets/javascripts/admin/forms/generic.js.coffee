$(document).on "click", '.submit-btn', (event) ->
  event.preventDefault()
  if is_not_blank('.required') && has_no_illegal_character('.alpha-numeric')
    $('form').submit()


$(document).on "click", '.submit-modal-btn', (event) ->
  event.preventDefault()
  $parent = $(this).parents().eq(3)
  if is_not_blank($parent.find('.required')) && has_no_illegal_character($parent.find('.alpha-numeric'))
    reset_push($(this))
    $(this).addClass("current-push")
    $(this).parents().eq(3).find('form').submit()

$(document).on "click", '.submit-po', (event) ->
  event.preventDefault()
  $parent = $('.submit-po').parents().eq(3)
  if is_not_blank($parent.find('.required')) && has_no_illegal_character($parent.find('.alpha-numeric'))
    $('.edit_purchase_order').submit()


$(document).on "click", '.submit-po-invoice', (event) ->
  event.preventDefault()
  $parent = $('.submit-po-invoice').parents().eq(3)
  if is_not_blank($parent.find('.required'))  && has_no_illegal_character($parent.find('.alpha-numeric'))
    $('.new_po_order_invoice').submit()


$(document).on "click", '.search-btn', (event) ->
  event.preventDefault()
  $form = $('.search-form')
  $form.find('input').each ->
    if $(this).val().trim() == ""
      $(this).prop("disabled",true)

  $form.find('select').each ->
    if $(this).val() == ""
      $(this).prop("disabled",true)


  $form.submit()





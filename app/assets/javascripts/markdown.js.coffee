jQuery ->
  $('*[data-markdown]').html ->
    marked $(this).data('markdown')

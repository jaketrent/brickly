define ['tmpl!cellView'], (cellViewTmpl) ->
  class CellView extends Backbone.View
    events:
      'click .widget-title.empty': 'addWidget'
    render: ->
      @$el.addClass("span#{@options.width}")
          .html cellViewTmpl(@options)
      this
    addWidget: ->
      alert('adding widget')
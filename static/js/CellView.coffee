define ['tmpl!cellView'], (cellViewTmpl) ->
  class CellView extends Backbone.View
    tagName: 'div'
    render: ->
      @$el.addClass("span#{@options.width}")
          .html cellViewTmpl(@options)
      this
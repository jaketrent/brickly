define ['CellView', 'tmpl!newLevel'], (CellView, newLevelTmpl) ->
  class LevelView extends Backbone.View
    className: 'row-fluid level'
    render: ->
      if @options.cells?
        frag = document.createDocumentFragment()
        _(@options.cells).each (cell, iter) ->
          cellView = new CellView(cell)
          frag.appendChild cellView.render().el

        @$el.html(frag)
      else
        @$el.html(newLevelTmpl())
      this
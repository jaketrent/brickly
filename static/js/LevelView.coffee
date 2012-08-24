define ['CellView', 'tmpl!newLevel'], (CellView, newLevelTmpl) ->
  class LevelView extends Backbone.View
    className: 'row-fluid level'
    events:
      'click .col-model': 'mkLevelDividers'
    initialize: ->
      @id = @options.id
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
    mkLevelDividers: (evt) ->
      $target = $(evt.currentTarget)
      widths = _($target.attr('class').match('colsize-(.*)?')[1].split('-')).map (obj) ->
        parseInt(obj)
      Backbone.Events.trigger('chooseNewLevelDividers', widths, @id)
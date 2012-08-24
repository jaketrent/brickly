define ['LevelView', 'tmpl!rowDiv'], (LevelView, rowDivTmpl) ->
  class LayoutManager extends Backbone.View
    events:
      'click .row-div': 'addRow'
    initialize: ->
      @layout = [
          id: '123abc'
          cells: [
            width: 4
            widget:
              title: 'Missionary Badge'
          ,
            width: 8
            widget:
              title: 'LMS Training',
          ]
        ,
          id: '456def'
          title: 'Missionary Prep'
          cells: [
              width: 4
              widget:
                title: 'Immunizations'
            ,
              width: 4
              widget:
                title: 'Dress and Grooming',
            ,
              width: 4
              widget:
                title: 'Mormonorg'
          ]
      ]
      Backbone.Events.on('chooseNewLevelDividers', @mkNewLevel, this)
    render: ->
      frag = document.createDocumentFragment()
      div = rowDivTmpl()
      frag.appendChild($(div)[0])

      _(@layout).each (level, iter) ->
        levelView = new LevelView(level)
        frag.appendChild levelView.render().el
        frag.appendChild $(div)[0]
      @$el.html(frag)
      this
    addRow: (evt) ->
      genUID = ->
        ("0000" + (Math.random()*Math.pow(36,4) << 0).toString(36)).substr(-4)
      indx = @$('.row-div').index($(evt.currentTarget))
      @layout.splice(indx, 0, { id: genUID() })
      @render()
    mkNewLevel: (widths, newRowId) ->
      emptyNewLevel = _(@layout).find (level) ->
        level.id is newRowId
      emptyNewLevel.cells = ({ width: w } for w in widths)
      @render()



define ['LevelView', 'tmpl!rowDiv'], (LevelView, rowDivTmpl) ->
  class LayoutManager extends Backbone.View
    events:
      'click .row-div': 'addRow'
    initialize: ->
      @layout = [
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
      indx = @$('.row-div').index($(evt.currentTarget))
      @layout.splice(indx, 0, {})
      @render()



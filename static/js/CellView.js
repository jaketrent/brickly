// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['tmpl!cellView'], function(cellViewTmpl) {
    var CellView;
    return CellView = (function(_super) {

      __extends(CellView, _super);

      function CellView() {
        return CellView.__super__.constructor.apply(this, arguments);
      }

      CellView.prototype.tagName = 'div';

      CellView.prototype.render = function() {
        this.$el.addClass("span" + this.options.width).html(cellViewTmpl(this.options));
        return this;
      };

      return CellView;

    })(Backbone.View);
  });

}).call(this);
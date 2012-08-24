require({
  paths: {
    cs: './vendor/cs-0.4.2',
    text: './vendor/text-2.0.0',
    underscore: './vendor/underscore-1.3.3',
    backbone: './vendor/backbone-0.9.2',
    handlebars: './vendor/handlebars-1.0.0.beta.6',
    tmpl: './tmpl'
  },
  shim: {
    'backbone': {
      deps: ['underscore'],
      exports: 'Backbone'
    }
  }
},
['require', 'backbone'],
function (require) {
  require(['LayoutManager'], function (LayoutManager) {
    var mgr = new LayoutManager({
      el: '.container'
    });
    mgr.render();
  });
});
var ubicacionesRouter = Backbone.Router.extend({
  extensionViewInstance: null,
  autorViewInstance: null,
  initialize: function() {
  },
  routes: {
    "": "index",
    "ubicacion": "ubicacion",
    "*actions" : "default",
  },
  index: function(){
    window.location.href = BASE_URL + "#/ubicacion";
  },
  ubicacion: function() {
    if(this.ubicacicionView == null){
      this.ubicacicionView = new UbicacionView();
    }
    this.ubicacicionView.render();
    this.ubicacicionView.tablaDepartamento.listar();
  },
  default: function() {
    window.location.href = BASE_URL + "#/error/404";
  },
});

$(document).ready(function(){
  router = new ubicacionesRouter();
  Backbone.history.start();
})

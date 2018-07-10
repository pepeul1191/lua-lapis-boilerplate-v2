var TablaProvinciaView = TableView.extend({
  initialize: function(options){
    // herencia de atributos, móetodos y eventos
    TableView.prototype.initialize.apply(this, [options])
    this.inheritEvents(TableView);
    // delegación de eventos
    this.delegateEvents();
  },
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    "click i.ver-distrito": "verDistrito",
  },
  verDistrito: function(event, tablaDistrito){
    var provinciaId = event.target.parentElement.parentElement.firstChild.innerHTML;
    tablaDistrito.urlListar = BASE_URL + "distrito/listar/" + provinciaId;
    tablaDistrito.limpiarBody();
    tablaDistrito.listar();
    tablaDistrito.extraData = {provincia_id: provinciaId};
    document.getElementById("formTableDistrito").classList.remove("oculto");
  },
});

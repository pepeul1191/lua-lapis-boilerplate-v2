var TablaDepatartamentoView = TableView.extend({
  initialize: function(options){
    // herencia de atributos, móetodos y eventos
    TableView.prototype.initialize.apply(this, [options])
    this.inheritEvents(TableView);
    // delegación de eventos
    this.delegateEvents();
  },
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    "click i.ver-provincia": "verProvincias",
  },
  verProvincias: function(event, tablaProvincia, tablaDistrito){
    var departamentoId = event.target.parentElement.parentElement.firstChild.innerHTML;
    //urlListar: BASE_URL + "provincia/listar/" + departamentoId,
    tablaProvincia.urlListar = BASE_URL + "provincia/listar/" + departamentoId;
    document.getElementById("formTableProvincia").classList.remove("oculto");
    tablaProvincia.limpiarBody();
    tablaProvincia.listar();
    tablaProvincia.extraData = {departamento_id: departamentoId};
    tablaDistrito.limpiarBody();
    document.getElementById("formTableDistrito").classList.add("oculto");
  },
});

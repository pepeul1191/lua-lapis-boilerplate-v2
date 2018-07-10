var UbicacionView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
		//this.tabla = new TableView(paramsDoctorTable);
    this.tablaDepartamento = new TablaDepatartamentoView(dataTablaDepartamento);
    this.tablaProvincia = new TablaProvinciaView(dataTablaProvincia);
    this.tablaDistrito = new TableView(dataTablaDistrito);
	},
	events: {
		// se está usando asignacion dinamica de eventos en el constructor
    //eventos tabla de departamentos
    "click #tablaDepatartamento > tfoot > tr > td > button.agregar-fila": "agregarFilaDepartamento",
		"click #tablaDepatartamento > tfoot > tr > td > button.guardar-tabla": "guardarTablaDepartamento",
		"keyup #tablaDepatartamento > tbody > tr > td > input.text": "inputTextEscribirDepartamento",
		"click #tablaDepatartamento > tbody > tr > td > i.quitar-fila": "quitarFilaDepartamento",
    "click i.ver-provincia": "verProvincias",
    //tabla provincias
    "click #tablaProvincias > tfoot > tr > td > button.agregar-fila": "agregarFilaProvincia",
    "click #tablaProvincias > tfoot > tr > td > button.guardar-tabla": "guardarTablaProvincia",
    "keyup #tablaProvincias > tbody > tr > td > input.text": "inputTextEscribirProvincia",
    "click #tablaProvincias > tbody > tr > td > i.quitar-fila": "quitarFilaProvincia",
    "click i.ver-distrito": "verDistrito",
    //tabla distritos
    "click #tablaDistritos > tfoot > tr > td > button.agregar-fila": "agregarFilaDistrito",
    "click #tablaDistritos > tfoot > tr > td > button.guardar-tabla": "guardarTablaDistrito",
    "keyup #tablaDistritos > tbody > tr > td > input.text": "inputTextEscribirDistrito",
    "click #tablaDistritos > tbody > tr > td > i.quitar-fila": "quitarFilaDistrito",
	},
	render: function() {
		this.$el.html(this.getTemplate());
		return this;
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'templates/ubicaciones/index.html',
		   type: "GET",
		   async: false,
		   success: function(source) {
		   	var template = Handlebars.compile(source);
		   	template_compiled = template(data);
		   }
		});
		return template_compiled;
	},
  //evnetos tabla de departamentos
  inputTextEscribirDepartamento: function(event){
    this.tablaDepartamento.inputTextEscribir(event);
  },
  quitarFilaDepartamento: function(event){
    this.tablaDepartamento.quitarFila(event);
  },
  guardarTablaDepartamento: function(event){
    this.tablaDepartamento.guardarTabla(event);
  },
  agregarFilaDepartamento: function(event){
    this.tablaDepartamento.agregarFila(event);
  },
  verProvincias: function(event){
    this.tablaDepartamento.verProvincias(event, this.tablaProvincia, this.tablaDistrito);
  },
  //evnetos tabla de provincas
  inputTextEscribirProvincia: function(event){
    this.tablaProvincia.inputTextEscribir(event);
  },
  quitarFilaProvincia: function(event){
    this.tablaProvincia.quitarFila(event);
  },
  guardarTablaProvincia: function(event){
    this.tablaProvincia.guardarTabla(event);
  },
  agregarFilaProvincia: function(event){
    this.tablaProvincia.agregarFila(event);
  },
  verDistrito: function(event){
    this.tablaProvincia.verDistrito(event, this.tablaDistrito);
  },
  //evnetos tabla de distritos
  inputTextEscribirDistrito: function(event){
    this.tablaDistrito.inputTextEscribir(event);
  },
  quitarFilaDistrito: function(event){
    this.tablaDistrito.quitarFila(event);
  },
  guardarTablaDistrito: function(event){
    this.tablaDistrito.guardarTabla(event);
  },
  agregarFilaDistrito: function(event){
    this.tablaDistrito.agregarFila(event);
  },
});

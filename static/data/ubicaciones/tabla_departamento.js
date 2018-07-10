var dataTablaDepartamento = {
  el: "formTableDepartamento",
  idTable: "tablaDepatartamento",
  targetMensaje: "mensajeRpta",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los departamentos",
  },
  urlListar: BASE_URL + "departamento/listar",
  urlGuardar: BASE_URL + "departamento/guardar",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    nombre: { // llave de REST
      tipo: "text",
      estilos: "width: 250px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px"
    },
  },
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "ver-provincia",
      clase: "fa-list",
      estilos: "padding-left: 5px;",
    },
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 10px;",
    },
  ],
  collection: new DepartamentosCollection(),
  model: "Departamento",
};

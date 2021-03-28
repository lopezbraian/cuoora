Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarPreguntaConTitulo: aTitle Descripcion: aText Topicos: aTopico de: aUsuario [

aUsuario preguntas: (Pregunta newConTitulo: aTitle descripcion: aText  topico: aTopico  from: aUsuario )
	
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarRespuestaAPregunta: aPregunta descripcion: aText from: aUsuario [

aPregunta agregarRespuesta: (Respuesta newConDescripcion: aText from: aUsuario )
	
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: aName conDescripcion: aText [
	topicos add: (Topico nombre: aName descripcion: aText)
]

{ #category : #'as yet unclassified' }
CuOOra >> borrarPregunta: aPregunta [
	(self
		preguntasDe: aPregunta user)remove: aPregunta
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: aUser conPass: aPass [
	usuarios add: (UsuarioC new: aUser conPass: aPass)
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestaAPregunta: aPregunta [ 
	aPregunta respuestas. "falta ver el tema del orden"
]

{ #category : #'as yet unclassified' }
CuOOra >> preguntasDe: aUsuario [
	^ aUsuario preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> puntajeDe: aUsuario [

	
]

{ #category : #'as yet unclassified' }
CuOOra >> registrarTopico: aTopico A: aUsuario [ 
	aUsuario agregarTopicoDeInteres: aTopico 
]

{ #category : #'as yet unclassified' }
CuOOra >> seguirA: aUsuario Por: aUsuario2 [
	
	aUsuario2 serFollowerDe: aUsuario
]

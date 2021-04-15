"
Representa una Red Social De Preguntas y respuestas

Instance var usuarios topicos
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #accessing }
CuOOra class >> clearSoleInstance [
	^ soleInstance := nil.
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^soleInstance ifNil: [
		soleInstance := self new .
	].


	
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: aName conDescripcion: aText [
|newTopic|
newTopic :=Topico newConNombre: aName descripcion: aText.
topicos add: (Topico newConNombre: aName descripcion: aText).
^newTopic.
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: aUser conPass: aPass [
	| user |
	user := UsuarioC new: aUser conPass: aPass.
	(usuarios includes: user)
		ifFalse: [usuarios add: user].
	^ user
]

{ #category : #'as yet unclassified' }
CuOOra >> dataTest [
	| pedro juan diego OO1 tu smalltalk p topiclist |
	pedro := self
		crearUsuario: 'pedro@cuoora.com'
		conPass: 'pedro@cuoora.com'.
	diego := self
		crearUsuario: 'diego@cuoora.com'
		conPass: 'diego@cuoora.com'.
	juan := self
		crearUsuario: 'juan@cuoora.com'
		conPass: 'juan@cuoora.com'.
	juan serFollowerDe: diego.
	pedro serFollowerDe: juan.
	OO1 := self
		agregarTopico: 'OO1'
		conDescripcion: 'Orientacion a objetos 1'.
	tu := self agregarTopico: 'Test de unidad' conDescripcion: 'TestCase'.
	smalltalk := self
		agregarTopico: 'Smalltalk'
		conDescripcion: 'Lenguaje de programación'.
	topiclist := OrderedCollection new.
	topiclist add: tu.
	topiclist add: OO1.
		p := pedro
		agregarPreguntaConTitulo: '¿Para qué sirve el método SetUp?'
		Descripcion: 'Para qué sirve el método Set Up en un test???'
		Topicos: topiclist.
	topiclist := OrderedCollection new.
	topiclist add: smalltalk.
	topiclist add: OO1.
	diego
		agregarRespuestaAPregunta: p
		contenido:
			'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'.
	p := diego
		agregarPreguntaConTitulo: '¿Qué significa #messageNotUnderstood?'
		Descripcion: 'Me sale este error y no se que significa'
		Topicos: topiclist.
	pedro
		agregarRespuestaAPregunta: p
		contenido:
			'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.'
]

{ #category : #initialization }
CuOOra >> initialize [
	super initialize.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
	self dataTest .
]

{ #category : #'as yet unclassified' }
CuOOra >> loginWithUsername: aUsername pass: aPass [
	^ usuarios 
		detect: [ :each | each usuario = aUsername & (each pass = aPass) ]
		ifNone: [ nil ].
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasDeTopico: aTopico [
	"De la coleccion de usuarios selecciona los que tienen preguntas que cumplan con el topico solicitado"

	^ usuarios
		flatCollect: [ :each | each obtenerPreguntasDeTopico: aTopico ] .
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRelevantesPara: aUser [
	"Se consideran relevantes las preguntas que pertenecen a los usuarios seguidos y a las que coinciden con los topicos de interes"

	| relevantes |
	relevantes := Set new.
	aUser topicos isEmpty
		ifFalse: [ relevantes
				addAll:
					((usuarios reject: [ :each | each == aUser ])
						flatCollect:
							[ :u | aUser topicos flatCollect: [ :t | u obtenerPreguntasDeTopico: t ] ]) ].
	aUser seguidos isEmpty
		ifFalse: [ relevantes
				addAll:
					((usuarios
						flatCollect: [ :u | aUser seguidos select: [ :s | s == u ] ])
						flatCollect: [ :s | s preguntas ]) ].
	^ relevantes asOrderedCollection .
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestaAPregunta: aPregunta [
	^ aPregunta respuestas asSortedCollection: [ :p1 :p2 | p1 puntaje >= p2 puntaje ]
]

{ #category : #'as yet unclassified' }
CuOOra >> preguntasDe: aUsuario [
	^ aUsuario preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> puntajeDe: aUsuario [
	^ ((self preguntasDe: aUsuario) size * 20)
		+ ((self respuestasDe: aUsuario) size * 50)
]

{ #category : #'as yet unclassified' }
CuOOra >> respuestasDe: aUsuario [

	^ (usuarios reject: [ :u | u == aUsuario ])
		flatCollect: [ :u | u obtenerRespuestasDe: aUsuario ]
]

{ #category : #accessing }
CuOOra >> topicos [
^topicos.
]

{ #category : #accessing }
CuOOra >> usuarios [

^usuarios
]

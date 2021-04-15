Class {
	#name : #PageHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'collectionPreguntas'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callback }
PageHomeComponent >> agregarNuevaPregunta [
	self call: (PageQuestionComponent new)
]

{ #category : #hooks }
PageHomeComponent >> children [
	^ Array with: (BtnComponent withContent: 'Agregar Nueva Pregunta')
]

{ #category : #callback }
PageHomeComponent >> goToDetail: aPregunta [

self session pregunta:aPregunta.

self call:(PageEntradaDetailComponent new)
]

{ #category : #initialization }
PageHomeComponent >> initialize [
	super initialize .

]

{ #category : #accessing }
PageHomeComponent >> model [ 
	^ CuOOra soleInstance .
]

{ #category : #'as yet unclassified' }
PageHomeComponent >> pregunta: aPregunta en: aCanvas [

aCanvas anchor
		callback: [ self goToDetail: aPregunta ];
		class: 'pregunta';
		with: [ aCanvas paragraph
				with: aPregunta titulo;
				class: 'title-pregunta' ].
	aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ aPregunta topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
	aCanvas span: 'Realizada por '.
	aCanvas anchor
		class: 'nombre-user';
		callback: [ self profileOfUser: aPregunta user ];
		with: aPregunta user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: aPregunta respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: aPregunta likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: aPregunta dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada:  aPregunta  ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada:  aPregunta ];
		with: 'dislike'.
	aCanvas horizontalRule   
]

{ #category : #callback }
PageHomeComponent >> profileOfUser: aUser [

^self call: (PageProfileComponent newWithData: aUser )
]

{ #category : #rendering }
PageHomeComponent >> renderContentOn: aCanvas [
	aCanvas div
		class: 'wrap-btn-home';
		with: [ aCanvas anchor
				callback: [ self agregarNuevaPregunta ];
				class: 'btn-anchor';
				with:
						[ aCanvas render: (BtnComponent withContent: 'Agregar Nueva Pregunta') ] ].
	aCanvas heading: 'Últimas preguntas'.
	self renderFeed: aCanvas
]

{ #category : #rendering }
PageHomeComponent >> renderFeed: aCanvas [
	collectionPreguntas := CuOOra soleInstance
		obtenerPreguntasRelevantesPara: self session user.
	aCanvas
		unorderedList: [ (collectionPreguntas size > 5 ) ifTrue: [(collectionPreguntas first: 5)
				asSortedCollection: [ :p1 :p2 | p1 fecha <= p2 fecha ]].
		collectionPreguntas do: [ :each | 
					aCanvas
						listItem: [ aCanvas render: [ self pregunta: each en: aCanvas ] ] ] ]
]

Class {
	#name : #PageHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'collectionPreguntas',
		'pregunta'
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


self call:(PageEntradaDetailComponent withData: aPregunta)
]

{ #category : #initialization }
PageHomeComponent >> initialize [
	super initialize .

]

{ #category : #accessing }
PageHomeComponent >> model [ 
	^ CuOOra soleInstance .
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
						listItem: [ aCanvas render: ( QuestionDetailComponent parent:self question: each ) ] ] ]
]

Class {
	#name : #PageEntradaDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'btnComponent',
		'pregunta',
		'data'
	],
	#classInstVars : [
		'data'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
PageEntradaDetailComponent class >> withData: aData [
^ self new data:aData; yourself.
]

{ #category : #hooks }
PageEntradaDetailComponent >> children [ 
^Array with: btnComponent 
]

{ #category : #accessing }
PageEntradaDetailComponent >> data [
	^ data
]

{ #category : #accessing }
PageEntradaDetailComponent >> data: anObject [
	data := anObject
]

{ #category : #callback }
PageEntradaDetailComponent >> goToDetail: aPregunta [
	self call: (PageEntradaDetailComponent withData: aPregunta)
]

{ #category : #initialization }
PageEntradaDetailComponent >> initialize [ 
	super initialize.
	
	btnComponent := BtnComponent withContent: 'Agregar Respuesta'.
]

{ #category : #callbacks }
PageEntradaDetailComponent >> nuevaRespuesta [
	self call: (PageAnswerComponent newWithData: data)
]

{ #category : #callback }
PageEntradaDetailComponent >> profileOfUser: aUser [

^self call: (PageProfileComponent newWithData: aUser )
]

{ #category : #rendering }
PageEntradaDetailComponent >> renderContentOn: aCanvas [
	aCanvas render: (QuestionDetailComponent parent: self question: data).
	self renderRespuestas: aCanvas.
	aCanvas paragraph
		class: 'center';
		with: 'No hay más respuestas'.
	aCanvas div
		class: 'wrap-btn-detail';
		with: [ aCanvas anchor
				class: 'center';
				callback: [ self nuevaRespuesta ];
				with: [ aCanvas render: btnComponent ] ]
]

{ #category : #rendering }
PageEntradaDetailComponent >> renderRespuestas: aCanvas [
	aCanvas
		unorderedList: [ data respuestas
				do: [ :each | aCanvas render: (AnswerDetailComponent parent: self answer: each )
					 ] ]
]

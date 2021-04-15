Class {
	#name : #PageAnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'data',
		'respuesta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'instance creation' }
PageAnswerComponent class >> newWithData: data [ 

^self new data: data; yourself . 
]

{ #category : #callback }
PageAnswerComponent >> cancelar [

self answer.
]

{ #category : #accessing }
PageAnswerComponent >> data [
	^ data
]

{ #category : #accessing }
PageAnswerComponent >> data: anObject [
data := anObject
]

{ #category : #callback }
PageAnswerComponent >> goToDetail: aPregunta [
	self call: (PageEntradaDetailComponent withData: aPregunta)
]

{ #category : #callback }
PageAnswerComponent >> guardar [
	self session user
		agregarRespuestaAPregunta: data
		contenido: respuesta.
	self answer
]

{ #category : #initialization }
PageAnswerComponent >> initialize [ 

super initialize .
self respuesta: 'Escriba su respuesta aquí'
]

{ #category : #callback }
PageAnswerComponent >> profileOfUser: aUser [
	^ self call: (PageProfileComponent newWithData: aUser)
]

{ #category : #rendering }
PageAnswerComponent >> renderContentOn: aCanvas [
	aCanvas render: (QuestionDetailComponent parent: self question: data).
	aCanvas div
		class: 'container-respuesta';
		with: [ aCanvas paragraph: 'RESPONDER '.
			aCanvas
				form: [ aCanvas textArea
						on: #respuesta of: self;
						columns: 80;
						rows: 5.
					aCanvas break.
					aCanvas div
						class: 'wrap-button-form';
						with: [ aCanvas submitButton
								callback: [ self guardar ];
								with: 'Guardar'.
							aCanvas submitButton
								callback: [ self cancelar ];
								with: 'Cancelar' ] ] ]
]

{ #category : #accessing }
PageAnswerComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
PageAnswerComponent >> respuesta: anObject [
	respuesta := anObject
]

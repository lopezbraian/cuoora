Class {
	#name : #PageAnswerComponent,
	#superclass : #PageComponent,
	#instVars : [
		'entrada',
		'respuesta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'instance creation' }
PageAnswerComponent class >> newWithData: data [ 

^self new entrada: data; yourself . 
]

{ #category : #callback }
PageAnswerComponent >> cancelar [

self answer.
]

{ #category : #accessing }
PageAnswerComponent >> entrada [
	^ entrada
]

{ #category : #accessing }
PageAnswerComponent >> entrada: anObject [
	entrada := anObject
]

{ #category : #callback }
PageAnswerComponent >> guardar [

self session user agregarRespuestaAPregunta: entrada contenido: respuesta.
self answer .
]

{ #category : #initialization }
PageAnswerComponent >> initialize [ 

super initialize .
self respuesta: 'Escriba su respuesta aquí'
]

{ #category : #'as yet unclassified' }
PageAnswerComponent >> pregunta: aCanvas [
	aCanvas paragraph
		class: 'title-pregunta';
		with: entrada titulo
		.
	aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ entrada topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
	aCanvas span: 'Realizada por '.
	aCanvas anchor
		class: 'nombre-user';
		callback: [ self profileOfUser: entrada user ];
		with: entrada user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: entrada respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: entrada likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: entrada dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada:  entrada ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada:  entrada ];
		with: 'dislike'.
	aCanvas horizontalRule
]

{ #category : #rendering }
PageAnswerComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self pregunta: aCanvas.
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

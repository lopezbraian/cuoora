Class {
	#name : #PageEntradaDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'btnComponent',
		'pregunta'
	],
	#classInstVars : [
		'data'
	],
	#category : #'Objetos2-CuOOra-UI'
}

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

{ #category : #initialization }
PageEntradaDetailComponent >> initialize [ 
	super initialize.
	
	btnComponent := BtnComponent withContent: 'Agregar Respuesta'.
]

{ #category : #callbacks }
PageEntradaDetailComponent >> nuevaRespuesta [
	self call: (PageAnswerComponent newWithData: data)
]

{ #category : #rendering }
PageEntradaDetailComponent >> pregunta [

	^pregunta
]

{ #category : #rendering }
PageEntradaDetailComponent >> pregunta:aPregunta [

	pregunta:=aPregunta.
]

{ #category : #rendering }
PageEntradaDetailComponent >> renderContentOn: aCanvas [

	self pregunta: self session pregunta.
	
	self renderPregunta: aCanvas.
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
PageEntradaDetailComponent >> renderPregunta: aCanvas [
	aCanvas paragraph
		class: 'title-pregunta';
		with: pregunta titulo.
	aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ pregunta topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
	aCanvas span: pregunta descr.
	aCanvas span: 'Realizada por '.
	aCanvas anchor
		class: 'nombre-user';
		callback: [ self profileOfUser: pregunta user ];
		with: pregunta user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: pregunta respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: pregunta likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: pregunta dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada: pregunta ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada: pregunta ];
		with: 'dislike'.
	aCanvas horizontalRule
]

{ #category : #rendering }
PageEntradaDetailComponent >> renderRespuestas: aCanvas [
	aCanvas
		unorderedList: [ pregunta respuestas
				do: [ :each | 
					aCanvas
						listItem: [ aCanvas
								render: [ aCanvas span: 'Respuesta de '.
									aCanvas anchor
										class: 'nombre-user';
										callback: [ self profileOfUser: each user ];
										with: each user usuario.
									aCanvas text: ' '.
									aCanvas paragraph: each content.
									aCanvas
										paragraph: [ aCanvas text: each likes.
											aCanvas text: ' Likes '.
											aCanvas text: ' | '.
											aCanvas text: each dislikes.
											aCanvas text: ' Dislike ' ].
									aCanvas anchor
										class: 'btn-calif';
										callback: [ self session user agregarCalificacion: true aEntrada: each ];
										with: 'like'.
									aCanvas span: '| '.
									aCanvas anchor
										class: 'btn-calif';
										callback: [ self session user agregarCalificacion: false aEntrada: each ];
										with: 'dislike'.
									aCanvas horizontalRule ] ] ] ]
]

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
		with: data titulo.
	aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ data topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
	aCanvas span: data descr.
	aCanvas span: 'Realizada por '.
	aCanvas anchor
		class: 'nombre-user';
		callback: [ self profileOfUser: data user ];
		with: data user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: data respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: data likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: data dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada: data ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada: data ];
		with: 'dislike'.
	aCanvas horizontalRule
]

{ #category : #rendering }
PageEntradaDetailComponent >> renderRespuestas: aCanvas [
	aCanvas
		unorderedList: [ data respuestas
				do: [ :each | aCanvas render: (AnswerDetailComponent parent: self answer: each )
					 ] ]
]

Class {
	#name : #PageQuestionComponent,
	#superclass : #PageComponent,
	#instVars : [
		'titulo',
		'desarrollo',
		'topicos',
		'topicosSelected'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callback }
PageQuestionComponent >> cancelar [

^self answer.
]

{ #category : #'as yet unclassified' }
PageQuestionComponent >> checkbox:aValue topic:aTopic [
	aValue ifTrue: [ topicosSelected add:aTopic ]
]

{ #category : #accessing }
PageQuestionComponent >> desarrollo [
	^ desarrollo
]

{ #category : #accessing }
PageQuestionComponent >> desarrollo: anObject [
	desarrollo := anObject
]

{ #category : #callback }
PageQuestionComponent >> guardar [
	topicosSelected.
	self session user
		agregarPreguntaConTitulo: titulo
		Descripcion: desarrollo
		Topicos: topicosSelected.
	titulo := ' '.
	desarrollo:= ' '.	
	topicosSelected removeAll.
]

{ #category : #initialization }
PageQuestionComponent >> initialize [ 
	super initialize .
	topicosSelected := OrderedCollection new.
]

{ #category : #rendering }
PageQuestionComponent >> renderContentOn: aCanvas [

	super renderContentOn: aCanvas.
	aCanvas heading: 'Nueva Pregunta'.
	aCanvas horizontalRule.
	aCanvas form
		class: 'wrap-pregunta-form';
		with: [ 
			aCanvas paragraph: 'Título'.
			aCanvas textArea
				on: #titulo of: self;
				columns: 80;
				rows: 1;
				placeholder: 'Escriba aquí el título de la pregunta'.
			aCanvas break.
			aCanvas paragraph: 'Desarrollo'.
			aCanvas textArea
				on: #desarrollo of: self;
				columns: 80;
				rows: 5;
				placeholder: 'Escriba aquí el desarrollo de su pregunta'.
			aCanvas break.
			aCanvas paragraph: 'Topicos'.
			CuOOra soleInstance topicos
				do: [ :t | 
					aCanvas  checkbox
						value: false;
						callback: [ :v | self checkbox: v topic:t ].
					aCanvas text: t nombre ].
			aCanvas break.
			aCanvas break.
			aCanvas break.
			aCanvas submitButton on: #guardar of: self.
			aCanvas submitButton
				callback: [ self cancelar ];
				with: 'Cancelar' ].
	aCanvas break
	"aCanvas div
		class: 'wrap-button-question';
		with: [  ]"
]

{ #category : #accessing }
PageQuestionComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
PageQuestionComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
PageQuestionComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
PageQuestionComponent >> topicos: anObject [
	topicos := anObject
]

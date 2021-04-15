Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'desarrollo',
		'topicos',
		'topicosSelected'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callbacks }
QuestionComponent >> cancelar [

^self answer.
]

{ #category : #'as yet unclassified' }
QuestionComponent >> checkbox:aValue topic:aTopic [
	aValue ifTrue: [ topicosSelected add:aTopic ]
]

{ #category : #accessing }
QuestionComponent >> desarrollo [
	^ desarrollo
]

{ #category : #accessing }
QuestionComponent >> desarrollo: anObject [
	desarrollo := anObject
]

{ #category : #callbacks }
QuestionComponent >> guardar [
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
QuestionComponent >> initialize [ 
	super initialize .
	topicosSelected := OrderedCollection new.
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	aCanvas heading: 'Nueva Pregunta'.
	aCanvas horizontalRule.
	aCanvas form
		class: 'wrap-pregunta-form';
		with: [ aCanvas paragraph: 'Título'.
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
					aCanvas checkbox
						value: false;
						callback: [ :v | self checkbox: v topic: t ].
					aCanvas text: t nombre ].
			aCanvas break.
			aCanvas break.
			aCanvas break.
			aCanvas submitButton on: #guardar of: self.
			aCanvas submitButton
				callback: [ self cancelar ];
				with: 'Cancelar' ].
	aCanvas break
	
]

{ #category : #accessing }
QuestionComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
QuestionComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
QuestionComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
QuestionComponent >> topicos: anObject [
	topicos := anObject
]

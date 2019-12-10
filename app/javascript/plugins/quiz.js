const onAnswerClicked = (event) => {
  // get string: answer
  const answer = event.target.dataset.answer;
  const form = document.querySelector('.quiz_thing');
  // set the form's 'answer' value
  const hiddenInput = document.getElementById('quiz_thing_answer');
  hiddenInput.value = answer;
  const answersToDisable = document.querySelectorAll('.quiz-answer')

  const trueAnswer = document.querySelector('.correct');
  const isAnswere =  trueAnswer === event.currentTarget;

  // display correct answer and highlight
  if(!isAnswere) {
    event.currentTarget.classList.add("wrong-answer")
  }
  trueAnswer.classList.add("correct-answer");

  // query  Next Button.. remove d-none class
  const nextButton = document.querySelector('#next_question');
  nextButton.classList.remove("d-none");

  // submit the form
  nextButton.addEventListener('click', (event) => {
    event.preventDefault();
    nextQuestion(form);
  });

  answersToDisable.forEach((answer) => {
    answer.removeEventListener('click', onAnswerClicked);
  });
}

const setUpQuiz = () => {
  const answers = document.querySelectorAll('.quiz-answer')
  answers.forEach((answer) => {
    answer.addEventListener('click', onAnswerClicked);
  });
}

const nextQuestion = (form) => {
  form.submit()
}

export { setUpQuiz }

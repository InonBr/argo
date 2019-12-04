const onAnswerClicked = (event) => {
  // get string: answer
  const answer = event.target.dataset.answer;
  const form = document.querySelector('.quiz_thing');
  // set the form's 'answer' value
  const hiddenInput = document.getElementById('quiz_thing_answer');
  hiddenInput.value = answer;

  // submit the form
  form.submit();
}

const setupQuiz = () => {
  const answers = document.querySelectorAll('.quiz-answer')
  answers.forEach((answer) => {
    answer.addEventListener('click', onAnswerClicked);
  })
}

export { setupQuiz }

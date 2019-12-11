const flipButton = document.querySelector('.flip')
const backButtons = document.querySelector('.flip_buttons_back');
const setupCardFlipper = () => {
  flipButton.addEventListener("click", (event) => {
    event.preventDefault()

    // check if the text input is not empty:
    const input = document.getElementById('user_input').value
    if (input.trim().length > 0) {
      event.currentTarget.classList.add('d-none')
      backButtons.classList.remove('d-none')
      const flashcard = document.querySelector('.flipper')
      flashcard.classList.add("flip-card");
    } else {
      const guessInput = document.querySelector('.guess-input')
      guessInput.classList.add('red-border')
      guessInput.insertAdjacentHTML('afterend', '<p>Input field cannot be blank</p>')
    }
  });
}

export { setupCardFlipper }


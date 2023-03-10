function Read-Guess {
    $guess = Read-Host "Please enter your guess (or enter 'quit' to quit)"

    while ((-not $legalGuessWords.contains($guess)) -and ($null -ne $guess)) {
        $guess = $guess.ToUpper().Trim()
        
        if ($guess -eq 'QUIT') {
            $guess = $null
        } elseif (-not $legalGuessWords.contains($guess)) {
            # TODO: Overwrite the previous line instead of adding a new line to the terminal.
            # TODO: Add feedback for why guess is invalid (ie contains number or symbols or too many letters)
            # TODO: prevent user from making same guess twice
            $guess = Read-Host "Sorry, that guess is invalid. Please try again (or enter 'quit' to quit)"
        }
    }

    $guessObj = [Guess]::new($guess)
    Return $guessObj
}

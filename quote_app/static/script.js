function getQuote() {
    fetch('/api/quote')
        .then(response => response.json())
        .then(data => {
            document.getElementById('quote').innerText = `"${data.quote}"`;
            document.getElementById('author').innerText = `- ${data.author}`;
        });
}

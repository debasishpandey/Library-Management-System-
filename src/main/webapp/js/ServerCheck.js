function checkServer() {
    fetch('/')
        .catch(() => {
            window.close();
        });
}

setInterval(checkServer, 3000); // Check server status every 3 seconds

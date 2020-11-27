<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="resource/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link rel="stylesheet" type="text/css" href="resource/css/bootstrap.min.css">
<script src="resource/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/pbkdf2.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
function crypto(pw) {
	var cry = CryptoJS.PBKDF2(pw, "KPU@wp", {keySize: 256 / 32, iterations: 1000});
	return cry.toString();
}
</script>
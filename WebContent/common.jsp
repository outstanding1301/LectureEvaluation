<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="resource/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="resource/css/bootstrap.min.css">
<script src="resource/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/pbkdf2.js"></script>
<script>
function crypto(pw) {
	var cry = CryptoJS.PBKDF2(pw, "KPU@wp", {keySize: 256 / 32, iterations: 1000});
	return cry.toString();
}
</script>
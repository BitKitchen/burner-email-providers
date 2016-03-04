
all: emails.json emails.php

clean:
	rm emails.php emails.json

emails.php: emails.txt
	echo '<?php return ' > emails.php
	php -r 'var_export(array_flip(array_map("trim", file("emails.txt"))));' >> emails.php
	echo ';' >> emails.php

emails.json: emails.txt
	php -r 'echo json_encode(array_flip(array_map("trim", file("emails.txt"))), JSON_PRETTY_PRINT);' > emails.json


<#
Exceedingly simple script to reach out to the OpenLibrary API in order to quickly determine the genre of the book corrresponding ISBN.
Written by YK
#>
$isbn = Read-Host "ISBN"
$request = "https://openlibrary.org/isbn/${isbn}.json"
$response = Invoke-RestMethod -Uri "$request"
$title = $response.title
$genre = $response.subjects
echo "Genres for the book '${title}':`n" $genre "`n"
$null = Read-Host "Press RETURN to close"

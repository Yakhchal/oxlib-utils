<#
Simple script to reach out to the OpenLibrary API in order to quickly determine the genre of the book corresponding to the input ISBN.
By YK
#>
$isbn = Read-Host "ISBN"
$request = "https://openlibrary.org/isbn/${isbn}.json"
$response = Invoke-RestMethod -Uri "$request"
$title= $response.title
$subjects = $response.subjects

$quickgenres = ""
# '.Contains' doesn't want to work properly on strings returned from the HTTP request, which is why I've done as below
# TODO: Exhaustive list that covers all bases on the Oxfam book genre select
if (($subjects -match "Fiction") -eq $subjects) { $quickgenres = "${quickgenres}Fiction`n" }
if (($subjects -match "Fantasy") -eq $subjects) { $quickgenres = "${quickgenres}Fiction - Fantasy`n"}
if (($subjects -match "Science Fiction") -eq $subjects) { $quickgenres = "${quickgenres}Fiction - Science Fiction`n" }
if (($subjects -match "Short Stories") -eq $subjects) { $quickgenres = "${quickgenres}Fiction - Short Stories`n" }
if (($subjects -match "Romance") -eq $subjects) { $quickgenres = "${quickgenres}Fiction - Romance`n" }

if ($quickgenres -ne "") {echo "`nSpecific Genres:" $quickgenres}

echo "Subjects for the book '${title}':" $subjects "`n"
$null = Read-Host "Press RETURN to close"

Clear-Host
#1 TASK

$countofBarman = 0
$file = Read-Host "give parameter!"

Write-Host "The names of people working as a barman are"
foreach($p in Get-Content $file)
{
    if ($p -match "barman")
    {
    $countofBarman = [int]$countofBarman + [int]1
    $p.Split("\,") | Select-Object -First 1
}
}

if ($countofBarman -eq 0)
    {
    Write-Host "NONE"
    }

#2 TASK

    Write-Host "The names of people working 3 jobs and above are:"

foreach($p1 in Get-Content $file)
{
    if ([int]( $p1.Split(",") | Measure-Object -Line).Lines - [int]2 -ge 3)
    {
    $p1.Split("\,") | Select-Object -First 1
    }
}


#3 TASK

$numberofWorkers = 0
$jobType = Read-Host "Please give a job type"

while (!$jobType)
{
$jobType = Read-Host "Please give a job type"
}

foreach($word in Get-Content $file)
{
if ($word -match $jobType)
    {
    $numberofWorkers = $numberofWorkers + 1
}
}
Write-Host "The number of people working as $jobType is: $numberofWorkers"

<# 1 #>
function q1($var1,$var2,$var3,$var4) {
#Question
    <# Return the product of the arguments 
    #>
#Option 1
    <
        $sum = ($var1*$var2*$var3*$var4)
        return $sum
    >
#Option 2
    return $var1*$var2*$var3*$var4
}
function q2($arr,$rows,$cols,$key) {
#Question
    <# Search the 2-dimensional array for the first occurance of key at column index 0
       and return the value at column index 9 of the same row.
       Return -1 if the key is not found.
    #>
#Human Visual Layout of Problem
    <#9
         0] 1]  2]  3]...9]
       0]10 
       1]12  9
       ?]2   8  12  19...7   
    
    #>
#Option 1
       foreach($whatever in $arr) {
            if($whatever[0] -eq $key) {
                return $whatever[9]
                }
            }
            return -1
        #If you put a 'return -1' within the foreach, it breaks out of the loop
#Option 2
<
    $x = 0
    foreach($i in $arr)
        {
          if($arr[$x][0] -eq $key){
          return $arr[$x][9]
        }
        $x = $x + 1
    }
    return -1
>
}
function q3 {
#Question
    <# In a loop, prompt the user to enter positive integers one at time.
       Stop when the user enters a -1. Return the maximum positive
       value that was entered."
    #>
#Option 1
    <
        $num = 0
        $high = 0
        while ($num -ne -1){
            [int]$num = Read-Host -Prompt "put in a positive number"
            if ($num -gt $high){
                $high = $num
            }
        }
        return $high
    >
#Option 2
    $ints = @()
    do {
        [int]$read = Read-Host -Prompt "put in a positive number"
        if ( $read -ne -1 ) {
            $ints += $read
        }
    } Until ( $read -eq -1 )
    return ($ints | Measure-Object -Maximum).Maximum
  
}
function q4($filename,$whichline) {
#Question
    <# Return the line of text from the file given by the `$filename
       argument that corresponds to the line number given by `$whichline.
       The first line in the file corresponds to line number 0."
    #>F
#Option 1
    <#
        $content = Get-Content -Path $filename
        return $content[$whichline]
    #>
#Option 2
    <#
        return (Get-Content -Path $filename)[$whichline]
    #>
#Option 3
    <#
        Get-Content -Path $filename | Select -Index $whichline
    #>
#Option 4
    foreach ($line in $filename) {
        return (Get-Content -Path $filename -TotalCount 50)[$whichline]
        }
}
function q5($path) {
#Question
    <# Return the child items from the given path sorted
       ascending by their Name
    #>
#Option 1
    Get-ChildItem -path $path | Sort-Object -Property Name
}
function q6 {
#Question
    <# Return the sum of all elements provided on the pipeline
    #>
#Option 1
    $sum = 0 
        foreach ( $element in $input) {
             $sum += $element    
        }
        return $sum
}
function q7 {
#Question
    <# Return only those commands whose noun is process
    #>
#Option 1    
     Get-Command -Noun process
}
function q8($adjective) {
#Question
    <# Return the string 'PowerShell is ' followed by the adjective given
       by the `$adjective argument
    #>   
#Option 1  
     return "Powershell is $adjective"
   
}
function q9($addr) {
#Question
    <# Return `$true when the given argument is a valid IPv4 address,
       otherwise return `$false. For the purpose of this function, regard
       addresses where all octets are in the range 0-255 inclusive to
       be valid.
    #>
#Option 1
    <
        if ($addr -match "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)") {
            return $true
            }
        else {
            return $false
    >
#Option 2
<
    if ($addr -as [IPAddress]) {
        return $true
    }
    else {
        return $false
    }
>
#Option 3
    return $addr -as [IPAddress] -as [Bool]
 
}
function q10 ($filepath,$lasthash) {
#Question
    <# Return `$true if the contents of the file given in the
       `$filepath argument have changed since `$lasthash was
       computed. `$lasthash is the previously computed SHA256
       hash (as a string) of the contents of the file. 
    #>
#Psuedo Code
    <#
        -obtain filehashs of $filepath [ ]
        -compare hashes with $lasthash [ ]
        -return $true it dont match    [ ]
        -else return $false            [ ]
    #>
#Option 1
    <
        $hashes = get-filehash $filepath | select-object -ExpandProperty Hash
        if ($hashes -ne $lasthash) {
            return $true
        }
        else {
            $false
        }
    >
#Option 2
    <
        $newhashes = get-filehash $filepath
        return $newhashes.Hash -ne $lasthash
    >
#Option 3
    return (get-filehash $filepath).Hash -ne $lasthash
}



## JOINING STRINGS TOGETHER:
    $string = @("some","thing","big")
    $string -join('_')
    >> some_thing_big
    
gt

function Get-LargestNumber ($targetArray) {
    
    
    $max=0

    for ($i = 1; $i -lt $targetArray.count-1; $i++) {

        if($targetArray[$i] -gt $max) {
            $max=$targetArray[$i]
        }
        
    }

    $max
}
 
Describe "Test function Get-LargestNumber" {
    It "Should Return 5" {
        $actual=Get-LargestNumber 2,5,4,3
        $actual | should be 5
    }

    It "Should Return 5" {
        $actual=Get-LargestNumber 5,4,3,2
        $actual | should be 5
    }

    It "Should Return -2" {
        $actual=Get-LargestNumber -5,-2,-4,-3 
        $actual | should be -2
    }

    It "Should Return -1" {
        $actual=Get-LargestNumber -5,-2,-4,-1 
        $actual | should be -1
    }

    It "Should Return -1" {
        $actual=Get-LargestNumber -1,-2,-4,-5 
        $actual | should be -1
    }
}

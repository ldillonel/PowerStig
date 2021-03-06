# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

$rules = Get-RuleClassData -StigData $stigData -Name 'WebAppPoolRule'

$stringBuilder = [System.Text.StringBuilder]::new()
foreach ($rule in $rules)
{
    $null = $stringBuilder.AppendLine("$($rule.Key) = $($rule.Value)")
}

foreach ($appPool in $WebAppPool)
{
    $resourceTitle = "[$($rules.id -join ' ')]$appPool"
    $scriptBlock = [scriptblock]::Create("
        xWebAppPool '$resourceTitle'
        {
            Name = '$appPool'
            $($stringBuilder.ToString())
        }"
    )

    & $scriptBlock
}

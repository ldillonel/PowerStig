Configuration IisSite_config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string[]]
        $WebAppPool,

        [Parameter(Mandatory = $true)]
        [string[]]
        $WebSiteName,

        [Parameter(Mandatory = $true)]
        [string]
        $OsVersion,

        [Parameter(Mandatory = $true)]
        [string]
        $StigVersion
    )

    Import-DscResource -ModuleName PowerStig -ModuleVersion 2.1.0.0
    Node localhost
    {
        IisSite SiteConfiguration
        {
            WebAppPool  = $WebAppPool
            WebSiteName = $WebSiteName
            OsVersion   = $OsVersion
            StigVersion = $StigVersion
        }
    }
}

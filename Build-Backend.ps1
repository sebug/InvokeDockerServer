﻿function Build-Backend {
    $msbuild = 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe'
    & $msbuild "C:\Sources\TalkNotesBack\TalkNotesBack.sln" /property:Configuration=Release /property:Platform="Any CPU" /p:DeployOnBuild=true /p:PublishProfile=FolderProfile
}
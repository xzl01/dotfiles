deepin-env-on ()
{
    export QT_QPA_PLATFORMTHEME=deepin
    export QT_STYLE_OVERRIDE=chameleon
}

deepin-env-off ()
{
    unset QT_QPA_PLATFORMTHEME
    unset QT_STYLE_OVERRIDE
}

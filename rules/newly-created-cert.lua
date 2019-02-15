-- courtesy of regit - https://github.com/regit
function init (args)
    local needs = {}
    needs["tls"] = tostring(true)
    needs["flowint"] = {"cert-age"}
    return needs
end

function match(args)
    notbefore = TlsGetCertNotBefore()

    if not notbefore then
        return 0
    end

    if os.time() - notbefore <  3 * 3600  then
        ScFlowintSet(0, os.time() - notbefore)
        return 1
    end
    return 0
end

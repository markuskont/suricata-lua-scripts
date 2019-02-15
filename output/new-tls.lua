function init (args)
    local needs = {}
    needs["protocol"] = "tls"
    return needs
end
function setup (args)
    name = "tls.log"
    filename = SCLogPath() .. "/" .. name
    file = assert(io.open(filename, "a"))

    redis = require 'redis'
    client = redis.connect('192.168.10.16', 6379)
end
function log(args)
    version, subject, issuer, fingerprint = TlsGetCertInfo()
    serial = TlsGetCertSerial()

    if version == nil then
        version = "<nil>"
    end
    if subject == nil then
        subject = "<nil>"
    end
    if issuer == nil then
        issuer = "<nil>"
    end
    if fingerprint == nil then
        fingerprint = "<nil>"
    end

    if fingerprint ~= nil then
        if client:get(fingerprint) == nil then
            ts = SCFlowTimeString()
            file:write(ts .. "|" .. version .. "|" .. subject .. "|" .. issuer .. "|" .. fingerprint .. "|" .. serial .. "\n");
            file:flush();
            --seen[fingerprint] = true
            client:set(fingerprint, true)
        end
    end
end
function deinit (args)
    file:close(file)
end

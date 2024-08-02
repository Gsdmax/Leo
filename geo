{
    "dns": {
        "final": "direct-dns",
        "servers": [
            {
                "address": "8.8.8.8",
                "detour": "direct",
                "tag": "direct-dns"
            }
        ],
        "strategy": "ipv4_only"
    },
    "inbounds": [
        {
            "listen": "127.0.0.1",
            "listen_port": 2088,
            "type": "socks"
        }
    ],
    "log": {
        "level": "info",
        "timestamp": true
    },
    "outbounds": [
        {
            "tag": "direct",
            "type": "direct"
        },
        {
            "tag": "block",
            "type": "block"
        }
    ],
"route": {
    "geoip": {
      "path": "geo-assets/chocolate4u-iran-sing-box-rules-geoip.db"
    },
    "geosite": {
      "path": "geo-assets/sagernet-sing-geosite-geosite.db"
    },
    "rules": [
      {
        "inbound": "dns-in",
        "outbound": "dns-out"
      },
      {
        "port": 53,
        "outbound": "dns-out"
      },
      {
        "clash_mode": "Direct",
        "outbound": "direct"
      },
      {
        "clash_mode": "Global",
        "outbound": "select"
      },
      {
        "geoip": "private",
        "outbound": "bypass"
      }
    ],
    "final": "select",
    "auto_detect_interface": true,
    "override_android_vpn": true
  },
  "experimental": {
    "cache_file": {
      "enabled": true,
      "path": "clash.db"
    },
    "clash_api": {
      "external_controller": "127.0.0.1:6756"
    }
  }
}

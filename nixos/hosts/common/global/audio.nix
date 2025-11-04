# Audio configuration with PipeWire
{ config, ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    
    wireplumber.extraConfig."10-bluez" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" =
          [
            "a2dp_sink"
            "a2dp_source"
            "bap_sink"
            "bap_source"
          ];
        "bluez5.codecs" =
          [
            "sbc_xq"
            "aac"
            "ldac"
            "aptx"
            "aptx_hd"
            "aptx_ll"
            "aptx_ll_duplex"
            "faststream"
            "faststream_duplex"
            "lc3plus_h3"
            "opus_05"
            "opus_05_51"
            "opus_05_71"
            "opus_05_duplex"
          ];
      };
    };
  };
}

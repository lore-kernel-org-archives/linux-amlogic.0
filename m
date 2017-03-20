From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 20 Mar 2017 09:50:29 +0100
Subject: drm-meson
In-Reply-To: <3893a328-10eb-edce-f3e8-5dbb071d4108@gmail.com>
References: <3893a328-10eb-edce-f3e8-5dbb071d4108@gmail.com>
Message-ID: <f6dfeeaa-f009-80f4-f89f-64aab8e2d3a3@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello !

Thanks for testing.

Can you provide me more details ?

Can you :
1) push the current linux source with the applied patches to a git tree (github for example) so I can test it
2) is the monitor an HDMI or a DVI monitor ? i.e. do you use a HDMI to DVI converter ?
3) Can you boot with the drm.debug=0x3f kernel parameter and send me the DRM logs ?

Thanks,
Neil

PS: like for Heiner, can you Cc the linux-amlogic list ? it could be beneficial for everyone ! And nothing is secret here.
linux-amlogic at lists.infradead.org

On 03/17/2017 08:28 PM, Helmut Klein wrote:
> Hallo Neil,
> 
> your graphics driver runs on my netxeon minimx (s905 based media player).
> I've installed 2 de (mate & kde) and both are perfectly operational.
> 
> but i've got 2 issues i want to mention
> 
> 1. to be able to compile meson-drv i had to add following patch
> (extracted from your dropped patch v2-1-2-drm-bridge-dw-hdmi-Take-input-format-from-plat_data.patch)
> 
> --- a/include/drm/bridge/dw_hdmi.h    2017-03-10 14:44:00.000000000 +0100
> +++ b/include/drm/bridge/dw_hdmi.h    2017-03-10 16:03:10.000000000 +0100
> @@ -82,6 +82,14 @@ enum {
>      DW_HDMI_RES_MAX,
>  };
> 
> +enum dw_hdmi_color_enc_format {
> +    DW_HDMI_ENC_FMT_RGB = 0,
> +    DW_HDMI_ENC_FMT_YCBCR444,
> +    DW_HDMI_ENC_FMT_YCBCR422_16BITS,
> +    DW_HDMI_ENC_FMT_YCBCR422_8BITS,
> +    DW_HDMI_ENC_FMT_XVYCC444,
> +};
> +
>  enum dw_hdmi_phy_type {
>      DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
>      DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
> @@ -120,12 +128,16 @@ struct dw_hdmi_phy_ops {
>      void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
>                 bool force, bool disabled, bool rxsense);
>      void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
> +    void (*configure_hpd)(struct dw_hdmi *hdmi, void *data);
> +    void (*clear_hpd)(struct dw_hdmi *hdmi, void *data);
> +    void (*unmute_hpd)(struct dw_hdmi *hdmi, void *data);
>  };
> 
>  struct dw_hdmi_plat_data {
>      struct regmap *regm;
>      enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>                         struct drm_display_mode *mode);
> +    enum dw_hdmi_color_enc_format input_fmt;
>      unsigned long input_bus_format;
>      unsigned long input_bus_encoding;
> 
> 
> in addition to following patches (applied to linux-amlogic)
> 
>   v5-01-10-drm-bridge-dw-hdmi-Remove-unused-functions.patch
>   v5-02-10-drm-bridge-dw-hdmi-Move-CSC-configuration-out-of-PHY-code.patch
>   v5-03-10-drm-bridge-dw-hdmi-Enable-CSC-even-for-DVI.patch
>   v5.1-04-10-drm-bridge-dw-hdmi-Fix-the-PHY-power-down-sequence.patch
>   v5.1-05-10-drm-bridge-dw-hdmi-Fix-the-PHY-power-up-sequence.patch
>   v5.1-06-10-drm-bridge-dw-hdmi-Create-PHY-operations.patch
> 
> v5-07-10-drm-bridge-dw-hdmi-Add-support-for-custom-PHY-configuration.patch
>   v5-08-10-drm-bridge-dw-hdmi-Remove-device-type-from-platform-data.patch
>   v5-09-10-drm-bridge-dw-hdmi-Switch-to-regmap-for-register-access.patch
> 
> v5.1-10-10-drm-bridge-dw-hdmi-Move-the-driver-to-a-separate-directory..patch
> 
>   v3-1-6-drm-bridge-dw-hdmi-Extract-PHY-interrupt-setup-to-a-function.patch
> 
> v3-2-6-media-uapi-Add-RGB-and-YUV-bus-formats-for-Synopsys-HDMI-TX-Controller.patch
> 
> v3-3-6-documentation-media-Add-documentation-for-new-RGB-and-YUV-bus-formats.patch
>   v3-4-6-drm-bridge-dw-hdmi-Switch-to-V4L-bus-format-and-encodings.patch
> 
> v3-5-6-drm-bridge-dw-hdmi-Add-Documentation-on-supported-input-formats.patch
>   v3-6-6-drm-bridge-dw-hdmi-Move-HPD-handling-to-PHY-operations.patch
> 
> 
> 01-11-drm-meson-Use-crtc_state-for-hdisplay-and-fix-atomic-flush-enable-sync-for-vsync-commit.patch
>   02-11-drm-meson-Add-missing-HDMI-register.patch
>   03-11-drm-meson-Add-support-for-components.patch
> 
> 04-11-drm-meson-venc_cvbs-no-more-return--ENODEV-if-CVBS-is-not-available.patch
>   05-11-drm-meson-add-support-for-HDMI-clock-support.patch
>   06-11-drm-meson-Add-support-for-HDMI-venc-modes-and-settings.patch
>   07-11-drm-meson-Add-support-for-HDMI-encoder-and-DW-HDMI-bridge-PHY.patch
>   08-11-ARM64-dts-meson-gx-Add-shared-CMA-dma-memory-pool.patch
>   09-11-ARM64-dts-meson-gx-Add-support-for-HDMI-output.patch
> 
> 10-11-dt-bindings-Add-bindings-for-the-Amlogic-Meson-dw-hdmi-extension.patch
>   11-11-MAINTAINERS-update-files-for-Amlogic-DRM-Driver.patch
> 
> 
> 
> 2. my colors are not correct.
> red and blue are swapped, means to see a red line on the screen you have to draw a blue one.
> 
> best regards
> Helmut
> 

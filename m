From: hgkr.klein@gmail.com (Helmut Klein)
Date: Tue, 21 Mar 2017 13:05:33 +0100
Subject: drm-meson
In-Reply-To: <dece1935-ce3d-2af3-0899-222d069f55cc@baylibre.com>
References: <3893a328-10eb-edce-f3e8-5dbb071d4108@gmail.com>
 <f6dfeeaa-f009-80f4-f89f-64aab8e2d3a3@baylibre.com>
 <30dd99de-0703-55e7-f4ee-f0217f239f0b@gmail.com>
 <dece1935-ce3d-2af3-0899-222d069f55cc@baylibre.com>
Message-ID: <18efde8e-b5df-5c5d-90a8-021743510c9b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hallo Neil,

i've attached the patch. It includes the kernel configuration (.config) 
and the dts for my minimx. This is a the nexbox-a95x.dts plus some minor 
modfications (led/ethernet/usb).

Helmut


On 21.03.2017 11:33, Neil Armstrong wrote:
> Hi,
>
> No problem for git, yes please send my the 50K patch.
>
> I suspect you badly merged to YUV444 source patch, so the HDMI Controller sends YUV data as RGB data.
>
> Neil
>
> On 03/20/2017 09:18 PM, Helmut Klein wrote:
>> On 20.03.2017 09:50, Neil Armstrong wrote:
>>> Hello !
>>>
>>> Thanks for testing.
>>>
>>> Can you provide me more details ?
>>>
>>> Can you :
>>> 1) push the current linux source with the applied patches to a git tree (github for example) so I can test it
>>> 2) is the monitor an HDMI or a DVI monitor ? i.e. do you use a HDMI to DVI converter ?
>>> 3) Can you boot with the drm.debug=0x3f kernel parameter and send me the DRM logs ?
>>>
>>> Thanks,
>>> Neil
>>>
>>> PS: like for Heiner, can you Cc the linux-amlogic list ? it could be beneficial for everyone ! And nothing is secret here.
>>> linux-amlogic at lists.infradead.org
>>>
>>> On 03/17/2017 08:28 PM, Helmut Klein wrote:
>>>> Hallo Neil,
>>>>
>>>> your graphics driver runs on my netxeon minimx (s905 based media player).
>>>> I've installed 2 de (mate & kde) and both are perfectly operational.
>>>>
>>>> but i've got 2 issues i want to mention
>>>>
>>>> 1. to be able to compile meson-drv i had to add following patch
>>>> (extracted from your dropped patch v2-1-2-drm-bridge-dw-hdmi-Take-input-format-from-plat_data.patch)
>>>>
>>>> --- a/include/drm/bridge/dw_hdmi.h    2017-03-10 14:44:00.000000000 +0100
>>>> +++ b/include/drm/bridge/dw_hdmi.h    2017-03-10 16:03:10.000000000 +0100
>>>> @@ -82,6 +82,14 @@ enum {
>>>>      DW_HDMI_RES_MAX,
>>>>  };
>>>>
>>>> +enum dw_hdmi_color_enc_format {
>>>> +    DW_HDMI_ENC_FMT_RGB = 0,
>>>> +    DW_HDMI_ENC_FMT_YCBCR444,
>>>> +    DW_HDMI_ENC_FMT_YCBCR422_16BITS,
>>>> +    DW_HDMI_ENC_FMT_YCBCR422_8BITS,
>>>> +    DW_HDMI_ENC_FMT_XVYCC444,
>>>> +};
>>>> +
>>>>  enum dw_hdmi_phy_type {
>>>>      DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
>>>>      DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
>>>> @@ -120,12 +128,16 @@ struct dw_hdmi_phy_ops {
>>>>      void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
>>>>                 bool force, bool disabled, bool rxsense);
>>>>      void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
>>>> +    void (*configure_hpd)(struct dw_hdmi *hdmi, void *data);
>>>> +    void (*clear_hpd)(struct dw_hdmi *hdmi, void *data);
>>>> +    void (*unmute_hpd)(struct dw_hdmi *hdmi, void *data);
>>>>  };
>>>>
>>>>  struct dw_hdmi_plat_data {
>>>>      struct regmap *regm;
>>>>      enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>>>>                         struct drm_display_mode *mode);
>>>> +    enum dw_hdmi_color_enc_format input_fmt;
>>>>      unsigned long input_bus_format;
>>>>      unsigned long input_bus_encoding;
>>>>
>>>>
>>>> in addition to following patches (applied to linux-amlogic)
>>>>
>>>>   v5-01-10-drm-bridge-dw-hdmi-Remove-unused-functions.patch
>>>>   v5-02-10-drm-bridge-dw-hdmi-Move-CSC-configuration-out-of-PHY-code.patch
>>>>   v5-03-10-drm-bridge-dw-hdmi-Enable-CSC-even-for-DVI.patch
>>>>   v5.1-04-10-drm-bridge-dw-hdmi-Fix-the-PHY-power-down-sequence.patch
>>>>   v5.1-05-10-drm-bridge-dw-hdmi-Fix-the-PHY-power-up-sequence.patch
>>>>   v5.1-06-10-drm-bridge-dw-hdmi-Create-PHY-operations.patch
>>>>
>>>> v5-07-10-drm-bridge-dw-hdmi-Add-support-for-custom-PHY-configuration.patch
>>>>   v5-08-10-drm-bridge-dw-hdmi-Remove-device-type-from-platform-data.patch
>>>>   v5-09-10-drm-bridge-dw-hdmi-Switch-to-regmap-for-register-access.patch
>>>>
>>>> v5.1-10-10-drm-bridge-dw-hdmi-Move-the-driver-to-a-separate-directory..patch
>>>>
>>>>   v3-1-6-drm-bridge-dw-hdmi-Extract-PHY-interrupt-setup-to-a-function.patch
>>>>
>>>> v3-2-6-media-uapi-Add-RGB-and-YUV-bus-formats-for-Synopsys-HDMI-TX-Controller.patch
>>>>
>>>> v3-3-6-documentation-media-Add-documentation-for-new-RGB-and-YUV-bus-formats.patch
>>>>   v3-4-6-drm-bridge-dw-hdmi-Switch-to-V4L-bus-format-and-encodings.patch
>>>>
>>>> v3-5-6-drm-bridge-dw-hdmi-Add-Documentation-on-supported-input-formats.patch
>>>>   v3-6-6-drm-bridge-dw-hdmi-Move-HPD-handling-to-PHY-operations.patch
>>>>
>>>>
>>>> 01-11-drm-meson-Use-crtc_state-for-hdisplay-and-fix-atomic-flush-enable-sync-for-vsync-commit.patch
>>>>   02-11-drm-meson-Add-missing-HDMI-register.patch
>>>>   03-11-drm-meson-Add-support-for-components.patch
>>>>
>>>> 04-11-drm-meson-venc_cvbs-no-more-return--ENODEV-if-CVBS-is-not-available.patch
>>>>   05-11-drm-meson-add-support-for-HDMI-clock-support.patch
>>>>   06-11-drm-meson-Add-support-for-HDMI-venc-modes-and-settings.patch
>>>>   07-11-drm-meson-Add-support-for-HDMI-encoder-and-DW-HDMI-bridge-PHY.patch
>>>>   08-11-ARM64-dts-meson-gx-Add-shared-CMA-dma-memory-pool.patch
>>>>   09-11-ARM64-dts-meson-gx-Add-support-for-HDMI-output.patch
>>>>
>>>> 10-11-dt-bindings-Add-bindings-for-the-Amlogic-Meson-dw-hdmi-extension.patch
>>>>   11-11-MAINTAINERS-update-files-for-Amlogic-DRM-Driver.patch
>>>>
>>>>
>>>>
>>>> 2. my colors are not correct.
>>>> red and blue are swapped, means to see a red line on the screen you have to draw a blue one.
>>>>
>>>> best regards
>>>> Helmut
>>>>
>>>
>>>
>>
>> Hallo!
>>
>> i've never worked with git. (except git clone) So i don't know, how to build a tree. Furthermore my internet uplink is slow (512 kbit/s).
>> i could send you a single patch file for the linux-amlogic tree. The file hat 20000 lines and i don't know if i can/should send it as a simple mail.
>> file size xz-compressed is 50 kByte.
>>
>> i connected two different full hd tv with a direct hdmi connection to my minimx. both showed the color problem (under X and fbcon)
>>
>> here is the syslog (filter: egrep "hdmi|drm")
>> [    0.000000] Kernel command line: console=ttyAML0,115200 no_console_suspend earlyprintk=serial-meson,0xc81004c0 root=/dev/sda2 rootwait rootfstype=ext4 rw fsck.fix=yes net.ifnames=0 drm.debug=0x3f
>> [    7.233152] [drm:drm_core_init [drm]] Initialized
>> [    7.473327] meson-drm d0100000.vpu: Queued 3 outputs on vpu
>> [    7.498673] [drm:compare_of [meson_drm]] Comparing of node /soc/hdmi-tx at c883a000 with /soc/hdmi-tx at c883a000
>> [    7.498878] meson-drm d0100000.vpu: Failed to create debugfs directory
>> [    7.498898] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [    7.498900] [drm] No driver support for vblank timestamp query.
>> [    7.498986] [drm:meson_dw_hdmi_bind [meson_dw_hdmi]]
>> [    7.499181] [drm:meson_dw_hdmi_bind [meson_dw_hdmi]] encoder initialized
>> [    7.523693] meson-dw-hdmi c883a000.hdmi-tx: Detected HDMI TX controller v2.01a with HDCP (meson_dw_hdmi_phy)
>> [    7.523942] meson-dw-hdmi c883a000.hdmi-tx: registered DesignWare HDMI I2C bus driver
>> [    7.524047] [drm:meson_dw_hdmi_bind [meson_dw_hdmi]] HDMI controller initialized
>> [    7.524061] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
>> [    7.524188] [drm:drm_irq_install [drm]] irq=19
>> [    7.524301] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (2)
>> [    7.524383] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (2)
>> [    7.524469] [drm:drm_mode_object_reference [drm]] OBJ ID: 25 (2)
>> [    7.524551] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.524633] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (2)
>> [    7.524715] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (3)
>> [    7.524770] [drm:drm_setup_crtcs [drm_kms_helper]]
>> [    7.524814] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:25:Composite-1]
>> [    7.524856] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:25:Composite-1] status updated from unknown to connected
>> [    7.524906] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:25:Composite-1] probed modes :
>> [    7.524993] [drm:drm_mode_debug_printmodeline [drm]] Modeline 31:"720x576i" 50 13500 720 732 795 864 576 580 586 625 0x40 0x10
>> [    7.525077] [drm:drm_mode_debug_printmodeline [drm]] Modeline 32:"720x480i" 60 13500 720 739 801 858 480 488 494 525 0x40 0x10
>> [    7.525117] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1]
>> [    7.525159] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] status updated from unknown to connected
>> [    7.637689] [drm:drm_detect_monitor_audio [drm]] Monitor has basic audio support
>> [    7.637879] [drm:drm_add_edid_modes [drm]] HDMI: DVI dual 0, max TMDS clock 190000 kHz
>> [    7.637960] [drm:drm_add_edid_modes [drm]] HDMI-A-1: HDMI sink does deep color 30.
>> [    7.638043] [drm:drm_add_edid_modes [drm]] HDMI-A-1: HDMI sink does deep color 36.
>> [    7.638124] [drm:drm_add_edid_modes [drm]] HDMI-A-1: Assigning HDMI sink color depth as 12 bpc.
>> [    7.638205] [drm:drm_add_edid_modes [drm]] HDMI-A-1: HDMI sink does YCRCB444 in deep color.
>> [    7.638287] [drm:drm_edid_to_eld [drm]] ELD monitor Panasonic-TV
>> [    7.638371] [drm:drm_edid_to_eld [drm]] HDMI: latency present 0 0, video latency 0 0, audio latency 0 0
>> [    7.638453] [drm:drm_edid_to_eld [drm]] ELD size 36, SAD count 1
>> [    7.638490] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 34:"1920x1080" 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x48 0x5
>> [    7.638503] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 35:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    7.638515] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 36:"1920x1080i" 50 74250 1920 2448 2492 2640 1080 1084 1094 1125 0x40 0x15
>> [    7.638525] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 37:"1920x1080i" 60 74250 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    7.638537] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 38:"1280x720" 50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
>> [    7.638547] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 39:"1280x720" 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    7.638559] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 40:"720x576" 50 27000 720 732 796 864 576 581 586 625 0x40 0xa
>> [    7.638571] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 45:"1920x1080" 0 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    7.638581] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 49:"720x480" 0 27000 720 736 798 858 480 489 495 525 0x40 0xa
>> [    7.638591] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 56:"640x480" 0 25175 640 656 752 800 480 490 492 525 0x40 0xa
>> [    7.638603] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 57:"1920x1080" 60 148352 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    7.638613] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 58:"1920x1080i" 60 74176 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    7.638624] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 59:"1280x720" 60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    7.638636] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 62:"1920x1080" 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    7.638646] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 64:"720x480" 60 27027 720 736 798 858 480 489 495 525 0x40 0xa
>> [    7.638656] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 68:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
>> [    7.638741] [drm:drm_mode_debug_printmodeline [drm]] Modeline 52:"720x576i" 0 13500 720 732 795 864 576 580 586 625 0x40 0x101a
>> [    7.638822] [drm:drm_mode_prune_invalid [drm]] Not using 720x576i mode: BAD
>> [    7.638906] [drm:drm_mode_debug_printmodeline [drm]] Modeline 53:"720x480i" 0 13500 720 739 801 858 480 488 494 525 0x40 0x101a
>> [    7.638987] [drm:drm_mode_prune_invalid [drm]] Not using 720x480i mode: BAD
>> [    7.639071] [drm:drm_mode_debug_printmodeline [drm]] Modeline 56:"640x480" 0 25175 640 656 752 800 480 490 492 525 0x40 0xa
>> [    7.639152] [drm:drm_mode_prune_invalid [drm]] Not using 640x480 mode: BAD
>> [    7.639236] [drm:drm_mode_debug_printmodeline [drm]] Modeline 57:"1920x1080" 60 148352 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    7.639318] [drm:drm_mode_prune_invalid [drm]] Not using 1920x1080 mode: CLOCK_RANGE
>> [    7.639403] [drm:drm_mode_debug_printmodeline [drm]] Modeline 58:"1920x1080i" 60 74176 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    7.639483] [drm:drm_mode_prune_invalid [drm]] Not using 1920x1080i mode: CLOCK_RANGE
>> [    7.639568] [drm:drm_mode_debug_printmodeline [drm]] Modeline 59:"1280x720" 60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    7.639648] [drm:drm_mode_prune_invalid [drm]] Not using 1280x720 mode: CLOCK_RANGE
>> [    7.639817] [drm:drm_mode_debug_printmodeline [drm]] Modeline 62:"1920x1080" 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    7.639903] [drm:drm_mode_prune_invalid [drm]] Not using 1920x1080 mode: CLOCK_RANGE
>> [    7.639996] [drm:drm_mode_debug_printmodeline [drm]] Modeline 64:"720x480" 60 27027 720 736 798 858 480 489 495 525 0x40 0xa
>> [    7.640081] [drm:drm_mode_prune_invalid [drm]] Not using 720x480 mode: CLOCK_RANGE
>> [    7.640169] [drm:drm_mode_debug_printmodeline [drm]] Modeline 66:"720x480i" 60 13514 720 739 801 858 480 488 494 525 0x40 0x101a
>> [    7.640252] [drm:drm_mode_prune_invalid [drm]] Not using 720x480i mode: BAD
>> [    7.640341] [drm:drm_mode_debug_printmodeline [drm]] Modeline 68:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
>> [    7.640431] [drm:drm_mode_prune_invalid [drm]] Not using 640x480 mode: BAD
>> [    7.640499] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] probed modes :
>> [    7.640585] [drm:drm_mode_debug_printmodeline [drm]] Modeline 34:"1920x1080" 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x48 0x5
>> [    7.640671] [drm:drm_mode_debug_printmodeline [drm]] Modeline 35:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    7.640756] [drm:drm_mode_debug_printmodeline [drm]] Modeline 37:"1920x1080i" 60 74250 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    7.640842] [drm:drm_mode_debug_printmodeline [drm]] Modeline 36:"1920x1080i" 50 74250 1920 2448 2492 2640 1080 1084 1094 1125 0x40 0x15
>> [    7.640926] [drm:drm_mode_debug_printmodeline [drm]] Modeline 45:"1920x1080" 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    7.641011] [drm:drm_mode_debug_printmodeline [drm]] Modeline 39:"1280x720" 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    7.641095] [drm:drm_mode_debug_printmodeline [drm]] Modeline 38:"1280x720" 50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
>> [    7.641180] [drm:drm_mode_debug_printmodeline [drm]] Modeline 40:"720x576" 50 27000 720 732 796 864 576 581 586 625 0x40 0xa
>> [    7.641264] [drm:drm_mode_debug_printmodeline [drm]] Modeline 49:"720x480" 60 27000 720 736 798 858 480 489 495 525 0x40 0xa
>> [    7.641319] [drm:drm_setup_crtcs [drm_kms_helper]] connector 25 enabled? yes
>> [    7.641360] [drm:drm_setup_crtcs [drm_kms_helper]] connector 28 enabled? yes
>> [    7.641372] [drm] kms: can't enable cloning when we probably wanted to.
>> [    7.641414] [drm:drm_setup_crtcs [drm_kms_helper]] looking for cmdline mode on connector 25
>> [    7.641454] [drm:drm_setup_crtcs [drm_kms_helper]] looking for preferred mode on connector 25 0
>> [    7.641493] [drm:drm_setup_crtcs [drm_kms_helper]] found mode 720x576i
>> [    7.641536] [drm:drm_setup_crtcs [drm_kms_helper]] looking for cmdline mode on connector 28
>> [    7.641575] [drm:drm_setup_crtcs [drm_kms_helper]] looking for preferred mode on connector 28 0
>> [    7.641614] [drm:drm_setup_crtcs [drm_kms_helper]] found mode 1920x1080
>> [    7.641657] [drm:drm_setup_crtcs [drm_kms_helper]] picking CRTCs for 3840x2160 config
>> [    7.641704] [drm:drm_setup_crtcs [drm_kms_helper]] desired mode 1920x1080 set on crtc 30 (0,0)
>> [    7.641788] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (2)
>> [    7.641832] [drm:drm_fbdev_cma_create [drm_kms_helper]] surface width(1920), height(1080) and bpp(32)
>> [    7.645840] [drm:drm_atomic_state_init [drm]] Allocated atomic state ffffffc069507480
>> [    7.646548] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:29:meson_primary_plane] ffffffc06716e000 state to ffffffc069507480
>> [    7.646646] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:30:meson_crtc] ffffffc06975b800 state to ffffffc069507480
>> [    7.646740] [drm:drm_atomic_set_mode_for_crtc [drm]] Set [MODE:1920x1080] for CRTC state ffffffc06975b800
>> [    7.646823] [drm:drm_atomic_set_crtc_for_plane [drm]] Link plane state ffffffc06716e000 to [CRTC:30:meson_crtc]
>> [    7.646909] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:43] for plane state ffffffc06716e000
>> [    7.646992] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (1)
>> [    7.647075] [drm:drm_atomic_add_affected_connectors [drm]] Adding all current connectors for [CRTC:30:meson_crtc] to ffffffc069507480
>> [    7.647157] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.647240] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (4)
>> [    7.647324] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (3)
>> [    7.647407] [drm:drm_atomic_get_connector_state [drm]] Added [CONNECTOR:28] ffffffc06716e100 state to ffffffc069507480
>> [    7.647488] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (4)
>> [    7.647570] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc06716e100 to [CRTC:30:meson_crtc]
>> [    7.647653] [drm:drm_atomic_check_only [drm]] checking ffffffc069507480
>> [    7.647732] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CRTC:30:meson_crtc] mode changed
>> [    7.647774] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CRTC:30:meson_crtc] enable changed
>> [    7.647858] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.647938] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [    7.647977] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] Updating routing for [CONNECTOR:28:HDMI-A-1]
>> [    7.648019] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] using [ENCODER:27:meson_hdmi] on [CRTC:30:meson_crtc]
>> [    7.648058] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CRTC:30:meson_crtc] active changed
>> [    7.648098] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CRTC:30:meson_crtc] needs all connectors, enable: y, active: y
>> [    7.648180] [drm:drm_atomic_add_affected_connectors [drm]] Adding all current connectors for [CRTC:30:meson_crtc] to ffffffc069507480
>> [    7.648261] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.648342] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [    7.648431] [drm:drm_atomic_commit [drm]] commiting ffffffc069507480
>> [    7.648521] [drm:drm_calc_timestamping_constants [drm]] crtc 30: hwmode: htotal 2640, vtotal 1125, vdisplay 1080
>> [    7.648600] [drm:drm_calc_timestamping_constants [drm]] crtc 30: clock 148500 kHz framedur 20000000 linedur 17777
>> [    7.648640] [drm:drm_atomic_helper_commit_modeset_disables [drm_kms_helper]] modeset on [ENCODER:27:meson_hdmi]
>> [    7.648656] [drm:meson_venc_hdmi_encoder_mode_set [meson_dw_hdmi]] 0:"1920x1080" vic 31
>> [    7.648672] [drm:meson_venc_hdmi_encoder_mode_set [meson_dw_hdmi]] vclk:148500 venc=148500 hdmi=148500 enci=0
>> [    7.648804] [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
>> [    7.648886] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=0, diff=0, hw=0 hw_last=0
>> [    7.648931] [drm:drm_atomic_helper_commit_modeset_enables [drm_kms_helper]] enabling [CRTC:30:meson_crtc]
>> [    7.648942] [drm:meson_crtc_enable [meson_drm]]
>> [    7.648981] [drm:drm_atomic_helper_commit_modeset_enables [drm_kms_helper]] enabling [ENCODER:27:meson_hdmi]
>> [    7.648989] [drm:meson_venc_hdmi_encoder_enable [meson_dw_hdmi]] VENCP
>> [    7.649016] [drm:dw_hdmi_phy_init [meson_dw_hdmi]] 0:"1920x1080"
>> [    7.668720] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=0, diff=1, hw=0 hw_last=0
>> [    7.688718] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=1, diff=1, hw=0 hw_last=0
>> [    7.708677] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=2, diff=1, hw=0 hw_last=0
>> [    7.728672] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=3, diff=1, hw=0 hw_last=0
>> [    7.748670] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=4, diff=1, hw=0 hw_last=0
>> [    7.768670] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=5, diff=1, hw=0 hw_last=0
>> [    7.788670] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=6, diff=1, hw=0 hw_last=0
>> [    7.795688] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=7, diff=1, hw=0 hw_last=0
>> [    7.815689] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=8, diff=1, hw=0 hw_last=0
>> [    7.815789] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (2)
>> [    7.815873] [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state ffffffc069507480
>> [    7.815955] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [    7.816041] [drm:__drm_atomic_state_free [drm]] Freeing atomic state ffffffc069507480
>> [    7.816163] [drm:drm_atomic_state_init [drm]] Allocated atomic state ffffffc06716e300
>> [    7.816247] [drm:drm_mode_object_reference [drm]] OBJ ID: 44 (1)
>> [    7.816329] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:30:meson_crtc] ffffffc069759c00 state to ffffffc06716e300
>> [    7.816411] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (3)
>> [    7.816494] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:29:meson_primary_plane] ffffffc06716e480 state to ffffffc06716e300
>> [    7.816576] [drm:drm_mode_object_unreference [drm]] OBJ ID: 44 (2)
>> [    7.816665] [drm:drm_atomic_set_mode_for_crtc [drm]] Set [MODE:1920x1080] for CRTC state ffffffc069759c00
>> [    7.816747] [drm:drm_atomic_set_crtc_for_plane [drm]] Link plane state ffffffc06716e480 to [CRTC:30:meson_crtc]
>> [    7.816830] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:43] for plane state ffffffc06716e480
>> [    7.816912] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (4)
>> [    7.816992] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (5)
>> [    7.817076] [drm:drm_atomic_add_affected_connectors [drm]] Adding all current connectors for [CRTC:30:meson_crtc] to ffffffc06716e300
>> [    7.817158] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.817242] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (5)
>> [    7.817322] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (6)
>> [    7.817406] [drm:drm_atomic_get_connector_state [drm]] Added [CONNECTOR:28] ffffffc06716e580 state to ffffffc06716e300
>> [    7.817487] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (7)
>> [    7.817569] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [    7.817650] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc06716e580 to [NOCRTC]
>> [    7.817732] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (5)
>> [    7.817813] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc06716e580 to [CRTC:30:meson_crtc]
>> [    7.817896] [drm:drm_atomic_check_only [drm]] checking ffffffc06716e300
>> [    7.817982] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.818063] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (7)
>> [    7.818119] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] Updating routing for [CONNECTOR:28:HDMI-A-1]
>> [    7.818161] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] keeps [ENCODER:27:meson_hdmi], now on [CRTC:30:meson_crtc]
>> [    7.818249] [drm:drm_atomic_commit [drm]] commiting ffffffc06716e300
>> [    7.818337] [drm:drm_calc_timestamping_constants [drm]] crtc 30: hwmode: htotal 2640, vtotal 1125, vdisplay 1080
>> [    7.818417] [drm:drm_calc_timestamping_constants [drm]] crtc 30: clock 148500 kHz framedur 20000000 linedur 17777
>> [    7.835691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=9, diff=1, hw=0 hw_last=0
>> [    7.835781] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (4)
>> [    7.835862] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (5)
>> [    7.835943] [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state ffffffc06716e300
>> [    7.836024] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [    7.836105] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [    7.836187] [drm:drm_mode_object_unreference [drm]] OBJ ID: 44 (1)
>> [    7.836270] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (4)
>> [    7.836352] [drm:__drm_atomic_state_free [drm]] Freeing atomic state ffffffc06716e300
>> [    7.855537] meson-drm d0100000.vpu: fb0:  frame buffer device
>> [    7.855648] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.855734] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=10, diff=1, hw=0 hw_last=0
>> [    7.855824] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [    7.855909] [drm:drm_minor_register [drm]]
>> [    7.855992] [drm:drm_minor_register [drm]]
>> [    7.856076] [drm:drm_minor_register [drm]]
>> [    7.856371] [drm:drm_minor_register [drm]] new minor registered 0
>> [    7.856549] [drm:drm_sysfs_connector_add [drm]] adding "Composite-1" to sysfs
>> [    7.856635] [drm:drm_sysfs_hotplug_event [drm]] generating hotplug event
>> [    7.856764] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    7.856916] [drm:drm_sysfs_connector_add [drm]] adding "HDMI-A-1" to sysfs
>> [    7.857000] [drm:drm_sysfs_hotplug_event [drm]] generating hotplug event
>> [    7.857133] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [    7.857139] [drm] Initialized meson 1.0.0 20161109 for d0100000.vpu on minor 0
>> [    7.875737] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=11, diff=1, hw=0 hw_last=0
>> [    7.895739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=12, diff=1, hw=0 hw_last=0
>> [    7.915759] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=13, diff=1, hw=0 hw_last=0
>> [    7.935750] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=14, diff=1, hw=0 hw_last=0
>> [    7.955773] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=15, diff=1, hw=0 hw_last=0
>> [    7.975754] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=16, diff=1, hw=0 hw_last=0
>> [    7.995743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=17, diff=1, hw=0 hw_last=0
>> [    8.015747] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=18, diff=1, hw=0 hw_last=0
>> [    8.035750] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=19, diff=1, hw=0 hw_last=0
>> [    8.055754] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=20, diff=1, hw=0 hw_last=0
>> [    8.075753] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=21, diff=1, hw=0 hw_last=0
>> [    8.095747] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=22, diff=1, hw=0 hw_last=0
>> [    8.115740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=23, diff=1, hw=0 hw_last=0
>> [    8.135755] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=24, diff=1, hw=0 hw_last=0
>> [    8.155764] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=25, diff=1, hw=0 hw_last=0
>> [    8.175749] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=26, diff=1, hw=0 hw_last=0
>> [    8.195746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=27, diff=1, hw=0 hw_last=0
>> [    8.215750] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=28, diff=1, hw=0 hw_last=0
>> [    8.235742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=29, diff=1, hw=0 hw_last=0
>> [    8.255765] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=30, diff=1, hw=0 hw_last=0
>> [    8.275757] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=31, diff=1, hw=0 hw_last=0
>> [    8.295747] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=32, diff=1, hw=0 hw_last=0
>> [    8.315757] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=33, diff=1, hw=0 hw_last=0
>> [    8.335739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=34, diff=1, hw=0 hw_last=0
>> [    8.355743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=35, diff=1, hw=0 hw_last=0
>> [    8.375758] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=36, diff=1, hw=0 hw_last=0
>> [    8.395746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=37, diff=1, hw=0 hw_last=0
>> [    8.415753] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=38, diff=1, hw=0 hw_last=0
>> [    8.435761] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=39, diff=1, hw=0 hw_last=0
>> [    8.455742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=40, diff=1, hw=0 hw_last=0
>> [    8.475742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=41, diff=1, hw=0 hw_last=0
>> [    8.495749] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=42, diff=1, hw=0 hw_last=0
>> [    8.515744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=43, diff=1, hw=0 hw_last=0
>> [    8.535747] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=44, diff=1, hw=0 hw_last=0
>> [    8.555745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=45, diff=1, hw=0 hw_last=0
>> [    8.575743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=46, diff=1, hw=0 hw_last=0
>> [    8.595741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=47, diff=1, hw=0 hw_last=0
>> [    8.615742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=48, diff=1, hw=0 hw_last=0
>> [    8.635743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=49, diff=1, hw=0 hw_last=0
>> [    8.655741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=50, diff=1, hw=0 hw_last=0
>> [    8.675747] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=51, diff=1, hw=0 hw_last=0
>> [    8.695745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=52, diff=1, hw=0 hw_last=0
>> [    8.715744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=53, diff=1, hw=0 hw_last=0
>> [    8.735741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=54, diff=1, hw=0 hw_last=0
>> [    8.755743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=55, diff=1, hw=0 hw_last=0
>> [    8.775741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=56, diff=1, hw=0 hw_last=0
>> [    8.795742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=57, diff=1, hw=0 hw_last=0
>> [    8.815743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=58, diff=1, hw=0 hw_last=0
>> [    8.835740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=59, diff=1, hw=0 hw_last=0
>> [    8.855738] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=60, diff=1, hw=0 hw_last=0
>> [    8.867745] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    8.867837] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [    8.867919] [drm:drm_sysfs_hotplug_event [drm]] generating hotplug event
>> [    8.868018] [drm:drm_fb_helper_hotplug_event [drm_kms_helper]]
>> [    8.868060] [drm:drm_setup_crtcs [drm_kms_helper]]
>> [    8.868101] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:25:Composite-1]
>> [    8.868158] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:25:Composite-1] probed modes :
>> [    8.868245] [drm:drm_mode_debug_printmodeline [drm]] Modeline 31:"720x576i" 50 13500 720 732 795 864 576 580 586 625 0x40 0x10
>> [    8.868330] [drm:drm_mode_debug_printmodeline [drm]] Modeline 32:"720x480i" 60 13500 720 739 801 858 480 488 494 525 0x40 0x10
>> [    8.868369] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1]
>> [    8.875744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=61, diff=1, hw=0 hw_last=0
>> [    8.895742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=62, diff=1, hw=0 hw_last=0
>> [    8.915741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=63, diff=1, hw=0 hw_last=0
>> [    8.935740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=64, diff=1, hw=0 hw_last=0
>> [    8.955756] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=65, diff=1, hw=0 hw_last=0
>> [    8.975574] [drm:drm_detect_monitor_audio [drm]] Monitor has basic audio support
>> [    8.975710] [drm:drm_mode_object_unreference [drm]] OBJ ID: 33 (1)
>> [    8.975796] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=66, diff=1, hw=0 hw_last=0
>> [    8.975982] [drm:drm_add_edid_modes [drm]] HDMI: DVI dual 0, max TMDS clock 190000 kHz
>> [    8.976069] [drm:drm_add_edid_modes [drm]] HDMI-A-1: HDMI sink does deep color 30.
>> [    8.976151] [drm:drm_add_edid_modes [drm]] HDMI-A-1: HDMI sink does deep color 36.
>> [    8.976236] [drm:drm_add_edid_modes [drm]] HDMI-A-1: Assigning HDMI sink color depth as 12 bpc.
>> [    8.976320] [drm:drm_add_edid_modes [drm]] HDMI-A-1: HDMI sink does YCRCB444 in deep color.
>> [    8.976406] [drm:drm_edid_to_eld [drm]] ELD monitor Panasonic-TV
>> [    8.976491] [drm:drm_edid_to_eld [drm]] HDMI: latency present 0 0, video latency 0 0, audio latency 0 0
>> [    8.976574] [drm:drm_edid_to_eld [drm]] ELD size 36, SAD count 1
>> [    8.976626] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 34:"1920x1080" 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x48 0x5
>> [    8.976638] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 35:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    8.976648] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 37:"1920x1080i" 60 74250 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    8.976661] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 36:"1920x1080i" 50 74250 1920 2448 2492 2640 1080 1084 1094 1125 0x40 0x15
>> [    8.976673] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 45:"1920x1080" 0 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    8.976682] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 39:"1280x720" 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    8.976693] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 38:"1280x720" 50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
>> [    8.976703] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 40:"720x576" 50 27000 720 732 796 864 576 581 586 625 0x40 0xa
>> [    8.976713] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 49:"720x480" 0 27000 720 736 798 858 480 489 495 525 0x40 0xa
>> [    8.976722] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 69:"640x480" 0 25175 640 656 752 800 480 490 492 525 0x40 0xa
>> [    8.976735] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 70:"1920x1080" 60 148352 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    8.976745] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 71:"1920x1080i" 60 74176 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    8.976755] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 72:"1280x720" 60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    8.976767] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 75:"1920x1080" 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    8.976776] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 77:"720x480" 60 27027 720 736 798 858 480 489 495 525 0x40 0xa
>> [    8.976785] [drm:dw_hdmi_mode_valid [meson_dw_hdmi]] Modeline 81:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
>> [    8.976870] [drm:drm_mode_debug_printmodeline [drm]] Modeline 65:"720x576i" 0 13500 720 732 795 864 576 580 586 625 0x40 0x101a
>> [    8.976950] [drm:drm_mode_prune_invalid [drm]] Not using 720x576i mode: BAD
>> [    8.977037] [drm:drm_mode_debug_printmodeline [drm]] Modeline 66:"720x480i" 0 13500 720 739 801 858 480 488 494 525 0x40 0x101a
>> [    8.977118] [drm:drm_mode_prune_invalid [drm]] Not using 720x480i mode: BAD
>> [    8.977204] [drm:drm_mode_debug_printmodeline [drm]] Modeline 69:"640x480" 0 25175 640 656 752 800 480 490 492 525 0x40 0xa
>> [    8.977285] [drm:drm_mode_prune_invalid [drm]] Not using 640x480 mode: BAD
>> [    8.977372] [drm:drm_mode_debug_printmodeline [drm]] Modeline 70:"1920x1080" 60 148352 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    8.977453] [drm:drm_mode_prune_invalid [drm]] Not using 1920x1080 mode: CLOCK_RANGE
>> [    8.977540] [drm:drm_mode_debug_printmodeline [drm]] Modeline 71:"1920x1080i" 60 74176 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    8.977620] [drm:drm_mode_prune_invalid [drm]] Not using 1920x1080i mode: CLOCK_RANGE
>> [    8.977706] [drm:drm_mode_debug_printmodeline [drm]] Modeline 72:"1280x720" 60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    8.977787] [drm:drm_mode_prune_invalid [drm]] Not using 1280x720 mode: CLOCK_RANGE
>> [    8.977873] [drm:drm_mode_debug_printmodeline [drm]] Modeline 75:"1920x1080" 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    8.977954] [drm:drm_mode_prune_invalid [drm]] Not using 1920x1080 mode: CLOCK_RANGE
>> [    8.978041] [drm:drm_mode_debug_printmodeline [drm]] Modeline 77:"720x480" 60 27027 720 736 798 858 480 489 495 525 0x40 0xa
>> [    8.978122] [drm:drm_mode_prune_invalid [drm]] Not using 720x480 mode: CLOCK_RANGE
>> [    8.978209] [drm:drm_mode_debug_printmodeline [drm]] Modeline 79:"720x480i" 60 13514 720 739 801 858 480 488 494 525 0x40 0x101a
>> [    8.978290] [drm:drm_mode_prune_invalid [drm]] Not using 720x480i mode: BAD
>> [    8.978377] [drm:drm_mode_debug_printmodeline [drm]] Modeline 81:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
>> [    8.978459] [drm:drm_mode_prune_invalid [drm]] Not using 640x480 mode: BAD
>> [    8.978537] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] probed modes :
>> [    8.978628] [drm:drm_mode_debug_printmodeline [drm]] Modeline 34:"1920x1080" 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x48 0x5
>> [    8.978713] [drm:drm_mode_debug_printmodeline [drm]] Modeline 35:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
>> [    8.978800] [drm:drm_mode_debug_printmodeline [drm]] Modeline 37:"1920x1080i" 60 74250 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
>> [    8.978884] [drm:drm_mode_debug_printmodeline [drm]] Modeline 36:"1920x1080i" 50 74250 1920 2448 2492 2640 1080 1084 1094 1125 0x40 0x15
>> [    8.978970] [drm:drm_mode_debug_printmodeline [drm]] Modeline 45:"1920x1080" 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
>> [    8.979053] [drm:drm_mode_debug_printmodeline [drm]] Modeline 39:"1280x720" 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
>> [    8.979139] [drm:drm_mode_debug_printmodeline [drm]] Modeline 38:"1280x720" 50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
>> [    8.979223] [drm:drm_mode_debug_printmodeline [drm]] Modeline 40:"720x576" 50 27000 720 732 796 864 576 581 586 625 0x40 0xa
>> [    8.979309] [drm:drm_mode_debug_printmodeline [drm]] Modeline 49:"720x480" 60 27000 720 736 798 858 480 489 495 525 0x40 0xa
>> [    8.979362] [drm:drm_setup_crtcs [drm_kms_helper]] connector 25 enabled? yes
>> [    8.979401] [drm:drm_setup_crtcs [drm_kms_helper]] connector 28 enabled? yes
>> [    8.979416] [drm] kms: can't enable cloning when we probably wanted to.
>> [    8.979456] [drm:drm_setup_crtcs [drm_kms_helper]] looking for cmdline mode on connector 25
>> [    8.979497] [drm:drm_setup_crtcs [drm_kms_helper]] looking for preferred mode on connector 25 0
>> [    8.979536] [drm:drm_setup_crtcs [drm_kms_helper]] found mode 720x576i
>> [    8.979578] [drm:drm_setup_crtcs [drm_kms_helper]] looking for cmdline mode on connector 28
>> [    8.979620] [drm:drm_setup_crtcs [drm_kms_helper]] looking for preferred mode on connector 28 0
>> [    8.979684] [drm:drm_setup_crtcs [drm_kms_helper]] found mode 1920x1080
>> [    8.979729] [drm:drm_setup_crtcs [drm_kms_helper]] picking CRTCs for 1920x1080 config
>> [    8.979830] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (4)
>> [    8.979879] [drm:drm_setup_crtcs [drm_kms_helper]] desired mode 1920x1080 set on crtc 30 (0,0)
>> [    8.979966] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (3)
>> [    8.980071] [drm:drm_atomic_state_init [drm]] Allocated atomic state ffffffc0664db500
>> [    8.980167] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (3)
>> [    8.980253] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:29:meson_primary_plane] ffffffc0664db880 state to ffffffc0664db500
>> [    8.980344] [drm:drm_mode_object_reference [drm]] OBJ ID: 46 (1)
>> [    8.980432] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:30:meson_crtc] ffffffc0671c1400 state to ffffffc0664db500
>> [    8.980520] [drm:drm_mode_object_unreference [drm]] OBJ ID: 46 (2)
>> [    8.980612] [drm:drm_atomic_set_mode_for_crtc [drm]] Set [MODE:1920x1080] for CRTC state ffffffc0671c1400
>> [    8.980702] [drm:drm_atomic_set_crtc_for_plane [drm]] Link plane state ffffffc0664db880 to [CRTC:30:meson_crtc]
>> [    8.980792] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:43] for plane state ffffffc0664db880
>> [    8.980880] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (4)
>> [    8.980967] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (5)
>> [    8.981056] [drm:drm_atomic_add_affected_connectors [drm]] Adding all current connectors for [CRTC:30:meson_crtc] to ffffffc0664db500
>> [    8.981147] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    8.981237] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (5)
>> [    8.981324] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (6)
>> [    8.981410] [drm:drm_atomic_get_connector_state [drm]] Added [CONNECTOR:28] ffffffc0664db780 state to ffffffc0664db500
>> [    8.981492] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (7)
>> [    8.981576] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [    8.981666] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc0664db780 to [NOCRTC]
>> [    8.981760] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (5)
>> [    8.981847] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc0664db780 to [CRTC:30:meson_crtc]
>> [    8.981936] [drm:drm_atomic_check_only [drm]] checking ffffffc0664db500
>> [    8.982033] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [    8.982115] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (7)
>> [    8.982175] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] Updating routing for [CONNECTOR:28:HDMI-A-1]
>> [    8.982236] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] keeps [ENCODER:27:meson_hdmi], now on [CRTC:30:meson_crtc]
>> [    8.982335] [drm:drm_atomic_commit [drm]] commiting ffffffc0664db500
>> [    8.982432] [drm:drm_calc_timestamping_constants [drm]] crtc 30: hwmode: htotal 2640, vtotal 1125, vdisplay 1080
>> [    8.982513] [drm:drm_calc_timestamping_constants [drm]] crtc 30: clock 148500 kHz framedur 20000000 linedur 17777
>> [    8.995743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=67, diff=1, hw=0 hw_last=0
>> [    8.995864] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (4)
>> [    8.995948] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (5)
>> [    8.996031] [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state ffffffc0664db500
>> [    8.996114] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [    8.996196] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [    8.996279] [drm:drm_mode_object_unreference [drm]] OBJ ID: 46 (1)
>> [    8.996367] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (4)
>> [    8.996451] [drm:__drm_atomic_state_free [drm]] Freeing atomic state ffffffc0664db500
>> [    9.015741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=68, diff=1, hw=0 hw_last=0
>> [    9.035742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=69, diff=1, hw=0 hw_last=0
>> [    9.055743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=70, diff=1, hw=0 hw_last=0
>> [    9.075749] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=71, diff=1, hw=0 hw_last=0
>> [    9.095748] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=72, diff=1, hw=0 hw_last=0
>> [    9.115745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=73, diff=1, hw=0 hw_last=0
>> [    9.135742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=74, diff=1, hw=0 hw_last=0
>> [    9.155738] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=75, diff=1, hw=0 hw_last=0
>> [    9.175744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=76, diff=1, hw=0 hw_last=0
>> [    9.195739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=77, diff=1, hw=0 hw_last=0
>> [    9.215728] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=78, diff=1, hw=0 hw_last=0
>> [    9.235741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=79, diff=1, hw=0 hw_last=0
>> [    9.255740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=80, diff=1, hw=0 hw_last=0
>> [    9.275735] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=81, diff=1, hw=0 hw_last=0
>> [    9.295718] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=82, diff=1, hw=0 hw_last=0
>> [    9.315717] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=83, diff=1, hw=0 hw_last=0
>> [    9.335716] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=84, diff=1, hw=0 hw_last=0
>> [    9.355738] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=85, diff=1, hw=0 hw_last=0
>> [    9.375742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=86, diff=1, hw=0 hw_last=0
>> [    9.395745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=87, diff=1, hw=0 hw_last=0
>> [    9.415742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=88, diff=1, hw=0 hw_last=0
>> [    9.435743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=89, diff=1, hw=0 hw_last=0
>> [    9.455738] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=90, diff=1, hw=0 hw_last=0
>> [    9.475740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=91, diff=1, hw=0 hw_last=0
>> [    9.495740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=92, diff=1, hw=0 hw_last=0
>> [    9.515734] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=93, diff=1, hw=0 hw_last=0
>> [    9.535724] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=94, diff=1, hw=0 hw_last=0
>> [    9.555717] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=95, diff=1, hw=0 hw_last=0
>> [    9.575712] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=96, diff=1, hw=0 hw_last=0
>> [    9.595738] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=97, diff=1, hw=0 hw_last=0
>> [    9.615733] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=98, diff=1, hw=0 hw_last=0
>> [    9.635739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=99, diff=1, hw=0 hw_last=0
>> [    9.655734] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=100, diff=1, hw=0 hw_last=0
>> [    9.675708] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=101, diff=1, hw=0 hw_last=0
>> [    9.695699] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=102, diff=1, hw=0 hw_last=0
>> [    9.715695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=103, diff=1, hw=0 hw_last=0
>> [    9.735739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=104, diff=1, hw=0 hw_last=0
>> [    9.755711] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=105, diff=1, hw=0 hw_last=0
>> [    9.775702] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=106, diff=1, hw=0 hw_last=0
>> [    9.795698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=107, diff=1, hw=0 hw_last=0
>> [    9.815695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=108, diff=1, hw=0 hw_last=0
>> [    9.835693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=109, diff=1, hw=0 hw_last=0
>> [    9.855693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=110, diff=1, hw=0 hw_last=0
>> [    9.875693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=111, diff=1, hw=0 hw_last=0
>> [    9.895696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=112, diff=1, hw=0 hw_last=0
>> [    9.915694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=113, diff=1, hw=0 hw_last=0
>> [    9.935693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=114, diff=1, hw=0 hw_last=0
>> [    9.955694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=115, diff=1, hw=0 hw_last=0
>> [    9.975692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=116, diff=1, hw=0 hw_last=0
>> [    9.995692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=117, diff=1, hw=0 hw_last=0
>> [   10.015691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=118, diff=1, hw=0 hw_last=0
>> [   10.035692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=119, diff=1, hw=0 hw_last=0
>> [   10.055691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=120, diff=1, hw=0 hw_last=0
>> [   10.075692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=121, diff=1, hw=0 hw_last=0
>> [   10.095692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=122, diff=1, hw=0 hw_last=0
>> [   10.115694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=123, diff=1, hw=0 hw_last=0
>> [   10.135691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=124, diff=1, hw=0 hw_last=0
>> [   10.155691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=125, diff=1, hw=0 hw_last=0
>> [   10.175694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=126, diff=1, hw=0 hw_last=0
>> [   10.195692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=127, diff=1, hw=0 hw_last=0
>> [   10.215692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=128, diff=1, hw=0 hw_last=0
>> [   10.235694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=129, diff=1, hw=0 hw_last=0
>> [   10.255693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=130, diff=1, hw=0 hw_last=0
>> [   10.275701] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=131, diff=1, hw=0 hw_last=0
>> [   10.295698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=132, diff=1, hw=0 hw_last=0
>> [   10.315694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=133, diff=1, hw=0 hw_last=0
>> [   10.335695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=134, diff=1, hw=0 hw_last=0
>> [   10.355692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=135, diff=1, hw=0 hw_last=0
>> [   10.375694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=136, diff=1, hw=0 hw_last=0
>> [   10.395693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=137, diff=1, hw=0 hw_last=0
>> [   10.415693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=138, diff=1, hw=0 hw_last=0
>> [   10.435692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=139, diff=1, hw=0 hw_last=0
>> [   10.455693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=140, diff=1, hw=0 hw_last=0
>> [   10.475696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=141, diff=1, hw=0 hw_last=0
>> [   10.495693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=142, diff=1, hw=0 hw_last=0
>> [   10.515695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=143, diff=1, hw=0 hw_last=0
>> [   10.535693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=144, diff=1, hw=0 hw_last=0
>> [   10.555693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=145, diff=1, hw=0 hw_last=0
>> [   10.575694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=146, diff=1, hw=0 hw_last=0
>> [   10.595692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=147, diff=1, hw=0 hw_last=0
>> [   10.615692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=148, diff=1, hw=0 hw_last=0
>> [   10.635694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=149, diff=1, hw=0 hw_last=0
>> [   10.655693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=150, diff=1, hw=0 hw_last=0
>> [   10.675693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=151, diff=1, hw=0 hw_last=0
>> [   10.695693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=152, diff=1, hw=0 hw_last=0
>> [   10.715695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=153, diff=1, hw=0 hw_last=0
>> [   10.735735] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=154, diff=1, hw=0 hw_last=0
>> [   10.755708] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=155, diff=1, hw=0 hw_last=0
>> [   10.775697] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=156, diff=1, hw=0 hw_last=0
>> [   10.795695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=157, diff=1, hw=0 hw_last=0
>> [   10.815697] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=158, diff=1, hw=0 hw_last=0
>> [   10.835693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=159, diff=1, hw=0 hw_last=0
>> [   10.855692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=160, diff=1, hw=0 hw_last=0
>> [   10.875693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=161, diff=1, hw=0 hw_last=0
>> [   10.895694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=162, diff=1, hw=0 hw_last=0
>> [   10.915696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=163, diff=1, hw=0 hw_last=0
>> [   10.935695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=164, diff=1, hw=0 hw_last=0
>> [   10.955693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=165, diff=1, hw=0 hw_last=0
>> [   10.975693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=166, diff=1, hw=0 hw_last=0
>> [   10.995694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=167, diff=1, hw=0 hw_last=0
>> [   11.015692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=168, diff=1, hw=0 hw_last=0
>> [   11.035693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=169, diff=1, hw=0 hw_last=0
>> [   11.055693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=170, diff=1, hw=0 hw_last=0
>> [   11.075694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=171, diff=1, hw=0 hw_last=0
>> [   11.095693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=172, diff=1, hw=0 hw_last=0
>> [   11.115695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=173, diff=1, hw=0 hw_last=0
>> [   11.135694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=174, diff=1, hw=0 hw_last=0
>> [   11.155693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=175, diff=1, hw=0 hw_last=0
>> [   11.175693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=176, diff=1, hw=0 hw_last=0
>> [   11.195693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=177, diff=1, hw=0 hw_last=0
>> [   11.215692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=178, diff=1, hw=0 hw_last=0
>> [   11.235694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=179, diff=1, hw=0 hw_last=0
>> [   11.255693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=180, diff=1, hw=0 hw_last=0
>> [   11.275693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=181, diff=1, hw=0 hw_last=0
>> [   11.295692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=182, diff=1, hw=0 hw_last=0
>> [   11.315694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=183, diff=1, hw=0 hw_last=0
>> [   11.335693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=184, diff=1, hw=0 hw_last=0
>> [   11.355694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=185, diff=1, hw=0 hw_last=0
>> [   11.375692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=186, diff=1, hw=0 hw_last=0
>> [   11.395692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=187, diff=1, hw=0 hw_last=0
>> [   11.415692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=188, diff=1, hw=0 hw_last=0
>> [   11.435693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=189, diff=1, hw=0 hw_last=0
>> [   11.455695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=190, diff=1, hw=0 hw_last=0
>> [   11.475694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=191, diff=1, hw=0 hw_last=0
>> [   11.495693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=192, diff=1, hw=0 hw_last=0
>> [   11.515692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=193, diff=1, hw=0 hw_last=0
>> [   11.535720] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=194, diff=1, hw=0 hw_last=0
>> [   11.555705] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=195, diff=1, hw=0 hw_last=0
>> [   11.575695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=196, diff=1, hw=0 hw_last=0
>> [   11.595692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=197, diff=1, hw=0 hw_last=0
>> [   11.615694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=198, diff=1, hw=0 hw_last=0
>> [   11.635694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=199, diff=1, hw=0 hw_last=0
>> [   11.655692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=200, diff=1, hw=0 hw_last=0
>> [   11.675695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=201, diff=1, hw=0 hw_last=0
>> [   11.695691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=202, diff=1, hw=0 hw_last=0
>> [   11.715693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=203, diff=1, hw=0 hw_last=0
>> [   11.735731] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=204, diff=1, hw=0 hw_last=0
>> [   11.755708] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=205, diff=1, hw=0 hw_last=0
>> [   11.775699] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=206, diff=1, hw=0 hw_last=0
>> [   11.795693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=207, diff=1, hw=0 hw_last=0
>> [   11.815693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=208, diff=1, hw=0 hw_last=0
>> [   11.835695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=209, diff=1, hw=0 hw_last=0
>> [   11.855695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=210, diff=1, hw=0 hw_last=0
>> [   11.875695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=211, diff=1, hw=0 hw_last=0
>> [   11.895693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=212, diff=1, hw=0 hw_last=0
>> [   11.915694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=213, diff=1, hw=0 hw_last=0
>> [   11.935693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=214, diff=1, hw=0 hw_last=0
>> [   11.955693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=215, diff=1, hw=0 hw_last=0
>> [   11.975692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=216, diff=1, hw=0 hw_last=0
>> [   11.995693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=217, diff=1, hw=0 hw_last=0
>> [   12.015693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=218, diff=1, hw=0 hw_last=0
>> [   12.035695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=219, diff=1, hw=0 hw_last=0
>> [   12.055692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=220, diff=1, hw=0 hw_last=0
>> [   12.075695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=221, diff=1, hw=0 hw_last=0
>> [   12.095693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=222, diff=1, hw=0 hw_last=0
>> [   12.115695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=223, diff=1, hw=0 hw_last=0
>> [   12.135694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=224, diff=1, hw=0 hw_last=0
>> [   12.155692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=225, diff=1, hw=0 hw_last=0
>> [   12.175692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=226, diff=1, hw=0 hw_last=0
>> [   12.195693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=227, diff=1, hw=0 hw_last=0
>> [   12.215692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=228, diff=1, hw=0 hw_last=0
>> [   12.235744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=229, diff=1, hw=0 hw_last=0
>> [   12.255743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=230, diff=1, hw=0 hw_last=0
>> [   12.275741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=231, diff=1, hw=0 hw_last=0
>> [   12.295738] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=232, diff=1, hw=0 hw_last=0
>> [   12.315741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=233, diff=1, hw=0 hw_last=0
>> [   12.335743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=234, diff=1, hw=0 hw_last=0
>> [   12.355739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=235, diff=1, hw=0 hw_last=0
>> [   12.375737] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=236, diff=1, hw=0 hw_last=0
>> [   12.395740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=237, diff=1, hw=0 hw_last=0
>> [   12.415739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=238, diff=1, hw=0 hw_last=0
>> [   12.435742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=239, diff=1, hw=0 hw_last=0
>> [   12.455746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=240, diff=1, hw=0 hw_last=0
>> [   12.475745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=241, diff=1, hw=0 hw_last=0
>> [   12.495743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=242, diff=1, hw=0 hw_last=0
>> [   12.515744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=243, diff=1, hw=0 hw_last=0
>> [   12.535742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=244, diff=1, hw=0 hw_last=0
>> [   12.555743] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=245, diff=1, hw=0 hw_last=0
>> [   12.575736] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=246, diff=1, hw=0 hw_last=0
>> [   12.595739] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=247, diff=1, hw=0 hw_last=0
>> [   12.615736] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=248, diff=1, hw=0 hw_last=0
>> [   12.635744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=249, diff=1, hw=0 hw_last=0
>> [   12.655741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=250, diff=1, hw=0 hw_last=0
>> [   12.675740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=251, diff=1, hw=0 hw_last=0
>> [   12.695726] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=252, diff=1, hw=0 hw_last=0
>> [   12.715729] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=253, diff=1, hw=0 hw_last=0
>> [   12.735737] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=254, diff=1, hw=0 hw_last=0
>> [   12.755740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=255, diff=1, hw=0 hw_last=0
>> [   12.775734] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=256, diff=1, hw=0 hw_last=0
>> [   12.795746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=257, diff=1, hw=0 hw_last=0
>> [   12.815766] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=258, diff=1, hw=0 hw_last=0
>> [   12.835749] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=259, diff=1, hw=0 hw_last=0
>> [   12.855744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=260, diff=1, hw=0 hw_last=0
>> [   12.875745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=261, diff=1, hw=0 hw_last=0
>> [   12.895742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=262, diff=1, hw=0 hw_last=0
>> [   12.915745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=263, diff=1, hw=0 hw_last=0
>> [   12.935741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=264, diff=1, hw=0 hw_last=0
>> [   12.955754] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=265, diff=1, hw=0 hw_last=0
>> [   12.975742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=266, diff=1, hw=0 hw_last=0
>> [   12.995748] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=267, diff=1, hw=0 hw_last=0
>> [   13.015758] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=268, diff=1, hw=0 hw_last=0
>> [   13.035740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=269, diff=1, hw=0 hw_last=0
>> [   13.055745] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=270, diff=1, hw=0 hw_last=0
>> [   13.075744] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=271, diff=1, hw=0 hw_last=0
>> [   13.095746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=272, diff=1, hw=0 hw_last=0
>> [   13.115750] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=273, diff=1, hw=0 hw_last=0
>> [   13.135740] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=274, diff=1, hw=0 hw_last=0
>> [   13.155750] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=275, diff=1, hw=0 hw_last=0
>> [   13.175761] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=276, diff=1, hw=0 hw_last=0
>> [   13.195746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=277, diff=1, hw=0 hw_last=0
>> [   13.215746] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=278, diff=1, hw=0 hw_last=0
>> [   13.235757] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=279, diff=1, hw=0 hw_last=0
>> [   13.255749] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=280, diff=1, hw=0 hw_last=0
>> [   13.275742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=281, diff=1, hw=0 hw_last=0
>> [   13.295741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=282, diff=1, hw=0 hw_last=0
>> [   13.315742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=283, diff=1, hw=0 hw_last=0
>> [   13.335741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=284, diff=1, hw=0 hw_last=0
>> [   13.355721] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=285, diff=1, hw=0 hw_last=0
>> [   13.375707] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=286, diff=1, hw=0 hw_last=0
>> [   13.395696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=287, diff=1, hw=0 hw_last=0
>> [   13.415696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=288, diff=1, hw=0 hw_last=0
>> [   13.435694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=289, diff=1, hw=0 hw_last=0
>> [   13.455692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=290, diff=1, hw=0 hw_last=0
>> [   13.475694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=291, diff=1, hw=0 hw_last=0
>> [   13.485231] [drm:drm_atomic_state_init [drm]] Allocated atomic state ffffffc067154400
>> [   13.485333] [drm:drm_mode_object_reference [drm]] OBJ ID: 47 (1)
>> [   13.485423] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:30:meson_crtc] ffffffc065b11400 state to ffffffc067154400
>> [   13.485509] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (3)
>> [   13.485593] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:29:meson_primary_plane] ffffffc067154680 state to ffffffc067154400
>> [   13.485676] [drm:drm_mode_object_unreference [drm]] OBJ ID: 47 (2)
>> [   13.485767] [drm:drm_atomic_set_mode_for_crtc [drm]] Set [MODE:1920x1080] for CRTC state ffffffc065b11400
>> [   13.485850] [drm:drm_atomic_set_crtc_for_plane [drm]] Link plane state ffffffc067154680 to [CRTC:30:meson_crtc]
>> [   13.485934] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:43] for plane state ffffffc067154680
>> [   13.486050] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (4)
>> [   13.486131] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (5)
>> [   13.486215] [drm:drm_atomic_add_affected_connectors [drm]] Adding all current connectors for [CRTC:30:meson_crtc] to ffffffc067154400
>> [   13.486299] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [   13.486383] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (5)
>> [   13.486464] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (6)
>> [   13.486546] [drm:drm_atomic_get_connector_state [drm]] Added [CONNECTOR:28] ffffffc067154980 state to ffffffc067154400
>> [   13.486640] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (7)
>> [   13.486721] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [   13.486812] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc067154980 to [NOCRTC]
>> [   13.486902] [drm:drm_mode_object_reference [drm]] OBJ ID: 28 (5)
>> [   13.486984] [drm:drm_atomic_set_crtc_for_connector [drm]] Link connector state ffffffc067154980 to [CRTC:30:meson_crtc]
>> [   13.487076] [drm:drm_atomic_check_only [drm]] checking ffffffc067154400
>> [   13.487172] [drm:drm_mode_object_unreference [drm]] OBJ ID: 25 (3)
>> [   13.487253] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (7)
>> [   13.487311] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] Updating routing for [CONNECTOR:28:HDMI-A-1]
>> [   13.487353] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]] [CONNECTOR:28:HDMI-A-1] keeps [ENCODER:27:meson_hdmi], now on [CRTC:30:meson_crtc]
>> [   13.487443] [drm:drm_atomic_commit [drm]] commiting ffffffc067154400
>> [   13.487536] [drm:drm_calc_timestamping_constants [drm]] crtc 30: hwmode: htotal 2640, vtotal 1125, vdisplay 1080
>> [   13.487618] [drm:drm_calc_timestamping_constants [drm]] crtc 30: clock 148500 kHz framedur 20000000 linedur 17777
>> [   13.495735] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=292, diff=1, hw=0 hw_last=0
>> [   13.495846] [drm:drm_mode_object_reference [drm]] OBJ ID: 43 (4)
>> [   13.495926] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (5)
>> [   13.496009] [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state ffffffc067154400
>> [   13.496091] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (6)
>> [   13.496172] [drm:drm_mode_object_unreference [drm]] OBJ ID: 28 (5)
>> [   13.496254] [drm:drm_mode_object_unreference [drm]] OBJ ID: 47 (1)
>> [   13.496341] [drm:drm_mode_object_unreference [drm]] OBJ ID: 43 (4)
>> [   13.496423] [drm:__drm_atomic_state_free [drm]] Freeing atomic state ffffffc067154400
>> [   13.515693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=293, diff=1, hw=0 hw_last=0
>> [   13.535732] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=294, diff=1, hw=0 hw_last=0
>> [   13.555741] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=295, diff=1, hw=0 hw_last=0
>> [   13.575727] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=296, diff=1, hw=0 hw_last=0
>> [   13.595702] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=297, diff=1, hw=0 hw_last=0
>> [   13.615695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=298, diff=1, hw=0 hw_last=0
>> [   13.635696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=299, diff=1, hw=0 hw_last=0
>> [   13.655697] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=300, diff=1, hw=0 hw_last=0
>> [   13.675696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=301, diff=1, hw=0 hw_last=0
>> [   13.695694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=302, diff=1, hw=0 hw_last=0
>> [   13.715691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=303, diff=1, hw=0 hw_last=0
>> [   13.735693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=304, diff=1, hw=0 hw_last=0
>> [   13.755693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=305, diff=1, hw=0 hw_last=0
>> [   13.775694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=306, diff=1, hw=0 hw_last=0
>> [   13.795694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=307, diff=1, hw=0 hw_last=0
>> [   13.815692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=308, diff=1, hw=0 hw_last=0
>> [   13.835694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=309, diff=1, hw=0 hw_last=0
>> [   13.855693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=310, diff=1, hw=0 hw_last=0
>> [   13.875691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=311, diff=1, hw=0 hw_last=0
>> [   13.895693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=312, diff=1, hw=0 hw_last=0
>> [   13.915695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=313, diff=1, hw=0 hw_last=0
>> [   13.935693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=314, diff=1, hw=0 hw_last=0
>> [   13.955694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=315, diff=1, hw=0 hw_last=0
>> [   13.975695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=316, diff=1, hw=0 hw_last=0
>> [   13.995694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=317, diff=1, hw=0 hw_last=0
>> [   14.015695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=318, diff=1, hw=0 hw_last=0
>> [   14.035692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=319, diff=1, hw=0 hw_last=0
>> [   14.055727] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=320, diff=1, hw=0 hw_last=0
>> [   14.075713] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=321, diff=1, hw=0 hw_last=0
>> [   14.095698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=322, diff=1, hw=0 hw_last=0
>> [   14.115693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=323, diff=1, hw=0 hw_last=0
>> [   14.135695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=324, diff=1, hw=0 hw_last=0
>> [   14.155693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=325, diff=1, hw=0 hw_last=0
>> [   14.175693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=326, diff=1, hw=0 hw_last=0
>> [   14.195693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=327, diff=1, hw=0 hw_last=0
>> [   14.215693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=328, diff=1, hw=0 hw_last=0
>> [   14.235693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=329, diff=1, hw=0 hw_last=0
>> [   14.255693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=330, diff=1, hw=0 hw_last=0
>> [   14.275691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=331, diff=1, hw=0 hw_last=0
>> [   14.295693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=332, diff=1, hw=0 hw_last=0
>> [   14.315694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=333, diff=1, hw=0 hw_last=0
>> [   14.335694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=334, diff=1, hw=0 hw_last=0
>> [   14.355694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=335, diff=1, hw=0 hw_last=0
>> [   14.375696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=336, diff=1, hw=0 hw_last=0
>> [   14.395742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=337, diff=1, hw=0 hw_last=0
>> [   14.415742] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=338, diff=1, hw=0 hw_last=0
>> [   14.435727] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=339, diff=1, hw=0 hw_last=0
>> [   14.455705] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=340, diff=1, hw=0 hw_last=0
>> [   14.475700] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=341, diff=1, hw=0 hw_last=0
>> [   14.495700] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=342, diff=1, hw=0 hw_last=0
>> [   14.515704] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=343, diff=1, hw=0 hw_last=0
>> [   14.535700] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=344, diff=1, hw=0 hw_last=0
>> [   14.555694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=345, diff=1, hw=0 hw_last=0
>> [   14.575694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=346, diff=1, hw=0 hw_last=0
>> [   14.595694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=347, diff=1, hw=0 hw_last=0
>> [   14.615696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=348, diff=1, hw=0 hw_last=0
>> [   14.635693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=349, diff=1, hw=0 hw_last=0
>> [   14.655692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=350, diff=1, hw=0 hw_last=0
>> [   14.675695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=351, diff=1, hw=0 hw_last=0
>> [   14.695693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=352, diff=1, hw=0 hw_last=0
>> [   14.715695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=353, diff=1, hw=0 hw_last=0
>> [   14.735694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=354, diff=1, hw=0 hw_last=0
>> [   14.755692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=355, diff=1, hw=0 hw_last=0
>> [   14.775695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=356, diff=1, hw=0 hw_last=0
>> [   14.795694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=357, diff=1, hw=0 hw_last=0
>> [   14.815694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=358, diff=1, hw=0 hw_last=0
>> [   14.835695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=359, diff=1, hw=0 hw_last=0
>> [   14.855694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=360, diff=1, hw=0 hw_last=0
>> [   14.875694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=361, diff=1, hw=0 hw_last=0
>> [   14.895694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=362, diff=1, hw=0 hw_last=0
>> [   14.915693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=363, diff=1, hw=0 hw_last=0
>> [   14.935693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=364, diff=1, hw=0 hw_last=0
>> [   14.955694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=365, diff=1, hw=0 hw_last=0
>> [   14.975693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=366, diff=1, hw=0 hw_last=0
>> [   14.995694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=367, diff=1, hw=0 hw_last=0
>> [   15.015693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=368, diff=1, hw=0 hw_last=0
>> [   15.035693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=369, diff=1, hw=0 hw_last=0
>> [   15.055698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=370, diff=1, hw=0 hw_last=0
>> [   15.075695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=371, diff=1, hw=0 hw_last=0
>> [   15.095694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=372, diff=1, hw=0 hw_last=0
>> [   15.115693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=373, diff=1, hw=0 hw_last=0
>> [   15.135692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=374, diff=1, hw=0 hw_last=0
>> [   15.155692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=375, diff=1, hw=0 hw_last=0
>> [   15.175693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=376, diff=1, hw=0 hw_last=0
>> [   15.195692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=377, diff=1, hw=0 hw_last=0
>> [   15.215695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=378, diff=1, hw=0 hw_last=0
>> [   15.235694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=379, diff=1, hw=0 hw_last=0
>> [   15.255694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=380, diff=1, hw=0 hw_last=0
>> [   15.275697] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=381, diff=1, hw=0 hw_last=0
>> [   15.295696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=382, diff=1, hw=0 hw_last=0
>> [   15.315692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=383, diff=1, hw=0 hw_last=0
>> [   15.335693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=384, diff=1, hw=0 hw_last=0
>> [   15.355693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=385, diff=1, hw=0 hw_last=0
>> [   15.375692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=386, diff=1, hw=0 hw_last=0
>> [   15.395695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=387, diff=1, hw=0 hw_last=0
>> [   15.415697] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=388, diff=1, hw=0 hw_last=0
>> [   15.435695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=389, diff=1, hw=0 hw_last=0
>> [   15.455694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=390, diff=1, hw=0 hw_last=0
>> [   15.475693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=391, diff=1, hw=0 hw_last=0
>> [   15.495692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=392, diff=1, hw=0 hw_last=0
>> [   15.515693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=393, diff=1, hw=0 hw_last=0
>> [   15.535693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=394, diff=1, hw=0 hw_last=0
>> [   15.555692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=395, diff=1, hw=0 hw_last=0
>> [   15.575693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=396, diff=1, hw=0 hw_last=0
>> [   15.595693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=397, diff=1, hw=0 hw_last=0
>> [   15.615695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=398, diff=1, hw=0 hw_last=0
>> [   15.635696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=399, diff=1, hw=0 hw_last=0
>> [   15.655701] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=400, diff=1, hw=0 hw_last=0
>> [   15.675698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=401, diff=1, hw=0 hw_last=0
>> [   15.695695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=402, diff=1, hw=0 hw_last=0
>> [   15.715692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=403, diff=1, hw=0 hw_last=0
>> [   15.735694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=404, diff=1, hw=0 hw_last=0
>> [   15.755693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=405, diff=1, hw=0 hw_last=0
>> [   15.775693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=406, diff=1, hw=0 hw_last=0
>> [   15.795692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=407, diff=1, hw=0 hw_last=0
>> [   15.815694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=408, diff=1, hw=0 hw_last=0
>> [   15.835693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=409, diff=1, hw=0 hw_last=0
>> [   15.855694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=410, diff=1, hw=0 hw_last=0
>> [   15.875692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=411, diff=1, hw=0 hw_last=0
>> [   15.895693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=412, diff=1, hw=0 hw_last=0
>> [   15.915693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=413, diff=1, hw=0 hw_last=0
>> [   15.935693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=414, diff=1, hw=0 hw_last=0
>> [   15.955694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=415, diff=1, hw=0 hw_last=0
>> [   15.975693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=416, diff=1, hw=0 hw_last=0
>> [   15.995692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=417, diff=1, hw=0 hw_last=0
>> [   16.015695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=418, diff=1, hw=0 hw_last=0
>> [   16.035694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=419, diff=1, hw=0 hw_last=0
>> [   16.055710] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=420, diff=1, hw=0 hw_last=0
>> [   16.075705] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=421, diff=1, hw=0 hw_last=0
>> [   16.095696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=422, diff=1, hw=0 hw_last=0
>> [   16.115694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=423, diff=1, hw=0 hw_last=0
>> [   16.135693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=424, diff=1, hw=0 hw_last=0
>> [   16.155693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=425, diff=1, hw=0 hw_last=0
>> [   16.175695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=426, diff=1, hw=0 hw_last=0
>> [   16.195693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=427, diff=1, hw=0 hw_last=0
>> [   16.215694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=428, diff=1, hw=0 hw_last=0
>> [   16.235695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=429, diff=1, hw=0 hw_last=0
>> [   16.255693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=430, diff=1, hw=0 hw_last=0
>> [   16.275694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=431, diff=1, hw=0 hw_last=0
>> [   16.295693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=432, diff=1, hw=0 hw_last=0
>> [   16.315693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=433, diff=1, hw=0 hw_last=0
>> [   16.335693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=434, diff=1, hw=0 hw_last=0
>> [   16.355693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=435, diff=1, hw=0 hw_last=0
>> [   16.375694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=436, diff=1, hw=0 hw_last=0
>> [   16.395713] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=437, diff=1, hw=0 hw_last=0
>> [   16.415708] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=438, diff=1, hw=0 hw_last=0
>> [   16.435702] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=439, diff=1, hw=0 hw_last=0
>> [   16.455698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=440, diff=1, hw=0 hw_last=0
>> [   16.475695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=441, diff=1, hw=0 hw_last=0
>> [   16.495694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=442, diff=1, hw=0 hw_last=0
>> [   16.515696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=443, diff=1, hw=0 hw_last=0
>> [   16.535693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=444, diff=1, hw=0 hw_last=0
>> [   16.555694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=445, diff=1, hw=0 hw_last=0
>> [   16.575694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=446, diff=1, hw=0 hw_last=0
>> [   16.595693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=447, diff=1, hw=0 hw_last=0
>> [   16.615692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=448, diff=1, hw=0 hw_last=0
>> [   16.635693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=449, diff=1, hw=0 hw_last=0
>> [   16.655696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=450, diff=1, hw=0 hw_last=0
>> [   16.675696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=451, diff=1, hw=0 hw_last=0
>> [   16.695693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=452, diff=1, hw=0 hw_last=0
>> [   16.715693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=453, diff=1, hw=0 hw_last=0
>> [   16.735693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=454, diff=1, hw=0 hw_last=0
>> [   16.755692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=455, diff=1, hw=0 hw_last=0
>> [   16.775693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=456, diff=1, hw=0 hw_last=0
>> [   16.795695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=457, diff=1, hw=0 hw_last=0
>> [   16.815693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=458, diff=1, hw=0 hw_last=0
>> [   16.835694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=459, diff=1, hw=0 hw_last=0
>> [   16.855694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=460, diff=1, hw=0 hw_last=0
>> [   16.875692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=461, diff=1, hw=0 hw_last=0
>> [   16.895692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=462, diff=1, hw=0 hw_last=0
>> [   16.915694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=463, diff=1, hw=0 hw_last=0
>> [   16.935691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=464, diff=1, hw=0 hw_last=0
>> [   16.955692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=465, diff=1, hw=0 hw_last=0
>> [   16.975690] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=466, diff=1, hw=0 hw_last=0
>> [   16.995694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=467, diff=1, hw=0 hw_last=0
>> [   17.015694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=468, diff=1, hw=0 hw_last=0
>> [   17.035695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=469, diff=1, hw=0 hw_last=0
>> [   17.055698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=470, diff=1, hw=0 hw_last=0
>> [   17.075695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=471, diff=1, hw=0 hw_last=0
>> [   17.095694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=472, diff=1, hw=0 hw_last=0
>> [   17.115693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=473, diff=1, hw=0 hw_last=0
>> [   17.135692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=474, diff=1, hw=0 hw_last=0
>> [   17.155691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=475, diff=1, hw=0 hw_last=0
>> [   17.175692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=476, diff=1, hw=0 hw_last=0
>> [   17.195692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=477, diff=1, hw=0 hw_last=0
>> [   17.215692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=478, diff=1, hw=0 hw_last=0
>> [   17.235691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=479, diff=1, hw=0 hw_last=0
>> [   17.255694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=480, diff=1, hw=0 hw_last=0
>> [   17.275695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=481, diff=1, hw=0 hw_last=0
>> [   17.295698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=482, diff=1, hw=0 hw_last=0
>> [   17.315696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=483, diff=1, hw=0 hw_last=0
>> [   17.335693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=484, diff=1, hw=0 hw_last=0
>> [   17.355693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=485, diff=1, hw=0 hw_last=0
>> [   17.375693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=486, diff=1, hw=0 hw_last=0
>> [   17.395699] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=487, diff=1, hw=0 hw_last=0
>> [   17.415695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=488, diff=1, hw=0 hw_last=0
>> [   17.435692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=489, diff=1, hw=0 hw_last=0
>> [   17.455693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=490, diff=1, hw=0 hw_last=0
>> [   17.475695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=491, diff=1, hw=0 hw_last=0
>> [   17.495693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=492, diff=1, hw=0 hw_last=0
>> [   17.515691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=493, diff=1, hw=0 hw_last=0
>> [   17.535694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=494, diff=1, hw=0 hw_last=0
>> [   17.555692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=495, diff=1, hw=0 hw_last=0
>> [   17.575692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=496, diff=1, hw=0 hw_last=0
>> [   17.595692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=497, diff=1, hw=0 hw_last=0
>> [   17.615692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=498, diff=1, hw=0 hw_last=0
>> [   17.635694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=499, diff=1, hw=0 hw_last=0
>> [   17.655694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=500, diff=1, hw=0 hw_last=0
>> [   17.675693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=501, diff=1, hw=0 hw_last=0
>> [   17.695695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=502, diff=1, hw=0 hw_last=0
>> [   17.715690] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=503, diff=1, hw=0 hw_last=0
>> [   17.735691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=504, diff=1, hw=0 hw_last=0
>> [   17.755692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=505, diff=1, hw=0 hw_last=0
>> [   17.775692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=506, diff=1, hw=0 hw_last=0
>> [   17.795692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=507, diff=1, hw=0 hw_last=0
>> [   17.815691] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=508, diff=1, hw=0 hw_last=0
>> [   17.835692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=509, diff=1, hw=0 hw_last=0
>> [   17.855694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=510, diff=1, hw=0 hw_last=0
>> [   17.875693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=511, diff=1, hw=0 hw_last=0
>> [   17.895694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=512, diff=1, hw=0 hw_last=0
>> [   17.915693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=513, diff=1, hw=0 hw_last=0
>> [   17.935707] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=514, diff=1, hw=0 hw_last=0
>> [   17.955701] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=515, diff=1, hw=0 hw_last=0
>> [   17.975701] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=516, diff=1, hw=0 hw_last=0
>> [   17.995699] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=517, diff=1, hw=0 hw_last=0
>> [   18.015695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=518, diff=1, hw=0 hw_last=0
>> [   18.035692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=519, diff=1, hw=0 hw_last=0
>> [   18.055709] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=520, diff=1, hw=0 hw_last=0
>> [   18.075702] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=521, diff=1, hw=0 hw_last=0
>> [   18.095698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=522, diff=1, hw=0 hw_last=0
>> [   18.115712] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=523, diff=1, hw=0 hw_last=0
>> [   18.135706] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=524, diff=1, hw=0 hw_last=0
>> [   18.155695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=525, diff=1, hw=0 hw_last=0
>> [   18.175693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=526, diff=1, hw=0 hw_last=0
>> [   18.195692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=527, diff=1, hw=0 hw_last=0
>> [   18.215693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=528, diff=1, hw=0 hw_last=0
>> [   18.235692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=529, diff=1, hw=0 hw_last=0
>> [   18.255694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=530, diff=1, hw=0 hw_last=0
>> [   18.275695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=531, diff=1, hw=0 hw_last=0
>> [   18.295694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=532, diff=1, hw=0 hw_last=0
>> [   18.315693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=533, diff=1, hw=0 hw_last=0
>> [   18.335692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=534, diff=1, hw=0 hw_last=0
>> [   18.355693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=535, diff=1, hw=0 hw_last=0
>> [   18.375692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=536, diff=1, hw=0 hw_last=0
>> [   18.395710] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=537, diff=1, hw=0 hw_last=0
>> [   18.415709] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=538, diff=1, hw=0 hw_last=0
>> [   18.435698] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=539, diff=1, hw=0 hw_last=0
>> [   18.455699] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=540, diff=1, hw=0 hw_last=0
>> [   18.475695] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=541, diff=1, hw=0 hw_last=0
>> [   18.495696] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=542, diff=1, hw=0 hw_last=0
>> [   18.515693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=543, diff=1, hw=0 hw_last=0
>> [   18.535694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=544, diff=1, hw=0 hw_last=0
>> [   18.555693] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=545, diff=1, hw=0 hw_last=0
>> [   18.575692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=546, diff=1, hw=0 hw_last=0
>> [   18.595694] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=547, diff=1, hw=0 hw_last=0
>> [   18.615692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=548, diff=1, hw=0 hw_last=0
>> [   18.635692] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=549, diff=1, hw=0 hw_last=0
>> [   18.655597] [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
>> [   18.655681] [drm:drm_update_vblank_count [drm]] updating vblank count on crtc 0: current=550, diff=0, hw=0 hw_last=0
>
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: drm.patch.xz
Type: application/x-xz
Size: 67944 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170321/b945358b/attachment.xz>

From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon,  1 Jan 2018 22:35:53 +0100
Subject: [RFC HACK 0/2] CVBS output on Meson8/Meson8b/Meson8m2
Message-ID: <20180101213555.5519-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

DISCLAIMER: none of these patches is meant to be applied anywhere!
their purpose is to document what I found out so far (things that are
not documented in any public datasheet that I am aware of).

I was curious and wanted to see if there are any differences between
the video IP blocks between Meson8/Meson8b/Meson8m2 and GXBB/GXL/GXM.

after reading your gpu/drm/meson/meson_vclk.c I stumbled across the
first problem (which is a big one): the 32-bit SoCs don't have the
HHI_VID_PLL_CLK_DIV register.
unfortunately there is no documentation in the public S805 datasheet
that describes the video clock path on Meson8b. some of the registers
that are documented in the GXM datasheet published by Khadas (which
also contains a nice video clock tree documentation). so I tried to
take a different approach: extending the clock controller driver so
I could play around until I could read the clock frequencies set by
u-boot (which displays an image on the CVBS output).
the result of this is the clock patch from this series, which gives
me the following output in /sys/kernel/debug/clk/clk_summary:
vid_pll                               0            0   648000000          0 0  
   vid_pll_pre_div                    0            0   108000000          0 0  
      vid_pll_post_sel                0            0   108000000          0 0  
         vid_pll_post_en              0            0   108000000          0 0  
            vclk2_sel                 0            0   108000000          0 0  
               vclk2_en0              0            0   108000000          0 0  
                  vclk2_xd0           0            0    54000000          0 0  
                     vclk2_clk_div_en           0            0    54000000          0 0  
                        vclk2_div12           0            0     4500000          0 0  
                           vclk2_div12_en           0            0     4500000          0 0  
                        vclk2_div6           0            0     9000000          0 0  
                           vclk2_div6_en           0            0     9000000          0 0  
                        vclk2_div4           0            0    13500000          0 0  
                           vclk2_div4_en           0            0    13500000          0 0  
                        vclk2_div2           0            0    27000000          0 0  
                           vclk2_div2_en           0            0    27000000          0 0  
                              hdmi_tx_pixel_sel           0            0    27000000          0 0  
                                 hdmi_tx_pixel_en           0            0    27000000          0 0  
                              vdac0_sel           0            0    27000000          0 0  
                                 vdac0_en           0            0    27000000          0 0  
                        vclk2_div1_en           0            0    54000000          0 0  
                           encl_sel           0            0    54000000          0 0  
                              encl_en           0            0    54000000          0 0  
            vclk_sel                  0            0   108000000          0 0  
               vclk_en0               0            0   108000000          0 0  
                  vclk_xd0            0            0    27000000          0 0  
                     vclk_clk_div_en           0            0    27000000          0 0  
                        vclk_div12           0            0     2250000          0 0  
                           vclk_div12_en           0            0     2250000          0 0  
                        vclk_div6           0            0     4500000          0 0  
                           vclk_div6_en           0            0     4500000          0 0  
                        vclk_div4           0            0     6750000          0 0  
                           vclk_div4_en           0            0     6750000          0 0  
                        vclk_div2           0            0    13500000          0 0  
                           vclk_div2_en           0            0    13500000          0 0  
                              enci_sel           0            0    13500000          0 0  
                                 enci_en           0            0    13500000          0 0  
                        vclk_div1_en           0            0    27000000          0 0  
                           encp_sel           0            0    27000000          0 0  
                              encp_en           0            0    27000000          0 0  
                           enct_sel           0            0    27000000          0 0  
                              enct_en           0            0    27000000          0 0  
      vid_pll_post_div                0            0   108000000          0 0  

I am not sure whether the ENCI clock is supposed to be 27MHz. at least
the VDAC0 clock is 27MHz, which is definitely correct (in my opinion ;))
"clkmsr" in u-boot (which I don't trust by the way, but I'll document my
results here for the sake of completeness) shows these video related
clocks:
- [ 216 MHz]  VID_PLL_CLK(6)
- [  54 MHz]  CTS_ENCP_CLK(8)
- [  54 MHz]  CTS_ENCL_CLK(9)
- [  24 MHz]  CTS_HDMI_SYS_CLK(19)
- [  27 MHz]  CTS_HDMI_TX_PIXEL_CLK(36)


after having fun with the clock driver I discovered that the CVBS output
turns black when I boot a kernel with the .dts VPU node. a bit later I
found out that we must not overwrite VIU_OSD2_CTRL_STAT with 0 and that
some of the code in gpu/drm/meson/meson_vpp.c didn't seem to be
compatible with the 32-bit SoCs so I simply "#if 0" that code. even
later I found out that the 32-bit SoCs seem to use OSD2 (instead of
OSD1) for the CVBS output. a small hack in meson_plane.c and
meson_canvas.c later I am now able to send my own images through the
CVBS output (colors are slightly incorrect and the image is cut off, but
you have to start small: [0])

are you planning to support OSD2 at some point?


Regards
Martin


[0] https://abload.de/img/vlcsnap-2018-01-01-22b1uym.png


Martin Blumenstingl (2):
  gpu: drm: meson: HACK - Meson8/Meson8b/Meson8m2 support - WiP
  clk: meson: meson8b: add the video clock trees - WiP

 .../bindings/display/amlogic,meson-vpu.txt         |  18 +-
 drivers/clk/meson/meson8b.c                        | 637 +++++++++++++++++++++
 drivers/clk/meson/meson8b.h                        |   7 +-
 drivers/gpu/drm/meson/meson_canvas.c               |  11 +
 drivers/gpu/drm/meson/meson_canvas.h               |   4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   3 +
 drivers/gpu/drm/meson/meson_plane.c                |   5 +-
 drivers/gpu/drm/meson/meson_vclk.c                 |  21 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |   5 +-
 drivers/gpu/drm/meson/meson_viu.c                  |   5 +-
 drivers/gpu/drm/meson/meson_vpp.c                  |  28 +
 include/dt-bindings/clock/meson8b-clkc.h           |  42 ++
 12 files changed, 771 insertions(+), 15 deletions(-)

-- 
2.15.1

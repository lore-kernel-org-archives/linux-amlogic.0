From: joseph.kogut@gmail.com (Joseph Kogut)
Date: Wed, 14 Jun 2017 09:59:49 -0700
Subject: Mali on Mainline Linux
Message-ID: <CAMWSM7izixre5oTLFtC4-BmSTW0oW_iGA2gKL3BKJrTa_n1wxw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

I've been following your work on mainlining support for Amlogic SoCs
for a while now, and I really appreciate what you and BayLibre are
doing. These devices are extremely popular, and only getting moreso.

I have a GXL S905X device, and I'm working on getting Xorg with GLES
running on a mainline kernel (4.12.0-rc5). I found your repository on
GitHub for compiling the kernel driver for mainline kernels:
https://github.com/superna9999/meson_gx_mali_450

It only took a couple of patches to compile the kernel driver
(mali.ko), which I'm using with meson_drm. The driver appears to load
successfully, but upon starting X, I get the error:

    Fatal server error:
    (EE) no screens found(EE)

Checking the log reveals:

    [ 55706.674] (II) xfree86: Adding drm device (/dev/dri/card0)
    [ 55706.675] (II) no primary bus or device found
    [ 55706.675]    falling back to
/sys/devices/platform/soc/d0100000.vpu/drm/card0
    <snip>
    [ 55706.777] (EE) MALI(0): [mali_drm_open_master:1036] Error:
mali_drm_open_master Unable to open DRM: No such file or directory
    <snip>
    [ 55706.777] (EE) MALI(0): [MaliPreInit:1169] Error: Failed to be
master of DRM!

I'm using Arch Linux ARM with the HardKernel X11 DDX for the ODROID C2
(S905 platform), and their Mali LibGL package.

It seems there's an incompatibility between some Mali driver
components, and the drm driver. I did some googling, and found this
thread on the ODROID forums that you started:

https://forum.odroid.com/viewtopic.php?t=26969

Does the Mali 450 driver for X11 currently not work at all on the
mainline kernel because of DRM differences? Is this something that
requires modifications to the blob to fix?

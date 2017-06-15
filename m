From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 15 Jun 2017 07:31:38 +0200
Subject: Mali on Mainline Linux
In-Reply-To: <CAMWSM7izixre5oTLFtC4-BmSTW0oW_iGA2gKL3BKJrTa_n1wxw@mail.gmail.com>
References: <CAMWSM7izixre5oTLFtC4-BmSTW0oW_iGA2gKL3BKJrTa_n1wxw@mail.gmail.com>
Message-ID: <d0ed97ec-4ccb-4d1e-a69a-797d5beaa13c@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Joseph,

On 06/14/2017 06:59 PM, Joseph Kogut wrote:
> Hi Neil,
> 
> I've been following your work on mainlining support for Amlogic SoCs
> for a while now, and I really appreciate what you and BayLibre are
> doing. These devices are extremely popular, and only getting moreso.

Thanks !!

> 
> I have a GXL S905X device, and I'm working on getting Xorg with GLES
> running on a mainline kernel (4.12.0-rc5). I found your repository on
> GitHub for compiling the kernel driver for mainline kernels:
> https://github.com/superna9999/meson_gx_mali_450

Right

> 
> It only took a couple of patches to compile the kernel driver
> (mali.ko), which I'm using with meson_drm. The driver appears to load
> successfully, but upon starting X, I get the error:
> 
>     Fatal server error:
>     (EE) no screens found(EE)
> 
> Checking the log reveals:
> 
>     [ 55706.674] (II) xfree86: Adding drm device (/dev/dri/card0)
>     [ 55706.675] (II) no primary bus or device found
>     [ 55706.675]    falling back to
> /sys/devices/platform/soc/d0100000.vpu/drm/card0
>     <snip>
>     [ 55706.777] (EE) MALI(0): [mali_drm_open_master:1036] Error:
> mali_drm_open_master Unable to open DRM: No such file or directory
>     <snip>
>     [ 55706.777] (EE) MALI(0): [MaliPreInit:1169] Error: Failed to be
> master of DRM!

Yes, it seems you are using the xf86-video-mali, but this X11 driver needs
a special DRM driver to allocate Mali memory, but this one is hard to build with
recent kernels.

> I'm using Arch Linux ARM with the HardKernel X11 DDX for the ODROID C2
> (S905 platform), and their Mali LibGL package.
> 
> It seems there's an incompatibility between some Mali driver
> components, and the drm driver. I did some googling, and found this
> thread on the ODROID forums that you started:
> 
> https://forum.odroid.com/viewtopic.php?t=26969
> 
> Does the Mali 450 driver for X11 currently not work at all on the
> mainline kernel because of DRM differences? Is this something that
> requires modifications to the blob to fix?

The blobs delivered by HardKernel has been tweaked to work with their Amlogic kernel
fork, and it will won't work on mainline.

To have X11 running :
- a mainline meson version of xf86-video-armsoc : https://github.com/superna9999/xf86-video-armsoc
- you need to get the Amlogic libMali in : http://openlinux.amlogic.com:8000/download/ARM/filesystem/arm-buildroot-2016-08-18-5aaca1b35f.tar.gz

You can follow the HOWTO at :
https://github.com/superna9999/meson_gx_mali_450#howto
to find the correct libMali for X11.

- add an udev rule for mali (if not already the case) :
 Add a file to /etc/udev/rules.d/, perhaps called 50-mali.rules, with the following content:
KERNEL=="mali", MODE="0660", GROUP="video"

- Change the xorg configuration :
Then you should also change the /etc/X11/xorg.conf to something like :

Section "Device"
	Identifier	"Amlogic Meson DRM driver"
	Driver		"armsoc"
	Option	"DRI2"	"true"
EndSection

When X11 is running, you can get the status by running the glesgears.

There is some more docs here :
https://github.com/superna9999/OpenArenaPandora#amlogic-s905-mainline-linux

Neil

From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 28 Nov 2018 16:54:53 +0100
Subject: Amlogic support on Alpine Linux
In-Reply-To: <20181128152257.nhrirxtxlsll6735@raspberrypi>
References: <20181128152257.nhrirxtxlsll6735@raspberrypi>
Message-ID: <b4fea03d-4446-6512-78f3-6fad6dfc3700@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Yangxuan,

On 28/11/2018 16:22, He Yangxuan wrote:
> Hi Neil,
> 
> The alpine kernel package `linux-amlogic` have been merged in alpine upstream:
> https://github.com/alpinelinux/aports/commit/8dc0e43d5a410a6f173c14caaa625adaf45f11f4
> The current kernel config only include arm64, maybe somebody can add armhf or armv7 
> kernel config later.
> And alpine u-boot package have add Odroid C2 support: 
> https://github.com/alpinelinux/aports/commit/706b2721976b16d73274f23966f3f1a5735bf301#diff-bf45357b9515f24851da3b650e49829e 

Good news, thanks for pushing this !

> will add Khadas Vim and Nanopi K2 in alpine u-boot package later. 

Could you also add the libretech-cc ?

> So after the alpine builder build the package, we will have basic support for amlogic
> devices in alpine.
> I'm thinking about package mali driver. Based on this mail: 
> https://lists.infradead.org/pipermail/linux-amlogic/2017-June/004092.html
> and Joseph's archlinuxarm package:
> https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/dkms-mali-utgard-meson
> https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/mali-utgard-meson-libgl
> https://github.com/archlinuxarm/PKGBUILDs/tree/master/alarm/xf86-video-armsoc-meson
> I have wrote the alpine APKBUILD for those three packages.
> Most part is same as Joseph's work, but use your repositories as source. 
> Actually I want to add wayland support and video acceleration.
> In your this releases: https://github.com/superna9999/meson_gx_mali_450/releases/download/for-4.15/buildroot_openlinux_kernel_4.9_20180131_mali.tar.gz
> there are several libMali.so (r7p0/m450/dummy,fbdev,wayland,r7p0/m450-X), I should use which one for wayland or video?

For wayland you should obviously use the wayland one, but this one is buggy, you should take the ARM HiKey binary instead at https://developer.arm.com/-/media/Files/downloads/mali-drivers/user-space/hikey/mali-450_r7p0-01rel0_linux_1arm64.tar.gz?revision=b8764bbe-c4d6-4825-a0d9-bceca4ee4b2d

For video acceleration, Mali is not involved her at all.

> And besides xf86-video-armsoc-meson do we still need xf86-video-fbdev or xf86-video-fbturbo?


No, the armsoc driver doesn't need other x11 driver.

Neil

> 
> Yangxuan
> 

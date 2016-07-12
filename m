From: alexandre.belloni@free-electrons.com (Alexandre Belloni)
Date: Tue, 12 Jul 2016 19:23:43 +0200
Subject: [PATCH v4 0/2] AMLogic Meson SoC RTC driver
In-Reply-To: <1468343799-12844-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1468343799-12844-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <20160712172343.GV22202@piout.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Well, I hoped I could send my review before v4 but I was a bit too
late...

On 12/07/2016 at 18:16:37 +0100, Ben Dooks wrote :
> This series adds support for the on SoC RTC driver on the
> AMLogic Meson devices. The device-tree updates are not included
> as they depend on the reset-controller support in -next.
> 
> The series does not have any build dependencies, but does require
> the reset controller and device-tree entries for the device-tree
> files for the relevant boards. 
> 
> The series tested by myself on the ODroid-C1 board with a battery
> pack attached. It has also been tested by Kevin Hilman.
> 
> I will send the DT changes in a second series so that they can be
> merged once the dependencies have been satisified.
> 
> Changes since V3:
>   <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
> - Added Kevin's tested by
> 
> Changes since V1:
>   <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
> 
>  - Fixed checkpatch and sparse errors
>  - Fixed minor locking bug when writing static-control register
>  - Updated the code ordering in the rtc-meson.c driver
>  - Fixed alphanumeric ordering in on-cpu rtc block
>  - Added Rob Hering's ack for the DT binding documentation
>  - Added better description to the RTC driver header.
> 
> Ben Dooks (2):
>   rtc: support for amlogic meson rtc
>   meson-rtc: add device-tree binding
> 
>  .../devicetree/bindings/rtc/rtc-amlogic.txt        |  21 ++
>  drivers/rtc/Kconfig                                |   9 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-meson.c                            | 349 +++++++++++++++++++++
>  4 files changed, 380 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
>  create mode 100644 drivers/rtc/rtc-meson.c
> 
> -- 
> 2.8.1
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

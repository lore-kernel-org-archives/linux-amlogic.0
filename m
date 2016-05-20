From: carlo@caione.org (Carlo Caione)
Date: Fri, 20 May 2016 16:44:52 +0200
Subject: [PATCH v7 3/4] arm: add initial support for Amlogic Meson and
 ODROID-C2
In-Reply-To: <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
Message-ID: <20160520144452.GA20005@mephisto>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 08/05/16 08:30, Beniamino Galvani wrote:
> This adds platform code for the Amlogic Meson GXBaby (S905) SoC and a
> board definition for ODROID-C2. This initial submission only supports
> UART and Ethernet (through the existing Designware driver). DTS files
> are the ones submitted to Linux arm-soc for 4.7 [1].
> 
> [1] https://patchwork.ozlabs.org/patch/603583/
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>  arch/arm/Kconfig                       |   9 ++
>  arch/arm/Makefile                      |   1 +
>  arch/arm/dts/Makefile                  |   2 +
>  arch/arm/dts/meson-gxbb-odroidc2.dts   |  69 +++++++++++++
>  arch/arm/dts/meson-gxbb.dtsi           | 178 +++++++++++++++++++++++++++++++++
>  arch/arm/include/asm/arch-meson/gxbb.h |  52 ++++++++++
>  arch/arm/mach-meson/Kconfig            |  31 ++++++
>  arch/arm/mach-meson/Makefile           |   7 ++
>  arch/arm/mach-meson/board.c            |  66 ++++++++++++
>  board/hardkernel/odroid-c2/Kconfig     |  12 +++
>  board/hardkernel/odroid-c2/MAINTAINERS |   6 ++
>  board/hardkernel/odroid-c2/Makefile    |   7 ++
>  board/hardkernel/odroid-c2/README      |  60 +++++++++++
>  board/hardkernel/odroid-c2/odroid-c2.c |  51 ++++++++++

I suggest to have s/hardkernel/amlogic/ so that we can have all the
amlogic boards in the same place.

Also I wonder if it's worth to have one single board file board.c so to
avoid duplicating code among the boards, especially now that the DT
support is still incomplete. 

Cheers,

-- 
Carlo Caione

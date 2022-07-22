Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387F0C43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Jul 2022 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwAVJm+3dF125B4LnnkJFw5mLw6MXJ7Qxq/DDb7AxYI=; b=TpQzkvos3ajJBv
	W1kyRfo06eSwhNg1oyn9DvERW2LcnOuxO1yxUxgKiNlVsGo1VWBijheSiQGHPtL6ZYTLkFc/aP5LH
	8MA421E8CNEjq6mGR57zfGCbvt3hmfLzqIHIAaYUDd5gxuPqTpE+L4Ek/Is+0NC3D6odSRGY7qKX5
	KOe/pXFCR+61eD17RRO9pWg939utaweLvAx7eEA4ko1MufPyvXG1lEO5m7FolEFkZJGjwVQP/7hyw
	ex9gB/tlu221QChX8ANGoOqstCsK6DZbOcSb+MatOGrR1W+irz/L33go9dRGMUHZQbqjZzK7QfyNH
	bTJLPYEGsHNvBHh7KpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmnt-000XlU-LZ; Fri, 22 Jul 2022 07:10:29 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmnq-000Xj5-8a
	for linux-amlogic@lists.infradead.org; Fri, 22 Jul 2022 07:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658473817; bh=mfXMY2gMeAASKCMlhszJjMuZPpzu0TXCTf+nO4IjZJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9WPOPpS2LbK5I+QQy9+4Uoltm4sNgZNlb87JGuMA9DlNpHGuiBm6hgwJ5fRAG04S
	 UFsPesaemPJ7TfH94D06l7O6y5pM508HYHhzWT5vF0nzdn2SXFAuYUivYXqCeXU3Pq
	 XiAVwljMmU8KFIy89rpzgh3LQMTSTu2gO9Iaw4c0=
Received: from TS-551 ([101.229.115.105])
	by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
	id 28F14CF9; Fri, 22 Jul 2022 15:10:15 +0800
X-QQ-mid: xmsmtpt1658473815tufjjj6ss
Message-ID: <tencent_33259B2969FF89B5861683B98BB931D97607@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIesNdAwRqK7f4bY/aczfB637loZUjJuRj01MRZBpf8opgYvdpxmM
	 31iDhFzKu0SvTJNCzNzi2Rcb/VJ5jH3/GVwc4cMFPbDk7Q4gtMtzy8qvMu06rQXQwB027UwJVjrU
	 0wzj52uJhFye6SFnOfxj2Pd652qLKUB+K1tb2TCkahwEYyZ8kijuUmrVQP4i1YF5mi7bsStZBpzl
	 xY3u+dIlMaRT19jIm/S0QS7BZ/EcCn9dafZSee8B3omQtGDWhq/z+dedV5EAFMUKpNLvxRlxSKh9
	 8h1MRX8mvJ5FjqgxRHO/eB4SYcqLyPI8gInBuyFOIWFENcxoNtMoJQrdoFsTBHTZRXCq/GKtSGes
	 alECm24CyuEU0MxHgkaQkas1g6xuREWB9qnQJdO+yPbYboSPcAHS3yRexamUll/csVZOLwY+cXit
	 EneN55tTXhE9No0sypp91q/7uGdU1/YrYSCzv1ynNtagMvYMMwYexs6oXxVBcyEcL+H3eqfC+S0c
	 i/tJcJF4VS6d8ULYs7umqjqd3b1BT9EnC3H+rlf2IUrDxGQk4xiQ3R5yszcSQ5H7xhoUz1/BipwQ
	 WMcIXPOKlWSD6jSU/2jjPCfcGRUA3GiLNEhP1aj3Nx/vDvASMVookh2WnlRuYXpb8BiZ3nMAdO0L
	 ntWXl1f2/zk7gyYvH1VeNtWFd/uBLV2nv86+fzJKtbhPXFy2OpRX3uQEcVjykWHiMIqLM4b34tDm
	 76Q1O1PrlNzD4tOA3M3HKDxbndV0D1iZTnxwQDkwHnx3WkXu2QIVAu/1ahx4DweHqU7wNhMMLPO9
	 Qiwx7ASHCqrJE8F+roiMAGRIfUmKg+wFFo6gsFXiBwqDChZgZMPkmGbKt0K63q11Ljs21FbtEvSN
	 PDXlcKsZWUpbup8KnHWoiPC+W8mWExDw==
Date: Fri, 22 Jul 2022 15:10:15 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] Add MagicBox M16S support
X-OQ-MSGID: <YtpNV+TTYOWfvHLW@TS-551>
References: <tencent_5FC75850BB8ECD9374E98461C38C41CAC506@qq.com>
 <050c3f94-5c65-d745-ffe7-6035e55a372f@baylibre.com>
 <tencent_C06302ED0F3660D25A133B0D4506EC17B908@qq.com>
 <44f1117c-3e9a-e9d0-6d88-0f4a233f19e1@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44f1117c-3e9a-e9d0-6d88-0f4a233f19e1@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_001026_650188_88371D75 
X-CRM114-Status: GOOD (  31.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil

I got these info from vendor OS:

<6>[    0.538173] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] no power_on_pin2
<6>[    0.538183] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] interrupt_pin=241
<6>[    0.538190] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] irq_num=100, irq_trigger_type=1
<6>[    0.538198] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] power_on_pin=206
<6>[    0.538204] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] clock_32k_pin=0
<6>[    0.538211] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] host_sleep_wifi=0
<6>[    0.538218] c0 1 (swapper/0) aml_wifi wifi.33: [wifi_dev_probe] shutdown_wifi = 0
<6>[    0.538513] c1 1 (swapper/0) aml_wifi wifi.33: [wifi_setup_dt] wifi_setup_dt
<6>[    0.538559] c1 1 (swapper/0) aml_wifi wifi.33: [wifi_setup_dt] interrupt_pin(241)
<6>[    0.538575] c1 1 (swapper/0) aml_wifi wifi.33: [wifi_setup_dt] delay 1000us
<6>[    0.539585] c1 1 (swapper/0) aml_wifi wifi.33: [wifi_setup_dt] power_on_pin(206)
<6>[    0.539592] c1 1 (swapper/0) aml_wifi wifi.33: [wifi_setup_dt] power_level=0

GPIOs 145-154, platform/c1109880.pinmux, ao-bank:
 gpio-147 (gpio_key            ) in  hi

GPIOs 155-255, platform/c1109880.pinmux, banks:
 gpio-172 (sda                 ) in  hi    GPIOH_1
 gpio-173 (scl                 ) in  hi    GPIOH_2
 gpio-176 (mute_gpio           ) out hi    GPIOH_5   dio2133
 gpio-190 (amlsd               ) out hi    BOOT_9    emmc_pwrseq
 gpio-203 (amlsd               ) in  hi    CARD_6    sd_emmc_b cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 gpio-206 (sdio_wifi           ) out hi    GPIODV_2  sdio_pwrseq
 gpio-241 (sdio_wifi           ) in  lo    GPIOX_7   interrupt-parent = <&pio>; interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
 gpio-251 (bt_rfkill           ) in  lo    GPIOX_17  shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;

The right 2 columns are my comments.

it's easy to add gpio-keys (maybe reset hole) and i2c-gpio (I need more info about devices
under this bus).

I think GPIODV_2 is for sdio_pwrseq. 
current dtb has a issue: wifi lost after reboot, below is the error.

mmc/core/sdio.c:        pr_err("%s: error %d whilst initialising SDIO card\n",

after I change sdio_pwrseq gpio to GPIODV_2, no such error.

Now it requires me to finish wifi&bt device tree items to make wifi/bt
work. But I don't know how.


could I only submit what I can do right now (include gpio-keys and
i2c-gpio if has subdevice)?



On Thu, Jul 21, 2022 at 07:55:03PM +0200, Neil Armstrong wrote:
> On 21/07/2022 16:37, Zhang Ning wrote:
> > On Mon, Jul 18, 2022 at 10:02:32AM +0200, Neil Armstrong wrote:
> > 
> > Thank you for review.
> > > Hi,
> > > 
> > > On 12/07/2022 16:24, Zhang Ning wrote:
> > > > MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> > > > 
> > > > it's gxm_q201_v1 according u-boot log.
> > > > and it's almost same as Q201 reference design.
> > > > 
> > > > add a simple dts to support this Tv box.
> > > > 
> > > > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > > > ---
> > > >    arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> > > >    .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 20 +++++++++++++++++++
> > > >    2 files changed, 21 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > > > index 8773211df50e..e0907fb41829 100644
> > > > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > > > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > > > @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
> > > >    dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> > > >    dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> > > >    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> > > > +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
> > > >    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
> > > >    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
> > > >    dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> > > > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > > > new file mode 100644
> > > > index 000000000000..be543d65a529
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > > > @@ -0,0 +1,20 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +/*
> > > > + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include "meson-gxm.dtsi"
> > > > +#include "meson-gx-p23x-q20x.dtsi"
> > > > +#include <dt-bindings/input/input.h>
> > > > +#include <dt-bindings/leds/common.h>
> > > > +
> > > > +/ {
> > > > +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> > > > +	model = "MagicBox M16S";
> > > > +};
> > > 
> > > The compatible should be documented in the DT bindings in:
> > > Documentation/devicetree/bindings/arm/amlogic.yaml
> > 
> > I will update this part next version.
> > > 
> > > > +&ethmac {
> > > > +        phy-mode = "rmii";
> > > > +        phy-handle = <&internal_phy>;
> > > > +};
> > > 
> > > Is the sd_emmc_a change incompatible with the M16S ?
> > 
> > sd_emmc_a is used as SDIO for wifi/bt. and wifi/bt works with this dtb.
> > I checked mrvl-sd8997 DT bindings,  missing a lot of properties need
> > by mrvl-sd8997.
> > 
> > I don't have schematics to fill these properties, need more time to
> > check vendor OS or try each GPIO.
> 
> Ok fine no problem, you can push it later when you figure out the properties.
> 
> > > 
> > > Neil
> 
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

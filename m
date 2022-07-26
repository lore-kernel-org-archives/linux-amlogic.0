Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3C3C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DuGpy5NfZaiJz8cmdKpSzTfzJl6IUWkXLGbOHCID98=; b=fwDu2i7/NsIuqd
	YVPUn0m2ZatYz359EG9C8jK5X2ASPKbdryEbzVSRcabT0JkWncKpAfacHYNx2yuAxXWTLobNUmpwG
	mQyef/8aUzvtI1n5XxK2fPuaw2mp7o/EyY/hUnbjmrpH4/UNE5/YNzMMuFB2xJZ0vVu0aIf3E2yg7
	f7PHfPDfPkQWiCIU6MCvFnmyH0umgi6ClCVh0Wxs1Q9OM/l6bjkcwi4AdPg04o9vSMiEmONWQSM6U
	/DGHr6UoK1HVAjsdaiqeJYGENmsUR2wZOLoCArsuTQ6tXd7UVvq9CahVdImnVJETjUAzkXRQrS2Cy
	f1XK0waYTq3ht37H+7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG83o-0057JQ-1h; Tue, 26 Jul 2022 00:04:28 +0000
Received: from out203-205-251-80.mail.qq.com ([203.205.251.80])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG83j-0057Fo-Et
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 00:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658793859; bh=s4djs3FkIXaCRQ0V+n6gX0WgjiyPhXifZ3f4SwWo9tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ujtz3IrBntb5pA/+AqDKH1U3z6FOg/ZCdRDm0Fl9lvFrAFvZH/gkckPie4JpM+9JA
	 cQ2CCo1ot1Flec08Hmuu0S2k7nAZr2saQYEoIHwAvm2+1qPn9bwpD7O603w2wUxoYO
	 tbszoqcowSy2XqCtPn+8BIUqq9Yc4iqr5dADEdT0=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 1101DC72; Tue, 26 Jul 2022 08:04:16 +0800
X-QQ-mid: xmsmtpt1658793856tqfbdvw4u
Message-ID: <tencent_1B5B069917D86370ED4136BDD2C413240D08@qq.com>
X-QQ-XMAILINFO: OakVxA/3u/8R7vy1OwiEMqa6xK6fy4noiLH8xDuMM0n7z1L0MuwAbFtvgXb59h
	 X2BHiwMAO+g2FSG4gCO2ZPepjrSQMMtdqGi8VWHUFJdTefL0nsGZuFrphRX2qvGanNnavIVns3oz
	 g1RN9bG5xw/6yLls1fiwbQGPDsTkL5FQXzRo20OqRWOoi5DKLSvkwYkVBxY1nrd0aunZ+aHei3Te
	 bQt30DTVAa2aKyeQXBRKk8TAIu3MAstyDWOep+qf+tNz0R1+uSiaHA40KVn5duiwKHAMKL7EAzdY
	 X4yv7lDR530hqjwT7J3H1mT8U2nKVu3keswMsyuBDsuXULjhhJ1tAmUUQyIzFMslrlR/6eq6LJ80
	 GUVMvddmGWI+ocIdUdh8d/4lQv9Cl6+AMls0QIc93G4KgW+PKM3Gkqw14elRfgKVUSKKPP3wtvqy
	 B8PlFASDp+d/R6lLMB4pQebDpe6iaWKlxQwvSoKftS2lFQ3FJmIdI3fUXShgJYuRmsk8dKv3QQ2e
	 J1esad9ifKAC+LDTr2l7ORzQaaPU86XHb4eyywO4CxuByaAn142rkBWTGVMcVl2mE1bDMxRfCZ0s
	 7+rSfJxhlN+L1H0+RiHgV01bh7myKQCdDjJKOXYiH6Z4ktVG82++460BnNf2CpWjhlOkvlJPvz3S
	 scsn97q/mVIbJMuKHmPg0rFJLPyGlkerm3JB5JIzRSxzWfqcbAz9594rCAXjGsOIKrIyUoJK7pKo
	 vr3pa3ekwMJGj9iVlyGjesH4MB0f4EwYiI19LakjZheaZOeqivlJBsm3DAYTmrZb4A3b9C1dnD74
	 4SKM9kskYLAePpuHqBokcMm1ULfovyECB++s2uHoRfLluQSuDDCjhgExwu5diADTvEv83oGPRd9K
	 vOb40pQplFYeEWnJgS85I3+LPx1xDr+jY6ojOBm7IEm2n96JuF3ZY=
Date: Tue, 26 Jul 2022 08:04:16 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
X-OQ-MSGID: <Yt8vgBjZzr0J9TW6@TS-551>
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
 <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_170423_827451_C2832D72 
X-CRM114-Status: GOOD (  22.09  )
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

On Mon, Jul 25, 2022 at 06:32:17PM +0200, Krzysztof Kozlowski wrote:
> On 25/07/2022 01:17, Zhang Ning wrote:
> > MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> > with spec:
> > 
> >  - Amlogic S912-H (S912 with dolby and dts)
> >  - 2G ddr3
> >  - 16G emmc
> >  - Marvell sd8897 BT/wifi module
> >  - 100M ethernet
> >  - IR reciever
> >  - 4K HDMI
> >  - AV out
> >  - Rest hole
> >  - 5V2A power input
> >  - white LED
> > 
> > it's q201_v1 according u-boot log.
> > and it's almost same as Q201 reference design.
> > 
> > add a simple dts to support this Tv box.
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> >  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 40 +++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > index 8773211df50e..e0907fb41829 100644
> > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> > +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > new file mode 100644
> > index 000000000000..69e72687ac9c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > @@ -0,0 +1,40 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "meson-gxm.dtsi"
> > +#include "meson-gx-p23x-q20x.dtsi"
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> > +	model = "MagicBox M16S";
> > +
> > +	gpio-keys-polled {
> 
> Just gpio-keys (or even "keys").
I see all dts for amlogic platform are using gpio-keys-polled, could I
keep current name?
> 
> > +		compatible = "gpio-keys-polled";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> 
> Address/size cells are not correct.
Yes, this has been already pointed out in V3's review, but I forgot to
delete these 2 lines.
thank you review it again.

> 
> > +		poll-interval = <100>;
> > +
> > +		button-power {
> > +			label = "power";
> > +			linux,code = <KEY_POWER>;
> > +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> > +		};
> > +	};
> > +};
> 
> Missing blank line.
thank you, will add it in next version.
> 
> > +&ethmac {
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

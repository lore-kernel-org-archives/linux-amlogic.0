Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B3BC43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Jul 2022 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffbfU9Jbo3IPFae8Lu5TER17SDZa9Dx9JijqdKV/R7w=; b=qZYlOMyvCOIaW9
	SQOm22ggFUNEF15QFCbHWju+kykKjltTSAMxe7C6sAyEhlsx+yOFDG7Q8/dPc/7kKPj7Rb34XWEVA
	b4aXt9Nte/V7r/gzA39CVX5C8ByJbUfE+M/yQ0wE4mlguoSBYLrOQWIJ40ww4b7PrL8UtUaZj0tEL
	C+HTLlY7LsX8GQ0FR7r3++koUbqL3c/7AFQfD260TePWPwb8umtEAdV6QysRqpMEfxQyXrzYN7hwL
	5sfJaoYowxfA2PkvXlwcGkFG8Wh9v9Nqoc0uENcvYKI3QH8VQ7f95CPrFLULLvRjwXhZ8TREMLcPr
	EjCiQ+lBLKd6oJSajiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXJP-00867j-O4; Thu, 21 Jul 2022 14:37:59 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXJM-0085yo-Tb
	for linux-amlogic@lists.infradead.org; Thu, 21 Jul 2022 14:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658414264; bh=eIXNnipLettVK3YXyQDl2/SWVNC4OrY0DTOn2XXEpFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bf7xXy4/OtOxR8D2qQwVMpYle5blnmofjRqOjF99r5t00l4WePVWcdAD3wRRYnzm4
	 b9LdBwDcAWI3BVKT161TAapMwb7LwhenLSNaaKX0KF9RfjSzp6baCgEA4ORcGNNScg
	 LtYcYtksAfH4WTV1+GPdF4nbhNniETxghefuHYMc=
Received: from TS-551 ([101.229.115.105])
	by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
	id 96A12262; Thu, 21 Jul 2022 22:37:42 +0800
X-QQ-mid: xmsmtpt1658414262t7sffqcn8
Message-ID: <tencent_C06302ED0F3660D25A133B0D4506EC17B908@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtXeoHX/NwH0/J3zkw0NUJki1inJyLQXdORGrGxFwZf9aKN82uBV
	 XboqJL4rdc0owrTUp/3pET0jsVRm/jzGxpivxWNYenEfoRGxwh6kilJMMjgYrTHolsaXEX7/SxnW
	 zWtMUg4PBlXxMh0gSWfNiy4l5WJNNXycvmjHwgcypdatUYryVN3xBRELlCLRFK4Nqmsh3BNPY/4D
	 WrAPN05aqLQvmB8M3wBeVrNzRPsDfQMt2UYjtPjF7ZADRQf3EQ9nOwtovPfKQL3wNuTuGebxCpkB
	 e6t6LZtG/0uWiV2VtyaKl6xTi/fCMCnkgquan2cwtGoZF5ggl/rm4YxzV0P28E4IMKRpidFgEyKg
	 uIN/eZX6OS9COebhiSKQ5fAbGckg+2L9H2GqaC0Jsry2czzeWp6CbE3m6GpduRxCVCM1CtTWjh71
	 5MHHJeLntcn3YbJlvsy8Fu8ojHuNhphrE7imJB4ACwRNVyh+9To7JKBZwkV2z4a2gZQceM65l8Wj
	 mSbUry9NAxQlZrDmLYONICRP+Mw2uTf10feISSiG62zFgt7SPF3MWNEg8Ud2Lh7T/dIdRJNGwTqL
	 /g0JjfeTX9YQr/Jiyl1hf/wY1rDMigo3HdUtp5Yq85iMywQ9TyUMOpEfJWIGt2QxSFdIiY9bsN5S
	 Ql2etdbsL/GAYR1zfEVUMGdBIW+rYCKFaoTyDKTKtaCfc/WPxPZwyqWG6PRGg6UXWHaQJk2K06J0
	 N5O+Jcv3evM4y/xSqSDFe0+Sd9YY91OdrBvxNo9g95DddAqFhI5QaX6sS0kKNxp7QqGWG1MJB/G5
	 NohxwzwWjqxpKECrQEgXfWv31cAX8jglkBvtuC0QnERLPFgz6ztcmoo7lOlLd8NQZbFGxSeF8RXB
	 sVQsQDgZRJftIl61vz3udpnYJrYtt60YFJfsfflim6eMH80t5SneLqkzdCnohjfDUUWY5dF65/5t
	 AskF+ob+Y=
Date: Thu, 21 Jul 2022 22:37:41 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] Add MagicBox M16S support
X-OQ-MSGID: <YtlktXFWm15EEz2q@TS-551>
References: <tencent_5FC75850BB8ECD9374E98461C38C41CAC506@qq.com>
 <050c3f94-5c65-d745-ffe7-6035e55a372f@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <050c3f94-5c65-d745-ffe7-6035e55a372f@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_073757_313933_73B1411C 
X-CRM114-Status: GOOD (  20.91  )
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

On Mon, Jul 18, 2022 at 10:02:32AM +0200, Neil Armstrong wrote:

Thank you for review.
> Hi,
> 
> On 12/07/2022 16:24, Zhang Ning wrote:
> > MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> > 
> > it's gxm_q201_v1 according u-boot log.
> > and it's almost same as Q201 reference design.
> > 
> > add a simple dts to support this Tv box.
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > ---
> >   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> >   .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 20 +++++++++++++++++++
> >   2 files changed, 21 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > index 8773211df50e..e0907fb41829 100644
> > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
> >   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> >   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> >   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> > +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
> >   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
> >   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
> >   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > new file mode 100644
> > index 000000000000..be543d65a529
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > @@ -0,0 +1,20 @@
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
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> > +	model = "MagicBox M16S";
> > +};
> 
> The compatible should be documented in the DT bindings in:
> Documentation/devicetree/bindings/arm/amlogic.yaml

I will update this part next version.
> 
> > +&ethmac {
> > +        phy-mode = "rmii";
> > +        phy-handle = <&internal_phy>;
> > +};
> 
> Is the sd_emmc_a change incompatible with the M16S ?

sd_emmc_a is used as SDIO for wifi/bt. and wifi/bt works with this dtb.
I checked mrvl-sd8997 DT bindings,  missing a lot of properties need
by mrvl-sd8997.

I don't have schematics to fill these properties, need more time to
check vendor OS or try each GPIO.
> 
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

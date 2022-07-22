Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACE5CCA473
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Jul 2022 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2jeFY9LHD29mOglKFRmsLsk2NLUPIGmA+23TuIX+EY=; b=mkR4WxADFQiaOg
	HKUVmH+9AM9ccCgs8FuldkAIytNE3QXcSI/u79MYQOQig2vRvpDXDyGfuOuE9tihBx2kcA3r1RQLw
	B2lECWOYJNPJan6ljQWgyBQCGLtbrD1qbd57f24kZ2MMuqDlCWxmuFyw8B8jcniiilE8GTh7WeXdq
	+3NkRiScPw86rshblCLUj2WGX+djmcLBz3sf43o4HUAtcUByYd38HfzRlvLVqNqHePA/cUQfft0xF
	vEdjyTpT6LaU5W10j1nMutMHe507jZtr9pj3RVHZ95PxA0HCIgZLCwXL6YmFRIM9pm6mQFF+bTq1V
	Jo6YM7MeOUBPOrdMzizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsK6-004ibb-4P; Fri, 22 Jul 2022 13:04:06 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsHK-004fwt-Ed
	for linux-amlogic@lists.infradead.org; Fri, 22 Jul 2022 13:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658494864; bh=o2tkGr1bNlr0iKJfLnZp9qAYVAkCvJRy7nc6zGNBRGo=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=wtk39hMND0GIL2u2/6+IPcUyJrLXDoudKIIK+Z5zDx3eVLTqwarZvxywOG31+RcaW
	 Xi+rNdUSKacoJBjfOH+k887zKhtFE4kGRaLmOvetpKFJVRPv/qmCdGr5mVDQ8jjeVa
	 cNLZpcsunqZlRy29TMg9vlUI8Wx2J97aSQDcs2ks=
Received: from TS-551 ([101.229.115.105])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 418B86D; Fri, 22 Jul 2022 21:01:01 +0800
X-QQ-mid: xmsmtpt1658494861twbybnwho
Message-ID: <tencent_9A352419505C708C01B46BDA204AF34DC00A@qq.com>
X-QQ-XMAILINFO: Mv0vHjCtzIgU1/FZ9Vpn9s/1Mpmy3KC/+T0O407jx8aCkWKiZ9PciQfd6CGeM6
	 le7zdp8FgSTYXzD7L6WwcHZSDbywWYPJmZFotV92jaUGya23ZtKLc99KWIp7Ra9mO9tRsx3CZtcU
	 HyIbtqAoXloWHz/dp47rQo9L4KdsanrGNT56n0RceBUuMhNV/dAlKndoiLi/syOHJT6y4XfEWN1m
	 WUjZ0bjsDJh0sBGNXUwXBGzDT0D64cfG5fssgXpxBsuaQALEGIGM59IEurPzd48LBcFx/p4Xzgqz
	 xJeNHtnuaxrQQMaFGYHBft6lJMflLizjxUYdUBtKPQAmLVREpnDSe4e+Ai0T5m4s8euVQ6USjePO
	 D+CodhmleMaaTBHG7KOiqlfBSQi7SV3ldxZAzKthVAjGBA1OcBdO1pOUbs0Lnj7qnvlmfvg/agII
	 ZA+gg2hAwunZvC/j7FLUkUDLdlVMIcm2FhwfrL+bRrE8Hr0MCQbNkgVZCt9RCHdDxQNCYzU9gNc4
	 huu/gapyRaI6T/JNeQfNAqweGWFjMy+Gn3gyrCcCI55oxiiNZI0wEycaqjOLWY3oBtBFS+KZDg83
	 2TDVXsLZALn13PzWQjxcHG48XVKmwMuzhCqy1kAtH1Z2hItC19RU9SpHKPDpSR4XKp6hPD9Glqgs
	 Zls1fEhY93zn3F0nlGvX8HZ3yORg8nnfGa20q0QpH6gVbAXmqkBVvLkr7o7Wc39Z8CS5zX0co5Kv
	 29WXzuqMWMjX0aNV0aWToKJJj8uft7Zq56ZVIUk7E+Oi4xZUy/dD+fvBdcdqjEze1nGpDI6Xaz42
	 WsS4DM/tfKP2LGVJBYILRlBnh6qu3jldE+6jFjF4GergXH73CQM8fPBgeiE4EhT1GSvj8/KhtNrX
	 d1jujdjsBN+EmRIR81JeBqLphfLjpD+A==
Date: Fri, 22 Jul 2022 21:01:01 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com, robh+dt@kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] [V2] Add MagicBox M16S support
X-OQ-MSGID: <YtqfjanOZp0TU0r2@TS-551>
References: <tencent_E909DD0619039C0BCF31DA763D1B3BE9BC07@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_E909DD0619039C0BCF31DA763D1B3BE9BC07@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_060115_016319_DC48EED5 
X-CRM114-Status: GOOD (  18.05  )
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

changelog and notes:
in V1 emails, I digged some info from vendor OS:

gpio key is added in this version.

gpio i2c is ignored, due to device under this bus is gpio-edid, mainline
kernel can get edid correctly, thus ignored.

GPIODV_2 is sdio_pwrseq reset pin, and it is active low. I tried active
high firstly, and no wifi. This also fixes wifi lost after reboot.

btrfkill gpio: GPIO_17, is not add in this version, marvell,sd8897-bt
don't have this rfkill property. leave it in my todo list. bt works
well.

GPIOX_7 is used as wifi interrupt in vendor OS, but meson gpio can't be configured as
interrupt, dtb compile warning. thus ignored. wifi works well.

other pins are already correctly handled.

and waiting for GPIO_TEST_N ready for gpio-leds. (should I add it now?)

ir decoder and keymap are still unknown, I can't get info from
vendor OS. leave it in my todo list.




On Fri, Jul 22, 2022 at 08:42:02PM +0800, Zhang Ning wrote:
> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> 
> it's q201_v1 according u-boot log.
> and it's almost same as Q201 reference design.
> 
> add a simple dts to support this Tv box.
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  .../devicetree/bindings/arm/amlogic.yaml      |  1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 36 +++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 61a6cabb375b..3eac16a4de68 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -123,6 +123,7 @@ properties:
>                - khadas,vim2
>                - kingnovel,r-box-pro
>                - libretech,aml-s912-pc
> +              - magicbox,m16s
>                - minix,neo-u9h
>                - nexbox,a1
>                - tronsmart,vega-s96
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 8773211df50e..e0907fb41829 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> new file mode 100644
> index 000000000000..464de73d2f0f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxm.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "MagicBox M16S";
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <100>;
> +
> +		button-power {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +&ethmac {
> +        phy-mode = "rmii";
> +        phy-handle = <&internal_phy>;
> +};
> +
> +&sdio_pwrseq {
> +	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
> +};
> -- 
> 2.35.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4705C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 13:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B0C2072C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 13:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cMBQLOpY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jLlqpxrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B0C2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Anai0TqQyTcrbxssVBSTwxoYL9S8YgOeammSbPhEX3E=; b=cMBQLOpYnoHR86
	DQlFgpHV0V1BHUAAEzZqoTsmZFQVybs9qC9Ul+Uaq3efE2GnQRlAOxD+bs5slp+n+E1Rzelcz1+bs
	1S41wFGj7/lsneWILTWEPzNXbPz/xAJYrcJ9DF5yW6TtuL+QThNQk0wYRShLpcBbsWHFyxRxaFEF1
	imOALWVKQGyaq6rddCrm97CMd5qqOSpY+YPAhXxjZn/JhYcpnPtmmwAWH8CsvVExSB5AtcYasNWSJ
	z6e9r6mjR12EsBcO4bgiG4dh0Pf7CEIUuZZ7fIq7JU0p45b7SH5vluHK6ZOoj6pGt6Zjq/JySfdaE
	AriMb4r+f4TXh91MghYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib3HM-0005PW-Eq; Sat, 30 Nov 2019 13:59:20 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib3HJ-0005Ok-AC
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 13:59:18 +0000
Received: by mail-oi1-x241.google.com with SMTP id a67so9631621oib.6
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knDG9q1Om7ylkLkDUnMttjzIm4kmfNCgMvz8qf3PAy0=;
 b=jLlqpxrTq0Xx9COlXnlECuoKTzj78CFge75eWGYPJ18t17/Gjqx9N1TLte+H2NUaxe
 yxXvd2fQDohV6UNhyEkdoTyVHOmguIB+zSXJ6p3Nhs8PBTTj861ePWHqioQlAdyxT6Eu
 TREjS6GEAgAuAl34PUb5rtxbpoeysgqos5Pm/hnCtRMh2p8+INLkRBxmvgNcBwIjjPRB
 SNgnFfJgtzFSbU66TysCdUQ02dRB4n9hpQJ5YbYuGETIImCfi73+pbJ9TB+uA+eWhlk3
 H0HcSE7WIht27rukA18DFw2YTCJm3cKowVUD6ShPJzHxAXlujOTlyWXjD6bJlY3LkzLc
 /u0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knDG9q1Om7ylkLkDUnMttjzIm4kmfNCgMvz8qf3PAy0=;
 b=P0DvOxZ7so3gyDnttsuSWSW0Xu3qIpJ16Vrqoxwa9S7ouTsMUU4ZpIjYgSklo6V1S+
 +cEyR5CXHhC/WRDyCeHQkOAWUNvMjehkH2sdZTjhkoDKgFNFF8IORYITCJJ0J7H7GX1D
 s7RTcye19/FbGq/2Tsb3Bk3SXpnZit0ejMeFQX8HCH4WD4o0mCYMeNd+q6gIoESIsNaJ
 EzlKKBGFutFER1cuF6ATTBfZlu8g1XdL9zzcSbAVQpSfvfvWoHfVCfBjDmAeH+yYsyEa
 dx+xSlAr+Up9xVI1j9SiJk7CjyrRC9mKLsTp3RgDhl4I3+P7ELP89qbJTPYhPNjWToIr
 ogKg==
X-Gm-Message-State: APjAAAU9oH6bwbo51/mnDqG+5bi3Gz4x+LqOWzR5AQmUcmIb1jVnChip
 Sa5t4JDOpF4IjycK9BVrdN/xrmfcHBl3hkGOQwk=
X-Google-Smtp-Source: APXvYqz1rUfi8sF0XztTmxtg04fI8l4L2p2Rz3H1ScN2vduYncwHYWNi7Ui0I0PKQZDwHbdGLpN4ydOzJDCQj9GYMJs=
X-Received: by 2002:aca:110f:: with SMTP id 15mr17097336oir.47.1575122351531; 
 Sat, 30 Nov 2019 05:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-3-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130115824.31778-3-mohammad.rasim96@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 30 Nov 2019 14:59:00 +0100
Message-ID: <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
To: Mohammad Rasim <mohammad.rasim96@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_055917_380808_CAFB7496 
X-CRM114-Status: GOOD (  20.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mohammad,

this patch should be third in the series.
the currently missing patch for the dt-bindings should be patch two.
you can take the following commit as an example:
effdd8a6b6ecb30b088f36ed0a1fb67cdc7610a9 ("dt-bindings: arm: amlogic:
add SEI Robotics SEI610 bindings")

On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> This patch adds support for the Videostrong KII Pro tv box which is
> based on the gxbb-p201 reference design
>
> The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
> which was merged recently into torvalds tree
>
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 84afecba9ec0..a795a170dcab 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> new file mode 100644
> index 000000000000..5d120e6ca338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxbb-p20x.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +/ {
> +       compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> +       model = "Videostrong KII Pro";
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               red {
> +                       label = "status";
this property seems to be deprecated now, see
Documentation/devicetree/bindings/leds/common.txt
but I'm not sure whether Kevin has made a decision yet when to not
accept "label" properties here anymore

> +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +               };
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               poll-interval = <20>;
> +
> +               button@0 {
please name this button-reset (even though we've done it wrong for
other boards in the past)
@0 indicates a unit-address, but the button has no address

> +                       label = "reset";
> +                       linux,code = <KEY_POWER>;
> +                       gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +};
> +
> +
> +
> +&uart_A {
> +       status = "okay";
> +       pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +       pinctrl-names = "default";
> +       uart-has-rtscts;
> +
> +       bluetooth {
> +               compatible = "brcm,bcm4335a0";
> +       };
> +};
> +
> +
> +
> +&ethmac {
> +       status = "okay";
> +       pinctrl-0 = <&eth_rmii_pins>;
> +       pinctrl-names = "default";
> +
> +       phy-handle = <&eth_phy0>;
> +       phy-mode = "rmii";
> +
> +       mdio {
> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               eth_phy0: ethernet-phy@0 {
> +                       /* IC Plus IP101GR (0x02430c54) */
> +                       reg = <0>;
> +                       reset-assert-us = <10000>;
> +                       reset-deassert-us = <10000>;
> +                       reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> +               };
thank you for switching to the new PHY bindings :)

assuming Kevin still accepts the LED "label" and you rename the button
node then you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(don't forget that we still need an additional dt-bindings patch though)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

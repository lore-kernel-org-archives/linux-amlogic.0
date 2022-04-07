Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C39C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBBjHLBun4uprHb+LMEPnKyCXd0OC1KbeCjJDRQQYss=; b=wFWj1/mfF1JsK0
	Q83nghzeDR1periwVqdwYcZe+BVpEd+Ksp37rCycCheBY4GZDasCRX1euPZUHI0HKaeIHcmIqJcWF
	FUUfcpHs69PjylHPBx/5skcNFyWi1Qrk8LoJir3tvy1sf1Q1uPMcfzdTXNCm6Az3JTTS5ttkyU94V
	uXq5b3T+MhkSMgmJEcZLOlkVjwzFCB3cS3Tl7MinM/3GyjP64XdZajANgI0hMESYQ2W3x27P8Q2pK
	IfkdwCMOH/JuD3BRurwXBG5mgGMhQTzEHzj4kgyp2pvJoUlJHoy79KzmtPjnXk/d5rkbXP/yQcKIZ
	vkG8qJE3B3Uq1dhUI6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncZ8B-00E2Gv-Uf; Thu, 07 Apr 2022 20:53:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncZ82-00E2DP-Sk; Thu, 07 Apr 2022 20:53:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC5DEB82994;
 Thu,  7 Apr 2022 20:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59025C385AA;
 Thu,  7 Apr 2022 20:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649364795;
 bh=hH0meYZ7KFxv8pBbd7Ld0RQ57xC725s9BToCO/hz7FY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ceU1Tao/URFDuuOZJunGv8ZJW10hHL4SFtQqZpM8Kfd3z7jx1i48ARHfVCZy1jE3F
 WLOYcQzK63738uhkbVLqfOY/UY4JOb1bv3qnys8pXWNomkfFpaqBINjHljdZ2o6kIN
 1zn2KOwRe/IgGBQX3+NYlGLL1BJZ/duHUUi1OQzSho+OSfBXBiQqgSkW8QXH8run14
 elhpLoCVCnwYwP4JnVTcmgRWwLBylflW1iPnPXyVXGf/96m7WYKGKUgxCk9t7bOS6y
 5ZRETNFtF7wok/zfav5nfofKG7ia6MpwKPYTHmr0tvGjBHY1aE5fKlL/Vy2BBO/YWE
 R9903jrFqq5aQ==
Received: by mail-io1-f46.google.com with SMTP id z7so8382726iom.1;
 Thu, 07 Apr 2022 13:53:15 -0700 (PDT)
X-Gm-Message-State: AOAM5313oD5kGK513aaY+aGPhOGS0TRnm+u1SADm6KokjtYFuebca8uf
 dTITu32WalSkj6Ead5HSI8SjTJzkV4d1/igv2A==
X-Google-Smtp-Source: ABdhPJwX9EOC7s4lernQaEBJdy8BtvchpcglTWArVdpbaOe2SaItODmejqV/qePgLb8HxSMQeV0F6nHDwxLGyrA/EGA=
X-Received: by 2002:a05:6638:1301:b0:323:3b47:8b3f with SMTP id
 r1-20020a056638130100b003233b478b3fmr7914802jad.291.1649364794440; Thu, 07
 Apr 2022 13:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220106112214.6987-1-xianwei.zhao@amlogic.com>
In-Reply-To: <20220106112214.6987-1-xianwei.zhao@amlogic.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 7 Apr 2022 15:53:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJs=zLegXz_oDqYFebJReCSnbHPWcPDD6rFv9SpSMmjAQ@mail.gmail.com>
Message-ID: <CAL_JsqJs=zLegXz_oDqYFebJReCSnbHPWcPDD6rFv9SpSMmjAQ@mail.gmail.com>
Subject: Re: [PATCH V4] arm64: dts: add support for S4 based Amlogic AQ222
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_135319_261964_A08691B2 
X-CRM114-Status: GOOD (  21.20  )
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

On Thu, Jan 6, 2022 at 5:22 AM Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>
> Add basic support for the Amlogic S4 based Amlogic AQ222 board:
> which describe components as follows: CPU, GIC, IRQ, Timer, UART.
> It's capable of booting up into the serial console.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V3 -> V4: cleaned up coding style.
> V2 -> V3: add of dts board  compatible family.
> V1 -> V2: cleaned up coding style, modify CPU affinity of timer interrups,
>           and modify GIC reg defintions.
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-s4-s805x2-aq222.dts     | 30 ++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 99 +++++++++++++++++++
>  3 files changed, 130 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 5148cd9e5146..faea74a45994 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> new file mode 100644
> index 000000000000..a942d7e06d6e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-s4.dtsi"
> +
> +/ {
> +       model = "Amlogic Meson S4 AQ222 Development Board";
> +       compatible = "amlogic,aq222", "amlogic,s4";
> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       aliases {
> +               serial0 = &uart_B;
> +       };
> +
> +       memory@00000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x40000000>;
> +       };
> +
> +};
> +
> +&uart_B {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> new file mode 100644
> index 000000000000..bf9ae1e1016b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a35","arm,armv8";

I see this is already applied, but 'arm,armv8' is only valid for s/w
models. Please send a fix.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

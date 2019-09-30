Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E41AC4360C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 09:39:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DC821925
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 09:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oxrjx2db";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezaO9zsz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DC821925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4umFdrrwKUzn7Fr/CGbnQgsw283ohMkitIj/cWUKWc=; b=Oxrjx2dbfyfSJi
	GldsJ2xjgKLPMjxUDGAbUhMUFpCCt4t7zMm/UKzkfOJg9AIsOEKOqhbCmDDQDFQ2O6hNqPrV3nLs/
	DUrQjqiSvz7DkXdycguySWjuVFdTYsDf13oQs9NdeCDwZ2EaQve+Mf7rc4EMsToiWMEn6TTev7Ynh
	W8hOyM5CgNT1HO2sHL/yrxzv0jGOAnO0hMB5mxcnEoGKXBrgPign2Q/w7Po3xLWygrsbzuBJNKxhR
	2KNj4nnakpE4H1+VWtoJc8CdGwXIKgNKdWVTG67M41Z+VYKCuGY2jlBqe1pkBP+RtwZOKbUzI3Vr/
	LXkO+kLishs8dP9G9Rvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEs9Y-0004eG-Se; Mon, 30 Sep 2019 09:39:36 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEs9N-0004SN-96
 for linux-amlogic@lists.infradead.org; Mon, 30 Sep 2019 09:39:26 +0000
Received: by mail-vs1-xe44.google.com with SMTP id b123so6300986vsb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2019 02:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cxq2bHjW+AlD4mf7jruqGrWE0fprB7ccNLUpIWh7TxQ=;
 b=ezaO9zszxJd+4Paz2hLVlDZc0d6U3pC4lCfi0hx3DLO+w5QuhSGeHUVHnB1NsO87YU
 /hKG68czBD7AnAolLrFBmu/xnQhcuDjd7HywSkHZaKPG4IrnGsro8QpWqisGbzZCMhK4
 fezjraSoXEiZbu8t5OWLAa62APj89GVmbo3sB8C6T4LL5PNtgGyRmBjhloSD9y42790/
 ZCeVZDcrRMTwJ4fQm7Jmx9rXCm7VmTJZot1YSFSD92VbD0LsQgyLKH6/JsDLHB9NgJvn
 DsC7BP3BZj8eCYngdpQGJJpalLx5oRJo0qgn+6E13Ez66aVjncVI36aajxbrpr1AOB+/
 2uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cxq2bHjW+AlD4mf7jruqGrWE0fprB7ccNLUpIWh7TxQ=;
 b=oa7sL5x/Kc1F6Y9E+5IGVw4tHYL2VZ3zjslm1E2joYe+XYAFncejqkxRpWROBRE5IA
 YOgFexEh8zeBvN3mDPH0YQVhRLQvWIWl1UKUtZnfto9IqsdjMKIKjdUox5NR7PL39/x9
 eV+aIdku/QRXKpj6yjLV26PXRhR+Hl6//ey7ujz/pcF9L2oOYfJHPUIRdqyRymeoXlDw
 3395N3nSYd2fBHt004NuDpL4Bd0OK4PxCz5wRt8sEDOXZI63asbelRXRxVvJTqL8C2Y+
 KlV4PdzQ5VoNF37CXbIL/TG5FuPEnwiw22RrAqZbHDqU4mO7zahLiJ8xPy7i8pXbFD6c
 +Ung==
X-Gm-Message-State: APjAAAXQtBh/hQLil9AuhXvghsSzli3ZJX/jL1U8nrGylFkDx3g2KKy6
 VERJu3mN7INRGT8rf50Dlz+VKyG2Njh66nAKHQJUGw==
X-Google-Smtp-Source: APXvYqwypOTWZbzuX6iCn3PcY5YBeeHcL68LEGV3573E+3R3Wicv0r3ZFov2Xry98RLO/sXnr4hY51+x2ckMi5V8fnk=
X-Received: by 2002:a67:842:: with SMTP id 63mr9032821vsi.9.1569836364416;
 Mon, 30 Sep 2019 02:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184352.28759-1-glaroque@baylibre.com>
 <20190927184352.28759-4-glaroque@baylibre.com>
In-Reply-To: <20190927184352.28759-4-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Mon, 30 Sep 2019 15:09:13 +0530
Message-ID: <CAHLCerPQ4Uzoo2F-fNxZNV0_uZZnLwNenDYZTzgj7pfOiwPtGg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] arm64: dts: amlogic: g12: add temperature sensor
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_023925_333462_E24CED4D 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Sep 28, 2019 at 12:14 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add cpu and ddr temperature sensors for G12 Socs
>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 38d70ce1cfc7..0660d9ef6a86 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1353,6 +1353,26 @@
>                                 };
>                         };
>
> +                       cpu_temp: temperature-sensor@34800 {
> +                               compatible = "amlogic,g12a-cpu-thermal",
> +                                            "amlogic,g12a-thermal";
> +                               reg = <0x0 0x34800 0x0 0x50>;
> +                               interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&clkc CLKID_TS>;
> +                               #thermal-sensor-cells = <0>;
> +                               amlogic,ao-secure = <&sec_AO>;
> +                       };
> +
> +                       ddr_temp: temperature-sensor@34c00 {
> +                               compatible = "amlogic,g12a-ddr-thermal",
> +                                            "amlogic,g12a-thermal";
> +                               reg = <0x0 0x34c00 0x0 0x50>;
> +                               interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&clkc CLKID_TS>;
> +                               #thermal-sensor-cells = <0>;
> +                               amlogic,ao-secure = <&sec_AO>;
> +                       };
> +
>                         usb2_phy0: phy@36000 {
>                                 compatible = "amlogic,g12a-usb2-phy";
>                                 reg = <0x0 0x36000 0x0 0x2000>;
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD53C43387
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jan 2019 16:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1372070D
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jan 2019 16:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kW74ZbwL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z3ZCsZrQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1372070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=msWADdc4bP9oaW42jlUHN69lhpZe2awScqJx6iChsFs=; b=kW74ZbwLR7bqjzZJmhF4M4BxB
	dvnDPloK4v0yGY42XE6p/M0sMvwr1WkH1WqcquFY74WCJjQ999Brd7eLKS6qRr/9HWv8Tfpn6RVXi
	bGbdv3LAtK7xv7GCqXXkyO38RqlzrZ8bmxB/9Ni8eGrchrJs1EN6uZAueJq+xcTG61MFFH86WgULC
	BV3dzoSmOF9BcG3k8PBqm1IE7F/w2ZSVzhpmzyVMpSHyiKJpTa7RbrD2U8AEfcNMQbWkbKOhFQKOU
	5+BoOsmKWbAVUT6XmxakZH7OUYMEfZWWFfDRk+uHfaLGdRTnk3c6FmQI9VZtgGIDOz8RnFRhovYq8
	Ear2V5t/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gf5UB-0008LL-Fw; Thu, 03 Jan 2019 16:04:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf5U8-0008Kz-MS
 for linux-amlogic@lists.infradead.org; Thu, 03 Jan 2019 16:04:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id b11so29690554wmj.1
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Jan 2019 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=WJAQvMs1Q0JN1b84t4wRcxNWwOJ+O3BW6vUmppGF/AY=;
 b=z3ZCsZrQDcEIzAIG8LechOUoUaDZcaOYNfECx4T0WAavtUc94kAfJJYdPwjczxEh/h
 1DIAb6ErTuFqm5XUtF7IQbWjG3fPD+TLo6ztlCx5059w+5aoKZjgWkh4wFBQvmLXise5
 iXO3k7bXdMFyees72jwJ8nSYG3P2PPiVvbuf/w9Z6Uss9GknXfX48BXmSiia5x+rOgRI
 vh7gWwyFgPUhfmKxocJk9l/YVoQb/QmRxHRZLkbSy3gIhb++S6sgIQrwOmSz+our9lmv
 kkv4tZPr8l/qQ4ffzlGZpj63KW2G1ak6RmTtYD9ojBWwzdLwOj8SgTKJ2O4WGr417MLV
 XVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=WJAQvMs1Q0JN1b84t4wRcxNWwOJ+O3BW6vUmppGF/AY=;
 b=W+FElu6mD6mJuPVw8sXrB1hvrSx2joojeze+I26DS9GVK59MhjsHZen7eaGjAodIXk
 kk1dTPQ6B6f/SLiof7TjMg6yrRbhOR5q8v1JGymhxXuNiDcj7Ru98NtrKtfvzoK+nH2X
 WL2G7fbZ+RndvpCIJ/4YPki9HLwfVBDsaEPrHyKfJOcbL3ipF8xocxbI6yVXq2BD0Fs3
 MWubjExsXQPJO2NvITwKOpRl6tjrfTeBG/Le8zApx+6AbWDCYl6fKn1bzzSaLZCkHCvF
 vv13OEnGSfObxFyap1yDulYa/9YCdsfgj+nUS7KyoyFyeS73oF3BaUgnF81nnxZLQ4iC
 130g==
X-Gm-Message-State: AA+aEWb/bJe1IUzDyfZT+t+Q2kYAsLORWNDi7RC9jyr8gorkt0Qe1OUa
 xuG0PyNOeJreSJKXmiclzNkLEQ==
X-Google-Smtp-Source: ALg8bN504hOREMbUdM3X7NXPDv625PjizpIF3Ff+xFy842xI6GNnXUXL8u+iQx8lGSejUlNsZWzX6w==
X-Received: by 2002:a1c:2787:: with SMTP id
 n129mr39893190wmn.128.1546531478712; 
 Thu, 03 Jan 2019 08:04:38 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:3f9a])
 by smtp.gmail.com with ESMTPSA id v1sm58979609wrw.90.2019.01.03.08.04.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jan 2019 08:04:37 -0800 (PST)
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Loys Ollivier <lollivier@baylibre.com>, devicetree@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
In-reply-to: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Date: Thu, 03 Jan 2019 17:04:35 +0100
Message-ID: <86bm4x6830.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_080440_785431_A22DA3E4 
X-CRM114-Status: GOOD (  17.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


As suggested by Neil Armstrong - this GNSS device seems to behave 
like
most generic GNSS receivers.
I'll send a v2 with a generic driver that works for both GlobalTop 
and
u-blox.

Please ignore this serie.

Thanks,

Loys

Loys Ollivier writes:

> Hello !
>
> This patch series adds a new GNSS driver for the globaltop GNSS 
> receivers.
> These receivers transmits NMEA output sequence as soon as they 
> have booted.
> Power management can be done via the main supply and optional 
> backup supply
> as defined in the device tree.
>
> The driver has been tested using a GlobalTop pa6h chipset on a 
> Libretech-cc
> board using the expansion header. Changes made in the board 
> device tree can
> be found below for reference and testing.
>
> Loys
>
> Loys Ollivier (4):
>   dt-bindings: Add vendor prefix for "GlobalTop Technology, 
>   Inc."
>   dt-bindings: gnss: add gtop binding
>   gnss: add gtop receiver type support
>   gnss: add driver for globaltop receivers
>
>  Documentation/devicetree/bindings/gnss/gtop.txt    |  33 +++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/gnss/Kconfig                               |  13 ++
>  drivers/gnss/Makefile                              |   3 +
>  drivers/gnss/core.c                                |   1 +
>  drivers/gnss/gtop.c                                | 152 
>  +++++++++++++++++++++
>  include/linux/gnss.h                               |   1 +
>  7 files changed, 204 insertions(+)
>  create mode 100644 
>  Documentation/devicetree/bindings/gnss/gtop.txt
>  create mode 100644 drivers/gnss/gtop.c
>
> ---
> diff --git 
> a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts 
> b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 90a56af967a7..3b3d4dcc47aa 100644
> --- 
> a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ 
> b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -17,6 +17,7 @@
>  
>         aliases {
>                 serial0 = &uart_AO;
> +               serial1 = &uart_A;
>                 ethernet0 = &ethmac;
>         };
>  
> @@ -269,7 +270,20 @@
>         pinctrl-names = "default";
>  };
>  
> +/* This is brought out on the UART_A_TX (8) and UART_A_RX (10) 
> pins: */
> +&uart_A {
> +       status = "okay";
> +       pinctrl-0 = <&uart_a_pins>;
> +       pinctrl-names = "default";
> +
> +       gnss {
> +               compatible = "globaltop,pa6h";
> +               v-bckp-supply = <&vcc_3v3>;
> +               vcc-supply = <&vcc_3v3>;
> +               current-speed = <9600>;
> +       };
> +};
> +
>  &usb0 {
>         status = "okay";
>  };


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

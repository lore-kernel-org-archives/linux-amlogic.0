Return-Path: <SRS0=MYl2=4W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE21C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 08:16:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4607A20716
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 08:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GD3gWcKm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uvMsy2gF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4607A20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DH19M4MH0Tm/3dSheeuYUmifWArgM4T2zSOb70PQugk=; b=GD3gWcKm13/7VPZ+pbBIgBwR04
	VAdpDowxwZ+wb+ClCayTfFVtw2g/5N80uVmZTi+QoWtoa+2IC2bXKGkv/6GUnkVAOb57nfg6YllJO
	dMj8hDGpa/ecWQ6ldYue/HAi/O1j01hNk1t6c6lKpQO1w9ciagpbKv6Wrq/nU7l6VZPCSqKMi1j9W
	6YBRXtphn2F8TEXCOYdROhs7pFcsKItEOqD7Rg1jI/0ukuXkwakaouLcqhc0bi7h3RtA5InTnEQ5R
	yj9IKR3C4Y/gAKn9ONsa8gNR9tHHQkuzLv4g3cYAsPO6bpis3UaBBQ9z72TllIJPEeO5P2dttQue1
	RGtd44cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9lfn-00031i-Pa; Thu, 05 Mar 2020 08:16:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9lfk-000315-KL
 for linux-amlogic@lists.infradead.org; Thu, 05 Mar 2020 08:16:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id j16so5840596wrt.3
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2020 00:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=59ResbYkgYYtyGS3yqL1pe7i5n25xfvpTn1SJGZoQcc=;
 b=uvMsy2gFIQJuGwPQY4jTQZfM443hyAsMpQsWvt61TsBrrNb5+brqKR7fyXH16dpcUG
 NKHn+FHej/vn1kTGDZAOiT3te05ZccNq2vpP9gefTXD4I8jUaaSMpDCA+puh6P7ugPyN
 Mq7CTRQp8ON7UQ8wyQBrxWkNHSBgn0GUrhEMx1wbzjnVma9BXBHRHMUXZ0u2P0xEa8lJ
 DaG2SUbfh2TZLAYPQNjz3QPd8SSGcSHivVrvmeFzY2wnQcFZQVrX8n1b+M7K41fDnb2V
 eqa2HBw0fdA4F/n4kWCqTVQAxYnxfMrF2BbKv5TCUD4Ge+NID+Dhpu/0B5cPIlHVEg20
 VWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=59ResbYkgYYtyGS3yqL1pe7i5n25xfvpTn1SJGZoQcc=;
 b=MiJmcH/P4BKtv4DUQ8312BkoyQnrXgKFQOPJyJY1C9tXarWCJxwr9CdcktUC6PI1I/
 tEhWpfC14vIm8LSKZOP3SFLeyixRbjlAcdHfAkvTgpxH7YrCdyFaQJGR553GvGRF4qoU
 +5obJQd6JBU/2RaPBvMYwzvC/p3AtNOq1YMf0hlZbRULSFLSLp5RVl2yRHUVAEzbPc9M
 zzgGdUL/Iyjo3oobAPrculz5hhiU3CZ1PqKVakjpmZdt4Qli0F3nyBWCIdgx1k0YsU7y
 mQuhxfjm/6bEDC76sK0K6+nVNIMO09YtoEqkOsSYHXYvvMGi3V9wWZTXZGdciSivbX5j
 aFWw==
X-Gm-Message-State: ANhLgQ3D4LxQ4TULEcV+1QHYXga8t1b3yECTO5xrowJAxK7mN5cS7MaH
 leI2OE52rvVrTr3SwC1fOdUZ3A==
X-Google-Smtp-Source: ADFU+vuuoKy23fJWsGIKanNj5vBpIUf8a+/Rb9mL+rPcSl7wR8cgvC2houSQAoG3kJh7HFjBsXemgw==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr8903620wrp.269.1583396158372; 
 Thu, 05 Mar 2020 00:15:58 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c2sm8220616wma.39.2020.03.05.00.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 00:15:57 -0800 (PST)
References: <1582991214-85209-1-git-send-email-christianshewitt@gmail.com>
 <1582991214-85209-3-git-send-email-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: meson-g12a-tanix-tx5max: add initial
 device tree
In-reply-to: <1582991214-85209-3-git-send-email-christianshewitt@gmail.com>
Date: Thu, 05 Mar 2020 09:15:56 +0100
Message-ID: <1jh7z3cj43.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_001600_807170_A0E7A35C 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 29 Feb 2020 at 16:46, Christian Hewitt <christianshewitt@gmail.com> wrote:

> The Oranth Tanix TX5 Max is based on the Amlogic U200 reference design
> using the S905X2 chipset. Hardware specification:
>
> - 4GB LPDDR4 RAM
> - 32GB eMMC storage
> - 10/100/1000 Base-T Ethernet using External RGMII PHY
> - 802.11 a/b/g/b/ac + BT 4.1 sdio wireless
> - HDMI 2.0 (4k@60p) video
> - Composite video + 2-channel audio output on 3.5mm jack
> - S/PDIF audio output
> - 1x USB 3.0
> - 1x USB 2.0
> - 1x micro SD card slot
>
> The device tree is based on the higher-spec X96 Max box device.

Would you mind pointing out the differences ?
Maybe I missed something, but do we really this dts ?
Can't this device directly use the x96 dt, or the u200 ?

All these boards, for which we don't have any documentation, add up 

>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>  .../boot/dts/amlogic/meson-g12a-tanix-tx5max.dts   | 481 +++++++++++++++++++++
>  2 files changed, 482 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-tanix-tx5max.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index eef0045..a1db803 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-tanix-tx5max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-tanix-tx5max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-tanix-tx5max.dts
> new file mode 100644
> index 0000000..c3ef0ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-tanix-tx5max.dts
> @@ -0,0 +1,481 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 BayLibre SAS. All rights reserved.
> + */
> +
> +/dts-v1/;

[...]

> +&spdifout_b {
> +	status = "okay";
> +};

Why do you need this ?
This producer is dedicated to HDMI controller which does not support it
ATM. Also it is not even used in your sound card

Same goes for the x96 BTW.

> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

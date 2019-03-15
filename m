Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4A9C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4580E218A1
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYp34O4M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XTsdu9Rv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4580E218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B26eP3pCyQbVdTkPNjHNa202re1e4ITYG/aWS/Xw04E=; b=jYp34O4MfJvAh/
	l3UUcoqiZfJS/Qk/JJBn6d510oGJkd85LDbCnaJBPPrqe1AziwPnj+95FRoCPpa2vsGHsdsE+9Jz2
	9nG60L4GnZBJeFbeYW0KmTRDxTQWV48mt4NNevsOiB6u5fN99qKbbW2/NUCQYX/5lDbGptHciAVtG
	kyNrLHrCXN7Xvh3vcj9UaDl9dBh6TSATS7Jxsw0z3f9eSekFWjVs3YCcj6y46Gfulvwj2gW72t0p2
	m7+pGo6P7sdh0aplGQOgn4s+zF6lJ2Y0idD4NxGZzrtvqFtTAl0YRaAOosggDocf+rShqCOP6VryU
	teBkK1lb3bpODh53mshw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4uQv-00039r-ML; Fri, 15 Mar 2019 21:32:05 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uQr-00039O-Sr; Fri, 15 Mar 2019 21:32:03 +0000
Received: by mail-oi1-x241.google.com with SMTP id v84so2161621oif.4;
 Fri, 15 Mar 2019 14:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgIyXXh0AbPxY3aqPaHCt/0y+Ix/xUe/YJtc3n1dDQs=;
 b=XTsdu9RvM2RAhiwntyzJcgc44qeM1gIaAHFAkuneiln53cE0T5u/BCaxlDoDoVza2x
 FyUwhM++1HORaxYPgLePdpnJI8ZYH1tIHzBNI/y1LJBFT8rQKbvqJKJGb7YqbBxOdQgH
 dhBx/3D5Tq4Mn3Im+473oPLHsWxuiJ6ia++y3RpTp0YfpELry0qq29d3PvzLWJ9zGb/s
 8HYy8TsIC3/ENzF7TO7ImxEMFSD3IKN5fd2KydNT9XrTUfycNOCGXV2o5m18vKvIkqry
 jUPZJXZjsENjRHMGAYUCLkpdybSu1hFwgBp75oB0lVcIBM3dhBs2Y/e7H6EzHX4F0bLo
 EZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgIyXXh0AbPxY3aqPaHCt/0y+Ix/xUe/YJtc3n1dDQs=;
 b=mXjF1h7j5jq4zE6yatOGaSHf4hwlRiB8ghEpyKLKP5oF4YBryEYi6ewlkzNs91vpsk
 W8IoBfpZRch0PmCvvRWjg1HgC7bVJgCHF+GF93Lt+y7uTBlKpRGsS/es1syz8AwsYeel
 Y++fHQ99wdUDwB8T7e+ilj5bDkNqOD2ovYhscEdPKHzCPTNwwi99nDKLCIRnIfy6rNAT
 aLNs6XQjv/xrnA0NWbdF9hInbrQ61n67iEYFkRNbajEWSZtMrWr7DSSwbXV1OWqEGAPO
 PdR+vYNvkcfpumSz4SzKknZCWSqM6QJDjJmDDpr4wchB3RmHm0Jx5kto9pMYoq5WSVyu
 4TMA==
X-Gm-Message-State: APjAAAVCezrDFubHZ/nFrv8ulRCnshgP+Y65f8jOZi8Rkqc+U3ozpqlw
 GurxYdLKexMM4dCIxPXClkyDFrh9Z9q08h2hTXI=
X-Google-Smtp-Source: APXvYqyszEfJBHzwK5qe8qdz20ry7K2TkwgSFK5kthzvHiXd8RYAQKAjxJAUf+63RHKgwze5mJfojjuwCZreXBOBhTs=
X-Received: by 2002:aca:4808:: with SMTP id v8mr2936092oia.129.1552685520745; 
 Fri, 15 Mar 2019 14:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-6-narmstrong@baylibre.com>
In-Reply-To: <20190307151342.7381-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:31:49 +0100
Message-ID: <CAFBinCBt290Qabw98SpiON3xG0ihMEDNzwDDTrBo6QYbA5QjMQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: meson: g12a: add reset controller
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_143201_957275_EBA41340 
X-CRM114-Status: GOOD (  15.80  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil and Jerome,

On Thu, Mar 7, 2019 at 4:14 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Jerome Brunet <jbrunet@baylibre.com>
>
> Add the reset controller device of g12a SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index f8f055c49f9a..2a700bb45d04 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -245,6 +245,13 @@
>                         #size-cells = <2>;
>                         ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
>
> +                       reset: reset-controller@1004 {
> +                               compatible = "amlogic,meson-g12a-reset",
> +                                            "amlogic,meson-axg-reset";
> +                               reg = <0x0 0x1004 0x0 0x9c>;
> +                               #reset-cells = <1>;
> +                       };
I tried to compare this with what is publicly available in
buildroot_openlinux_kernel_4.9_fbdev_20180706 - unfortunately this is
harder than I thought:
the buildroot kernel doesn't define the reset controller in mesong12a.dtsi

so I tried to follow the code in the HDMITX driver instead:
kernel/aml-4.9/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_txlx.c
uses P_RESET0_REGISTER and P_RESET2_REGISTER
these are defined in
kernel/aml-4.9/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/txlx_reg.h
using:
> #define RESET_CBUS_REG_IDX 5
> #define BASE_REG_OFFSET 24
> #define RESET_CBUS_REG_ADDR(reg) \
>    ((RESET_CBUS_REG_IDX << BASE_REG_OFFSET) + (reg << 2))
>
> #define RESET0_REGISTER 0x01
> #define P_RESET0_REGISTER RESET_CBUS_REG_ADDR(RESET0_REGISTER)

when I do the maths:
(5 << 24) + (0x01 << 2) = 0x5000004

The GX SoCs have the reset controller at cbus + 0x4404
however, the offset may have changed in G12A because the SAR ADC
offset also changed (just one example).

Do you have any hint how to verify the CBUS offset (0x1004) of the
reset controller?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

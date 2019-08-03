Return-Path: <SRS0=lQ9R=V7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D9EC31E40
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 17:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC64020679
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 17:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E3k28Q0p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AqJbCsXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC64020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7gxLd/QFxivhvEh9ra9oVl92w7pTdiqCcIRW9a5EAU=; b=E3k28Q0p/5EWPJ
	I7+zw0kakjWS4d1w2aOaPrip9C6kTPuDkCnVSzD+FgEOzD+WCF/h7T5orVBDcCI1IhoPjtf2tG9Ac
	/hQWT0w92AKRYg6hcH+rWaAz0bLGfFxOdWDfYf3Ym3TrYwCaj3G9Tl+HhB0sbwku2CmaDZ76S9mvy
	clfZzIRFbfta8hqcZHiEN46T2lPKSgnITlilF0HB6OBAXzO0X+70xEdjyubtB0fUq35kYWdzkua8e
	XN59yskuCOoEOXbhtBca6IWpcT5EBTegArpXo3plOhZgOmokfWQnBX/iOyBSSY6d+YHOfdwzTd6fc
	BqwXJ20kiEfhPoTSoXBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htyCw-0001dx-G1; Sat, 03 Aug 2019 17:52:42 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htyCt-0001dS-O0; Sat, 03 Aug 2019 17:52:41 +0000
Received: by mail-oi1-x241.google.com with SMTP id m206so59248084oib.12;
 Sat, 03 Aug 2019 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=giFFxAwzHVZcTDv5cDCIurtf5E8rD1w0AM4tyzYzsnQ=;
 b=AqJbCsXDWob/b1bzOngByMcRxPfvkbkLz4G34Vbw2MZRlyroyApUC5Yw87zvK1Fur+
 ApIUWtaYUtyP4jsJhLc+gdiuuNvpHs9jHIzxCAp91ZlfGebQMuEfPKgOhEWoSqbDqinM
 3YB973dJ2gsupR7H4uAehDFoKZ1fLBkDf88snzFgsNMMy7LP8S6V1Su/qea2eX6LY5Bt
 Mc6LCYXIshNWNXUKtet/Mh2yuJdoqwCUDVkt+1FRiqqMLXrb6YtQA9OZYz3dM3MX/M9n
 vQ3zQo6Y/m6jnWotG6iMVH6ooG0O9XcBCoDO1up9zhMyWlMXB4Fb3B3GP4rc4bjb0ox3
 3rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giFFxAwzHVZcTDv5cDCIurtf5E8rD1w0AM4tyzYzsnQ=;
 b=KljNesDh7+vyGn6bzUJNIBy7FhJ7eDwJ3w4Noc7BDO4Ufu//esKTbpD78evQOjlGqE
 KLr9GQaF4F6aD5wyzYevXYqBpwmDPQb82abjBiU6b7Da6TAMoLHewky3UBsJkPPg3nUl
 f0XfquawOAzOprGEDsREVVyY4svRrWYGG9QzXkqkGVLXG3ghr6qcxkpIZuDxh3jUSQUq
 0cUR7r7KMHQfHt4CaaXiVgXJk9mkD2zRKzZtZ3IvcM2lz/ZKemvA4IeJbEsl013BYF6k
 +HHhfsiUu53brhiQhkBpBfvWROs66owjtBZJ1mrFI/y/wGTwTgzMWLG2Jodfjgd2pj76
 9sGw==
X-Gm-Message-State: APjAAAUlkDyNpY2HW+nHUPZ5VItgUbk6o+TbZaSO4R6Qcv6DgHqCbdKZ
 FMq9wVibvXsAJOog3Ze3PEsODyAAjh9lhTSJPGA=
X-Google-Smtp-Source: APXvYqxqdM5pIwO1f3rZx14fWOmsfcgj0wzLh+wItwhmdI2TFmrHh+uLmQVwCG+sWXsST/bisXbSaeQf/oOwXtq+xYQ=
X-Received: by 2002:a05:6808:3d6:: with SMTP id
 o22mr6383634oie.140.1564854757760; 
 Sat, 03 Aug 2019 10:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-4-glaroque@baylibre.com>
In-Reply-To: <20190731153529.30159-4-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 3 Aug 2019 19:52:26 +0200
Message-ID: <CAFBinCBYPiLgmTNk+7Db3EPSPePwbnAshCbomYPXWdse8i0oJw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: amlogic: g12: add temperature sensor
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190803_105239_807740_BB4A7C46 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add cpu and ddr temperature sensors for G12 Socs
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
with the nit-pick below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 06e186ca41e3..7f862a3490fb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1353,6 +1353,28 @@
>                                 };
>                         };
>
> +                       cpu_temp: temperature-sensor@34800 {
> +                               compatible = "amlogic,g12-cpu-thermal",
> +                                            "amlogic,g12-thermal";
> +                               reg = <0x0 0x34800 0x0 0x50>;
> +                               interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&clkc CLKID_TS>;
> +                               status = "okay";
I believe nodes are enabled automatically if they don't have a status property

> +                               #thermal-sensor-cells = <0>;
> +                               amlogic,ao-secure = <&sec_AO>;
> +                       };
> +
> +                       ddr_temp: temperature-sensor@34c00 {
> +                               compatible = "amlogic,g12-ddr-thermal",
> +                                            "amlogic,g12-thermal";
> +                               reg = <0x0 0x34c00 0x0 0x50>;
> +                               interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&clkc CLKID_TS>;
> +                               status = "okay";
same here


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

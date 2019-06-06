Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CCAC04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:17:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007B720872
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wo+KEH28";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MlguHHFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007B720872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1F36faAZMNfzMRcyY7tJkPoFVkX1WuHwuN+fK8oXEs=; b=Wo+KEH28gQhdGT
	b/q08gT5f1zHJuCTC6N+1+FkdzDDq/R281r0wPWxcsdwTRdhdK0lRmfE+32rDiLU77eZF7iu21Bbu
	/e6EEeHfLUYRX27lONqJCom25g/Zk67AT+Ar/tV74VRVXBK6+yy9IEvIn/FXVLLt494A4DPr8J+e4
	IZ16nPO5AXBzN2ZZyzpsPm5ko4U/DIrSDHIdOhV4X6usVnmDErrttIQh7wAMswOhd3ObIWJODXuXo
	JIheDUx0nnFHCLSZW40l0qOSEZPqIyUC/GvTX5pxbE1GEOatl7aGvwiJXmE46dFXn3XhVtcmvwHEJ
	IEqdxhxBh2P25HeaEhEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxsg-0007pu-2U; Thu, 06 Jun 2019 19:16:58 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYxsY-0007iy-Bh; Thu, 06 Jun 2019 19:16:51 +0000
Received: by mail-oi1-x244.google.com with SMTP id 203so2376033oid.13;
 Thu, 06 Jun 2019 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGZZja4pj4ztNwQ9lR3/UUwJOv78Qh9P9Xjpyh0RQ78=;
 b=MlguHHFVeVF5g8EuutoY2+4e4/Pw0Jksvx2WO+YX4EXH/vrWpw8vSrRkHDsQ5pCprF
 VOOrYSbElvFQPDJ1pyFaOT1ZJsULnLmMJqy1IsxnVZdQ2TX7jIHv0e0ss70lh5ntGrCr
 9h5SGrKKopTt92DtlXKrgLixrRZN3HTlEp/DsazX5SMtFLNu/HDahe78SQy0E27BH+bd
 RxBmkb4hwXMColZk5JNlqwaiHmrUdxk+iPbBcJNiYM0JuHJkuGRnqrkSb2EDhX3CPXFR
 5vgsiGzCykpZt901hiOso3ha0jcf1ibamJ27d0TLyi7mkiDkAOrclJVHjLg6ZD6sw/qp
 a+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGZZja4pj4ztNwQ9lR3/UUwJOv78Qh9P9Xjpyh0RQ78=;
 b=RpO1CVgOTtJCrAvIgqL6TzIpOFdzrHzx5D4jVE6BaQTJffKKGCacXLQvdWiToxFuyX
 UadaJyCb7j8UBjMrCDuLEKE0qj9ie3Ll4zt6Q7wFyXIgEXDn66nnGAStknWg6w8KeqTZ
 Vo7nyV9DZXkvLBHwwVkr1LJvGv6oGtSNkdDMG6HK3oQNeoJIdV9pDiemQ7oa+z955ddU
 QvDsjMZ+IfdsYpn5yC3rNoyG3AH1toLDuSSTcV2/BAjTWLTXsDIFx/C+OhtxX3iv6dI+
 1X47QX+ToWuipfDD/I/TTAFeOOdXe0WP5f8wM3IDs8adfxQ0MsNFFYwADKfP/z3sQs07
 p4/g==
X-Gm-Message-State: APjAAAVxfC7aSMiImvTxyYK5+4g1FsymSpj0VnCCP9ZdZzSwJwucvyVq
 S45L13iyaA4QaRSGCKT0rdr3k7bjhdhTFv1a5GY=
X-Google-Smtp-Source: APXvYqzC9WxN3NamhIGFHT81BAmrC45+rcidscjDt+KRt+ASEEUVD3u5cHxp97h+S4hAPTzsUEsNS5LmM87cdCqMsVQ=
X-Received: by 2002:aca:3545:: with SMTP id c66mr1176682oia.129.1559848608679; 
 Thu, 06 Jun 2019 12:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190604144714.2009-1-glaroque@baylibre.com>
 <20190604144714.2009-2-glaroque@baylibre.com>
In-Reply-To: <20190604144714.2009-2-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:16:37 +0200
Message-ID: <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: dt-bindings: add the Amlogic Meson
 Temperature Sensor
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_121650_426431_4FFDF391 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, jic23@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

thank you for working on this!

On Tue, Jun 4, 2019 at 4:47 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> This adds the devicetree binding documentation for the Temperature
> Sensor found in the Amlogic Meson G12 SoCs.
> Currently only the G12A SoCs are supported.
so G12B is not supported (yet)?

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../iio/temperature/amlogic,meson-tsensor.txt | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> new file mode 100644
> index 000000000000..d064db0e9cac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> @@ -0,0 +1,31 @@
> +* Amlogic Meson Temperature Sensor
> +
> +Required properties:
> +- compatible:  depending on the SoC and the position of the sensor,
> +               this should be one of:
> +               - "amlogic,meson-g12a-cpu-tsensor" for the CPU G12A SoC sensor
> +               - "amlogic,meson-g12a-ddr-tsensor" for the DDR G12A SoC sensor
> +               followed by the common :
> +               - "amlogic,meson-g12a-tsensor" for G12A SoC family
> +- reg:         the physical base address and length of the registers
> +- interrupts:  the interrupt indicating end of sampling
> +- clocks:      phandle identifier for the reference clock of temperature sensor
> +- #io-channel-cells: must be 1, see ../iio-bindings.txt
have you considered using the thermal framework [0] instead of the iio
framework (see below)?

> +- amlogic,ao-secure: phandle to the ao-secure syscon
the driver has some "u_efuse_off" access. do we need to get some
calibration values from the AO syscon or can we also fetch it from the
eFuse? you can look at arch/arm/boot/dts/meson8.dtsi where I'm passing
the temperature sensor calibration data to the SAR ADC (there's no
dedicated temperature sensor IP block prior to G12A) while reading the
data from the eFuse

> +Optional properties:
> +- amlogic,critical-temperature: temperature value in milli degrees Celsius
> +       to set automatic reboot on too high temperature
as far as I can tell the thermal framework supports multiple trip
points. I'm seeing this as a benefit because the hardware can raise
interrupts at four different temperatures (defined by the driver)

> +Example:
> +       cpu_temp: temperature-sensor@ff634800 {
> +               compatible = "amlogic,meson-g12a-cpu-tsensor",
> +                            "amlogic,meson-g12a-tsensor";
> +               reg = <0x0 0xff634800 0x0 0x50>;
> +               interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&clkc CLKID_TS>;
> +               status = "okay";
as far as I know the dt-bindings should not have a status property in
the examples


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFF5C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 13:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A57216C4
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 13:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DsJAbJqC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR8O4kq3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A57216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGbR+B+Yg7dbkN8TGDrgofuA49nCpOJuQmspZb+T1ms=; b=DsJAbJqCbBUn6z
	fe8ubkGccStoj7C5obqAsJaMgSzeRgO6z1wQc0VASY//6e/ynWXUQsrv8TqE3CEb5EMEEAiGUGrNH
	Eqder1WKxiUlvFeX37kNaSpuBPqQQzFJ9G+bB7GmW2Gl6SA/+sOeu2g8Miu/idbJD+S/tpxB8XE9t
	DbMANsJVJOwRRNja8dXh2v+HjJkJb6Ww+8et56QSTAVHMvNub4viUq7L0WTjyfnYW2YT8ChL855lW
	lpkJi+CCEAdGMfpBE8pgds6ZUDurmaQSwNt0d1HLLfNwgQu8LtIxyoTligqaSXSzFQr9v6AY4nqkU
	CHVdGxw2Qf6uL6Zm0scw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZb7S-0005dA-Ew; Sat, 08 Jun 2019 13:10:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZb7Q-0005ce-0Y; Sat, 08 Jun 2019 13:10:49 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33622214D8;
 Sat,  8 Jun 2019 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559999447;
 bh=SH5hTI5c11OAq8te0ktGV7fuTcM1q8eDJlQcLervdqI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BR8O4kq34VZ4Ba7wqJ4OcPbhW9IvCm/fQ6ec14jvja6VdJGsxlHXSIxtg3Bts+cjk
 Xg2tw3F5wVxSchVgxhgoDpwwC5wy5lguwUoJ7kNcMdP0iUp+eKU05LW7jUAnf8hMsp
 G7HtMkUEv4kPprhb+fWPWY7oF0oKlLgrYvn/XcMQ=
Date: Sat, 8 Jun 2019 14:10:43 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] Documentation: dt-bindings: add the Amlogic Meson
 Temperature Sensor
Message-ID: <20190608141043.6c7d332e@archlinux>
In-Reply-To: <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com>
References: <20190604144714.2009-1-glaroque@baylibre.com>
 <20190604144714.2009-2-glaroque@baylibre.com>
 <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_061048_089006_5C730C55 
X-CRM114-Status: GOOD (  24.60  )
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
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 6 Jun 2019 21:16:37 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Guillaume,
> 
> thank you for working on this!
On comment from me inline.

Thanks,

Jonathan

> 
> On Tue, Jun 4, 2019 at 4:47 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
> >
> > This adds the devicetree binding documentation for the Temperature
> > Sensor found in the Amlogic Meson G12 SoCs.
> > Currently only the G12A SoCs are supported.  
> so G12B is not supported (yet)?
> 
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > ---
> >  .../iio/temperature/amlogic,meson-tsensor.txt | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >
> > diff --git a/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> > new file mode 100644
> > index 000000000000..d064db0e9cac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> > @@ -0,0 +1,31 @@
> > +* Amlogic Meson Temperature Sensor
> > +
> > +Required properties:
> > +- compatible:  depending on the SoC and the position of the sensor,
> > +               this should be one of:
> > +               - "amlogic,meson-g12a-cpu-tsensor" for the CPU G12A SoC sensor
> > +               - "amlogic,meson-g12a-ddr-tsensor" for the DDR G12A SoC sensor
> > +               followed by the common :
> > +               - "amlogic,meson-g12a-tsensor" for G12A SoC family
> > +- reg:         the physical base address and length of the registers
> > +- interrupts:  the interrupt indicating end of sampling
> > +- clocks:      phandle identifier for the reference clock of temperature sensor
> > +- #io-channel-cells: must be 1, see ../iio-bindings.txt  
> have you considered using the thermal framework [0] instead of the iio
> framework (see below)?
I had the same thought.  Right now, this doesn't look generic enough
for IIO to make that much sense.

I'll review anyway as may give some useful pointers even if you do move
it over to thermal.

> 
> > +- amlogic,ao-secure: phandle to the ao-secure syscon  
> the driver has some "u_efuse_off" access. do we need to get some
> calibration values from the AO syscon or can we also fetch it from the
> eFuse? you can look at arch/arm/boot/dts/meson8.dtsi where I'm passing
> the temperature sensor calibration data to the SAR ADC (there's no
> dedicated temperature sensor IP block prior to G12A) while reading the
> data from the eFuse
> 
> > +Optional properties:
> > +- amlogic,critical-temperature: temperature value in milli degrees Celsius
> > +       to set automatic reboot on too high temperature  
> as far as I can tell the thermal framework supports multiple trip
> points. I'm seeing this as a benefit because the hardware can raise
> interrupts at four different temperatures (defined by the driver)
> 
> > +Example:
> > +       cpu_temp: temperature-sensor@ff634800 {
> > +               compatible = "amlogic,meson-g12a-cpu-tsensor",
> > +                            "amlogic,meson-g12a-tsensor";
> > +               reg = <0x0 0xff634800 0x0 0x50>;
> > +               interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
> > +               clocks = <&clkc CLKID_TS>;
> > +               status = "okay";  
> as far as I know the dt-bindings should not have a status property in
> the examples
> 
> 
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

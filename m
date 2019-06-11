Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4444C4321A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 17:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACE7720896
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 17:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BxeCNQMt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="P1UKhIYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACE7720896
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybk6ZFMriugvCZx3FlU3IBzLJBHDm0fKGIoGdnjrwqw=; b=BxeCNQMtZu7WTJ
	zVszpq3vI9Zb7JZMk7dB0Egi6CBVhdq5cvPoQnJXFok9aEJl5y43xAHrbxNX/G3GsDyX33+QnEg26
	2h0SKmpoSwQFGSSqk1DZZuAg7f0r1PKXTJjQ96eMsh2MUXJnq7AcSCEj29sX5c6blKvMWtZIjhvqH
	20Mccqkcn2Yplu1IIx4QiQmYHCos/eoWoxRdJ3tThGZeBvSavAk7CrRyF5SU7TcbasKJC7flMy22I
	bA9U8hPr/QOAqP+u05eQSh82iYKqbdQzegnB1ym2ic7lKsNW+HQfDaBimsr8wZnLIL65ZtFR7XwvM
	qkiNd7anGvvqnv73V8vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hal2E-0006Uw-Ne; Tue, 11 Jun 2019 17:58:14 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hal2C-0006UW-E1; Tue, 11 Jun 2019 17:58:13 +0000
Received: by mail-ot1-x344.google.com with SMTP id z23so12754769ote.13;
 Tue, 11 Jun 2019 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCk8yXyDlU45xhcdQhx1a6hD5bkWPN082lBz8bnOkUY=;
 b=P1UKhIYgxM+XqSIsgTb87emPKNlNd6xALypb/TZzyRb+jBUnC8i5Nd+y9bqj8zezw1
 PVLkE5srBChxTYeKSTiG/xzCtE2O39FMElMr++lFqkDifYYzZHHXxNVa6ZAUbKOpMyhe
 u6PlXZNboq4L0jgn7AkxtSd28W736ruhkywHshY+jyCzZvIMs1O56l0gflaBZ7UqhwQL
 x2RQMfu1NCl93I1mh4SAyT5fO5WxjcRqNVi6NdN2yKWoaWkd3acM80QLStmQWoTnX1v5
 7M1JBXsMpTxCe4p9R78MjJh5v33YPLvhehDsyfHgqx7cuL09xlhmcldE4dAYPb/FmdZm
 6TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCk8yXyDlU45xhcdQhx1a6hD5bkWPN082lBz8bnOkUY=;
 b=OAXK36m3kBeR4/HkQbkMxcboBP0RUNUqj2Tb/9bfNH3Ow6ugC8MfvRI4iWT9oFHaYa
 Iy76zd6Ai1MXKhMWVMEHvQJFEn5pJXqUdpzV1ljoh1YVvF+E3eKDBYIruxoUFqCRLuoh
 EM2DjRUtPCqJMDC12k7oDEcVwaBYOUbLECKdkhQsBwsXtLNPmnIt6qiQ8yFM6lXps9eE
 afmDME303jfDD3lZWTi8u3M5xIYPNhvgFIQBNFBOcLQ9kQeicl2C8qh0WPi873WDWdKs
 Ro4vt1pyLFLkZbiP5HAckR4K4ed2h3JkksJM8bj+AQ9IJTkb2st2ZWnWCauHFTlWHScF
 mMGQ==
X-Gm-Message-State: APjAAAVXeSHofPLiF8IJdDCzoKJ/VWHXa2bmwWjG3mcfnBaghwnAU8hk
 BktHXKIjd7iV3/nP0wRps6PHif4Xu58ZRqTWCUU=
X-Google-Smtp-Source: APXvYqzoPj3Xa4uMgvBC9zsIyKzC4P0HF+b5cZAVaQucBLGJZkMH7tOH6JRC+xDDYFPIUVm3dwteObyR0yuyPX59K5A=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr36257313otb.81.1560275890132; 
 Tue, 11 Jun 2019 10:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190604144714.2009-1-glaroque@baylibre.com>
 <20190604144714.2009-2-glaroque@baylibre.com>
 <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com>
 <d68aae23-f877-1f65-94a4-79e909ae111a@baylibre.com>
In-Reply-To: <d68aae23-f877-1f65-94a4-79e909ae111a@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Jun 2019 19:57:59 +0200
Message-ID: <CAFBinCBCUxZjnrRxFHApp4iwPUCQQ+PU54V6zJew8Sr8La3u7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: dt-bindings: add the Amlogic Meson
 Temperature Sensor
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_105812_499119_1DA0D9EB 
X-CRM114-Status: GOOD (  22.42  )
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
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Jun 11, 2019 at 1:01 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 06/06/2019 21:16, Martin Blumenstingl wrote:
> > Hi Guillaume,
> >
> > thank you for working on this!
> >
> > On Tue, Jun 4, 2019 at 4:47 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
> >>
> >> This adds the devicetree binding documentation for the Temperature
> >> Sensor found in the Amlogic Meson G12 SoCs.
> >> Currently only the G12A SoCs are supported.
> > so G12B is not supported (yet)?
>
> G12B is 95% similar as G12A, it will certainly use slighly different values.
OK, thank you for clarifying this
as far as I can tell Guillaume's code is already prepared for that (as
there's a per-instance specific struct with settings for the specific
instance) which is good to know

> >
> >> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> >> ---
> >>  .../iio/temperature/amlogic,meson-tsensor.txt | 31 +++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >> new file mode 100644
> >> index 000000000000..d064db0e9cac
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >> @@ -0,0 +1,31 @@
> >> +* Amlogic Meson Temperature Sensor
> >> +
> >> +Required properties:
> >> +- compatible:  depending on the SoC and the position of the sensor,
> >> +               this should be one of:
> >> +               - "amlogic,meson-g12a-cpu-tsensor" for the CPU G12A SoC sensor
> >> +               - "amlogic,meson-g12a-ddr-tsensor" for the DDR G12A SoC sensor
> >> +               followed by the common :
> >> +               - "amlogic,meson-g12a-tsensor" for G12A SoC family
> >> +- reg:         the physical base address and length of the registers
> >> +- interrupts:  the interrupt indicating end of sampling
> >> +- clocks:      phandle identifier for the reference clock of temperature sensor
> >> +- #io-channel-cells: must be 1, see ../iio-bindings.txt
> > have you considered using the thermal framework [0] instead of the iio
> > framework (see below)?
>
> Question: why thermal, and not hwmon ? what's the main difference ?
this is what came to my mind why the thermal framework fits best (at
least based on my current knowledge):
a) the thermal-zones (see meson-gxm-khadas-vim2.dts for example) a
"thermal-sensors" property. so for active (with a fan) or passive (by
limiting the maximum frequency and thus the supply voltage) cooling we
need a thermal device anyways
b) the thermal bindings support multiple trip points. we can map them
to one of the four interrupts which the IP block can generate
c) defining a temperature where the chip will power off sounds like a
use-case which may be implemented by other thermal IP blocks (in other
words: maybe the thermal frameworks provides some generic property to
replace the "amlogic,critical-temperature" property)
d) as far as I know you can tell the thermal framework to create a
hwmon device with only a couple (5?) lines of code

as Guillaume has already shown we can implement c) with a custom
property, but that's not limited to the underlying framework (IIO,
hwmon, thermal, ...)

use-case d) is not a strong one because I'm using iio-hwmon to create
a hwmon device on the 32-bit SoCs.
however, together with case a) using an IIO driver is going to be more
difficult because currently there's "only" a "generic-adc-thermal"
binding (but not a "generic-iio-temperature-thermal" binding)

the initial driver version doesn't have to support everything I listed above.
however, I believe with the thermal framework we don't limit ourselves
to one use-case and can extend the driver in the future


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

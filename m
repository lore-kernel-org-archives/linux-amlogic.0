Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A205ECE58C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 15:54:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F047720679
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 15:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GXv5NWJ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIm5xSbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F047720679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSldB8hXrJqfEA1pX0Wng0t/MNbD9WGgkl9TomE0Wf8=; b=GXv5NWJ2owgnyS
	WZKnfzd3lsITmDLMxajryBxzx4TYh/6Rfwr1vfWYhtTzdAO3hcWKTvAn9E+gHkVMLLYvQmeykDO0L
	DnKf2O1ITk6u9l0onBCbEDJa9Zg3Glh18oyihDFTscFE3IRH5lXPKj88I2gdmvleR1hzcEmW+eAcT
	iEbFmP68gogTGWf+PpuFMTvdT9EvOgTdASYEa2bl5tir/i76SO9c4ABapH8LLaj3w35oW00QGqo+g
	/Xso3CecOKz9mNynoBkeP0TcQZPqy6bpYvujCWAgIPAUmzyCnr4+e1scOSv9oGW0gfcNJsjWBUiPM
	96HmwXLyItu7tFsxcdMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHVKv-000894-Rs; Mon, 07 Oct 2019 15:54:13 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHVKo-00081A-FP; Mon, 07 Oct 2019 15:54:07 +0000
Received: by mail-io1-xd44.google.com with SMTP id q1so29760550ion.1;
 Mon, 07 Oct 2019 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oOKcZv1B2M+ysN8LJmTMwi1RT7cbsvdwnRry27TboAA=;
 b=GIm5xSbRI50sJepzUbwycg7NDvMt3BT+3RYQ1Ak3PHk03MA/wlw9SqTNGY2DfIZkI3
 vzloLLiQdo1Im+2BoTX2drQ9SytWBxd+eHhHN+oxkN83GrWLEW2lR8fnp2/7fI3yPVJk
 ZxOm4F1VeDXgpPbLMuAjDt3XlVRxikDPzHve8KYJuOw5hyLbMGGgxDCmn4YkVI3ivd7q
 +qC9HjO+buQM/o2qZs44GNytFS6dr+QBe4nE9YfUXJ9tYuB3aUliVkTo2PYIw168NusB
 jYzgE62kDvg5lylYW9+xxyGY9aRNG6dfE/sjjE4tsJNb9Fkc+4mHngnT1fhm2fIWSs2U
 RT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOKcZv1B2M+ysN8LJmTMwi1RT7cbsvdwnRry27TboAA=;
 b=TjPmXVGuCV3Pz3VNEwdWCwyG3j1rE3uI0ekSqfcSCpNWnwvXHlE0mmbCx2DKCYmtBB
 8SQJnSII2n/o0EMDX2aoUkzkk1Q2i80Q8fz85Nupr7rqRFgabydWP9/dIq+mgrKTd08B
 LOSMjZ4Az4HavbPA3ZtegbiEe4tp2738zvJFatLOXfsZ35B6doPqDuOT+wvZceH2hna3
 OZPAyzL71Xg16xOO2/A576l4nW9UHhxji7na1ntCZdbrFBO5YjJWtjKUv9vT+/pDMveW
 bBByR3Nrz3Q3oSY8EyqsEJ3Fa043yAooEM60jAL0DA3rJ3JfxdmwBrAT0XZHuDbEpoLw
 HySA==
X-Gm-Message-State: APjAAAUNrX4kxq4XIouN/1SiHtx94sLMMX5qPVBuT7N2Eliy6RLn0iXz
 Gi3HaNxAL2yDAVzDNzEv/I3O6eWFION/zjynWBc=
X-Google-Smtp-Source: APXvYqw9T09ClSC4idvRRaaJZz/xKErgE5SB3WxVYBhzuMFYdqY2HrLZiaXgYCS9faKiSyduxgwe6sfmi9HXu2ybLSY=
X-Received: by 2002:a02:c983:: with SMTP id b3mr27831643jap.120.1570463645906; 
 Mon, 07 Oct 2019 08:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-4-linux.amoon@gmail.com>
 <b73a1302-90ae-f1db-ff43-84d56ca4ba39@baylibre.com>
In-Reply-To: <b73a1302-90ae-f1db-ff43-84d56ca4ba39@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Oct 2019 21:23:53 +0530
Message-ID: <CANAwSgQjKRAKV2wycZ7QFq1CS5jr_ABgvFb+pGMHWTxgFR8wPQ@mail.gmail.com>
Subject: Re: [RFCv1 3/5] arm64: dts: meson: Add missing regulator linked to
 VDDAO_3V3 regulator to FLASH_VDD
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_085406_519004_67607AD7 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-amlogic@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 7 Oct 2019 at 19:51, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 07/10/2019 15:16, Anand Moon wrote:
> > As per schematics add missing VDDAO_3V3 power supply to FLASH_VDD
> > regulator. Also add TFLASH_VDD_EN signal name to gpio pin.
> >
> > Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 66262a6ab3fe..6bd23a1e7e1d 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -51,9 +51,12 @@
> >               regulator-min-microvolt = <3300000>;
> >               regulator-max-microvolt = <3300000>;
> >
> > +             /* TFLASH_VDD_EN */
> >               gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >               regulator-always-on;
> > +             /* U18 FC8731-09VF05NRR */
> > +             vin-supply = <&vddao_3v3>;
> >       };
> >
> >       tf_io: gpio-regulator-tf_io {
> >
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

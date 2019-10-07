Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CDDC47404
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 15:55:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53602070B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 15:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPW20QOf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ckvqu/Vo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53602070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ab7lj9sGWVsPOje3gl4uV+tzHfJfJuWbR+NRAeeXAss=; b=cPW20QOfD4Pfc0
	aVrEjc9GFgSHWyT6yfC+3GlPAs3yIhEXyvSeXEKwA0hDnCSiae4llkfnruEOCeDW3wd3C6VWsEsKL
	F3cAazhRqlls007Gt+cUthQMfGJQCmom3WfmssHxayMWLaJ+qUm51tEoJtI079SkP1S4WcJ6gD2WL
	2A96Gr8n+NEHCKiYeaE6HKcFFP7LxP3M1TQLMfKies3v1/9RJ8sMInIT1C1+Dr9z5EZodoPLZp6uX
	n1SDS+NVBzc8f6rmxjDJzAMAMraL7gjrX8EAZVEvlGExd4F+FiD/ihk3LgDPDpb9a1+9OBGkN4oim
	h+ff85LMevJd1Se06S5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHVLu-0001Je-48; Mon, 07 Oct 2019 15:55:14 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHVLZ-0008Jy-Q4; Mon, 07 Oct 2019 15:54:55 +0000
Received: by mail-io1-xd41.google.com with SMTP id n26so29615384ioj.8;
 Mon, 07 Oct 2019 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvpOYPT25Dz/vPtn4WUNNAsTQj8w9iYHYk37s9wmbRA=;
 b=Ckvqu/VoFwKFHldPlCQQ7rGN0El4oSw62jZdcCzu59LwyF2msfcDQM63j0TmFd2YxT
 WAe3o/ieROixTeOWj5cRNIdhGzfdb3SSQ3c2/0hAmI4vacwT/AjZ4HdH47oBJz13v1Xr
 Zu8ism2Y1fiki6FPQl3fWyevesoLjP1eV251spvajxesKUS2hbYoN6+cWKrr9CAo71KK
 tRL3LBH1bAqTsv2FhLoatmnhFgfI8Mfg4LHc7RACVt965MBiLo30hVr5jrP8l7NJI/kw
 p3e7Ti728xG16cOQ5s+unqsH4DBrAZ3fE9TTt05hfU0+FOECcfP4b/OA8wKIHm+CJuwV
 9tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvpOYPT25Dz/vPtn4WUNNAsTQj8w9iYHYk37s9wmbRA=;
 b=fQZD1nS//aqYq2sROjHvRwxgyyvMWmwKuUuuCsAcTH08K1UuVfVNFnsVtZMzn5+Agi
 neIK8c0ADlSTUl88kTybhVb6yYQpdXphmvHZ9oJn9U9ZQv7dq2bkUx0yWed/73meImZI
 WA4FMm1+pDl7HLWUPZZ6XrhYGdCM3NeQj6M9Hxcv8ZlHmtmCIsg/e8ec8QI2tfdN5Twz
 eiq+wRFfo0xdjE635+lzWdjlknypI5vEl6TeJnOjL/Z7Y9wdiZE7d4bDXUTgDE8DEUAC
 TDQApLixEKnodcE7lHwqnx/PLXOtdqTLlKKkPOuGq8fpIpenIlXO5j9N2fpnX79zyLzV
 3aMg==
X-Gm-Message-State: APjAAAUCcF9crTMZ9nZlLRbKVGt9WUBJb3652lpcvnYWwWe298PVuIA5
 9rvO3hMNX/kwgGiPj1NXtwMXlOMuHck803Mgwbk=
X-Google-Smtp-Source: APXvYqxi4nNcdgpdM7NsVyNP5M/JKLLRb6BMM4Kll8kUSaYi7x+Qj5bGG21aaEgdWhPttIekzf3iOaMHq7JDv5ThOfI=
X-Received: by 2002:a02:2b2e:: with SMTP id h46mr27703157jaa.141.1570463693043; 
 Mon, 07 Oct 2019 08:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-5-linux.amoon@gmail.com>
 <a6daf5e5-fadf-ca72-fc7b-1789abaab605@baylibre.com>
In-Reply-To: <a6daf5e5-fadf-ca72-fc7b-1789abaab605@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Oct 2019 21:24:41 +0530
Message-ID: <CANAwSgQBMzkdnuHc8_hFx0+Es2PWmCwgeqykCTieZ3BtTK1W7A@mail.gmail.com>
Subject: Re: [RFCv1 4/5] arm64: dts: meson: Add missing regulator linked to
 VCCV5 regulator to VDDIO_C/TF_IO
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_085453_848705_AF2D323A 
X-CRM114-Status: GOOD (  13.29  )
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
> > As per schematics add missing VCCV5 power supply to VDDIO_C/TF_IO
> > regulator. Also add TF_3V3N_1V8_EN signal name to gpio pin.
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
> > index 6bd23a1e7e1d..5daf176452f7 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -66,11 +66,14 @@
> >               regulator-min-microvolt = <1800000>;
> >               regulator-max-microvolt = <3300000>;
> >
> > +             /* TF_3V3N_1V8_EN */
> >               gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
> >               gpios-states = <0>;
> >
> >               states = <3300000 0>,
> >                        <1800000 1>;
> > +             /* U16 RT9179GB */
> > +             vin-supply = <&vcc_5v>;
> >       };
> >
> >       flash_1v8: regulator-flash_1v8 {
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

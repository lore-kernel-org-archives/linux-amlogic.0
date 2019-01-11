Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58F2C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:53:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC5F20879
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8Q53S/u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zVrA6T/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADC5F20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwlsbLMT2SeKHwKhZZbCGlhHr9GtZmWvSushotbsfVc=; b=P8Q53S/uDWu2Mn
	7I7c/fw67/OMYxIZR4v5H1LcqYpmI5duEpin8gSrfCu83O19wqE0MZU1g3ArUVgSR9rNYo6bCPsU/
	asIozWiC9PI61XRF0ePa9k0fWYXDj3OGnxwS/ywucmLsHgXUOArcPsJigoCL7OmLFr8dl1WZeWRyr
	+nfHH2mtFGFhfHHz00/JxG6swI+Pf2EWSzC/d9bDaKIyXoJT5qAT872s045TwzfHmDzkAs8gQUala
	pP9bqy1wFv0TNqY9YInUj/58d7xLZpTFpT/kJFRn0zKGJR834A7Pyy+lbrgeY7+gG+TBg3gY/+Bqt
	fkHq2s8OUB3bcWD9tAYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghl4u-0004Pe-Pj; Fri, 11 Jan 2019 00:53:40 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghl4r-0004PH-HU
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 00:53:39 +0000
Received: by mail-pl1-x643.google.com with SMTP id e5so5945777plb.5
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 16:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=d+X9gpNYVSva8N2u0I5OWMv9xuzeEIgVw0AyDjUxoJI=;
 b=zVrA6T/FKuIYh9Kgg9FkzvDQWkQZpyopoZp/bD8sGDhCyLF7rBXVZmjgLnzToTccZL
 7jeXqAtmHxb+h490SSFuLdr4qRR+dSqtcY8jqTqxXfdYn8/CiP5HOOaDkyDOxezpjp1C
 aJw6X9eZpvufQJr6oyXRJiQ/E3809djtMJcU2+bRno4ZJeN9JoAU7ixWVtcPNTDWCkmQ
 wahduqkLpNWKv56/6uX7DZew2jegvYq48aJ4nOO3v4aaSpCnNpQx+bwCYqlxKH2Dnbjh
 Av2iZ1h5dJwplzsq07mbeMkqUtoD4LcK8KoxNGiH8hvwepZVGnB17NiVtMkmsWI+vW56
 h+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=d+X9gpNYVSva8N2u0I5OWMv9xuzeEIgVw0AyDjUxoJI=;
 b=E8MnbZrbslAR6Luk67k7kmi8MqQY+N/ke7HTS1+HLLqhV+WNVFwl4s00GCmBDHsP44
 ZvC2VZp+PZczXRT01K3PpFE1LSl79rQE3ovvpCeJ1Mwuo/JsA1NFbYiczaAB3Ga2k4ca
 nRlfphZxH0oTN9jCgg9nNTfrPDQorbC2eBCIxDpvQLacfc6JcHgjFpVdf6qJ73Eq3u2y
 xeq1zJCY/afxFWr9tJivYaiCfAixHG9RWIsyi4hRe14XFC6gby610DNTfh3wOIaij0d4
 AJwa1uMfO9YXve0zKyRMWhzApvxehi4PylAcvH/hs5TctRODKAYRwZ2hINzEjoEu1bqj
 U0kQ==
X-Gm-Message-State: AJcUukeOiw65BP8cAMnFhDWicODmbmEkIstlXwnqMaVIjJLl11ssVEf9
 iqgrX3bslOOEXphpzyVCQzHJxw==
X-Google-Smtp-Source: ALg8bN7kf17ouikPbX3kwEK63xd10riC0IV86qLI8Pb2l50tpM/h5j+1Iao91I9mV4FU97dcAQhi2A==
X-Received: by 2002:a17:902:aa8c:: with SMTP id
 d12mr12707258plr.25.1547168016422; 
 Thu, 10 Jan 2019 16:53:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 m65sm136399873pfg.180.2019.01.10.16.53.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 16:53:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
In-Reply-To: <f4fa4226a508d563d1a77eaafa5590fd84577c15.camel@baylibre.com>
References: <20181220161037.23756-1-jbrunet@baylibre.com>
 <20181220161037.23756-3-jbrunet@baylibre.com>
 <CAFBinCBQkpLxUZYp2NQoXEA=8t_XCJMHauM+DwTz-p0FA57CrA@mail.gmail.com>
 <f4fa4226a508d563d1a77eaafa5590fd84577c15.camel@baylibre.com>
Date: Thu, 10 Jan 2019 16:53:35 -0800
Message-ID: <7h5zuwqak0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_165337_579119_92B891B4 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sat, 2018-12-22 at 18:01 +0100, Martin Blumenstingl wrote:
>> Hi Jerome,
>> 
>> On Thu, Dec 20, 2018 at 5:11 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> > While some 3.3v eMMC 4.0 are available from libretech, the default
>> > option for the aml-s905x-cc seems to 1.8v 5.0 modules.
>> nit-pick:
>> can you please state which module (storage size) you used for testing?
>> you probably still remember that we had some confusion on Odroid-C2
>> which eMMC module works and which doesn't, so let's be explicit here
>> 
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > ---
>> >  .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 9 +++++----
>> >  1 file changed, 5 insertions(+), 4 deletions(-)
>> > 
>> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> > b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> > index daad007fac1f..d0d202cf7161 100644
>> > --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> > @@ -118,8 +118,8 @@
>> >         vddio_boot: regulator-vddio_boot {
>> >                 compatible = "regulator-fixed";
>> >                 regulator-name = "VDDIO_BOOT";
>> > -               regulator-min-microvolt = <3300000>;
>> > -               regulator-max-microvolt = <3300000>;
>> > +               regulator-min-microvolt = <1800000>;
>> > +               regulator-max-microvolt = <1800000>;
>> is there a 3.3V -> 1.8V regulator on the eMMC module?
>> I'm not sure about the schematics but it seems to be that the board
>> itself supplies only 3.3V to the eMMC connector, so I'm not sure where
>> 1.8V come from in this case
>
> The module is indeed fed by 3.3v only but it has embedded LDOs add will feed
> back the supply of the BOOT gpio bank.
>
> I tried the following modules:
> * 8 GB samsung - v1.0-170420
> * 32 GB toshiba - v1.0-170421
>
> I think you can't get them here [0].
>
> In theory, these 4.x modules [1] could also work. They don't have the LDOs and
> are directly feeding back the 3.3v to the BOOT bank. Since the modules are
> advertised as being compatible with the Allwinner boards only, and not the AML
> ones, it should not be the default option.
>
> [0] : 
> https://www.loverpi.com/collections/libre-computer-project/products/libre-computer-board-emmc-5-x-module?variant=4173557729
> [1] : 
> https://www.loverpi.com/collections/libre-computer-project/products/libre-computer-board-emmc-4-x-module?variant=761282232333
>
>> can you please add a comment to the .dts about this?
>
> Sure
>

OK, I'll wait for a v2 of this series.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

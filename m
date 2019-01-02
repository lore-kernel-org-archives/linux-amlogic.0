Return-Path: <SRS0=W3Hy=PK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F85C43444
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jan 2019 10:51:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2A502171F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jan 2019 10:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q94FqxuE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P6WjS79b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2A502171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40msoQOdDbVC6rBAAkQ2aCsHT/OYV0TEr0J2XSenans=; b=Q94FqxuE1p1D7K
	5yQLt7a73snV0RtfcsGvQtk8eOLvlSW8WmZS80TbEHYu10cgB9zGGT6nGtGIwjV9AIzSWZ8ASs3gj
	JS/32ZexF5DdFYlBwwkbCCh/q+WaHHco07bzrvX8dQ1gGTaVO6s3L/hHg5CxuiHlcfElhM8jvp3gP
	F4mosi4xGRlgBdkYAT9u3hA71+wb9w2gp1hVOBvbYSHJ/QaU2cmjr6fGK0Xcupfg+wWMoTrV4BfUe
	wwoZdIV4Jo5E0GqZH2Wyqk/z+dsPdb75cEw12Yn5bAk5ARXguB6SLw161gYl0C08QZ52+A1GPZ1VR
	KBo57bADwB79Ht4nrhbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gee7T-0006lc-U9; Wed, 02 Jan 2019 10:51:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gee7Q-0006kv-Dr
 for linux-amlogic@lists.infradead.org; Wed, 02 Jan 2019 10:51:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id c14so30107152wrr.0
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Jan 2019 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=8MmLBCI2PIoQ8MIUEoJ2wCK/ssvfuTsMrNba1wjWWZM=;
 b=P6WjS79bJcOn2dhtizkDZC4pJI5RerhuQ5sAWonwOoRO/9tGTcpjrTYxDbbOps9rBp
 zSSwWDU69XmFdeYWV09lBFnRoRt8PJiKazI3KSt/S0v0GJJMaCBlO8CdwU98VehrBW0E
 9X6IwAG7TbZIhSSQzQTptixXB8MaQ+0TamYjv1BonSen7a6S3wX0Xl8i1r7vSUEKQvN7
 zb0kye/iDLurFj7THJXSqa6+LDGQYGM8istIeZMjv2GBYyIod97x4D1X53Tc0ufnE2ZZ
 t0e0+HPltJ5BUgJIY3i73GUqem7bkbXOPcDf1WrtVfUod5tLq7fgkpAvztdjpgwr9heO
 axEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=8MmLBCI2PIoQ8MIUEoJ2wCK/ssvfuTsMrNba1wjWWZM=;
 b=Gt7APKuS4QZrO90Jzkxix3pq2wuwzdig0gL+RBW2cJ2G5YNSEfIVgXKJNLHD7wOEsU
 et62hzQCFL87efqeQn2rxQrlH8zHLgJM2AmA51gxuU1XwTAQ1T5/UguLXEcjAkoYy46r
 mQNJKzEoehqVuXJ5qEx9RZKDLP9nWroI2exGZhtaYpwQ9y+SwXSVoE98NmD0qMoj+ql3
 Ke6haRSffuPop5q5iNTknr7r5SnX0okomKBEsj3QplfJxMEGJzmGSWG/83ScwayF/J1T
 2dMsMYvGEv1RQq/iCHgduA6aCWaZ/njKV1wc7w39swP2VFEnvuE11TIeNOddZF7FOQtD
 P+rg==
X-Gm-Message-State: AJcUukdq5hreaocJTMWZlmYRjPvnNXtxcg15X7GY7h4ahFYwDynmEfmP
 ElHicxk28ZwBWoyNkLXb2a066Q==
X-Google-Smtp-Source: ALg8bN6n41xk9YnjSihHkqvG0avbzSe0eKT0bldMHW0Vyt4XN1F+XgUrZsKkusOT+p06EZr1bTCchw==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr37207582wrx.315.1546426281734; 
 Wed, 02 Jan 2019 02:51:21 -0800 (PST)
Received: from boomer.baylibre.com (uluru.liltaz.com. [163.172.81.188])
 by smtp.gmail.com with ESMTPSA id t76sm68331814wme.33.2019.01.02.02.51.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Jan 2019 02:51:21 -0800 (PST)
Message-ID: <f4fa4226a508d563d1a77eaafa5590fd84577c15.camel@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 02 Jan 2019 11:51:19 +0100
In-Reply-To: <CAFBinCBQkpLxUZYp2NQoXEA=8t_XCJMHauM+DwTz-p0FA57CrA@mail.gmail.com>
References: <20181220161037.23756-1-jbrunet@baylibre.com>
 <20181220161037.23756-3-jbrunet@baylibre.com>
 <CAFBinCBQkpLxUZYp2NQoXEA=8t_XCJMHauM+DwTz-p0FA57CrA@mail.gmail.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_025124_529518_994EBF52 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2018-12-22 at 18:01 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Thu, Dec 20, 2018 at 5:11 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > While some 3.3v eMMC 4.0 are available from libretech, the default
> > option for the aml-s905x-cc seems to 1.8v 5.0 modules.
> nit-pick:
> can you please state which module (storage size) you used for testing?
> you probably still remember that we had some confusion on Odroid-C2
> which eMMC module works and which doesn't, so let's be explicit here
> 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> > b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> > index daad007fac1f..d0d202cf7161 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> > @@ -118,8 +118,8 @@
> >         vddio_boot: regulator-vddio_boot {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "VDDIO_BOOT";
> > -               regulator-min-microvolt = <3300000>;
> > -               regulator-max-microvolt = <3300000>;
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <1800000>;
> is there a 3.3V -> 1.8V regulator on the eMMC module?
> I'm not sure about the schematics but it seems to be that the board
> itself supplies only 3.3V to the eMMC connector, so I'm not sure where
> 1.8V come from in this case

The module is indeed fed by 3.3v only but it has embedded LDOs add will feed
back the supply of the BOOT gpio bank.

I tried the following modules:
* 8 GB samsung - v1.0-170420
* 32 GB toshiba - v1.0-170421

I think you can't get them here [0].

In theory, these 4.x modules [1] could also work. They don't have the LDOs and
are directly feeding back the 3.3v to the BOOT bank. Since the modules are
advertised as being compatible with the Allwinner boards only, and not the AML
ones, it should not be the default option.

[0] : 
https://www.loverpi.com/collections/libre-computer-project/products/libre-computer-board-emmc-5-x-module?variant=4173557729
[1] : 
https://www.loverpi.com/collections/libre-computer-project/products/libre-computer-board-emmc-4-x-module?variant=761282232333

> can you please add a comment to the .dts about this?

Sure

> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D9AC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5402720665
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+AExvWY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q/NornTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5402720665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjg798yCB3gXuyQUG7z5nZVCfnOrK5Pusn08ddsA3wk=; b=l+AExvWY5o6MOqCO1+X4om1WW/
	CM//XaJlNKQHEfsYwdOPqJr3ZsIGUGM59zDWMyDvJwfLcTvXptIzGlDqNoYm55hr2BUfiUcUAgOm2
	3SL2cT6zfiZ5Jr0CM410zpZPc+G4tntrXq1y4CHH8PPXAQhh6yd02xQMDabnJ2QYfCe7GOvHZ2wj7
	qCZtlm4BkK3sL1D9P0R/z39hRFdBiSn8RBm9ZvVpP93IUGqjskdQNF2nnhmtQ2oSN42dKRUH5opBD
	ofYfznSQjXC07pwlC+2jDeYnXWGh5/MATgT4gKfnVKnJMElqlHi7yoVRf3IhzzS2LKNBqWKTfVoih
	/Q/K98hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOMSw-000786-87; Fri, 02 Oct 2020 14:55:22 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOMSt-00077F-DZ
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 14:55:20 +0000
Received: by mail-ej1-x641.google.com with SMTP id md26so2374570ejb.10
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=pDks6p78EBD7ss15qrLLTZCcCpPLA2YETzRFSCodWyo=;
 b=q/NornTt2eh3x4yoPtr/QjxWUZ2YMcknK7dAxDB+N5RmzQA4dWhmZyWx5jVdcCuG8E
 Yglw1CIOPe/A8+I5xu85MEFyzft7kKBfuTGQyopZPaTnltBYnqhAn8lNM1+9THbJkn9q
 JMR07CI+5Xl3TwCFT99/ikUuNKDQcuPa9AfEeStfjPTrjqSTVYDO7fj1u8iY7bZSg9oU
 sA9/47NW0gggg+6zu3DM074irN83HJDylN6I2UVFpnRQnK4HD8YMcpDkgr/NFRUN9RDF
 UaolQPYhm1V61C1X+X4jBGSRLRQQxqdCX0UtmgijuNAW6vm7OIxEKrTh2oY1VjNaXv0s
 aA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=pDks6p78EBD7ss15qrLLTZCcCpPLA2YETzRFSCodWyo=;
 b=AEewyXEEWE8bXREuqJWbf06G2PvPjyBI3VPeha8yMeSUykYTbJbgVQiLanUAdMvCpI
 Ex4aWDtDoup4zwsfYKAk0lq/KmfwQX5hoZAwzIzrjSQTQbKkTZh0WUieqVEVwb3P2Cqg
 YC/n+WhuRfMOz9LKigeS0AK4lmHJIo8DWDIFtc2zjHXGRlnk56QK3lLYWu3AWvmHffPe
 gKZ8SsNlI9fLdUZaOvU71s/+OSdTVuaLW0EHTTP72L5yYCa5njgXJnTwfNjhGrOdUNpq
 o26kS4lECMOGWMn0+jpRyyvjom5O1wuRv9NZLp53KQ4W6ANwsOxL0Q9eSGlrM0oGXdqh
 jA4w==
X-Gm-Message-State: AOAM532TANeAhlPR77ZX3zT3JeWSlLKn6hIPPOFrwvHDiDTFqnqqXDbF
 pAcfvFdCDVn+AbaJ+YT1jcUORg==
X-Google-Smtp-Source: ABdhPJxeWoIW2hk98lm8JxgeH6OqwPbzwaF2nR6YfVrAzo27GB7rxcfU1hjQOZwHmbzvboDD1SmiBg==
X-Received: by 2002:a17:906:a256:: with SMTP id
 bi22mr2629106ejb.375.1601650517967; 
 Fri, 02 Oct 2020 07:55:17 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id p17sm1397771edw.10.2020.10.02.07.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:55:17 -0700 (PDT)
References: <20201002143141.14870-1-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] arm64: dts: meson: add more GX soundcards
In-reply-to: <20201002143141.14870-1-christianshewitt@gmail.com>
Date: Fri, 02 Oct 2020 16:55:16 +0200
Message-ID: <1jy2koisob.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_105519_477679_3EA8AFF1 
X-CRM114-Status: GOOD (  15.98  )
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


On Fri 02 Oct 2020 at 16:31, Christian Hewitt <christianshewitt@gmail.com> wrote:

> This series adds basic support for LPCM audio over HDMI and S/PDIF
> interfaces to GXBB/GXL/GXM devices without support. I'm sure audio
> support can be extended in places (some devices have internal DACs
> and headphone hardware) but this gets the basics working.
>
> I have personally tested with the khadas-vim2, odroid-c2, and both
> wetek devices as I have them, and there are positive forum reports
> from users with vega-s95 and some no-name P20X box devices.

It is fine to add what you have tested but I'm not confortable adding
untested stuff which will later give the false idea that they are
supposed to work.

Amplifiers and codec may require different settings and ressources
(such as GPIO and regulators) to actually operate properly.

As far the p200 and p201, like the g12 u200, those are reference design
with various sound card possibilities which usually don't apply to end
products.

For example the p200 is missing both input and output codecs, the sound
amplifier and, as it stands, is likely to be muted.

>
> Changes from v1
> - Drop nexbox-a1 and rbox-pro changes - the regulator changes are
> needed to get the dts to compile, but I do not have schematics to
> validate the changes or the hardware to test with.
>
> Christian Hewitt (10):
>   arm64: dts: meson: add audio playback to a95x
>   arm64: dts: meson: add audio playback to khadas-vim2
>   arm64: dts: meson: add audio playback to nanopi-k2
>   arm64: dts: meson: add audio playback to odroid-c2
>   arm64: dts: meson: add audio playback to p201
>   arm64: dts: meson: add audio playback to p200
>   arm64: dts: meson: add audio playback to p212-s905x dtsi
>   arm64: dts: meson: add audio playback to vega-s95 dtsi
>   arm64: dts: meson: add audio playback to wetek-hub
>   arm64: dts: meson: add audio playback to wetek-play2
>
>  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++++
>  .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-p200.dts      | 61 +++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-p201.dts      | 40 ++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 +++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++++
>  .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
>  .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 40 ++++++++++++
>  .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 ++++++++++++-
>  10 files changed, 464 insertions(+), 3 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

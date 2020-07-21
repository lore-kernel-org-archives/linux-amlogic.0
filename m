Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F86C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628E520709
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXaXw2zV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZHkV8yt3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628E520709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPZ3OhzsSaIS9gHN5F6dT97rphNjt37ELmEHQ+SPfys=; b=iXaXw2zV8iprAhwn4HG/Q2oXar
	P63wU8XUNMNnqR1L2kVffLt+vsIjiHqcdZnCWtwbgzxHd9wNxz6xyQBq2GzxTzPBOZ+UXPjqp67oz
	CT/By8NhtzxBJnKcPkM2ExQekAOUMLurB2dWTZ0SnO61TT/rcoO9sdptW85JixmBO7ZQcE2xyEQgm
	3ycS1yXGauYqRT1GxCBIY/6Zc9J1RFcEkv3wTedEruHhJlnBkNy2u0RhHt7AlI92qKeKjBZ4s5xoi
	nMuCzT4dmoSzSC9ubkLnjagiuWtOZ+nZxq+pNy6dwbdR6D7FIjAxuuckOFXboHwYJ95FMncl4nQi/
	jagfToKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnoh-0007sW-DM; Tue, 21 Jul 2020 08:40:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnob-0007qV-NJ
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:39:59 +0000
Received: by mail-wm1-x344.google.com with SMTP id j18so1960797wmi.3
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=kffYnJ6AlClklIV94Jnp3wm8cFF3FK2tqJd8e6ndHNA=;
 b=ZHkV8yt3OL5rcS+aqUvhiyM3XF59GBemXA6DwSKA9Wz9bQWUDFlSA/bnjwvE3caBHh
 VZdYeJShAe3TpNjjzybE7oF9oWz1nnYYL/Uz4PEWeEEnzXKisbkZHegFPN0wQBmJ/O3M
 dJx3a+mpMwXZBlrkXt8SdYXmpS4qVwAsf/EwKrxfn+/CTgDV8xDOc2tTNFqE2yT4EjOj
 9T60xEnQC1RnOtV24/SPfaKxK2kfluHHTpcZwQYl8wimTcuXmVe9ct9ZFz20G/rV2/N7
 A4qr+ecDGnGBuDqVfRAHKYXSlmZ6LdpDaxylhOCnchElF6NQjwqC+vimBJqK5K3jXf2x
 T2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=kffYnJ6AlClklIV94Jnp3wm8cFF3FK2tqJd8e6ndHNA=;
 b=Fp/hcDYQ5O1UIYZ3J1xk2nEiWX1XeXhgsZiivyScpQIzaIdin1GjBFoE9XIbqHBXJ2
 9Y6+j2kpaH39d6WtEKcxpcO0XaKI4DsSOtZXchlqVqxlKCZx5PHuf+62ZdD87tHt6zbk
 oxbqoeVyNC1tbWo96ckfkci+yjbgqG+fnVM7WEIU1QTBwTfEMDYpETxcmiSmY7LFGJXX
 JAeGXh1CjyY7ewrq8deXUHAVjil9qA7zaGHiyAroLPsCJeWxvGn8IssJVOh6uouZdvtb
 pbvkXK+5O6JKFpai1OalIkHRqzdC7qUGuK51IbhhohMr25kwtNyZ9wdvhr4iXjFswv0x
 kf/Q==
X-Gm-Message-State: AOAM530Jm8FhHA51WTk6EgQ3I/i3TR+yYijPpLi36V2U8dZW6WC66JdF
 lN3Q4Z5FsVgwsvzeHFeMu2Potg==
X-Google-Smtp-Source: ABdhPJytIMh8MKWLIeaObf5rXO9B9D9co4BaPFgQ7wK5k0hBGSGiAuNpeRqCul3V5nGfvsvi2ap9Rg==
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr2537003wmf.132.1595320796488; 
 Tue, 21 Jul 2020 01:39:56 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u20sm2478974wmm.15.2020.07.21.01.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:39:55 -0700 (PDT)
References: <20200718065739.7802-1-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] arm64: dts: meson: add more GX soundcards
In-reply-to: <20200718065739.7802-1-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 10:39:55 +0200
Message-ID: <1jtuy18dno.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_043957_794307_B49E9068 
X-CRM114-Status: GOOD (  13.38  )
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


On Sat 18 Jul 2020 at 08:57, Christian Hewitt <christianshewitt@gmail.com> wrote:

> From: chewitt <christianshewitt@gmail.com>
>
> This series adds basic support for LPCM audio over HDMI and S/PDIF
> interfaces to GXBB/GXL/GXM devices without support. I'm sure audio
> support can be extended in places (some devices have internal DACs
> and headphone hardware) but this gets the HDMI port working as a
> minimum capability.
>
> I have personally tested with the khadas-vim2, odroid-c2, and both
> wetek devices as I have them, and there are positive forum reports
> from users with vega-s95 and some no-name P20X box devices.

I'm under the impression that not *all* the boards below have tested
against these changes, on both output when applicable. I'm a bit
concerned by that. For the boards you don't have, it would be nice if
you could add a Tested-by Tag.

Tiny things, yet critical, such as regulators and pinctrl, may change.
People looking at our DT should be able to expect that things have been
tested and confirmed working at least once.

Apart from the comment regarding the regulators, the changes seems OK.

>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>
> Christian Hewitt (12):
>   arm64: dts: meson: add audio playback to a95x
>   arm64: dts: meson: add audio playback to khadas-vim2
>   arm64: dts: meson: add audio playback to nanopi-k2
>   arm64: dts: meson: add audio playback to nexbox-a1
>   arm64: dts: meson: add audio playback to odroid-c2
>   arm64: dts: meson: add audio playback to p201
>   arm64: dts: meson: add audio playback to p200
>   arm64: dts: meson: add audio playback to p212-s905x dtsi
>   arm64: dts: meson: add audio playback to rbox-pro
>   arm64: dts: meson: add audio playback to vega-s95 dtsi
>   arm64: dts: meson: add audio playback to wetek-hub
>   arm64: dts: meson: add audio playback to wetek-play2
>
>  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++
>  .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++
>  .../boot/dts/amlogic/meson-gxbb-p200.dts      | 61 ++++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-p201.dts      | 40 ++++++++++
>  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 ++++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++
>  .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 ++++++++++++++
>  .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 40 ++++++++++
>  .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 +++++++++-
>  .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 80 +++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 80 +++++++++++++++++++
>  12 files changed, 624 insertions(+), 3 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

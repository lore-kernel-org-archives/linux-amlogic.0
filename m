Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65343C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 12:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360A72074B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 12:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oomOYqCr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zRIKU8kp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360A72074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UxopjHVQexsF9YXxVSZAUrIaVjFYXHgmq1yAtXCdxsc=; b=oomOYqCr0y4u1jU2bL/HMclnD
	036GGa1DNs23kmXD6z4NkArNs/XKI3C2LH7vQ6vcBoZevXAfOOOd9aIu4y2ikmf70GFmKd8Ff8QIz
	3OhSm5YNc0ygsoSBCYiCOERWjalhhqk+tkt3cdCBDu0tiech9C4+vFwk7cPEfJGfpTFjtQ0GqQsfo
	8o6NndL00voC18zan6c8ZLLHhpCJZONeJ4yoLyftgRfcVT9M25A30Esc3wjlJk45kviLcJw/G4+4g
	Kz0bOBLuHO6OGICmfvUTIeg5D/lhnQ/vOfdqjkLfOu+oEFmAwr+/1kv44+LkOO7SRFN4OMtLPwWXe
	Y3ttDg0BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k17Sa-0001km-I4; Thu, 30 Jul 2020 12:14:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k17SY-0001k5-UM
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 12:14:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id q76so4786974wme.4
 for <linux-amlogic@lists.infradead.org>; Thu, 30 Jul 2020 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=/r+N6eKyBWJdzxgYlYaBhm9+mOtspwHJ/eIAKQtz++0=;
 b=zRIKU8kp5WoYBIeDpHxsR86gcozaWDxJwr++sn9ppFBnSD7vL1H4IlJItye/f42UTz
 U5+MuqKoUXa2ekyaGCqnKkM+Vw/rCElo4m0dwEYW0nSAT972qWhyH67ycG5HTnEBG5bN
 GZbtdud0qIjXZppF/J/9z5sBJVqGEmmQs55+/EOjQ2lF0LZj90o6YMm9QeAarnwh7H7s
 /FNpA7BDwdlAf1w+9xESJPgyakro4x2qi1+qjhkPDZPriBzhw11IsoNAxkG05LOysVHT
 pGp80Ti8m4gIDVC236SDIGseS85o9GKSfTNs6wW45Eh3qBfKA/g4+UwRwBaWbRPx1Vfg
 DRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=/r+N6eKyBWJdzxgYlYaBhm9+mOtspwHJ/eIAKQtz++0=;
 b=UOUobl+2PPLH5lElRyPwnDXmuydCt4ltqPAyf1CbANehkOOHyuL7lShHlzle9n2B4Z
 j0vQEBsskeQdh/FwDx9sO1KH+4SwlhikcO8asX3tszg4pnjLc+fBecKatu3sUYZtmb7G
 XbGlDWOuDHbgeE+6gpEddMUvaL5vBuhEqBii9V8kSRirU7Aq2KtgmZ3jagSM3C2uiD+W
 6IBJNJISRIu6ueJbHhSL5Tkk5+qLNVMqPefTP86VFzD1gVBU3rIYan1BRFvEnkqFBNwl
 nsuK4sVo4GgWjla3FZr6EoO+D3iULaZNJxoITCKLOYvHChmHe9PVZPH9M2nusvTwjkaH
 7S5g==
X-Gm-Message-State: AOAM533Lqo+qgJy7nTGdTYdJPTZAag/y/nFNShCQ3PbnUEztPoy4RQ6o
 ky5U+dSgD6Q4wexzY0w9p5Ty2Q==
X-Google-Smtp-Source: ABdhPJxeSZah/GBhT5AXfMsyEU7xu3cs5rnYnqoFxpEo4JI5uqQ53M13n/+4C68CfimapcobUCdrcA==
X-Received: by 2002:a1c:7915:: with SMTP id l21mr13753703wme.50.1596111294085; 
 Thu, 30 Jul 2020 05:14:54 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t2sm9757845wmb.28.2020.07.30.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 05:14:53 -0700 (PDT)
References: <20200730100209.793-1-linux.amoon@gmail.com>
 <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
In-reply-to: <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 30 Jul 2020 14:14:52 +0200
Message-ID: <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_081454_992151_651E01D3 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
>
>> These patch fix the Ethernet issue on Odroid C2 & Odroid N2 
>> Some time Ethernet interface come up but no DHCP request
>> is forwaded to the Router, this happens quite offern on
>> my side. Adding Reset controller to ethernet node FIx the
>> inilization issue.
>>
>
> I'm seeing this on other device as well. Strange that it pops up only
> now. Change tested on S905x, seems to help.

Strike that one - still seeing random DHCP issue on boot with this
applied

>
>> -Anand
>>
>> Anand Moon (3):
>>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
>>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
>>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
>
> None of the patches apply, please rebase on kevin's dt64 branch.
>
> With that, you can add
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>

So still worth rebasing and applying on I suppose but I don't think it
solves the problem as described in this cover letter.

>
>>
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
>>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
>>  3 files changed, 7 insertions(+)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

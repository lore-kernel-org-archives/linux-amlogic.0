Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BECC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 21:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE122173E
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 21:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDIgm4k2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE122173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Oy4xaK+QYlIsMnC4wfQ9xdY35oaRqFpHdTSG6ghsks=; b=QDIgm4k2sz/dlu
	AB3eYd/TW+L/UoVZ7Hpv3JVAXP47lV1aV8a92LkDIlmw8E1mA9WsDMZMbNVs/E772ZKK+49gIoidj
	KpwO7bfnXUtbWiRj0dzBYWnRLLA4Yu6Wb3pyM2Ocdu3PqQReknMPG5tIOduoUFhYGSrsX6s4IkrXO
	cZOEVmq/hT7QU6N8k3mcBJBaBFaGOsZu1Bh7zKXDVDb0hg+iKwAaSo6eDld+lTyM0Al2Cf2kSIMOt
	eDw1RsO+NiFm9zkT78wRumRVF7DWTAsCLd1I5glaFA3qGltj1u1e/cpRygZ50D+ehB2GXEiOuQraS
	FF99xVo+gwKSiTPGGhGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5GBZ-00067j-62; Tue, 03 Sep 2019 21:17:57 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5GBX-00067D-CV; Tue, 03 Sep 2019 21:17:56 +0000
Received: by mail-qk1-f179.google.com with SMTP id f10so17560945qkg.7;
 Tue, 03 Sep 2019 14:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DoFNL2Xw85kFFJUW6peduZxA/0zNesvvkQ9XWqK3cNo=;
 b=nJNLGdTZ0ItKLhXgHr6Qr30fLpVd3G5hV/gMGNmjnMyCY1xX02KaIjCp7OQHbBUO92
 KNnEoN4FvPBp18njOKOHqm6jkB0rdH1nY39DTrvHSBZqrTX2zh0Xj9bc3R7nh/Vqe0uf
 sNcHAvSXY+/F18mYDsQtCOl+vh/Vy1Fhr8zV8akDi31xJF4Z23QTiCaFbWAUW6H8K10I
 Tx1DbU0Dmadl0ppGuikvW92Xi/Ix2ipOx8M6kjVbP5MvaBKAJP8iO8brZLJdFQ0QhNe7
 Y7/if7LcmxllU8+Yehl0mnQBzvRu/JLwaAFL3JnEVy3KYv1W50FKam+a5X8KF5blEmep
 AH4Q==
X-Gm-Message-State: APjAAAUMB78TQCI8sGJoCw82IZbfBX318c1Gr9q1B7nT8/7uKi0IHUzN
 chfDqUT7KdGH9097W/+R18qBINoTpmVL/vcHl8I=
X-Google-Smtp-Source: APXvYqzPKAEL57Dqj6+o72+mq3l1R1POezPpmM6EDrRvzrojkJs6eaKFs7LPI2743Rj8Ua5MEVBUoqoTalVPIEX3XOE=
X-Received: by 2002:a37:4fcf:: with SMTP id
 d198mr35980474qkb.394.1567545474318; 
 Tue, 03 Sep 2019 14:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <7h4l1zrf84.fsf@baylibre.com> <7hv9ufmthb.fsf@baylibre.com>
In-Reply-To: <7hv9ufmthb.fsf@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 23:17:38 +0200
Message-ID: <CAK8P3a0JUmErnV+jq8D262y8Tkw9=DYdyEOBn91+yB-8muC8EQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.4 (round 2)
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_141755_427541_75A8431E 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 1:39 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Arnd, Olof,
>
> Kevin Hilman <khilman@baylibre.com> writes:
>
> > Another (final) round of 64-bit DT updates for Amlogic SoCs for v5.4.
> > Highlights are in the tag description, but of note is a tag pulled in
> > from the clock tree due to a handful of new clocks used for DVFS and
> > power domains.
>
> Here's the promised respin (round 2.1):
>
> In addition to the clock dependency listed above, this branch adds a
> bunch of DT users of a new PM domain driver, which has new bindings and
> DT headers added in my drivers PR.  That drivers branch is also merged
> here to ensure this branch builds standlone also.
>
> Sorry for the noise on the first attempt.
>

Pulled manually into arm/dt now, thanks!

        Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

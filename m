Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA025C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 21:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D6461001
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 21:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D6461001
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RqY8x/ar1x/yuRUzYkxTDoyKUw83vAgPsOgZpUgw9o=; b=YI/UAjFlwOXjnY
	fW4Zo1sRVRtjJD9oVOW0zzisV5/ad0zpBSi8IEN3ZPgeB4nnD3iySB1nMi2AUIabDR+/gMGo39GNt
	l34SgS16UVVJ4w1snFxsf5g6SK0380uxMJuH+CoWRn/vgi/LKJErygsFbAGOujDMjwDgN0An0PHND
	GU7RysAL+i+of2tInz6lvdLPBwSAtgn/riFEU1PlAlHFeDPyNEXVzWBHqRZhSY4Bfdj69K4Bmcii4
	OMGl9EoihT88IqWJI2fvgqtVLbn+NeFXBCXGxMT3Jbdl7GDo3TovxHRoECedoonSDREVcJK2KgW+n
	FpWtvMX8Gj5IazkwKGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvna2-008QJq-Hf; Tue, 22 Jun 2021 21:05:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvna0-008QJA-9Q; Tue, 22 Jun 2021 21:05:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id hz1so565343ejc.1;
 Tue, 22 Jun 2021 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UUc+wnGu+qMMod+izmu7YMTZnrpqEfnlG0hnSla1RfI=;
 b=MhqOn4tLoi01in/oJrMFsXHKfK91kconn54gNEDCGTEr+NqA/5XMsHzTB8B/YRC01f
 EUAJdfEFssAK3vB6ngsO4VzbFE0xn/4SA/xSaOs1s9ql4pP17uvZOqAdxUtbvNJ7eBJy
 cEKLv94QzwJYODppWCl4gbxuH8g4boCwlljHBJuvTvTEeZhi97ooK73FDtI5+l6VCBwe
 2FtW/p7rLb1EwMnKr6DLTl1U9aPcEGJDG7iXTayW6TWbGFJexCfI47aDX7j3vLr/IBKX
 7NJBYwoBchWmz/NJ5q2DLl0YPmiD6ZSg0hITOb6Ev1KAoU7djRN4oLYAy6cL3v3rLGYu
 +zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUc+wnGu+qMMod+izmu7YMTZnrpqEfnlG0hnSla1RfI=;
 b=nNDjPwMw68mjgI5v3bZzi4u4nneClBaAYIBtoWRcxySiyYMbnRsJL7nko2kEtYqwxR
 eZK+qmAEd7X0HdWu4y96L0MuOX+k2UpMFRVTHJYXlxw0gdOY9SENx/naQ15tn0MlOnjk
 LbVdL3F/yqrrcjIy4I01UxGcHgK7p8B3eS3c5AJoQg9gy2R7Lf15S22dTsMcqRLkqD8G
 /gklOSwavLnxvMUTZ0wawkgpt3rzRIN9DtvMtxRY0xwxioGKQKAc8NOnvLqJ1Fx1Mbiw
 dDBW0yRN+harHl4EPgwT/A91nXt6zC2NDZuFilltSi2ShgbnKOWOv+D1E+uxo1IQgYzt
 4udQ==
X-Gm-Message-State: AOAM532DDXRJDqFrIAhRV8garr47AiU6R1yE9DQUgaJ3c4jiyhAjRh3v
 1os9CJdZmDu246Tx0WMB/R10Lwltk4EV+H1I55c=
X-Google-Smtp-Source: ABdhPJwMewFnPfwv2MyXFnRt30omw+O65gF6+q13Lx/fCk9guSaZ8IKLEo+FvBPtL66HDFH7uMVWqojGhh/VRFlURTg=
X-Received: by 2002:a17:906:3102:: with SMTP id
 2mr1711516ejx.208.1624395906020; 
 Tue, 22 Jun 2021 14:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
 <CAFBinCDn_0TeyLG9b9uB+4-4PdeNXgja11wf2CGcQ99tUNjkyQ@mail.gmail.com>
 <1jr1heqhoy.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jr1heqhoy.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jun 2021 23:04:55 +0200
Message-ID: <CAFBinCBpkci-BeqLSN+BNbrcAE9sLKM8Hs0BB09AM1GKmtU9_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
To: Jerome Brunet <jbrunet@baylibre.com>, sboyd@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_140508_404517_14F8429B 
X-CRM114-Status: GOOD (  29.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi Stephen,

On Mon, Jun 7, 2021 at 9:04 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Fri 04 Jun 2021 at 19:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Hi Jerome, Hi Stephen,
> >
> > On Mon, May 24, 2021 at 12:37 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> >> fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> >> up to approx. 3GHz.
> >> This however causes a problem, because these rates require BIT(31) to
> >> be usable. Unfortunately this is not the case with clk_ops.round_rate
> >> on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
> >>
> >> clk_ops.determine_rate does not suffer from this limitation. It uses
> >> an int to signal any errors and can then take all availble 32 bits for
> >> the clock rate.
> >>
> >> Changes since v1 from [0]:
> >> - reworked the first patch so the the existing
> >>   divider_{ro_}round_rate_parent implementations are using the new
> >>   divider_{ro_}determine_rate implementations to avoid code duplication
> >>   (thanks Jerome for the suggestion)
> >> - added a patch to switch the default clk_divider_{ro_}ops to use
> >>   .determine_rate instead of .round_rate as suggested by Jerome
> >>   (thanks)
> >> - dropped a patch for the Meson PLL ops as these are independent from
> >>   the divider patches and Jerome has applied that one directly (thanks)
> >> - added Jerome's Reviewed-by to the meson clk-regmap patch (thanks!)
> >> - dropped the RFC prefix
> > please let me know what you think about this v2
> > I am asking because clk-divider is widely used, so I'd appreciate if
> > this gets some time in linux-next (so for example Kernel CI can test
> > this and report issues if there are any).
Do you have any comments on this series?
I am fine with it skipping 5.14 as it's a change which affects
multiple platforms.
So I would like to use the time until the trees are opening for
patches targeting 5.15 to iron out code-review comments.

> Looks good to me
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Thanks Jerome - I'll add it to v3 once I send it (assuming nothing
major changes)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

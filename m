Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E07C83004
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 11:45:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8139B2085B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 11:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owwyuzlI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m8aseD4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8139B2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/VPlIhMcBeyDJdgR8UUmPQUacn5NHjmJc0A0kRWtN5g=; b=owwyuzlIwnbEkbd3VYHrWscV/B
	NA0Uoo9GB1GXGKRPRvkG8QReGCeeHnWxN25fbdGqA6NZNbJYJaP8ZNE2T2vDTyF+BYkqIwFAtj4iG
	uxOjO8/euBRAYJrY3gEaDzB6pdqLHcjXhuX97Bu/MfS6OROlKQp6TcMMUzbleOmCoxUC7Nu7YssBJ
	e6tG5AIw7AafPSGuNH5TZp2GEmNJRShDYD28lpbqePT8qEnZcQ0l0PbGvui7JQzh5s3atjLPF1hng
	fsFcNjP97T+YOYPLGKF/4zbJWi6XMoxq/aiUpSxYYOe/idvb5QbrDjFcOdSXDlioqKX8WEu7h4CGh
	5pD7zyFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTl98-000343-Co; Wed, 29 Apr 2020 11:44:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTl95-00032q-B2
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 11:44:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id x17so2131839wrt.5
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ycL/xol5LXc1oCnHf2lKepLV8YI7R5oU0gAskKNmHEg=;
 b=m8aseD4BGSL2eeyIyCCtWjiVzInZjA9AOhfIWWHODJqtsZn3u8IiZm78LhL6xbNLXZ
 egBMXWzyS5tpOXxLihcfxqD+Lb2ikPScf8qTirnKlsO3Iw4So/70aOvCDL9XG3pDLZTD
 MFyA6G+W+2lloNKnkwXdiIl78GUA8HPcqZgVV6JmrVySRDyfhw/Oe1KUPW2mVSo671o2
 l6HNwZkudieQaqswTiPD0p3wq/2WHsKUqLgcnLjh5W7gLr1QAfVXaBUGD/iSvK7doL33
 o3T/OEEmwDHnVzQKZod20K0v7oHIk64Ihl2XPtOQ7zkmzeHlpneKKQu2dNVhRie6qCsd
 0rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ycL/xol5LXc1oCnHf2lKepLV8YI7R5oU0gAskKNmHEg=;
 b=hDLtv8Tj14d3RmPK659dfqewufrQS3BUyeWw6C98iz8io1cGdHhdLNWg66NyK+spAh
 oh/AoiKXlf5izw7j0JMtqwRJV8lRCV8Dcba/47/FL5XSiNtSHY7PGlvu91L7K5Fd2bdY
 bJF9at5vOZsqW03cEXSrpIFDoGP2OsSFkp+wIDGXsGuqXc04TRPotUdY6V0hiOdzLubE
 apXxlgpODxMHUJ19D7t3Ty+R8aSjlNdu8FtLKAhKv++rUyRofNFtQzBqIqeUKKlUMZQH
 H8RDrQwrJXFwwZgS0a9EOWiowgoaemnZlYt5Z6U8DTKlrRTlc/IE9ewIDmNzr5XkcB7j
 Y9Jg==
X-Gm-Message-State: AGi0PubPzM4XIypCy/J4J75wiiX/POYY8p37c6fBQNBUhOTiIGu+DuD9
 GpnZb8zjof8PX8VUWRSnxhj69ie5XFs=
X-Google-Smtp-Source: APiQypJh67PJZJCKLabOQpyBwAm1TEQoQ/CjhAvqt2E5lBGcLL5HQluaH1NaN2U1R8Ksxp+nn0C5Xg==
X-Received: by 2002:adf:f1c5:: with SMTP id z5mr38733111wro.100.1588160693203; 
 Wed, 29 Apr 2020 04:44:53 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id z8sm28289847wrr.40.2020.04.29.04.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 04:44:52 -0700 (PDT)
References: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/4] clk: meson8b: updates for video clocks / resets
In-reply-to: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
Date: Wed, 29 Apr 2020 13:44:51 +0200
Message-ID: <1jr1w6iki4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_044455_435780_CAF2B44A 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 17 Apr 2020 at 20:41, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This is the first batch of fixes and updates for the Meson8/8b/8m2
> clock controller driver.
>
> The first patch fixes the video clock hierarchy. Special thanks to
> Neil for providing a lot of details about the video clock tree!
>
> The second and third came up while testing video output on my EC-100
> (Endless Mini). This board is special because u-boot does not enable
> the video outputs like most other u-boot versions do. However, this
> is very useful for development because it shows (the hard way ;))
> where the existing code is buggy.
>
> The last patch is a small improvement for the VPU clock so we
> utilize the glitch-free mux (on SoCs which support it) and avoid
> problems by changing the "live" clock tree at runtime (with the mali
> clock this resulted in system hangs/freezes).
>
> In my opinion all of these patches - including the fixes - can go to
> "next" because the relevant clock trees are still read-only.
>
>
> Changes since v1 at [0]:
> - updated the description in patch #1 to clarify that (it seems that)
>   there is no fixed pre-multiplier for the HDMI PLL (like on GXL for
>   example). Spotted by Jerome - thanks!
> - simplified the logic for the active_low resets in patch #2 by
>   shortening the if ... else. Thanks to Jerome for the suggestion.
>
>
> [0] https://patchwork.kernel.org/cover/11489079/
>
>
> Martin Blumenstingl (4):
>   clk: meson: meson8b: Fix the first parent of vid_pll_in_sel
>   clk: meson: meson8b: Fix the polarity of the RESET_N lines
>   clk: meson: meson8b: Fix the vclk_div{1,2,4,6,12}_en gate bits
>   clk: meson: meson8b: Make the CCF use the glitch-free VPU mux

Applied, Thx

>
>  drivers/clk/meson/meson8b.c | 105 +++++++++++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 32 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43EBC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14F821D79
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A14F821D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wf7dclX12blfSS7pZAVunqFi0gH3HKq4+Ehh0Jur3+E=; b=UQBXAECzocANkS63cvJizS4vv
	R+B7huc/HsGHdGASAsSEU3LWS9+8jbQaxOEkCxLyYujD+2TzAf3Ow/l/Lt6Opu7l2Ffta+TrfNBwq
	ehc793exs0uODzYOxlRb0D4Tj2QFS71hU23uD4VTjWK8p4SeNg5AB70RMHf8QRaQ5/PISGwihR72k
	3nKCnNx7RekFWC4tYoWYdnPve+7Bzl5507biq+pu013AZGvSuRHoyc7DCZbRjvYIg28qkrXOjYjRu
	1k3WA0FAI4WGsSxVSqTA5BzxCKcLAM5XwsLja4bZxZckb5XlkeNahgSnbyx5csDRL1KbNy/8c78BN
	2BFZ8TAMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwOGr-0004RH-6f; Mon, 04 Jan 2021 11:43:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwOGn-0004OE-Qj
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 11:43:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id cm17so27015818edb.4
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 03:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=jsQiv7cqKQrSj23j2G0kt6dWNWQkHHnDW/6TeXSTB6Q=;
 b=vHbUmqWI85jcwU/YZBtf+CTTbe8UempEi5UCoJs0Ja1Q9sTILX4QZpqu0AdrImXUtL
 MDppO3UN6vFDSeERlmX+dvoCNHHbLp+5T4OPwv81x5ogJU+/U4QdWP6AlygXtQ/ohseW
 yCa+l5ewdXhkM4kVwz5N475I7feEFEVPfx5dbq3kfyh2SeAjkCQsWQuvfZ2bgZ3PNl4X
 7Ju/zcZSlVggCQItJEhW5GWud96kKs9fG0FfMpnVw5LK71p6X3Ny+Vf8Wz/J9QhQZG46
 U05gejwRXZePz83QiF9FEw0AC/A3snns++n+9hWMbaDqW6ugm+lJPLwjJJ5nAl8EjHeC
 194w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=jsQiv7cqKQrSj23j2G0kt6dWNWQkHHnDW/6TeXSTB6Q=;
 b=sHixJ1hE4pWoWrhYznrWv9RfNzR0RGS6EI8YJY1VMQtSoe2YDaWFkofE/9ZX/Jn9G1
 HyUuUsYYDYL6ld2Vm74LSYHRFQ296CObLSnlxOj6kcFdTMdvRJZl/a3VdtJ5AlO1sOzc
 5IgSRjopmnuDlc+ji8MNSITpPIt683KTBXl5MgIzWMfHvG0yyNWXGHM0Sibwa5x8dj7Q
 eKRDpYCIwH6rlvVKMXKrad4ald9nhfsMloUAcArBDWPvK0DawnWP1fgUXl+IwnyHwhAA
 A21Nv4XXCL1GBs99549WH2/yikQoISkLkQ1Xlq1Sp8IAPwTvu3932MPXhxHEJaUknoxv
 c4bQ==
X-Gm-Message-State: AOAM530RN/j3Sb7xEQQpOe4GxKFscyns2lcVyUU0g5/rGl2vwyLt0gC+
 QA8exqkL6L+PF1Ym0OSZNs52+w==
X-Google-Smtp-Source: ABdhPJzYKRRnB7KPDJCGg14sKuBusAL0e/wFDhro0DqKxc4vzJIBbCO1KQ8x6pq9q47v9j2Cc12bmg==
X-Received: by 2002:aa7:dc0d:: with SMTP id b13mr70450856edu.170.1609760608380; 
 Mon, 04 Jan 2021 03:43:28 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id f13sm23221758ejf.42.2021.01.04.03.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 03:43:27 -0800 (PST)
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] clk: meson: three small clk-pll fixes
In-reply-to: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jzh1pvsf4.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 04 Jan 2021 12:43:27 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_064329_935856_0F35BEF5 
X-CRM114-Status: GOOD (  16.38  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 26 Dec 2020 at 13:15, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> while working on some changes for the 32-bit SoCs I hit a corner-case
> in the HDMI PLL: there's some rate doubling going. The PLL only locks
> in a specific rate range but the M/N table is not aware of that. This
> means for now (I am planning to fix that) that we can end up in a 
> ituation where the PLL doesn't lock and meson_clk_pll_set_rate() is
> supposed to still behave in this case. So here's three small patches
> for that.
>
> For me it's fine to queue these patches for -next. I am not aware of
> any breakage upstream, only some of my pending patches prefer to have
> these fixes.
>
> Slightly unrelated: if you know anything about that clock doubling then
> please let me know!
>
>
> Best regards,
> Martin
>
>
> Martin Blumenstingl (3):
>   clk: meson: clk-pll: fix initializing the old rate (fallback) for a
>     PLL
>   clk: meson: clk-pll: make "ret" a signed integer
>   clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()
>
>  drivers/clk/meson/clk-pll.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

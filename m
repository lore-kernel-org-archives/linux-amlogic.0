Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098A5C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:40:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA012086C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E3W2iUyl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m6EHyBNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA012086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIlD7VDq+K3cKPBwS2Hs/MOpUs6wYVlao/KtdljNanU=; b=E3W2iUylmNIUlJ
	V2+grCNl9gg9GwnaD0CUXSIWXotOV26Bp7QhLoSdUFUCHTMJZ7zw710FyfMmWsD9pq/KDpitw2z2q
	P4nLOwBQ+W0yY2raq7DyrcqbISva3F3SpGRAvteyvHvzdPLKaXl/ZD3/OmsvLIns/AQ9DfvfZ1bSk
	retfB8cOq4OO18YMxxpBXIGtEOEKS1cdhSEfTjCTIPuBqfTu2QHOLTQ6ZETceCCQxxG8SfKoPpid/
	CQ7jKQ1ABYY69g36Jfx8jjJBVUrSG15JfXK4isFA1TK95LZJgexdCZIRwIsFOZX0PWJ7w8hyFDQQx
	lOsMisEPeb2uJWhfqNLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsUW-0003GW-2f; Mon, 01 Apr 2019 08:40:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsUS-0003ET-Ku
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 08:40:26 +0000
Received: by mail-wm1-x341.google.com with SMTP id r186so1002734wmf.1
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=SP6dtRR4XnBdiX6pYVY4GbOIbGYL0lpRYejuQl03xJ8=;
 b=m6EHyBNnSSUkYUtR23/XjZmIic9axelIbgMEk7IPl1hIbkV9FQZ/yRv+ujdwe64VXV
 NWvSW+OkMcwo+RgYHZkX6fdW9Dwq+P9opHQPelu/0G1OSXQYow+9Iss4nE9YdjSQh/Hj
 dGgPbqUOVarFCKsC8as7jsb10XVg79B4AN+r+Hc35/pzX/7aIS7RKL2PasM2YWotg0Ag
 m2kV5xsWsJ/v1Pjxk57uFur8CQAqK+EsZJNM5zYg6Hp9l80wCol+FclIM0YepAK0S/Ua
 aeEkLxmNTUTZ7seOujwOjmQQxWO1W2xhlJ0h7HdrZzHWHMT8iu6uiLbtiOXyENy7pn+A
 YJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=SP6dtRR4XnBdiX6pYVY4GbOIbGYL0lpRYejuQl03xJ8=;
 b=PE9KDUcLjUHTuA3qI3EALQ2OlHPUjRkYHQxhi9TLqE//OGjqkLoWEdXI7JTOsAlK59
 4AQvFpzHF8Krki3OPdGMyXz5VCQrBU9OaPMRgIYp3WzoBY6Nr1tr02ODlNMHB87lPe6R
 fBTdGJWh7PEVk9sodJD41GmOCyL44x5iIttYNhzYqJRnU2IYxAonKZPvBW0zKyUhBnxj
 DISl56o0x/pWzpE3t9EMN7Z7o3Al0ZajT8/ihYKmuup3X8hwFvQXH+atmpjCaGqe5Qxl
 2BIV6N+HBGDFrXDQBZ0ROjmVmLe4B61HgpIhmlwb0g/0ecq7b1JUhjWIqVoS1w9h806Z
 nhsQ==
X-Gm-Message-State: APjAAAUUsBBE4jivchYZqvV16ZbJYGT9wK4holSU9aHUjQNa3V4zCruj
 BNkloeKEh0dPeTEbp92VVOJsAQ==
X-Google-Smtp-Source: APXvYqzftgbkDH5aDIC8sGZWKMCqOeiwTPMCcCUD4KUuV+cSOmuE4MG/C9OqHLfULsPow1H1Ple08w==
X-Received: by 2002:a7b:c769:: with SMTP id x9mr11364300wmk.103.1554108023014; 
 Mon, 01 Apr 2019 01:40:23 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 q17sm7746726wrw.70.2019.04.01.01.40.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Apr 2019 01:40:22 -0700 (PDT)
Message-ID: <63fc525faf2d82cb2436a17ab2206293aeef6c31.camel@baylibre.com>
Subject: Re: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 01 Apr 2019 10:40:20 +0200
In-Reply-To: <CAFBinCCUrKGPWpTu_u3okaHVfMY4CN5F5qaRcKdTRbg35xrMEQ@mail.gmail.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
 <20190329153325.23869-2-jbrunet@baylibre.com>
 <CAFBinCDnoY41ZcoHqsngR4WTeczkmOu93R=2G_JOXbdUmHSjMw@mail.gmail.com>
 <3bef1bb26e9eff0cfc20cd4bb78a5d7cea4c5076.camel@baylibre.com>
 <CAFBinCCUrKGPWpTu_u3okaHVfMY4CN5F5qaRcKdTRbg35xrMEQ@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_014024_684858_C74454F5 
X-CRM114-Status: GOOD (  25.48  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2019-03-30 at 16:56 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Sat, Mar 30, 2019 at 12:07 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Fri, 2019-03-29 at 20:39 +0100, Martin Blumenstingl wrote:
> > > Hi Jerome,
> > > 
> > > On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > The bit 'SSEN' available on some MPLL DSS outputs is not related to the
> > > > fractional part of the divider but to the function called
> > > > 'Spread Spectrum'.
> > > > 
> > > > This function might be used to solve EM issues by adding a jitter on
> > > > clock signal. This widens the signal spectrum and weakens the peaks in it.
> > > > 
> > > > While spread spectrum might be useful for some application, it is
> > > > problematic for others, such as audio.
> > > > 
> > > > This patch introduce a new flag to the MPLL driver to enable (or not) the
> > > > spread spectrum function.
> > > > 
> > > > Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
> > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > ---
> > > >  drivers/clk/meson/clk-mpll.c | 9 ++++++---
> > > >  drivers/clk/meson/clk-mpll.h | 1 +
> > > >  2 files changed, 7 insertions(+), 3 deletions(-)
> > > > 

[...]

> > 
> > Yes, none of our application require spread spectrum
> thank you for the explanation. can you please add it to the patch description?

I think I described spread spectrum already in the commit description.

> 
> > The fact is that only 2 MPLL had this bit, mpll0 on gx (without effect) and
> > mpll0 on axg: actually spread spectrum impacts mpll2, making it unusable, as
> > explained in the related patch
> > 
> > > based on the original commit 1f737ffa13ef ("clk: meson: mpll: fix
> > > mpll0 fractional part ignored") it seems that
> > > CLK_MESON_MPLL_SPREAD_SPECTRUM should be set for mpll0 (at least on
> > > GXBB and Meson8b)
> > > 
> > 
> > There a patch specifically targeting gxbb.
> I missed that, sorry for the noise
> 
> > I have checked on GXL and this bit had no effect (fractional part still on, no
> > spread spectrum)
> > 
> > So either we fixed something since then or I messed up when doing the patch
> > initially.
> > 
> > Feel free to cross check
> I tried it on Meson8b and it seems that there's no difference. I've
> done a bit of software archaeology:
> $ grep -R mpll_cntl uboot-2015-01-15-23a3562521/ | grep "=" | head -n3
> uboot-2015-01-15-23a3562521/board/amlogic/m8_k100_1G/firmware/timming.c:
>        .mpll_cntl = 0x600009A9,        //2.5G, fixed
> uboot-2015-01-15-23a3562521/board/amlogic/m8_k100_2G/firmware/timming.c:
>        .mpll_cntl = 0x600009A9,        //2.5G, fixed
> uboot-2015-01-15-23a3562521/board/amlogic/m8b_ft_v1/firmware/timming.c:
> .mpll_cntl = 0x600009A9,        //2.5G, fixed
> 
> Ethernet is still working on my Odroid-C1, so you can add my:
> Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

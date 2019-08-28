Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7592C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 08:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9291D22DA7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 08:11:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9K1ST1z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P80buuQW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9291D22DA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUUphsLzCFE5a6ItpMTwS0KAtsgYUlHblvSLE82DOYY=; b=Z9K1ST1zA+rovK
	KFhEaiXgu/ecmbUNwPM3PKCc+228M/BjVLB9KCGYs2bykIb/y0geJ5R9oTYRAxVgswg8XihyFoIm0
	GGn3/makQAiuMRhmNyvPZlHoWkbbkbMliKH4FlwOdbHHn5fPez1JY3ljaWCxHpSu1twW+0VV9fgxd
	hXM1p9QUfv7Ih6TnXx7r0iBvxZM9Ol3ClTA48tujMz+jXuSg36Lgsw8IyfQoDYSGPkD08u34KU7gA
	dvjFqNzxb4stWfZnSRMc1/kqKVmNNqMudd/f4OFzTdBjoIj1sLn3gKHqKC2D/a3TstGaIeQ81hkRm
	1v9fYLOTLf5xmSOJonfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2t3H-0001vZ-7F; Wed, 28 Aug 2019 08:11:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2t32-0001kU-Kx
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 08:11:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id g7so290982wrx.2
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=eqxGNYrdtuK3SqiJCuvuQ/MzG5G751K98+gYpAVutqc=;
 b=P80buuQWsphNP6jREPV9Yws4dRQ7P0oOQLJevgEYYwLT3PHrJvQdpfP7m+z1ZM01SX
 TWLR2nOrqbxu04cjxyj+H2VurQ5K9D/lo0/O75yOHfKlwPEpZx+6Nspl5XSs0Z6aGXTF
 f0QtyxLe9BkWjANhgwOmPIjQ97xARayjbVQpMikUPIeMf/hsWtG+rfkGXFk+q4//IfW9
 gRixhJmfDRLDOMtSkF+qnsNAf58ljCf/dWMYOA57HhwIz9PYKbSejKGuZIECWCYjJtH9
 7kXYTDEnAQfd4Yo1+s0gYpy9i0ESORwXIN6r3mfMTNpNo5GzbRhLAb6RBzOL0dczg+lc
 JF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eqxGNYrdtuK3SqiJCuvuQ/MzG5G751K98+gYpAVutqc=;
 b=JyYc1r5/oaPsSTySBSWHwc9YPd/jftTIgrsocvZUnQHSFaT2U2aSf73Fd1hUFBJfkh
 oO8h5YpcCPqBACMjr8BaXoRfOwfg3m3oz4LeUixsb+Wu9IgQR9AI25FN5wX8S4RhFdnu
 J+LLCv1fndyPnyC8vfmAImheUXwPnWtiSTH8WDr5gkQJVTHoV7I1kwkClEl4TDLcYdqU
 I85zUWSbqNn4rAZtmjvH8BBaqYaXER8MbJAFicYYMVzXCv6TiW8pLPrmRUpjRYBr+mxr
 Axv3lgCQV0GDKze+FcAS23CRemAvL2Dri7upXeLXxGPLoZKTjZ6ib034I9/kiHwjwZuR
 B19Q==
X-Gm-Message-State: APjAAAU8B2YNQGjEZ/aXY5swOuhKyajW10psgK8N2/WXjqJpPPrh0Tv4
 fyy7Cni9zQDZaF3B0QlYG+1Djw==
X-Google-Smtp-Source: APXvYqzwX8FTlhdjUpZFriJLF7P3vR+CknbqtKPsxaLV3l7qvZqJ+ykNQCGzZRQgUdNj9dWbhLJxPw==
X-Received: by 2002:adf:ea51:: with SMTP id j17mr3193282wrn.184.1566979878558; 
 Wed, 28 Aug 2019 01:11:18 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm2668811wre.27.2019.08.28.01.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 01:11:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <7h1rx6uti8.fsf@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
 <1jblwc6wjq.fsf@starbuckisacylon.baylibre.com> <7h8srexw1i.fsf@baylibre.com>
 <7h1rx6uti8.fsf@baylibre.com>
Date: Wed, 28 Aug 2019 10:11:16 +0200
Message-ID: <1jo909ogkb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_011120_690330_3DA0FC01 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 27 Aug 2019 at 15:35, Kevin Hilman <khilman@baylibre.com> wrote:

> Kevin Hilman <khilman@baylibre.com> writes:
>
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>>
>>> On Mon 26 Aug 2019 at 09:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>>> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
>>>> enables DVFS on the SM1 SoC for the SEI610 board.
>>>>
>>>> The SM1 Clock structure is slightly different because of the Cortex-A55
>>>> core used, having the capability for each core of a same cluster to run
>>>> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>>>>
>>>> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
>>>> with a bypass mux to use the CPU0 instead of the dedicated trees.
>>>>
>>>> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>>>>
>>>> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
>>>> G12A only a single version of the SoC is available.
>>>>
>>>> Dependencies:
>>>> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
>>>> 	but is not a strong dependency, it will work without
>>>>
>>>> Changes since v1:
>>>> - exposed GP1, DSU and CPU 1,2,3 clock in patch 1
>>>>
>>>> Neil Armstrong (5):
>>>>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>>>>   clk: meson: g12a: add support for SM1 GP1 PLL
>>>>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>>>>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>>>>   arm64: dts: meson-sm1-sei610: enable DVFS
>>>>
>>>>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>>>>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>>>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>>>>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>>>>  drivers/clk/meson/g12a.h                      |  24 +-
>>>>  include/dt-bindings/clock/g12a-clkc.h         |   5 +
>>>>  6 files changed, 697 insertions(+), 5 deletions(-)
>>>
>>> Applied 1 to 4
>>
>> Will there be a stable tag I can use for that so I can apply patch 5?
>
> Ah, I should've finished reading the list before asking.  I now see your
> clock PR.  I'll use this tag[1] unless there's a different one I should
> use.

I just pushed clk-meson-dt-v5.4-3 for you, with dt changes only.

>
> Kevin
>
> [1] git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

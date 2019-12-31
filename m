Return-Path: <SRS0=Y1av=2V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD0BC2D0C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2019 14:18:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB002064B
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2019 14:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AturwnnM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gdHiHIYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB002064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14pZqLmpSkvSD5g09C1BQZEM3K6dvPSe3GD3sxMJMtc=; b=AturwnnMCMKkaW
	cuvqzBPXgNSulPvKE2dBNXFJSVWT1dBTKqBFQWFV5ZaBSaMa9kqsMKDa6UZSj3d0XdU7GdNtcWw1v
	lW+9XltLK00e1nNqv/dArKvkyLbavtNHZ11y5o6qVg48YMtuJ6/1Gu/ThvwqtnYA8FAKk6M+zvI7R
	7oIsXGM5ikV+U5xAoU1fs55iBe6MS5651wBeauqVB7S+8LCfrMxKiDpn4iUw5mZPAvDNw9zgbum5a
	LnTrWj65VSyDkRe5h8y6oQA8nh5Bu7dPSs0tGDY5W/JE1AiCfqrMjOHqRXj4IWUgF0wuosP180C14
	+mb5Q3Uq/ohN+4pq494g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imILP-0006cm-Jp; Tue, 31 Dec 2019 14:17:59 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imILL-0006bv-Lt; Tue, 31 Dec 2019 14:17:57 +0000
Received: by mail-ed1-x541.google.com with SMTP id dc19so35335116edb.10;
 Tue, 31 Dec 2019 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNs8OlYzsZsgaTVTJ4d2AeZZS0KH6pA84bynm/T8fmw=;
 b=gdHiHIYZpnEpU9UnRF0qMaOQd/vPNh1srUcHFRQTZCCWy/OgG4612UzuYrLW90hbcU
 2FJj3DWjTlw/QQf12H8e3CC54SFF0KaFjGVsRBBNqs2igzCrKfPKjmaTQw1xhMg4C2RI
 LcToOOmbdeMjMXtjfkDCrrqsGdW2YKTbzbrX3FdXCgDbHOW0mqbRjzVRml2FKRHMrykb
 5zLuHok6Hl6e6IgLYSN4hytm1fu9r4EiMxoXmZhdq2g8FNGhpotKcz0rClrK4GD2Ba9i
 bFNpoBS5u4IRNHgVV7BfeDZ/KrFmv2notP1GU+lkSv4N9J+3Dd0fdJYotb6F1oai5FUa
 +W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNs8OlYzsZsgaTVTJ4d2AeZZS0KH6pA84bynm/T8fmw=;
 b=gEPALqGDWg8RiDeb+BafH3iqltCTt0AncEr0VuRGH/lCQFXZpG+4wvEug88/EROw5f
 N2kOb9t5OdwNsYS31sMfxW189MDvLJjZzmLIQ5hVtXrJdyFJ2ZM3LuRvcaqtnoyNbhOV
 zSY+8hVc2hE8LDjNMEGkcvLzjwEIqBGbA2K0G4HhP/DWSQ5qEGtGkU24ffUFM5fmnTdd
 8oKwJbX66U4LRd0xdMw8QgBa5cWTCpbwepG7As6es1uJQa2qCtYOUfo+N94ylOLV9IjS
 /8OXDSrdf7QDhZS4GqNF2Uso5DViMOrmbB7OXIN8tNLzBBz8q/iBOBk0Y0rWf9rk+6Rm
 NpUg==
X-Gm-Message-State: APjAAAUST+gl87xLHiCkcgWJOEh/GSTMLTXB5Z86z/WRJOcKo/LMhIXQ
 NTnYEVn8BRV2l5998G9GhWwzJZBjUOLTlTNB7yw=
X-Google-Smtp-Source: APXvYqwSiePXVoRUw8gJ/sEg4LKPTsG3G7GWxVQyLT4WISsO6zZ4PPra5S6beiWn62LpvYWzUGdJKa4tYfMAlEsF000=
X-Received: by 2002:a17:906:1a50:: with SMTP id
 j16mr70863648ejf.106.1577801873680; 
 Tue, 31 Dec 2019 06:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
 <CAFBinCDs3a8TJcQKgHUkDvssMR6Y2Kys38p50P0q=2KOiDTNHg@mail.gmail.com>
 <fe45f4f8-8c67-ded2-90bf-8d5fd6874876@arm.com>
In-Reply-To: <fe45f4f8-8c67-ded2-90bf-8d5fd6874876@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2019 15:17:42 +0100
Message-ID: <CAFBinCByzLLdVTL0v=eC-TbZQnwnDY7cBLf4jyWq7N4PA1rr+A@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_061755_744102_63BD90BC 
X-CRM114-Status: GOOD (  23.51  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 yuq825@gmail.com, daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Robin,

On Mon, Dec 30, 2019 at 1:47 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2019-12-29 11:19 pm, Martin Blumenstingl wrote:
> > Hi Robin,
> >
> > On Sun, Dec 29, 2019 at 11:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On 2019-12-27 5:37 pm, Martin Blumenstingl wrote:
> >>> Most platforms with a Mali-400 or Mali-450 GPU also have support for
> >>> changing the GPU clock frequency. Add devfreq support so the GPU clock
> >>> rate is updated based on the actual GPU usage when the
> >>> "operating-points-v2" property is present in the board.dts.
> >>>
> >>> The actual devfreq code is taken from panfrost_devfreq.c and modified so
> >>> it matches what the lima hardware needs:
> >>> - a call to dev_pm_opp_set_clkname() during initialization because there
> >>>     are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
> >>>     the GPU so we need to control it using devfreq.
> >>> - locking when reading or writing the devfreq statistics because (unlike
> >>>     than panfrost) we have multiple PP and GP IRQs which may finish jobs
> >>>     concurrently.
> >>
> >> I gave this a quick try on my RK3328, and the clock scaling indeed kicks
> >> in nicely on the glmark2 scenes that struggle, however something appears
> >> to be missing in terms of regulator association, as the appropriate OPP
> >> voltages aren't reflected in the GPU supply (fortunately the initial
> >> voltage seems close enough to that of the highest OPP not to cause major
> >> problems, on my box at least). With panfrost on RK3399 I do see the
> >> supply voltage scaling accordingly, but I don't know my way around
> >> devfreq well enough to know what matters in the difference :/
> > first of all: thank you for trying this out! :-)
> >
> > does your kernel include commit 221bc77914cbcc ("drm/panfrost: Use
> > generic code for devfreq") for your panfrost test?
> > if I understand the devfreq API correct then I suspect with that
> > commit panfrost also won't change the voltage anymore.
>
> Oh, you're quite right - I was already considering that change as
> ancient history, but indeed it's only in 5.5-rc, while that board is
> still on 5.4.y release kernels. No wonder I couldn't make sense of how
> the (current) code could possibly be working :)
>
> I'll try the latest -rc kernel tomorrow to confirm (now that PCIe is
> hopefully fixed), but I'm already fairly confident you've called it
> correctly.
I just tested it with the lima driver (by undervolting the GPU by
0.05V) and it seems that dev_pm_opp_set_regulators is really needed.
I'll fix this in the next version of this patch and also submit a fix
for panfrost (I won't be able to test that though, so help is
appreciated in terms of testing :))


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

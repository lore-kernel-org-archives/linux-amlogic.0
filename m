Return-Path: <SRS0=4IOV=6L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878C6C54EEB
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 19:31:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614E3205C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 19:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="It3PF6rK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VAfe08Bf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 614E3205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDqm2gvvtyuY43pSjGqyJALe77UpgzvpAPixBmJOHyU=; b=It3PF6rK29pJis
	c15XkYrjXUksIjuUFZCTLYlxLjtHloMVOuc/exZmTaTNojzQylhbcY1iERjsItb1QScUsevpBse1X
	xYiDYhW/e16e7CwCpgPtql8ST8Z2511hHA1frCpsJVoQdC2SPNF1n5/FVw/3Q5TolHipTlI4ImhMj
	SEO5KVS/xW5Li8vGWbODXmSjppMKqh69zTY56fEsDCmpniXOw6N2hBhFyejW6kEYacBqh5Vci33B1
	IkWFXeY5QRFScD7vYt8/nqaPhUyZXb8pX75ciYBpZqCWXxVv4RIMQSdtfkWKoBjn2+aRJZWmQFqZf
	lj9usivsX097qN3NSiOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9TY-0002cm-FZ; Mon, 27 Apr 2020 19:31:32 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9TL-0002RB-0t; Mon, 27 Apr 2020 19:31:20 +0000
Received: by mail-ed1-x542.google.com with SMTP id t12so14453945edw.3;
 Mon, 27 Apr 2020 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCBHygv2Dz+zd+RKARK5K2miMNYjk565u4hnFpBMvlI=;
 b=VAfe08BfrA1Ts8YeU6qdFauAw/FLbzlElIcsPCrEesK+v/47PeU9ndhqzfCOU4c8zb
 SOMm+seRIfUVRMnBGCmDHKbdUhEcs2KIsIoKsTg//vmAWez0476KZQFd3qulfSbq1/a2
 hYkWJxzov7yXvJYiu/B3x0MdHd5peO36/Qf1O246U5YG2AUtymDGxGNcGCLSdn1az12B
 urZzNVEDGuTXRUDhHqgGvkAxOfR1ZmNVc5YWUSQQ48UZNFUbUlmiyiD1LjE6S9RoYtye
 5jON7spJZUBz5mxVGGUEQfh0hfXLY6gWQnFi18XZkz4Pqsj9cd+sino6Zd3YAqJOkT9t
 Kk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCBHygv2Dz+zd+RKARK5K2miMNYjk565u4hnFpBMvlI=;
 b=o66zxHauRDqJ6qlpfGnoQpyPPjKT9BO9Mg1FVXRRSJ2e6syBGX1QjPPqUCh8cVppQT
 wXjXteDUwZN94xFbw8dhl5orRUEB58GGHzqhdjiJQLB97z+J6OJNygTd9dJTrTzFu4s4
 rWRBK4TdSfS7j98WAhXW4dQ/zCgyDv9MsBlUMFtDXrO6e3t/PkCaWmw5RNLszAW1ROQo
 A9IPPTTjBwhhX6Tp2g9CN9kx+sitzffGEbCu5HLOZEKbuHE/8Vp/1tqh6wt1saRFKydD
 ZpOmHHt/3yLvqcu6B/9p+ZhRJLnP24te/HiKuX1avhGCNyXjbiCd8ZU8ZgpMddO54qoW
 q3Zw==
X-Gm-Message-State: AGi0PubGWydLmy4aQNDwSOCfhZv3NBVX/hhCKHRcPeBHGWfS4qMmCY1m
 YX4sdf1CPnqmFQzuZnQArAMOCQVo81fECh/19RI=
X-Google-Smtp-Source: APiQypIJfTQsCgvehtZ278338B1P8XoCCOZdJgf9HibFmV04ATXeExxGGygEU3y4vpwfiwUWn6qtGWILmY7bDmXM+XU=
X-Received: by 2002:a05:6402:1d15:: with SMTP id
 dg21mr20520944edb.13.1588015877271; 
 Mon, 27 Apr 2020 12:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <1jblnd2tp3.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCDzNw6nV3oBJs6C0sssW61GERBXq39DCM22BT9zS8M31A@mail.gmail.com>
 <1j8sig3mi3.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFrYNmCtX3KHaE1vw4rT45WdsUWKqOaJ43rJCKwsnY4PCQ@mail.gmail.com>
In-Reply-To: <CAPDyKFrYNmCtX3KHaE1vw4rT45WdsUWKqOaJ43rJCKwsnY4PCQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Apr 2020 21:31:06 +0200
Message-ID: <CAFBinCDPkdRF4RJ+AL0TvjKzxJ4YP_D4XmGg1dp4LmtRyL-o8A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Amlogic 32-bit Meson SoC SDHC MMC controller driver
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_123119_064729_9EA23161 
X-CRM114-Status: GOOD (  28.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 lnykww@gmail.com, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ulf, Jerome,

On Mon, Apr 27, 2020 at 8:36 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Jerome, Martin,
>
> On Mon, 27 Apr 2020 at 18:46, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> >
> > On Mon 27 Apr 2020 at 18:23, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> >
> > > Hi Jerome,
> > >
> > > On Mon, Apr 27, 2020 at 10:56 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > [...]
> > >> > Changes since v3 at [3]:
> > >> > - split the clock bits into a separate clock controller driver because
> > >> >   of two reasons: 1) it keeps the MMC controller driver mostly clean of
> > >> >   the clock bits
> > >>
> > >> If the register is in the MMC controller register space and the MMC
> > >> driver is the driver using these clocks, it is where the clocks belong.
> > >> I don't get why it could be an issue ?
> > >>
> > >> Is the clock block is shared with another device, like on the Gx family ?
> > > no, it is not shared with another device (to my knowledge).
> > >
> > >> > 2) the pure clock controller can use
> > >> >   devm_clk_hw_register() (instead of devm_clk_register(), which is
> > >> >   deprecated) and the MMC controller can act as a pure clock consumer.
> > >>
> > >> Why can't you use devm_clk_hw_register in an MMC driver ?
> > >> Unless I missed something, it is provided by clk-provider.h, which can be
> > >> included by any driver.
> > > indeed, I could use devm_clk_hw_register in the MMC driver.
> > > Ulfs concern was that a lot of code was needed for managing the clocks
> > > and I agree with him. so this is my way of keeping those details away
> > > from the MMC driver and have two separate drivers which are better to
> > > understand overall.
> >
> > Martin, Ulf,
> >
> > I understand that CCF code might seems verbose and I'm happy to help
> > review it if necessary but I don't think every driver out there should
> > register some kind of fake clock controller driver everytime they wish
> > to use CCF API.
> >
> > Yes the it might make the driver code cleaner but the overall
> > architecture is harder to follow.
> >
> > CCF was made so driver from any subsystem *may* use it. Creating a
> > controller for a single register is overkill. The HW architecture of
> > this particular device does not justify it.
>
> I fully understand your point and I agree with it.
>
> If I recall correctly, my point in the earlier review phase was that I
> wanted the driver to be nicely split into a clock provider part and
> into a mmc host driver part. I also raised the point of using
> devm_clk_hw_register() rather than the deprecated devm_clk_register().
> I still think this makes sense.
>
> That said, perhaps a reasonable split could be to have two separate
> c-files (one for clock provider and one for mmc host), but both in the
> mmc subsystem.
I'm fine with that - I'll do that in the next patch version
I believe the amount of changes will be small because the clock driver
already uses devm_clk_hw_register()


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

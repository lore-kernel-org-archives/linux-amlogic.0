Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD5BC11F67
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 01:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC2C613DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 01:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC2C613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vurF3gYCLt5EtWJtdP5tTezJr6kmnPVNilvvUlg1PSU=; b=3bEfLtNES9cSQ3
	xdNfM3DLNa3JAcs5V5GPsAEfI188LqTLTKImfVOK5KGifu48yuso3y7Huw6t/IDvu+zxdqAZFPNha
	mrHTtnxweX2ozv537O2iZjmgErhnM2bg+C7V53lZ6Mofr94Xlw5cZounXB4pnZIpEXEBoytGFhDe5
	veE6oXhjagW0GZ+sYta9u84+CmbdvcHK4w9kh8BUHflGWORibX/xeAX57MaoxE/A/pUZvB1/gxfPP
	cVFMBiCNptOIorQaqTAN8LX74ezvsrSXjK4EcjMX73go1nGbs2r57U1+w49zguqeCRjDEJGsa8ZM9
	DMjJfK+2LQFWDy4apNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz7Zz-001huk-12; Fri, 02 Jul 2021 01:02:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz7Zv-001huA-OM; Fri, 02 Jul 2021 01:02:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56034613F7;
 Fri,  2 Jul 2021 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625187767;
 bh=CfWIpKKl303hREJ4X2i7un5cOC2KayhRK9260oHQV8A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YjLchiU5GDhN+13sDWf/CKHa3aZ/tbC4/M6tx6AYgjipkBynVAQik51CBFKZqthtN
 b1cH19kUEHXu3lKoofZdjcdxxM+tOg6jAElNbvwzCw+mHTxbY96yFIRKnFewsaNkT8
 WYnUlM/gGj0V8q5+QKu1pgUjCD5SaeF4wvS/cS2jUU9Bje02wuLcAeySVQcAh/8NKb
 jwf1y8/nu9NUxivFGIUeonPBKDLYXupjs1l2gwVwQ2Ucgj+KWEXzFu0As/UF5Uxbp8
 iD+TnD2iOsnW1ZPKVoNe/GLj0piTJQ1snOUGqD3F8vvB5ycaGMIt7skWXf4FeMZXnN
 NkFFIRsfYtW8Q==
MIME-Version: 1.0
In-Reply-To: <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 01 Jul 2021 18:02:46 -0700
Message-ID: <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_180247_854036_A738B6FC 
X-CRM114-Status: GOOD (  20.60  )
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

Quoting Martin Blumenstingl (2021-07-01 13:57:28)
> Hi Guenter,
> 
> On Thu, Jul 1, 2021 at 10:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> [...]
> > [    0.000000] [<c07be330>] (clk_core_determine_round_nolock) from [<c07c5480>] (clk_core_set_rate_nolock+0x184/0x294)
> > [    0.000000] [<c07c5480>] (clk_core_set_rate_nolock) from [<c07c55c0>] (clk_set_rate+0x30/0x64)
> > [    0.000000] [<c07c55c0>] (clk_set_rate) from [<c163c310>] (imx6ul_clocks_init+0x2798/0x2a44)
> > [    0.000000] [<c163c310>] (imx6ul_clocks_init) from [<c162a4e4>] (of_clk_init+0x180/0x26c)
> > [    0.000000] [<c162a4e4>] (of_clk_init) from [<c1604d34>] (time_init+0x20/0x30)
> > [    0.000000] [<c1604d34>] (time_init) from [<c1600e0c>] (start_kernel+0x4c8/0x6cc)
> > [    0.000000] [<c1600e0c>] (start_kernel) from [<00000000>] (0x0)
> > [    0.000000] Code: bad PC value
> > [    0.000000] ---[ end trace 7009a0f298fd39e9 ]---
> > [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> >
> > Bisct points to this patch as culprit. Reverting it fixes the problem.
> sorry for breaking imx6 - and at the same time: thanks for reporting this!
> 
> Do you have some additional information about this crash (which clock
> this relates to, file and line number, etc.)?
> I am struggling to understand the cause of this NULL dereference
> My patch doesn't change the clk_core_determine_round_nolock()
> implementation and the new determine_rate code-path (inside that
> function) doesn't seem to be more fragile in terms of NULL values
> compared to the round_rate code-path.
> Instead I think it's more likely that the problem is somewhere within
> clk_divider_determine_rate() (or in any helper function it uses), but
> that doesn't show up in the trace

My guess is that we have drivers copying the clk_ops from the
divider_ops structure and so they are copying over round_rate but not
determine_rate.

> 
> I don't have any imx6 board myself and so far I am unable to reproduce
> this crash on any hardware I have.
> However, if it's a problem in my clk-divider.c changes then I'd like
> to find the cause (ASAP) because possibly more SoCs may be broken...
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

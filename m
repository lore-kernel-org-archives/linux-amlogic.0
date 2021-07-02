Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6DEC11F67
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 00:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F36F6140A
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 00:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F36F6140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AblW2DYPoCQcAlnIkQgNNhgI29SsFAY5on8F8uSltN0=; b=cB2vxjFl6c+U4d
	E7LGAjUaSDTxDS7jo4sjMndtM2RM2KrtT9sJjthDSuQwAz8fgG5tCU/jbLrboY44b+eD66v3w2ack
	DtSdQ1oZVSydtxTB6MlfyF2R1XAhucH8Pv4Ac8SXlr1/N330iKi7xGEr2g9CxahBpA/jbWLIUBcj0
	HVvCYDrM8wLQUq402Qobuhp0dha5Bgf+it4riRBW2WNHxOqwlZgAflMq0TacijH8fLyqXT8y21k+9
	PWa4te7Mc/oh77Ua43Se8QVjBerX8s0ueu8Jz0wYKmqnTR9uRgJFxGJnz6YryXFvZ/kHb5tN2Ndg5
	IOIPajwI5AQiEpY1M1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz7Qr-001fWO-Pr; Fri, 02 Jul 2021 00:53:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz7Qn-001fVn-M6; Fri, 02 Jul 2021 00:53:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A49DF6140A;
 Fri,  2 Jul 2021 00:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625187198;
 bh=hOxydK9lrZm1tCUuGvVtxlJm6pqPnLt4Q3e8u+eW+0o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lXic832EbDrfONeY+FbNtkCmiW2k6d7NqRznrL1mf8g4SnHl0OTjSWD4vunYeqB1I
 3YX7oDuMoMuV0PVVIG+0qatCK8HJ9L+wXUWAKXAKAE4KAdLQK3KIV4w4wpuhwI21Um
 HFWuMWzFY1QDQksSjoZjlhUciC+daaEsWFCbH/rJfU428V9t5UdkUK5cX3nCPTwx8M
 MYoXjJlNrKz2dpGfLzo7z8d3M5CA8Ag5WIwx/vL7bTiis3Fl8+FGUzS53EQZsVU0ml
 jNKC7zqsDqEn+i0E2v41DRDP9qegW0zV5PjodVkRKGX3+YHEt/SbB6njVABV0Nuk8I
 GLGGjjnDcOysA==
MIME-Version: 1.0
In-Reply-To: <7a06cfaf-4cae-5c4c-edff-16d6406a1b6c@roeck-us.net>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
 <7a06cfaf-4cae-5c4c-edff-16d6406a1b6c@roeck-us.net>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 01 Jul 2021 17:53:17 -0700
Message-ID: <162518719742.3570193.6252446967177529304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_175321_798613_B82D4435 
X-CRM114-Status: GOOD (  26.37  )
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

Quoting Guenter Roeck (2021-07-01 14:43:29)
> On 7/1/21 1:57 PM, Martin Blumenstingl wrote:
> > Hi Guenter,
> > 
> > On Thu, Jul 1, 2021 at 10:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > [...]
> >> [    0.000000] [<c07be330>] (clk_core_determine_round_nolock) from [<c07c5480>] (clk_core_set_rate_nolock+0x184/0x294)
> >> [    0.000000] [<c07c5480>] (clk_core_set_rate_nolock) from [<c07c55c0>] (clk_set_rate+0x30/0x64)
> >> [    0.000000] [<c07c55c0>] (clk_set_rate) from [<c163c310>] (imx6ul_clocks_init+0x2798/0x2a44)
> >> [    0.000000] [<c163c310>] (imx6ul_clocks_init) from [<c162a4e4>] (of_clk_init+0x180/0x26c)
> >> [    0.000000] [<c162a4e4>] (of_clk_init) from [<c1604d34>] (time_init+0x20/0x30)
> >> [    0.000000] [<c1604d34>] (time_init) from [<c1600e0c>] (start_kernel+0x4c8/0x6cc)
> >> [    0.000000] [<c1600e0c>] (start_kernel) from [<00000000>] (0x0)
> >> [    0.000000] Code: bad PC value
> >> [    0.000000] ---[ end trace 7009a0f298fd39e9 ]---
> >> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> >>
> >> Bisct points to this patch as culprit. Reverting it fixes the problem.
> > sorry for breaking imx6 - and at the same time: thanks for reporting this!
> > 
> > Do you have some additional information about this crash (which clock
> > this relates to, file and line number, etc.)?
> > I am struggling to understand the cause of this NULL dereference
> > My patch doesn't change the clk_core_determine_round_nolock()
> > implementation and the new determine_rate code-path (inside that
> > function) doesn't seem to be more fragile in terms of NULL values
> > compared to the round_rate code-path.
> > Instead I think it's more likely that the problem is somewhere within
> > clk_divider_determine_rate() (or in any helper function it uses), but
> > that doesn't show up in the trace
> > 
> > I don't have any imx6 board myself and so far I am unable to reproduce
> > this crash on any hardware I have.
> > However, if it's a problem in my clk-divider.c changes then I'd like
> > to find the cause (ASAP) because possibly more SoCs may be broken...
> > 
> 
> I don't have such a board either. The problem shows up in my qemu boot tests. See
> https://kerneltests.org/builders/qemu-arm-v7-next/builds/38/steps/qemubuildcommand/logs/stdio
> for an example. The problem reproduces with qemu's mcimx6ul-evk and sabrelite
> emulations.
> 

Would be great if we had some kunit tests for the divider code. No doubt
it would have caught this. I think for now I'll just drop this patch
from clk-next. Thanks for testing.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

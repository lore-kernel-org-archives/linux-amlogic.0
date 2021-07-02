Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90B8C07E95
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 20:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8732B60E08
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 20:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8732B60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Awwdvp/R1z5n2cXDv3zDKuKQTHqvEc6zf/967yGfbnA=; b=c0XdKERRhz/BGE
	baGndI7YhpPrz3XF98ml0/UbUeuVCXUn2HQB1xV1WAxr5V9gD4Jjr/usBdaK4wgc6/Upyl3pqFQm8
	knWr8JvI/mKEfQSyTbO0YwuYRKbuvX/AsvVryEWteTrNj+lMww4LaQeHQJ+Vn1B72saG6PrsBWb3a
	//DnvqzRodAhVhDOO1CzcP7Ejaow7U26AE9WwN2CIYEtqgPDwdzrrpNg1YcjVocoHnyX0CXFsooFD
	lGXkuvkv8p2whCmgNQB6LuPZKEK5PolFu7y021TGY/YrXopr1Q9FcfZs2H9zUKxFjToR4/qPbImB5
	r6giIFlk22FKymDT5qNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzQFn-0042z0-Nz; Fri, 02 Jul 2021 20:59:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzQFk-0042yS-E3; Fri, 02 Jul 2021 20:59:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F4F1613EB;
 Fri,  2 Jul 2021 20:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625259551;
 bh=Ls60RX1571idIce45U8CLpSNiuxtIk6tUPerE3Q41Eo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=FfUTkZL9BWNlcdfcEF60jjkt0s6tNk4MtpFj1RIiL2uFJ2Vqu1klVyqGcSYYMqYtf
 ONTmjqa8a38F/ExsbJuHgdCXaAbUu6WmfudZAHDu4gs4XWyoesOqmaKzXfjItu/2/4
 f3+X13KwtGS9MLqPfqPuIyikVBr+6RVYZQNLkhlRHTF/Gb5WTMhZUtkXC/OzVSEVVM
 FODHOtz1uFht9goJuP8negMV3VW/h387QRtYBlcA85oN+1MOHysk86CVmkhSNIDJK3
 /lAHMwDQDUg9EVDsSRZqJ5Tj/35NQqmGjZdWojO8k3BYoug65d/nxjOhVmh8fwQQ3M
 sxwOXeJUuM7Lg==
MIME-Version: 1.0
In-Reply-To: <CAFBinCAASQUB=cg5EFsBQ4jd3TvcCJzV1=sYJci4ibR7FjRcww@mail.gmail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
 <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
 <CAFBinCAASQUB=cg5EFsBQ4jd3TvcCJzV1=sYJci4ibR7FjRcww@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 02 Jul 2021 13:59:10 -0700
Message-ID: <162525955027.3570193.16463056788252699243@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_135912_549531_036108A2 
X-CRM114-Status: GOOD (  18.65  )
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

Quoting Martin Blumenstingl (2021-07-02 02:19:37)
> Hi Stephen,
> 
> On Fri, Jul 2, 2021 at 3:02 AM Stephen Boyd <sboyd@kernel.org> wrote:
> [...]
> > My guess is that we have drivers copying the clk_ops from the
> > divider_ops structure and so they are copying over round_rate but not
> > determine_rate.
> I just learned something new - thanks for investigating this as well!
> 
> $ git grep "clk_divider_ops\.round_rate" drivers/
> drivers/clk/bcm/clk-bcm2835.c:  return clk_divider_ops.round_rate(hw,
> rate, parent_rate);
> drivers/clk/clk-stm32f4.c:      return clk_divider_ops.round_rate(hw,
> rate, prate);
> drivers/clk/clk-stm32h7.c:      return clk_divider_ops.round_rate(hw,
> rate, prate);
> drivers/clk/clk-stm32mp1.c:             req->rate =
> clk_divider_ops.round_rate(hw, req->rate, &best_parent_rate);
> drivers/clk/imx/clk-divider-gate.c:     return
> clk_divider_ops.round_rate(hw, rate, prate);
> $ git grep "clk_divider_ro_ops\.round_rate" drivers/
> $
> 
> Changing these over to use clk_divider_ops.determine_rate doesn't seem too hard.
> The part that I am not sure about is how to organize the patches.
> 1) amend the changes to all relevant drivers (from above) to this patch
> 2) multiple patches:
> - adding .determine_rate to the default divider ops (but not removing
> .round_rate)
> - a single patch for each relevant driver (from above)
> - removing .round_rate from the default divider ops
> 
> Another approach is to first create clk_divider_determine_rate() (as
> done here) and export it.
> Then I could have one individual patch for each relevant driver (from
> above) to use:
>   .determine_rate = clk_divider_determine_rate,
> Then finally I could remove clk_divider_round_rate() and switch over
> the default divider ops to .determine_rate as well.
> 
> Which way do you prefer?
> 

I'd prefer we leave round_rate assigned in clk_divider_ops and
clk_divider_ro_ops but then also assign the determine_rate function. We
have some duplication but that's OK. Then make individual patches to
migrate each driver over to the new clk op.

We could stack a final patch on top to remove the round_rate function
from clk divider.  Unfortunately, if some driver wants to use round_rate
then it will fail in interesting ways. Probably best to live with it
until we decide to drop round_rate entirely. Patches to convert all the
round_rate code over to determine_rate would be welcome in the meantime.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

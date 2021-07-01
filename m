Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA21C11F67
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 20:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5A8613F4
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 20:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5A8613F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSLENOxD7cKCY7ZP1GIX9lJRO9utJDL589vstmtJo98=; b=sik52Q5w5rnG2D
	/ucFCL6fQexoyMh8ZXHoerE+59pOYIk+EPJco8aAJintzJx4FQJuV6ww9OXerutZO6GqnpenAG2RT
	VWQNC1vJVTgNzuVRSRdiZeNmapD2z7mhjq8xGC9MiS0qx9V70GLu8ve0MaUIBpT+kxs7xH++uTFUS
	IFSduRaM0djOTzUJiJ5wM8NeEb/iMPTiLjnSLOBKduHLvIpubOuAuvA4Lbf8L2MCPZ6wvZoXV89Wp
	vLBtOgsZO/zmFmvePAvFST5Ld8gQowX8qWKU+0hW0VlrOpTj34LIG5XksymJW0aq5P7N0BoWHheM5
	Aq0cnSqxRsh5L+2MahAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz3kn-0019lZ-UI; Thu, 01 Jul 2021 20:57:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz3kl-0019jF-1I; Thu, 01 Jul 2021 20:57:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id x12so10296890eds.5;
 Thu, 01 Jul 2021 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VP2Ta3q4Jb5bQwDLseeiEQMAjQJRQEWeQWwTkmKx76w=;
 b=oFhKI2MluGQ+1JEDG+4WRkFCVYSvgWmO2VdGPZACvIvnMtFoBQgspl2ad58ZMjJV+W
 ETLgvMSdz/PERb15fCCBpqIZedtpqGW0INO/6KtOcswUhQRRPkbC6dwdUgvdikgiGmTx
 koMzO50VYzCzdm70ANUenku2hdL3KQZuyqEo7Anzl1oHy5ZhsiVyCnPZ9GXdmp4z2Zk0
 s4Z3c7XoW+QEMEvEEPKLCXiZk7kZOjJ9tKt/ag2ZGCPA2SJzR6MVokWbMY24BXMDfPUe
 D1lPAOqzBqNk2eMIT0UEDZP8askASHnnoUqlNqrsmlqn+MJLkO2KBwMcdiGPoQNo3RAz
 Rsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VP2Ta3q4Jb5bQwDLseeiEQMAjQJRQEWeQWwTkmKx76w=;
 b=dKjkkbo46L9+5d9AKs2HWNgUtidP5oiqKHB2TP8+GEw8bFCeVAUtId2DC3XYoYvf6K
 9BiJnpHL944Aiiz+CRoDmmxNKFnfHvRmo6a61FN33RmHQiI4cmBElAZrVWKESEUAtNE5
 0mg1IJylL1Z/B8rGoroUp1k9Yew4pql37T3bGnLff0daRzWBdJ6CBcDrDJiYLUIYX6Ia
 1kkS1+nttUpon/wVsXUnFcWa62XVO9lzcRFJyAye3//2W/TsQ6+iH4pIuzqEuW86GwCV
 mT8Q3xpRXvi7WJebwhjoQkNLOVA8FAneHhyT+lRbHUqnxaGfeYVoFhIKqnhTyEb5XcMx
 Yssw==
X-Gm-Message-State: AOAM531ZK2WYyeaHsdbQ4O+j7lI69UUHSM0gzILcMdvtfUdq4Scl7CS2
 REm5SC0/D0+P2mJi4zz9t8G7MOug1/bav0q68fE=
X-Google-Smtp-Source: ABdhPJz058h3NcfrAlPBkFZPCdJ8Yg2KK8FXz3FF0CRf4Elqcwf033TfCCNu9O9waMMBHAjYk8tHzNXd+/uDHMhwPJE=
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr2238223edd.179.1625173059565; 
 Thu, 01 Jul 2021 13:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
In-Reply-To: <20210701202540.GA1085600@roeck-us.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Jul 2021 22:57:28 +0200
Message-ID: <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
To: Guenter Roeck <linux@roeck-us.net>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_135743_144186_4A8AA253 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Guenter,

On Thu, Jul 1, 2021 at 10:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
[...]
> [    0.000000] [<c07be330>] (clk_core_determine_round_nolock) from [<c07c5480>] (clk_core_set_rate_nolock+0x184/0x294)
> [    0.000000] [<c07c5480>] (clk_core_set_rate_nolock) from [<c07c55c0>] (clk_set_rate+0x30/0x64)
> [    0.000000] [<c07c55c0>] (clk_set_rate) from [<c163c310>] (imx6ul_clocks_init+0x2798/0x2a44)
> [    0.000000] [<c163c310>] (imx6ul_clocks_init) from [<c162a4e4>] (of_clk_init+0x180/0x26c)
> [    0.000000] [<c162a4e4>] (of_clk_init) from [<c1604d34>] (time_init+0x20/0x30)
> [    0.000000] [<c1604d34>] (time_init) from [<c1600e0c>] (start_kernel+0x4c8/0x6cc)
> [    0.000000] [<c1600e0c>] (start_kernel) from [<00000000>] (0x0)
> [    0.000000] Code: bad PC value
> [    0.000000] ---[ end trace 7009a0f298fd39e9 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
>
> Bisct points to this patch as culprit. Reverting it fixes the problem.
sorry for breaking imx6 - and at the same time: thanks for reporting this!

Do you have some additional information about this crash (which clock
this relates to, file and line number, etc.)?
I am struggling to understand the cause of this NULL dereference
My patch doesn't change the clk_core_determine_round_nolock()
implementation and the new determine_rate code-path (inside that
function) doesn't seem to be more fragile in terms of NULL values
compared to the round_rate code-path.
Instead I think it's more likely that the problem is somewhere within
clk_divider_determine_rate() (or in any helper function it uses), but
that doesn't show up in the trace

I don't have any imx6 board myself and so far I am unable to reproduce
this crash on any hardware I have.
However, if it's a problem in my clk-divider.c changes then I'd like
to find the cause (ASAP) because possibly more SoCs may be broken...


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

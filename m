Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7182C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9886261445
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9886261445
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6FrSdqqYcMM8wEdFAKkKZWfvxQfGMjYtjxVK2lJj7Tk=; b=mk0DzV6t9o2hNmJ7ZWLN9j8l7
	ggetIt/+dYBbIwCMNF9Inr6BVrQ+qA5q5sbVhvC7JuS2mXS+nsmvqQoePrjj3nUYpgy1VpLpPtE9x
	umXjOnWoFrSaDCMbHhlhacwR5TIUSVd5M7N8X6GuATTdIV6DocIpWGmbVPLrxu0R5iwZ0p3O/b/Em
	kGhXb216pTITXDvN+MrhVz8WjqzCi0chrm4TEcxuaWJpCF55IAtz2J6sHYgqIrJNWeCPpGnO+23rG
	wdK9kwFF9lBxWtr87eMfwcs1VAzGU2kDg8YOUSOs6y9PvvDq5o+GawzPnsR/aJApjLpICUB9h6LTB
	NWKyNmapw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2qC-005QTN-48; Thu, 29 Apr 2021 09:20:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2qA-005QTB-7a
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=OEnZFH+XYmfSP7g7WH0QI8W4ZYWs8ZUaoUGB+JuAxoM=; b=NhemniIplrK87u8fCXC9A2q41T
 oxwDG2vMbWc8BWMC+g4TRO8qgO7hkFt+tb+yowubGwOy1tpQPEZAGIPkog8wJ7F5oKuijflGZ4OmP
 RE1IsnZkOERsMnitolgZV6MCwI9BbnWSSLlTGSRONiP1Tse7zq1QnSV2gakWJHaDj3UghgmR5hIcl
 oQykZrFbLRU/AZX1jsp6H1BeCKY2QPH7JyZbwNYxXqCA+aSbo5TR188kPqjbzGcxjtXNRzes0rH6C
 JtTpxswbwtRl+4VFjSc0etdU5tT7GRq1XjKUd+KzuETi1J/xAHKrbYFgBR+6oaush3+zynW4MvpeE
 bGsHbCew==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2q7-000WJU-4Q
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:20:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id a4so66120950wrr.2
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OEnZFH+XYmfSP7g7WH0QI8W4ZYWs8ZUaoUGB+JuAxoM=;
 b=Mm8xR36UEWJ6cS/XVCZAg06SJ8bVoGQwtegzm0Efe0KzMFiqiX58kizt5BxUCmAct1
 XNcx+mGKGlXGphDHdUG4u/f2it6Vn0QuWvYK52mYMVvDbtQGyOXAKbaGxcHfGISAg3Yh
 DeMttCvju5ZPiLWDNPvmxPqUzqM0QLYWmpiXtLFI0PT6tTLnXTnhUuQX3as6ClQmDFru
 jHiW5g7K8RvY8fTwdXhzC7ssqkEawqN7kie2i3PfCf+Ps82jEl6QCwTk9XV7NOvpJLDq
 OmtPqH8d98UaaR3ll3mvCB5dyZ8ZODNFu1nwAm8ueqcb+Z7VoPhrLiMWVx/2xk2838IP
 Ncfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OEnZFH+XYmfSP7g7WH0QI8W4ZYWs8ZUaoUGB+JuAxoM=;
 b=Vv/2+HHUilHT64oQM6IKutV6ArHuJJXSM5Hf1Bn7k66kPikIVOIqPjkmn7NEfiozZ3
 ke93H0wGPyOx6itBwV1rb+cb/osNLSfGJ6r9ofursTz8bGhvEvH57dGjts0j5jKcw2hE
 vf25V+xcWMV7kdPjC6SWZb2+w9TiPFRRrE9GlITueRLIfMGvLvs9F+TQ6eja84Qy+Kkk
 8C8ybeJZxNWfbv4IxDra3/KHFcioVQCKn2NGN7JH+GAAU4EBlKwW5p8itfGPADRDo879
 npZyA7inhPXr1SWTMck6SSLMlDHhKGWsv6+ZiGg+ikNswsYuWnha7IbiQcLo1npp/7ZY
 Wo3g==
X-Gm-Message-State: AOAM530QwoGQE+xUYjP5wCXe/0k2IA1Eg8ApoeFD8W2x1bassHbP23el
 OuhhdT7DAGc4Tv/snHHBe//1NQ==
X-Google-Smtp-Source: ABdhPJy1DesDcdMTDcl1IHz35cNr7g3mrtoEBR2y4NzPLkd9a2ncVF1iU/HEFWmsMvhhTTteYlUoQQ==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr28892118wrt.14.1619688001872; 
 Thu, 29 Apr 2021 02:20:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9?
 ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id a9sm3960823wrw.26.2021.04.29.02.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 02:20:01 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210429090325.60970-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
Date: Thu, 29 Apr 2021 11:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429090325.60970-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_022007_215551_0E16683C 
X-CRM114-Status: GOOD (  27.63  )
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

On 29/04/2021 11:03, Jerome Brunet wrote:
> While some SoC samples are able to lock with a PLL factor of 55, others
> samples can't. ATM, a minimum of 60 appears to work on all the samples
> I have tried.
> 
> Even with 60, it sometimes takes a long time for the PLL to eventually
> lock. The documentation says that the minimum rate of these PLLs DCO
> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
> 
> With factor range changed, the PLL seems to lock quickly (enough) so far.
> It is still unclear if the range was the only reason for the delay.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b080359b4645..a805bac93c11 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>  };
>  
>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
> -	.min = 55,
> +	.min = 125,
>  	.max = 255,
>  };
>  
> 

I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.

I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index cde07f7ebad6..897cd6db5c0f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
                meson_parm_write(clk->map, &pll->frac, frac);
        }

-       /* If the pll is stopped, bail out now */
+       /* If the pll is stopped, bail out now * /
        if (!enabled)
-               return 0;
+               return 0;*/

        if (meson_clk_pll_enable(hw)) {
                pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",

This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
then the GP0 is seen as stopped and then the rate is never set.

When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
this permits setting the rate in the registers even if the PLL is stopped.

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 1b0167b8de3b..08174724a115 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
 };

 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-       .min = 55,
-       .max = 255,
+       .min = 120,
+       .max = 168,
 };

I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

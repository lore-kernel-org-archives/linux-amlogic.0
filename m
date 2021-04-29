Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A786C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:46:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4559D611BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4559D611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=imVsd1LdRaVwIMjsdHMkigLZ3DZNp0EwSDVA0DcNmQU=; b=YdpiU3zileSgjb0snDTG1Ye1P
	HkZAbjStF+iW6QvWHcnkvgIco1dA2DLwi+kSsUyM8+3i6DKVBFxOfkhME8a679+NAGpm48LnTVTU0
	E68eA1e+FGvEWw4EPfx/aPlO0v/y93Y7yDndpobv480xVDVhAjTjW1k3r38SxQvBxq8OA5XlZPpkx
	HaRa0IQLVNYx+xNaxkilwF//kRn1gk6g62uwAniOW0HqP/v2YXAfLFtvEfVAH5Okb5cbP+6n0JWRZ
	rgxvE3bmECgMFq/rZMro08QJliI0oNrfx2EA3hTSAkWL6eJ81BF7vCBAs0G545hcTLavyjP1e2Rtc
	43UBJKr/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc3F3-005S1G-EH; Thu, 29 Apr 2021 09:45:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc3F1-005S16-D4
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aNf26sUMiRwJBKQH/Hf8TYhehmA4Zm+XIsMUwKiuMyQ=; b=sJu97b5T/uX3huRtfkOJwNE6JL
 V+h2Kq4lMKmhtuoneF3wTZDZWQX4QWAAEUi14NKj12c2Oq0GOr3TXaAukqrFWFTPrxDmbvlFDcqa+
 nznN452Lh3OSfVYGSMYREJPb+peLHFxJ0GRf7owRjLRve0t42OOl50+0z7pZdBa9URttvH4MUWSal
 wz2RJnkNGSHCF8Aj9DsNar4d8O2I6Gm6+k8cnGPzq2cUnKJPxTIyOfcDFyr+1Mgc4s7G7JxaF0qDy
 4SelXs2aoTEs+izPqVTu71yFalfOMbW4s4JtYdh5OWL20HSngm6N90Mr2uKLz8ZBjQ0biSeNp0zAk
 ZXiqn11w==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc3Ex-000X3C-OL
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:45:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id q6so18508668edr.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=aNf26sUMiRwJBKQH/Hf8TYhehmA4Zm+XIsMUwKiuMyQ=;
 b=iFQnzJcpCFbrQ4rZP6nCuYXPQwNrLKblQh2GcD2tO49KIxKybUwu/C95NtgQLiNjEn
 Utem+Lk41XU4ZOv1WKA3H/KFr2Z9y3RC9oSCvOIkoLxbrJInMLERtLjpkdr3pU8FHD2d
 FG//yFR0sfrX6C+knGQhZ/ktDFxqvAIkUW0W0cDdQaK4z/VYF5tV9Tj8kMAXLqdP0Vjp
 N+qfSUbnMxRGYWXV1ARJR3gogiVF7FlGebSjzqSUZSIci+BDxh9E5XFK+KTxS0piR+Mq
 oDkP1I70Q1BGwZKptf7W11zfE1u2Fxjee5k4EplOo59kmtRZU7SBymlgLj7ZyoVEs3TD
 u7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=aNf26sUMiRwJBKQH/Hf8TYhehmA4Zm+XIsMUwKiuMyQ=;
 b=B8OEmpcmB0p3JGKHHJHw5z4m3HDCrV9ZOrASParsrvjgNDBXC821MRx4rbjcSzwDia
 OSw9rWwrLMogqDyKIafeYjcRjhrf7RVyHoDWM2zWSSnxdA0TaggyrQL/nyKUsBfeliDe
 ZkDLTGYLrkHtatA95AXT08crPbgxAYRYoXGGtoY5064dlPJONtsO+xexnJF0JEIuwrss
 jp99EYIrMFCDjgFz/V3055DP+ktP0aG6HqYMjN9mDIKvrfntkPBSnksvRlgrFRoPGCt1
 QlzA2rq0jR2w1g6uMNvlwLH44HUV4JU3AW17iy1vKPGmKZ3rI/myAC1BlcmKU0uQhcoC
 nlUQ==
X-Gm-Message-State: AOAM5317QaepqXNXd8V+K+oJbgv42yk48azw34ZZkMkfgdRThhfZorcs
 wQ4+Z5PqqeUNaF20mkQO13kC3A==
X-Google-Smtp-Source: ABdhPJyBmbHnL2J4IIvJHV8eZFiZeGIaxve23EUNHu8okuLO7wRyLTAWhhlI0wR+0AcC5tBYFh7lIg==
X-Received: by 2002:a05:6402:254f:: with SMTP id
 l15mr17186114edb.189.1619689544467; 
 Thu, 29 Apr 2021 02:45:44 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id z17sm1492469ejc.69.2021.04.29.02.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 02:45:44 -0700 (PDT)
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
In-reply-to: <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
Message-ID: <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 29 Apr 2021 11:45:38 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_024547_959894_41AE0867 
X-CRM114-Status: GOOD (  32.16  )
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


On Thu 29 Apr 2021 at 11:20, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 29/04/2021 11:03, Jerome Brunet wrote:
>> While some SoC samples are able to lock with a PLL factor of 55, others
>> samples can't. ATM, a minimum of 60 appears to work on all the samples
>> I have tried.
>> 
>> Even with 60, it sometimes takes a long time for the PLL to eventually
>> lock. The documentation says that the minimum rate of these PLLs DCO
>> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
>> 
>> With factor range changed, the PLL seems to lock quickly (enough) so far.
>> It is still unclear if the range was the only reason for the delay.
>> 
>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/meson/g12a.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index b080359b4645..a805bac93c11 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>  };
>>  
>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>> -	.min = 55,
>> +	.min = 125,
>>  	.max = 255,
>>  };
>>  
>> 
>
> I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.
>
> I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index cde07f7ebad6..897cd6db5c0f 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>                 meson_parm_write(clk->map, &pll->frac, frac);
>         }
>
> -       /* If the pll is stopped, bail out now */
> +       /* If the pll is stopped, bail out now * /
>         if (!enabled)
> -               return 0;
> +               return 0;*/

This enables the PLL everytime set_rate() is called :/

>
>         if (meson_clk_pll_enable(hw)) {
>                 pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
>
> This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
> then the GP0 is seen as stopped and then the rate is never set.

Audio does the same - PLL is set and enabled afterward. This has been
working so far.

>
> When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
> this permits setting the rate in the registers even if the PLL is
> stopped.

There something to be explained here cause the register have been set
before bailing out. What is happening ? The pokes before have no effect
or are the value being reset at another point ?

I understand this need to address this concern but it does not seems
related to this particular patch.

>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 1b0167b8de3b..08174724a115 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>  };
>
>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
> -       .min = 55,
> -       .max = 255,
> +       .min = 120,
> +       .max = 168,
>  };
>
> I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.
>

How about the range provided in here ? This is range documented by AML
(3GHz < DCO < 6GHz). 168 limits would limit the rate to ~4GHz which is
way below spec and would negatively impact audio clocks.

> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

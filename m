Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26972C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 12:17:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA5561352
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 12:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DA5561352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wp3LyUXsahjVUlDFuPUpzf8p+6GTFxvaIgaPRuVdel4=; b=d4FOtFqqUA0dOLBGPEqxSGoLO
	m7JspIXkIBQNymDepPWCakXWc9FOn8b1+y4g1j2K+Gh2eWdKJdAC0c0s2rzphx1Gz6ucPyL9qJ8PZ
	b2pnjxafcZmbN9hdQlAZfl0ecIigrgUXrENXwvETxRGsOKHu6HVMkFRjUcsqihT3MnYct3AFmCFNf
	+a3A+0QyC+EwEoKJ4FoIwQN6tpmWnduZfYt6Vq/1tEeCXIuXLbQjIB6PKKAUIzZBKJyNaJE3NVe/x
	L7BEHKxvcmTYhWUG/wBfa0dOCzCZ59fc0vA9IIVZFUv5BE8A6GaLsPYY+l8WW3+n/L4ydq9PQc5y2
	iNPvNWJ9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc5bI-005bnA-6f; Thu, 29 Apr 2021 12:17:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5bD-005bmv-Fz
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 12:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RHDNDn67MN6JLEq0pltz7iYeAGgFoGfE9CmM1nSQbiM=; b=qbuW5hTrDjLvO5mklkj1mRhX3L
 Qf++t67ugIa463KW5ged7p29BDsP3+bFSI1d5AD4F+3mzXdZYpRRfWXQ3zoP2j/1HonPvpPG4dKPk
 s7LqJO0ufTND11H84ccOfHdiaiWIuGU0GXXi+Y1LzKse/b3ekfLqksrnqxe+oX2/DVmvUCXlyvswB
 P8qr8C3Y2rRIWK8p42NTFw3U7DlcXiWdxPCfdqLFMPoyOonSJSISijEF7FnvwEqCya47thSi7biIF
 rZ7xDsr1jif/1Zwc8LRwqGmIvDyNWu6dFQ6n4QJunSdypkQiK3d7DNn6IDMaQ6QEqIdJS4Jf/xwLU
 agR8+aCQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5bA-000cDa-Qr
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 12:16:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id u17so99633713ejk.2
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=RHDNDn67MN6JLEq0pltz7iYeAGgFoGfE9CmM1nSQbiM=;
 b=VLz3BHKdI7dakRFv9mmsbfTllD7WadxqdT21O1FF3zjQHR/N6QaVylRXAFuabctKcP
 S1bsSYCBhQP2msbddEU8aX4hizq6OualaavABgrpoFGQQZHebEb5d5OAO4FuTh/aWLG/
 u9ySRd6UmiGk9zNRwGeDJ6U/9b8vNd8F0XzKbW2YZkB314aLxEQ3YSvkRH6JoysyEBVr
 sEYVf58VIKpdKkjoOUS7PHRybE4+2r7m7GpRNrT6lid9ZsfBuGyrLKVmufnpcvzsIzm2
 W0yAHRx6boAsSZIN9OA882VkKLiQz7SMzoikULGcw7/GDvEz4oaGPwFnYVg37Imh8xzl
 Z0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=RHDNDn67MN6JLEq0pltz7iYeAGgFoGfE9CmM1nSQbiM=;
 b=cPLp2Bumv4Dy6obZixhHtKhPhKBqrgYQ6f2JBlySNgicQ+VHrLrwi9PNRo4jglvKxS
 vkNoR7zLWo273Iari+LBOqIRZlUewljAKyaDplv7Db2ugMmGWfPz/hG6PNXm53CNf451
 kGvsDoR8pZBD5Vh9xtbES4WdsP4wh/XxpWKCHpf44FjfxX58eJt93vEhAHeMOw9Tzlg8
 IjjimWAKT5Mzetf0bnoWPqDPHG/seXgRSyq3f6pGtP7xL8p/3Gv/0VcDUdXofw5ZmRf9
 UVlxAwJAU/SJsCRKkk/qz6gSHhQMM6GX+VnJCu6y4GlxVAPfeVYugT6Ocg42b6zOnrqZ
 +xuw==
X-Gm-Message-State: AOAM531Lh0Uct11ui2xNtAO8RR31nMPI2t6JY+xktAgqg5oTXuT1+pOo
 ENwx02MqvZ5TFkdW03elu43lc6y/ZzkDTOGn
X-Google-Smtp-Source: ABdhPJyjKXaQJOX+hYp1411iGB1TL2HQfK+4JZ8HKBK8KqippD9mSpc/mnctO78Xqo7k5gSPI5tCkg==
X-Received: by 2002:a17:906:b5b:: with SMTP id
 v27mr11944783ejg.40.1619698610904; 
 Thu, 29 Apr 2021 05:16:50 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id k5sm2441081edk.46.2021.04.29.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:16:50 -0700 (PDT)
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
 <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
 <0cfc7286-7be6-57ec-8040-a4370d0b4204@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
In-reply-to: <0cfc7286-7be6-57ec-8040-a4370d0b4204@baylibre.com>
Message-ID: <1jfsz9jnf2.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 29 Apr 2021 14:16:49 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_051652_897218_B54016AA 
X-CRM114-Status: GOOD (  23.68  )
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


On Thu 29 Apr 2021 at 14:15, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 29/04/2021 11:45, Jerome Brunet wrote:
>> 
>> On Thu 29 Apr 2021 at 11:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> 
>>> On 29/04/2021 11:03, Jerome Brunet wrote:
>>>> While some SoC samples are able to lock with a PLL factor of 55, others
>>>> samples can't. ATM, a minimum of 60 appears to work on all the samples
>>>> I have tried.
>>>>
>>>> Even with 60, it sometimes takes a long time for the PLL to eventually
>>>> lock. The documentation says that the minimum rate of these PLLs DCO
>>>> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
>>>>
>>>> With factor range changed, the PLL seems to lock quickly (enough) so far.
>>>> It is still unclear if the range was the only reason for the delay.
>>>>
>>>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> ---
>>>>  drivers/clk/meson/g12a.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>>> index b080359b4645..a805bac93c11 100644
>>>> --- a/drivers/clk/meson/g12a.c
>>>> +++ b/drivers/clk/meson/g12a.c
>>>> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>>>  };
>>>>  
>>>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>>> -	.min = 55,
>>>> +	.min = 125,
>>>>  	.max = 255,
>>>>  };
>>>>  
>>>>
>>>
>>> I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.
>>>
>>> I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index cde07f7ebad6..897cd6db5c0f 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>>                 meson_parm_write(clk->map, &pll->frac, frac);
>>>         }
>>>
>>> -       /* If the pll is stopped, bail out now */
>>> +       /* If the pll is stopped, bail out now * /
>>>         if (!enabled)
>>> -               return 0;
>>> +               return 0;*/
>> 
>> This enables the PLL everytime set_rate() is called :/
>> 
>>>
>>>         if (meson_clk_pll_enable(hw)) {
>>>                 pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
>>>
>>> This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
>>> then the GP0 is seen as stopped and then the rate is never set.
>> 
>> Audio does the same - PLL is set and enabled afterward. This has been
>> working so far.
>> 
>>>
>>> When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
>>> this permits setting the rate in the registers even if the PLL is
>>> stopped.
>> 
>> There something to be explained here cause the register have been set
>> before bailing out. What is happening ? The pokes before have no effect
>> or are the value being reset at another point ?
>> 
>> I understand this need to address this concern but it does not seems
>> related to this particular patch.
>> 
>>>
>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>> index 1b0167b8de3b..08174724a115 100644
>>> --- a/drivers/clk/meson/g12a.c
>>> +++ b/drivers/clk/meson/g12a.c
>>> @@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>>  };
>>>
>>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>> -       .min = 55,
>>> -       .max = 255,
>>> +       .min = 120,
>>> +       .max = 168,
>>>  };
>>>
>>> I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.
>>>
>> 
>> How about the range provided in here ? This is range documented by AML
>> (3GHz < DCO < 6GHz). 168 limits would limit the rate to ~4GHz which is
>> way below spec and would negatively impact audio clocks.
>
> For hifi pll right, not for GP0 ?
>

Both have the same spec.

>>> Neil
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

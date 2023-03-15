Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF67DC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2REes/RO4bV3NeNNAUIt0FicTeBF5LgxIs0cymI38E=; b=mjBmaSexunAGTA
	kD0qz9B5AQNtro7KXj5bhAJ+wSMSt1FSib1zVd2/TtDv3E2iG9bjgDF3DDPUxw0lEscXrLZQENqrN
	FnFEFP4Mpx0VWZHHiUd3sN460hlpTLy6LSaJKVglo5KToZ5FOT3GlH0ZbhsKcvhw1p0hWrC0UErAj
	a0koQkXUJHc1M2XdyWI9EEr8kChZkrUt69xhfgGj6YVyCb+2dQevnJkkGR+dyxfU9jpk5SRDM7ph+
	04931UGmy3MauFt7DECcrItOzH3j6ydddjbCkjb4u9dLRh/1jBWAQfa91zhjcpmg61XYBEwKmDKBU
	7TJDuMP4SdlT7x2ocT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYRm-00ERVU-2K;
	Wed, 15 Mar 2023 21:14:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYRk-00ERUR-0T
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Mar 2023 21:14:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id m35so3902086wms.4
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Mar 2023 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678914844;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqbFt/pBqE5TKXfMvdh7DdqHmCUQvpuDlko3Y111n6Q=;
        b=lHyNA0iN3AhDcoMXRc4Cv+gWXaGMDbun/JVL4l1g4S0/58rP+rSTdzf9e1pdbiFCRm
         r2TQUH7mWheMx6e/lSR+eJWrVCXgUCaXFNyTzXra5YWHCkFFmT5WyiqPnmrY+tZ4StaT
         C6WGkRNddO6y+9o+AV1dNbW7uYF6hugngMic37KCCq9oXndkUBb+BD32Kv8RX6TQGJdi
         zKI8RO1MibqmEFWvFbIQE1FQhAowH+lAS/9TYkYsllS+gChbiTC598aEmM0LhEXZphFp
         9UFV9rbF+QEFhlccG7eTvxDuqlwAXSZKKYb7JEDqsWtYOzMLxUm02K/4jayP45UcST28
         l1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678914844;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqbFt/pBqE5TKXfMvdh7DdqHmCUQvpuDlko3Y111n6Q=;
        b=hlQh8xLXuyiuzes3nony5gyvHwdXQE3nxvyUEW4/AmfnKoInF2ZWWMf2L+OT3kExuR
         Cle8e0zbFTtegdLEiz0PpHXmgt6sOZRT9xGQ3Qe799W5pBwJyrHd5/bgY/wdvZqRiwC9
         vt6UJp6aAh/8wxMO+e4H/WARVG5bRoXHKAjpNuJmSLaimV1jgwlCBr0tKLKPzI2FC1ts
         6INQJoasQ8rRdLn6Ol3O4xjGvOJ3KYSxJ4eSaXU9xiNTMNXS3Gl/ZnOYlumIvLkorLjt
         lf60jTn92Mk7wr9927Ezaa83IONO7J6z/v97UNqH/bXqzZDEL4gLl8jmeMnAVp1W755E
         BkJw==
X-Gm-Message-State: AO0yUKXqaTbHHPXEJywAM5eFYfKNzGk1dw+0jDdzPwErjtjWYKoRAPAd
	qQsK57fJ0J3E175IIDmR6qjua2GEOpQ=
X-Google-Smtp-Source: AK7set8dS3PA4TFy/DP8vm97OAHvVKDEGbkpTI/0jnu7LSmYNPyb37++a3xBOqFPl+MnLEgwBhkOiw==
X-Received: by 2002:a05:600c:45d2:b0:3ed:2a8f:e6dd with SMTP id s18-20020a05600c45d200b003ed2a8fe6ddmr8033503wmo.6.1678914843708;
        Wed, 15 Mar 2023 14:14:03 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bcc4:9b00:c423:87da:b23:892a? (dynamic-2a01-0c23-bcc4-9b00-c423-87da-0b23-892a.c23.pool.telefonica.de. [2a01:c23:bcc4:9b00:c423:87da:b23:892a])
        by smtp.googlemail.com with ESMTPSA id k3-20020a7bc403000000b003ed1f69c967sm3068957wmi.9.2023.03.15.14.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 14:14:03 -0700 (PDT)
Message-ID: <15b12187-abcc-b77f-6538-ffae5988bd2b@gmail.com>
Date: Wed, 15 Mar 2023 22:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>, Rong Chen <rong.chen@amlogic.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
 <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
 <b6971cd6-80f2-522a-64fb-82b126500010@free.fr>
 <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
In-Reply-To: <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_141408_182690_4C291E00 
X-CRM114-Status: GOOD (  23.25  )
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

On 15.03.2023 16:27, Jerome Brunet wrote:
> 
> On Wed 15 Mar 2023 at 11:20, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
> 
>> On 14/03/2023 20:45, Heiner Kallweit wrote:
>>
>>> On 14.03.2023 18:24, Marc Gonzalez wrote:
>>>
>>>> With the default power-up delay, on small kernels, the host probes
>>>> too soon, and mmc_send_io_op_cond() times out.
>>>
>>> Looking at mmc_power_up() and how power_delay_ms is used
>>> I wonder what you mean with "host probes too soon".
>>
>> Hello Heiner,
>>
>> Thanks for your interest in my patch! :)
>>
>> I should have added a link to the thread that led to the patch.
>> https://patchwork.kernel.org/project/linux-wireless/patch/c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr/
>> Start at "I have run into another issue."
>>
>> Basically, I have an S905X2-based board.
>> I built a small kernel for it (with only a few drivers), that boots really fast.
>>
>> mmc2 (SDIO controller hooked to WiFi chip) would not probe at all,
>> unless I added lots of printks.
>> Basically, calling mmc_send_io_op_cond() too soon after the controller
>> has been reset leads to the CMD5 request timing out.
>>
>>
> 
> I tend to agree with Heiner here.
> This patch is backing a contraint only reported on your design in the
> driver of every AML SoC supported, for every MMC controller.
> 
> I think you should look first in your vmmc and vqmmc regulators and
> their setup times.
> 
> "fixed-regulator" have properties which might be interesting to you,
> like
>  * startup-delay-us
>  * off-on-delay-us
> 
>>> Are you sure that the additional delay is needed for the Amlogic MMC
>>> block IP in general? Or could it be that your issue is caused by
>>> a specific regulator and you need to add a delay there?
>>
>> The eternal question...
>>
>> I have only one type of board. (Actually, I have a reference design
>> that is slightly different, so I should test on that one as well.)
>>

Let me ask few more questions:

You said that the issue is with a SDIO card. How about eMMC and sdcard,
does the issue occur for them too?

Then you mention "too soon after reset", but add a delay to power-up.
If the delay would be needed after reset, then shouldn't it be in
meson_mmc_probe() after the call to device_reset_optional()?

>> In vendor kernels, they add delays to the WiFi drivers.
>> Maybe they have run into the issue, and they're just fixing the symptom?
>>
>> Default value for ios.power_delay_ms is 10 ms.
>> msleep(ios.power_delay_ms) is called twice in mmc_power_up().
>> So raising the delay from 10 to 20 adds 20 ms
>> to the latency of initializing SDIO/SD/MMC controllers.
>>
>> Would you be willing to test if the problem manifests on your board?
>>
>> Regards
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

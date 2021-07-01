Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C32C11F67
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476C761410
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 476C761410
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRyo+b17VGpjqdJaEPgzptliemGRTDQPm4/xmPzLm1Q=; b=POHLE5oRoOV2dkII+nLQuPOU+G
	Ymv2UJuwqGD2sntSzSDtJZsJ+tThnQkMibUBq5UfYlm9vxxjI4qB3a+2UgvLudsqCXlb4JZofKdgT
	WVz3l4D/9vHY6A0Q5qiHA92TVKEm5pgHf4wHaWLMsU5YMxtPNXKU25wSQ3yRmwR4hG/yTStG2bU6i
	YkLLHLNpHjbwWova+aRT246xixAbft2NOXeWN4GTYEHSYg+2yQsk6vqLQO7M6IA6zHgEewQb4r4Ni
	g/sbN1OfsADURU6XK8LrxIpgarRZVfJuajjauSH1LNp4lJy7Bnm6Ab1MtQNHw35tFEHyVkBPTVeTu
	TuY8/QDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz4TL-001FE8-E6; Thu, 01 Jul 2021 21:43:47 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz4T8-001FBR-0w; Thu, 01 Jul 2021 21:43:35 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 bc18-20020a0568201692b029024c6dbc2073so1960441oob.8; 
 Thu, 01 Jul 2021 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K75TMc833Hnb3K5ewk2HbYnNKfUBgfQkkOxc24B6DT4=;
 b=vRn3yfZ8+4E3qWPjdUGgXR4HGXqqJ/qUjMGAP90AWTjVl4wnA56aTtxKvjPBaEblBR
 Es4GusU8pQmCTnG+WX/Mv/E7S101G3hjV3ItxdZxBH0LhD4o7soKHJ7teiB3E+MyjehB
 sHs+E6RqYyy3k9Xzm5G6UnHs6Cz/TREKSRYXsh/36rgR96RDs03QvZla92C+7hYDtiP9
 65QR7z5S5HoTdKgGs1UzU+b0UJmPX5YLdE6J8Hq6BHuI4A1dcujApZaYwvdQ/7xIACzN
 LLJB/MNz4gmQux0TLWXkhjUgvmQTNzkNqwYzDMyyfV6y0VjFv81B9jrN+dos290NIzX7
 WXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K75TMc833Hnb3K5ewk2HbYnNKfUBgfQkkOxc24B6DT4=;
 b=Vzxto+HIg2nEKBM8hrn6rN0HMJMdpu8GT162GZS68HfbC/AQjblq8MCFt9+ZSgzMDZ
 1rIUDl0cYxnDQaBoOv3v46+fKeRHP0yopY5pgRly2+gBVJJF9PyFscsn9sXmNyYB4Nlx
 aOYyCtKmuiJxDWWkKwa/wRGT/pNsm9+Qq01SLdYy7kxybQlYVY1Rrli9UZEpLZvNovLA
 66DFsuxYQL/0jmYPGoBmaxo6WTaUM08TYNTRtU+zVupPQVagOpI8wBFKM1N1W3509z/q
 TyXJoYfMTH0klRK1N5ShJZ6HB4WtnhX58AAJ8+6yiYrJzOoNmxjQhXgMJ/8OPCe9Asbn
 aTMw==
X-Gm-Message-State: AOAM532XmARrXflKvs6zF8g2DLDkNznDXoSszQ2XvUjPcQhmsVVe45MS
 LtxZrUGONE35wGmgSR4joqryU4omzBU=
X-Google-Smtp-Source: ABdhPJzIRrjoijEn1koxIO+9bmtEXdAF29WNwuReepWnxaWoHI0uNMwp+/TA2WeEqF2v5v+xIFiLXw==
X-Received: by 2002:a4a:8241:: with SMTP id t1mr1609090oog.13.1625175812601;
 Thu, 01 Jul 2021 14:43:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e18sm252459oiw.27.2021.07.01.14.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:43:31 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7a06cfaf-4cae-5c4c-edff-16d6406a1b6c@roeck-us.net>
Date: Thu, 1 Jul 2021 14:43:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_144334_146348_E1B804AA 
X-CRM114-Status: GOOD (  24.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 7/1/21 1:57 PM, Martin Blumenstingl wrote:
> Hi Guenter,
> 
> On Thu, Jul 1, 2021 at 10:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> [...]
>> [    0.000000] [<c07be330>] (clk_core_determine_round_nolock) from [<c07c5480>] (clk_core_set_rate_nolock+0x184/0x294)
>> [    0.000000] [<c07c5480>] (clk_core_set_rate_nolock) from [<c07c55c0>] (clk_set_rate+0x30/0x64)
>> [    0.000000] [<c07c55c0>] (clk_set_rate) from [<c163c310>] (imx6ul_clocks_init+0x2798/0x2a44)
>> [    0.000000] [<c163c310>] (imx6ul_clocks_init) from [<c162a4e4>] (of_clk_init+0x180/0x26c)
>> [    0.000000] [<c162a4e4>] (of_clk_init) from [<c1604d34>] (time_init+0x20/0x30)
>> [    0.000000] [<c1604d34>] (time_init) from [<c1600e0c>] (start_kernel+0x4c8/0x6cc)
>> [    0.000000] [<c1600e0c>] (start_kernel) from [<00000000>] (0x0)
>> [    0.000000] Code: bad PC value
>> [    0.000000] ---[ end trace 7009a0f298fd39e9 ]---
>> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
>>
>> Bisct points to this patch as culprit. Reverting it fixes the problem.
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
> 
> I don't have any imx6 board myself and so far I am unable to reproduce
> this crash on any hardware I have.
> However, if it's a problem in my clk-divider.c changes then I'd like
> to find the cause (ASAP) because possibly more SoCs may be broken...
> 

I don't have such a board either. The problem shows up in my qemu boot tests. See
https://kerneltests.org/builders/qemu-arm-v7-next/builds/38/steps/qemubuildcommand/logs/stdio
for an example. The problem reproduces with qemu's mcimx6ul-evk and sabrelite
emulations.

Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

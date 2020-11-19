Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82416C6369E
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 16:58:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50D9221FB
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 16:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oElrPTGE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="llhVzZqd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50D9221FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KWjr4YrJRPn4B6l06uIxGUNoPUwuFNCtfSG7cN7styY=; b=oElrPTGEUCsdec7fRDDKz56qg
	GwSV+vLv4KeRhbW0x+p23dPpwWGlWSK4/H4nlvTBvL/4UVUHGzuecpwfLkgMqXQj0VVJoGDJFpjA1
	2WmUifb2y2N6PGOxDj1pbGhZmaBDVE1n4MVhUI6h7jRAqbxtTp/h1oJLqbQuTS8EIrmp5NYfMjqMe
	fyBb9kcYBnOgW/muELD6nocakG/xjFgkqrwI524CtB0gA+AWGk7VjV73bY5vjukV61tpZcZyG/p+d
	wV7LgXqmaP9ZubhAw2JafLlWhYto03BuYt2p5XpVtTTkiLXoYHcgZEIIZROk0Fo/WKtbxLJjCtQP+
	kEJcRWN6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnG9-00061g-3G; Thu, 19 Nov 2020 16:58:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfn9a-0002yN-Sy
 for linux-amlogic@lists.infradead.org; Thu, 19 Nov 2020 16:51:30 +0000
Received: by mail-wr1-x444.google.com with SMTP id c17so7113382wrc.11
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Nov 2020 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=IUxoppfqaSQfsgS7sOWn2afMXOkizKDwhUSj+oVrHcg=;
 b=llhVzZqdVGyYKolK2rraEMEYaT5uKZuLlzaCVTV7wB36pCE+nauvjqnkPbaluaKEev
 rs6/8MjTfbiEc01TqH8nOqxKK7+z2MB3uQeCdPaLstqYdkYSNhnW4eO/3YFpy9z0BoxT
 wGyjkYDjZANdzUoZ8nsy4j8/1tmhU2Xa/mII8VKwYZcXtbBll1KcsE+AD12sZ6BceRXJ
 ehavDdTG7CkvNGgHOgpTLoScRLGnRj1LgTd1d5d3OG9z4bAg0BIXcXePDIo18CKUteac
 Un0IwT6ElV5SGgaR8BmBzwqzv5zLTPT1YUHtnmzZV2LB/mmhTfGr2xx+O0/uFHqngrhT
 OBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=IUxoppfqaSQfsgS7sOWn2afMXOkizKDwhUSj+oVrHcg=;
 b=VLay1wrXR8J+oPCAj/u6bFKXfk+5Hr1rD8ESI0++YZLOVJl8ZGpS4zzmYYWT0Fgpnb
 7viX01wK8nGAHodyFTjSlkYNa4SRuLOsHBUZOSHyb6lWxk9klRlx4q3/J0H139cLr5hj
 PB9EV6spFkwCkvOOETClAIMjICBxqkiGOCnTZgc4NnhA0SBxCn45VNsyeRm1JTWYAQZn
 OIplblKC4fiIG9afkAz90L2d7PA+f6qkzG37O30Df8eEDs+9cKfeIgIR8CRn9Cas9CAG
 3TR1GIvmTgkCXRhvD0p9On3RmkeMXkkdf4WjrlH6DeIIGtcl+tHicffr5xpA+tyNwpVQ
 MDIQ==
X-Gm-Message-State: AOAM533Xwqqz1nt52lzHCD0B7nu+73oqvz1yEyPl2IedFDd2iF6kB/Z7
 KInuDyZ4ENzDv6iM8fKwyULJXw==
X-Google-Smtp-Source: ABdhPJwnkIXJoN3H0698Zt2fIJTEH3pRamAve0MklS/Z6BoCyJmmYSy6ATWf3ecrunxy7/KcKK7KHA==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr10950862wru.287.1605804684487; 
 Thu, 19 Nov 2020 08:51:24 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id o10sm642195wma.47.2020.11.19.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:51:23 -0800 (PST)
References: <20201118190930.34352-1-khilman@baylibre.com>
 <1jzh3d8fal.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: Kconfig: fix dependency for G12A
In-reply-to: <1jzh3d8fal.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jwnyh8f3p.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 19 Nov 2020 17:51:23 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_115127_454930_9EBB62C4 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 19 Nov 2020 at 17:47, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Wed 18 Nov 2020 at 20:09, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> When building only G12A, ensure that VID_PLL_DIV clock driver is
>> selected, otherwise results in this build error:
>>
>> ERROR: modpost: "meson_vid_pll_div_ro_ops" [drivers/clk/meson/g12a.ko] undefined!
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")

And applied, Thx

>
>> ---
>>  drivers/clk/meson/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 034da203e8e0..9a8a548d839d 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>>  	select COMMON_CLK_MESON_AO_CLKC
>>  	select COMMON_CLK_MESON_EE_CLKC
>>  	select COMMON_CLK_MESON_CPU_DYNDIV
>> +	select COMMON_CLK_MESON_VID_PLL_DIV
>>  	select MFD_SYSCON
>>  	help
>>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

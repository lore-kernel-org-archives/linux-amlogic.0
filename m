Return-Path: <SRS0=PyQ3=KM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65D2C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 21:09:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0CE611CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 21:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0CE611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rtA96jMRjsYYF3DOEYflTX8kCa+kwuo+FVFTa4ZEsWo=; b=hh6EdyRmIq72nFCeFVUKJj162
	x0OoW2HDo3p+K/7+eeue+5L/fc5cNwvrTnsfuQPEG17KDTpR0hcoG/ZY02wOZBLCIdnkTjpF+8ibB
	rIMqezBslSHG6smsGBx7AruChW2JHOH+AuZMWEgwrfMUbJIEPGfhOzaQsmaGIcZEUSidY8RIHdAdf
	6WYoxc0KsQdx6RNEcO6Ove0ZRJ3VnAH7qhKVVRPEqHUtKC1l0Mch6jf4tZO74og91zyE3ji/W0wC6
	k8TZ/6JPr/9dC9OiOsLMfp6+8fatptbSzPInyYFPlkDxLn636CpOzssNHhTeZGT2iD9ohxTWxjWxg
	cflX/u/Yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1likUg-00GAvS-VO; Mon, 17 May 2021 21:09:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1likUf-00GAv7-0K; Mon, 17 May 2021 21:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=izAuyhZgm7M/LMe4a4qNJpvf8wOXCKgLwis8wN2PCow=; b=JQdoKzoM8+cEAZcRI0tYgVLRwT
 r3ljRFFWWxl4cA8bPtGIRy17X5Wo3IVt9pJDabDk/fXYpFI4xERKfhLI+IG197b7EPUgCenmCd20O
 Bok41yJvYdVr1WuL7/fPLgFyZfI4tnObVAYz8BOxJcFPm26dsHE94BxZJ6/0dW9tYGD4yjp+rOnf2
 40Wyjk5Uw3r1Qb8oKGOQKTzF3WuZ8qf4b2/QAoJiz3gXG+Ewy5yjiA+n8oardNbmU+NSQzgS97y/N
 lfbMDCwaZnYchkERMQcukNFDMHXwFsJZjnAeIXwlYO2jfvLvBa1Xd0Gh6DEaxa4pm1gwki6IKkrYD
 sLne1hfQ==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1likUX-00E9WF-CV; Mon, 17 May 2021 21:09:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id a25so8519238edr.12;
 Mon, 17 May 2021 14:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izAuyhZgm7M/LMe4a4qNJpvf8wOXCKgLwis8wN2PCow=;
 b=qokmphszxncEkEwLLKRpmfR+sWPFtUvkOFh36bA/z2mgpVVLi0XLHMB7fwOs+qzXHH
 wwB2HurVgT/bgXVQico2LlB2+rfXbuNYGwx0k6xRdWUOn3eWc/vzEOONO2ZiRuU1Uk5B
 E5YeCzyK36YLztIs7Bs2hUJtczxUqiIsZojRlO9+kb7Ff8dmJlVpkV86Wi9RWQ1W2eO/
 teCYQXUkeqNNnJkLfueImXQ7JakkP2ct++215MGXnx3jc7s/PkwLQ2sfJ5TWvNWHAh2V
 ce5n60SqHuGUsX1L3i7ghCeALOCftFUnIckNnMrG/mGaIdZ9W6RyB0IbrDUeLUBiMyb5
 7sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izAuyhZgm7M/LMe4a4qNJpvf8wOXCKgLwis8wN2PCow=;
 b=iIs6UuHdP2iYkmpaQ28oCZ4Awgrc6PJoPJM48oZ+yUddLU0o7shj+mW/wF8jnkK20M
 aSJwQsc1tPsZ/nWm2J4YKTvcLSeyk82Tqc6L020pJ/RAxaUoUQNpDvf36btJZYybeZdd
 9XxDx2mN3h116kBYLcFHTdtRk3D7OPf/DQpL20swaW1CDqmsggeflZ514tksn8ncGlvD
 bIiMxURTRTsUU5SHeb38QqhxwLIl/KcvjuobOPWO/iBU1zG+PrO2QhKWUvxks+gWrG9O
 5jAoqp772RIpsukzjZfAUCSGdscnhcQVUDPx+Hs4Yg35CxmvPkmL6g5YvobmDsBiArvO
 0gRA==
X-Gm-Message-State: AOAM530hNpLnleSkp4uP/nbjj+PUsqEGdxq/blk2VfgUgzxP+rXGzmgK
 RHG2TFkXq98gRGgD9H9/yZda+n5IpGAert4l9ApryPJH1C8=
X-Google-Smtp-Source: ABdhPJzetaOKwgsJMpGG5I6YoXfc4AXmndEhL5lAvZ9Kv75v9gi/ooE1y7jV9ziP2bIPt8CWDytMHmcTTtdOVr/EB64=
X-Received: by 2002:aa7:da8e:: with SMTP id q14mr2425271eds.13.1621285770621; 
 Mon, 17 May 2021 14:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
In-Reply-To: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 17 May 2021 23:09:19 +0200
Message-ID: <CAFBinCA50H55e2FMKgLtH-+2huReBgm_ckOW9BNcXA1WJwvvBQ@mail.gmail.com>
Subject: Re: Random reboots on ODROID-N2+
To: Stefan Agner <stefan@agner.ch>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_140933_490666_1B78D205 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Stefan,

On Mon, May 17, 2021 at 11:14 AM Stefan Agner <stefan@agner.ch> wrote:
>
> Hi,
>
> We are currently testing a new release using Linux 5.10.33. I've
> received since several reports of random reboots every couple of days.
> Unfortunately the log (journald) doesn't show anything, just a hard cut
> at some point.
I'm sorry to hear that some things are not working right

[...]
> [202983.988187] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [202983.988188] Call trace:
> [202983.988188]  dump_backtrace+0x0/0x1a0
> [202983.988189]  show_stack+0x18/0x70
> [202983.988190]  dump_stack+0xd0/0x12c
> [202983.988190]  panic+0x170/0x338
> [202983.988191]  nmi_panic+0x8c/0x90
> [202983.988191]  arm64_serror_panic+0x78/0x84
> [202983.988192]  do_serror+0x38/0xa0
> [202983.988193]  el1_error+0x88/0x108
> [202983.988193]  udp_send_skb.isra.0+0x178/0x390
> [202983.988194]  udp_sendmsg+0x7c8/0x9c0
> [202983.988194]  inet_sendmsg+0x44/0x70
> [202983.988195]  sock_sendmsg+0x4c/0x60
> [202983.988196]  __sys_sendto+0xd0/0x140
> [202983.988196]  __arm64_sys_sendto+0x28/0x40
> [202983.988197]  el0_svc_common.constprop.0+0x78/0x1a0
> [202983.988197]  do_el0_svc+0x24/0x90
> [202983.988198]  el0_svc+0x14/0x20
> [202983.988199]  el0_sync_handler+0xb0/0xc0
> [202983.988199]  el0_sync+0x178/0x180
> [202983.988211] SMP: stopping secondary CPUs
> [202983.988212] Kernel Offset: disabled
> [202983.988212] CPU features: 0x0240002,61082004
> [202983.988213] Memory Limit: none
that looks weird

> Anyone observed such an issue? I am pretty sure that this is a new issue
> as we have many installations using Linux 5.9.16 running stable on the
> same hardware,.
I haven't but I am currently trying to hunt down a (probably
unrelated) Ethernet issue on an older Meson8m2 SoC currently.
All Amlogic Meson SoCs use a DWMAC IP for Ethernet connectivity plus
there's a little bit of "glue" IP for the xMII connecting to the SoC's
IO pads

I think it's a good idea to involve the netdev and (probably even more
important) stmmac maintainers.
Anything skb related is handled by the stmmac driver.
So I am hoping that someone with expertise in that area can give any
hints for debugging or reproducing this.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

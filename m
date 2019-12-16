Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72653C43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 09:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C2E206D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 09:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqouiCCN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WUP++Ukk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C2E206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Jo7WhI1Km3n6Qzt7dPgOFIfoiQRXaPqlbODJZnrcVjM=; b=JqouiCCNHzhOqy9ajjQxmCqAVu
	Jt+ifaHp53d26rUUYHftO91NO/aub8jGuloZLuHUrEVCbtS5qX0aA/WfdX+z3Qkfl7F8u+bhAnW6W
	cFbaNRUuil7OGpqyfNyrcc6wzfqN7MYd/0akX5rG64I/oUk7q1vgcYsQOvBIH7l0Cc/zdFC4JpPTf
	dYJYRTn9X28gYgqc1quM3ZdyNklDxTvOWLDpUsdbEEDGND4pIxdSvTiJNCE4C5WVnuZHgTwmh5929
	Ye4zoBbZsXK+3AjoTf2ISr15s0i47CHeBk6ZBYntd0X+s85FodqNWFoFZItp/tSuah7mXAzS50Gp+
	JTmOHNBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igmRl-00036K-Bq; Mon, 16 Dec 2019 09:13:45 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igmRb-0002xl-LK
 for linux-amlogic@lists.infradead.org; Mon, 16 Dec 2019 09:13:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id d73so5871477wmd.1
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Dec 2019 01:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=hGz9qWdY8ZcUU5/VcrTyxse6NvOSG2JsP6RQHgyur6o=;
 b=WUP++UkkkRHAngukuNoFL6QdnnAcsECwDXGu5MQfgjJHODHN6xd2WMIiokGIBHeJeY
 Xtr1sfbZVaBjybPoIos7VuR8uYpG2CQ6mV7+A9FhXATLlJdFc21aKVjsQctJD3oOVJI+
 j0gaFHhyX0/J//241U49HhKK5tv0N7vfW8xW9nsL+FPYkfo7loQk7KaEkpgiFgXb26FY
 bbd35FmlBznv/3K5Dw4098MXk+dR5bhE1BZFGdprT0krRVjCR5XeI/758Sqgk5ZBKLBy
 DTlU59r2daKnL4q0/U9E4IeAjQIt7ZYunYv05taTdrauBJUWbfi0v5Pr3wcN7Phj0ZOw
 DreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=hGz9qWdY8ZcUU5/VcrTyxse6NvOSG2JsP6RQHgyur6o=;
 b=bvYxAtp1qKuFrX7dlrEjwFcVSHyxFlDgrTFYdBt0RYqt4a17LGEQ0G0lAttre3f6LH
 v575kmAZf/GpoO0GHmIiUcBXFWAx245vIgXWWVPvAQdTLCld+giR/2iP3z/tQNpSC9XM
 YYKtAiVE2PCBixEN98LjfEzMPlJ3snn60Zi7uoOTLO4i8FJ0qJ7bhq06LKQ0WRGUrPVe
 uLIp/J5Y4wtPUqcdNKtqo5IL03S/bOmkjxxcRszDrM2N+18T7qoJ0KHyKbIW2Fu4u27L
 KRw5Xar5bHo9c6wIS88Jj3Vu+ICOr9o3TVLXqGm5Ys9EsR0DqEZPV5Vx5ujTg6ZjJlSb
 qYQA==
X-Gm-Message-State: APjAAAVKg1+vtLumdVoxeHJ09Hmka8RRJf3lS8oADyI25ZWCdNkGLeT7
 fAVlah47gePb+73BGGubUekcfA==
X-Google-Smtp-Source: APXvYqy19YVm/1kSejmA9wVlq3iOrl0I2bxY+X47LQj5Bypu9SC2jPZAIHgTCn3wIgxj4Ti9RIfJaw==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr27710908wma.121.1576487613009; 
 Mon, 16 Dec 2019 01:13:33 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id b10sm21088066wrt.90.2019.12.16.01.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 01:13:32 -0800 (PST)
References: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Subject: Re: [PATCH 0/1] clk: Meson8/8b/8m2: fix the mali clock flags
In-reply-to: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
Date: Mon, 16 Dec 2019 10:13:31 +0100
Message-ID: <1jr214bpl0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_011335_693009_4A749C68 
X-CRM114-Status: GOOD (  20.38  )
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
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 15 Dec 2019 at 22:01, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> While playing with devfreq support for the lima driver I experienced
> sporadic (random) system lockups. It turned out that this was in
> certain cases when changing the mali clock.
>
> The Amlogic vendor GPU platform driver (which is responsible for
> changing the clock frequency) uses the following pattern when updating
> the mali clock rate:
> - at initialization: initialize the two mali_0 and mali_1 clock trees
>   with a default setting and enable both clocks
> - when changing the clock frequency:
> -- set HHI_MALI_CLK_CNTL[31] to temporarily use the mali_1 clock output
> -- update the mali_0 clock tree (set the mux, divider, etc.)
> -- clear HHI_MALI_CLK_CNTL[31] to temporarily use the mali_0 clock
                                      ^ no final setting then ? :P
>    output again
>
> With the common clock framework we can even do better:
> by setting CLK_SET_RATE_PARENT for the mali_0 and mali_1 output gates
                ^
From your patch, I guess you mean CLK_SET_RATE_GATE ?

> we can force the common clock framework to update the "inactive" clock
> and then switch to it's output.
>
> I only tested this patch for a limited time only (approx. 2 hours).
> So far I couldn't reproduce the sporadic system lockups with it.
> However, broader testing would be great so I would like this to be
> applied for -next.

CLK_SET_RATE_GATE guarantees that a clock cannot be updated while in
use. While it works at your advantage here, I'm not sure CCF guarantees
the assumption this implementation is based on. Some explanation below:

In your case, if it works as you expect when calling set_rate() on the
top clock, it goes as this:

- mali0 is use with rate X:
- => set_rate(mali_top, Y)
- mali0 is in use, cannot change, will round rate Y to X
- mali1 is not in use, can provide Y
- mali1 is determined to be the new best parent for mali top

So far so good.

- CCF pick the mali1 subtree
  *start updating the clock from the root to the leaf*

So the mali top mux, which choose between mali0 and mali1, will be
*updated last* which crucial to your use case.

I just wonder if this crucial part something CCF guarantee and you can
rely on it ... or if it might break in the future.

Stephen, any thoughts on this ?

PS: If CCF does guarantee "root-to-leaf" updates, I think this
implementation is a clever trick to solve this usual glitch free clock
update issue ... much more elegant that the notifier solution we have
been using so far.

>
>
> Martin Blumenstingl (1):
>   clk: meson: meson8b: make the CCF use the glitch-free "mali" mux
>
>  drivers/clk/meson/meson8b.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

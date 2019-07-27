Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715DEC433FF
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 18:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF152075E
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 18:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2D6A1de";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="trJ4em4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EF152075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOs8Nf1hHLgAHnBrfTXNmnpm3MIqjokVULszqW0dALU=; b=c2D6A1de+QiVfk
	bg8xlU8k4IdeuEn3SbiIYJcrEhmKNZaTcE1TeSi0AjaqNHucx7tL7AVeWGzlo1sdnxQtUfacdPmOx
	js44uaB1Xt+YN7NmZDn64Fq+FQwk2XATeQusGtpGKT1LfGm7VffJy1lm0OYpUAtfA5rZKNjWW29i2
	ZmykM9b/LdO9vgcgAELfhxLs0bJO9Xh42rMB0yBMFFnm98dOC0lRePvlICt7opAJwcFTAO7kb05mb
	JaXf960VQAgM2ABKsaAhD7rK4EulQL2yWXIqAi6CTi4PeebsRO2g4NqJXELccG6PX72NjcAo54BR+
	x9e/jeu7vPIYU+NvLxvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrRW1-0000Na-TF; Sat, 27 Jul 2019 18:33:58 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrRVz-0000NF-6I; Sat, 27 Jul 2019 18:33:56 +0000
Received: by mail-ot1-x342.google.com with SMTP id s20so58588770otp.4;
 Sat, 27 Jul 2019 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zykk+16i/VaVO7vGCiEbOdwpwXy1foVL2dprzKW3VcY=;
 b=trJ4em4+Up9wf1cWi1zJIcTeKiL7VU8V9eR5/totF/SJ0sOa2b18vWkoRsYUxxjzXZ
 bpbUjXFrViU1uLaFI1bFyaXG3jXnsd/VptCVzoGhYHUtyPKCfE7qY3mRHhnJjQUQgps5
 QH1MDSQ6e6BO3L7fA174okRYNj8wrkebTPaGzABuPmG1O06GVUYNkIk5gwhb7aobsEL4
 bJtYvldv5e5lbou3rE9WXAJiexTIhjSPu6N+jbiglnMbX4vli9Yss52Y+bh0jzdDlZ+q
 HeyajiZSxZuhogSB1u+OMqPLkh3JkyBsJxjA/RweVlQm6ry5uxMMhzqMmYv0EUkUfY+d
 h0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zykk+16i/VaVO7vGCiEbOdwpwXy1foVL2dprzKW3VcY=;
 b=mzqLVHNtMBKyQBCG7HOVGvYO/31EwS4NPR11yRmTdmvbpghAbH2MBfgZd6GIl3SbqA
 irSBb2xtmu7VpYcTxd57FwHFJRTzp4+3t6QNLFuGTvZnPZBWp21ndN0rjMCIp2biuzZA
 962mKEKLrO1W8Hj5oIFk3a0DNOBJStuR5y9BeUAn3WHehqvdukk76eusm4hEgFSAt2Il
 fEc7DdYPRTc2kA3cntmrPZfC0VthQwatYlyY/ECgdhXYfzwC7MEh5XNhcrmESXn4qU7O
 RpPfsFy8iwU3JS91kDIavtJMTb+oyZ3oSDkpzQa874gSV75+9bWNlVhglX0+VV6o1Jas
 DNKw==
X-Gm-Message-State: APjAAAW31F6wmgwUcUE0iL2EF7aOMb3LFhwiMAh4P+5n+UCr5PaEXKWd
 a/v9aOYSbSS07ZxaC54Fxgl/VY30LlvJnhYcxztBU1Pg
X-Google-Smtp-Source: APXvYqyXx94WA5EdJdcpHMg/R/oEWO8JMmb/K2pzFqcu3/J8K/4V0sX76FoWK0bUo/XsHICC0CqCHvBxvgMmF7RF9t8=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr11080912otb.81.1564252433247; 
 Sat, 27 Jul 2019 11:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190725164238.27991-1-amergnat@baylibre.com>
 <20190725164238.27991-6-amergnat@baylibre.com>
In-Reply-To: <20190725164238.27991-6-amergnat@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Jul 2019 20:33:42 +0200
Message-ID: <CAFBinCC3D87AxTJ_SpATWM8BcKAtLPKjc22mF5GPS+=-u0HC0w@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] clk: meson: meson8b: migrate to the new parent
 description method
To: Alexandre Mergnat <amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_113355_259272_0A410F92 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Alexandre,

On Thu, Jul 25, 2019 at 6:47 PM Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
> This clock controller use the string comparison method to describe parent
> relation between the clocks, which is not optimized.
>
> Migrate to the new way by using .parent_hws where possible (ie. when
> all clocks are local to the controller) and use .parent_data otherwise.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
thank you for working on this - everything looks fine to me, so feel
free to add:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

and on my Odroid-C1+:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(I compared the output of /sys/kernel/debug/clk/clk_summary before and
after this patch and it's identical. CPU frequency scaling also still
works)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

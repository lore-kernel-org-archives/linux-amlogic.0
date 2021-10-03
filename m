Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3310C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 23:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5204F611CE
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 23:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5204F611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2CSLKK0i3qOznLQCuRoVkZ0FCMu1TR14cwSg8iwhD4=; b=LmwIBFDsYgIpzl
	WD/skmH43eGOu2Yfrj5aANGPjv6R7y1VgnzY0YZNMeRDjiB5l8Ri7vzOEMlAAM/r78ZFZxnh2vKGd
	qjPWobq9HrCmEeQFwxrO5dhhz9rZYuCAxg0A3n5PA4/sLvm012DRyXhnrhnunRd3rC7vW/R5G5h6R
	oVJhHwyBIE8rnJBmiSFQyoiXBuX5Z3rqPkOl7PFeAvxzAobYcnH4TC6rRSAZh7/eSM6Zub0qlVKvL
	SBL3whCq3E5gvFDZlPGFwZsWYaGaYWz/07PTLLufdVqa9rZR+grdfRK9bat4cHc/BYnwK0BgW0cOP
	XyuodRYO4KK5Zfl+NRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXAeJ-004gUg-Gg; Sun, 03 Oct 2021 23:12:03 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXAeH-004gUI-Gw; Sun, 03 Oct 2021 23:12:02 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id g10so31836vsb.8;
 Sun, 03 Oct 2021 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mMQIV6iy/YcB5GjonDB7HSdfPpKfOSD7BW3xn+YP/DU=;
 b=QkXTiIR3+QNbtk78cJbJtsNqnJQf1vPk3ReN5Z/IsCuN+ld/6Y8+SyjR/sSNObHrvy
 LuwIIfiTgyLmDaVPkhz88u8/lmQxA27XGwZcsb0S0nOHIx8h1yFrgLaurz5EJtxUxH+Z
 kDtuPH/tB7mrtMZB0/2saB1PT3ODQNBwlUAyfdI6Rbi5qDdWhK59KNV8ElrjleNny4aL
 JYefwlQ2doHpniLrfKl03S/vFCtOPJfxz/pUOw/bPcXaXIIxh4wGelE/u0M90x8qXTYU
 YGnandWgE7gO/FTbroftj6bhHtNiQiqlPCWQY7DaczTEDmgAeWhzWNkQdQNjclseSgA3
 Cv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMQIV6iy/YcB5GjonDB7HSdfPpKfOSD7BW3xn+YP/DU=;
 b=LZVfv5bjzEFUiGQrjgAaELHGRRnznQfJXVtiFuf27Yskd/ElQ0fe0AgIJ3LJgvZ624
 mzbomcQ0lzwvU47pqAYdQh3O2zv5rJpd4wHOktA4rUJsAPnSyT16XMD1F4zjm/QWHfmI
 KKsLYIvD+IfHPJ6RWSooFBo84uuNgYWyvppLAvw/f4YIJSJq6qUyd/1FWeZaCOd1maE1
 0r+rD2Cn2c5HXrqDxuAZpYGEogoBsbRK24w44CkiD/bq8Nu/pfj9kDH9ctDnZOFWhWxz
 rkup630aI5iB0Vyvjnfq7d89x7H/jgS9H0vVPT+acskCX+g8f80GwpIXYtLtIK+MzJd3
 O0Og==
X-Gm-Message-State: AOAM531aRE5LXXNub5CtMU61iTZXr1Nmg1tblVJ8Z08BWNIqDGUA35wX
 6UqehR2buuEekpa8ZGWSEoEtmfgq9YE5yg==
X-Google-Smtp-Source: ABdhPJxZFZJ00cfx/JjWexY4Yi9Z65BWyW0WPxPc+6iP9/jByvYrihDArkBL5WNBLxsnACqlUzbi6g==
X-Received: by 2002:a67:d00d:: with SMTP id r13mr10866961vsi.23.1633302719105; 
 Sun, 03 Oct 2021 16:11:59 -0700 (PDT)
Received: from geday ([2804:7f2:8280:9a0f:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id t5sm6100912vsk.24.2021.10.03.16.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 16:11:58 -0700 (PDT)
Date: Sun, 3 Oct 2021 20:11:54 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVo4uuKJy2QIQ77n@geday>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_161201_611404_4D865E31 
X-CRM114-Status: GOOD (  23.39  )
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

On Sun, Oct 03, 2021 at 05:57:34PM +0200, Jerome Brunet wrote:
> 
> On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> 
> > Hello Jerome et al.,
> >
> > on Amlogic Meson SoCs which use the AIU audio controller we have the
> > so-called "machine gun noise" (MGN) issue, reproducible for example in
> > Kodi. So far nobody was able to identify the cause of this issue. My
> > idea was to at least narrow down the issue so we can categorize it. For
> > that I wanted to get the SPDIF output from AIU to the HDMI controller
> > working.
> 
> Ok, I'll clarify (again) about this issue.
> 
> This issue is on AIU only (not the AXG series), on the i2s encoder
> regardless of the output (HDMI, internal and external codec)
> 
> This encoder support either 2ch or 8ch mode, nothing else.
> As long as only 2ch was supported, there was no problem.
> In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
> AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
> aiu-encoder-i2c.c). Without this, the switch is not done.
> 
> What these do, how and when it should be done is unclear. I tried
> several combination. At the time I found something stable-ish but it was
> not perfect.
> 
> At the time, It was completely new driver. Even if was not rock solid,
> it was still progress and I opted to upstream it with an imperfect 8ch
> support so people could help debug it. This was mentioned in the
> original submission.
> 
> The other solution is to restrict to 2ch mode and remove
> AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
> anymore.
> 

Hi, Jerome,

Thanks for the extensive clarification. I have compiled 5.15-rc3
commenting out the pokes for 8ch as you have suggested, both for
AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC in both aiu-fifo-i2s.c
and aiu-encoder-i2c.c.

It works, the bug is gone just like you said it would be.

My suggestion is that, for the time being, until someone can solve
this properly, you restrict enablement of 8ch configuration under
an EXPERIMENTAL kernel option, with a big fat warning in the help
description, saying it will break 2ch.

Last but no least, thanks for helping Martin out.

Thank you,
Geraldo Nascimento

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59453C10F12
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 07:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2911320675
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 07:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2481++G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gmNcJnhq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2911320675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fEyjjqnKDZi5VdtOFS2B7KQDPrY1KwSNsjkzxXaQXw=; b=P2481++GMIUbgL
	OVdXnmV+kIh0luu/OXdpJGezfI1xNwngJNNvfxBwHbz4QeQ4MnVdE3A65Aoa6v1FEJ3pm+l5SfosK
	qLvd+s1NTDMVBjyOP5bM+DbavXPsW9wRpsZQr8ld9a/e/DwOehxwQfgtg+8gTxqZtgqq4gngzt6zj
	YEZlPrfsRYzGLJ3e21Cs7t2bDFMwP9/xfGAN3dGVgiSP6b1wLWYDV7846uf9hfFPh5IuFMtgEEKjj
	j2YDCzU/ZEf2eXfV9y8bFWCe3lyOU2GFUU2qK+rGz8zWVXvUN1IYeVmpaHhMFIBd/FBlHFAHWBMux
	b3qerwmsASQXqhp9DbZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGefG-0005ag-Lw; Wed, 17 Apr 2019 07:07:26 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGef7-0005T0-Lm
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 07:07:19 +0000
Received: by mail-wm1-x343.google.com with SMTP id o25so1990196wmf.5
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=MagiVVsLv7f6Puj0uqCtZOjMbwEZE4eWEmRuawO2KC0=;
 b=gmNcJnhqCLVf299+IhArLUl0pb0EwTCniJyMdEMdQ63cKSqk4dX0eNNEpwH14gAVt+
 1dAhmG1Dof5h/DCG12z/WQrFDGPhYIY5uyG6l+tPwJzPFYk4/TA2aE6fPWkPiWllOixL
 FKzvdJUDGbs+5ikVfu+oIraZGbvquZE9BxVZlaPLhJEXla1ptjda8mGdyR5BVivy3CZn
 5r4OM1PEX7pebIjRoS2+phNAIh+ezErSm/y1D6OYnUW0ZRHQXCdP0SWNCjHvjY8BslVV
 Iw1orImf91wkR6bvnPSum+NU5IIiO601r/VmOGKmE7DgUGDfUVO45ifWdeAShceiLueA
 /CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=MagiVVsLv7f6Puj0uqCtZOjMbwEZE4eWEmRuawO2KC0=;
 b=fuS5v3D7FyXTy1CmSV9WmUP4SSa92+wYUCxZcOXR4S8Fnj/So86v1YW+baa1FMSuL7
 5SSJDuP41msWYnKf1vUrrtvSQx1nxJZybxtHRSIrN3MGlzs1oPhGLd5Ar7YUoFHdOClp
 vO/GRQKK7SAcK6nk4vC3ZRFJ2CEJmAdT5l2GEEzhx04RkD0fFLpoDyD7bdUoV1MMY+x/
 O4NPi2q7+YdXUZxQGvAe0yqDmp1mPTCQJpaPFILHRVrnbs5qhqMMxaCWIyw3/50kotpf
 yTYiyie3YKRS0aUW1Kn8ZfT6ZNtUA2BFONRoWQi+h49vkIyTMfYbJDlLd0vAnwNTuVqa
 5ReA==
X-Gm-Message-State: APjAAAWBuEgIqvLIG0z5vEwO+jXss9QtdtR6woknJyqAzVNcuFg6pYgg
 kKCNpfyHxVts2L0eiRTX89QxSQ==
X-Google-Smtp-Source: APXvYqyFENtAPfteYb0wtz6TNBqryi7it7WwFiPYyckE6t7KumJf/r2ky87fPrBj/YfzTUV1hE+kxA==
X-Received: by 2002:a1c:c287:: with SMTP id s129mr31404681wmf.63.1555484835530; 
 Wed, 17 Apr 2019 00:07:15 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w9sm6004866wmi.0.2019.04.17.00.07.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Apr 2019 00:07:14 -0700 (PDT)
Message-ID: <3eec8b122aa4912dfa67aeb37ad2c941c34c0a38.camel@baylibre.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Wed, 17 Apr 2019 09:07:13 +0200
In-Reply-To: <CAOi56cU0dHoyRzTXeKGoiFwTms4WuJ7LV2EXTJLoEmOsC8OyrA@mail.gmail.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
 <7h5zrdpytg.fsf@baylibre.com>
 <CAOi56cU0dHoyRzTXeKGoiFwTms4WuJ7LV2EXTJLoEmOsC8OyrA@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_000717_760057_DAC379C3 
X-CRM114-Status: GOOD (  15.46  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>, patchwork-bot+notify@kernel.org,
 lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-04-16 at 12:22 -0700, Kevin Hilman wrote:
> On Tue, Apr 16, 2019 at 11:52 AM Kevin Hilman <khilman@baylibre.com> wrote:
> > Jerome Brunet <jbrunet@baylibre.com> writes:
> > 
> > > This patchset adds most the audio devices of the g12a SoCs.
> > > 
> > > Kevin, couple of things worth noting:
> > >  * This patch depends of the new audio clocks binding recently applied
> > >    by Neil [0].
> > 
> > Was this supposed to be part of the clk-headers dependency PR I
> > received?  /me looks... It looks like it's applied right after the tag I
> > pulled, so I doesn't look like it.
> > 
> > If I should queue $SUBJECT series up for 5.2, I'll need another stable
> > tag.
> 
> Also, this doesn't apply cleanly anymore to my v5.2/dt64 branch.  When
> the stable tag is ready, do you mind doing a rebase? (or telling me
> what it currently applies to, and I will do the rebase.)

Hi Kevin,

Until we have a solution for the drive strength in pinctrl, I won't be able to
submit the audio pins. I doubt it will happen in this cycle.

Without the pins, audio won't work anyway ... so no rush

If it is ok with you, I'll resend at the beginning of the next cycle. Clk and
ASoC deps will be merged by then, so things should be more straight forward.

> 
> Thanks,
> 
> Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

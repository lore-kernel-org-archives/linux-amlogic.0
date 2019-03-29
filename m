Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F491C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3DE218A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rFsfM+LV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O1+9x8z1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3DE218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wrOAQSI7ovEZuvnO6FvOX6x5M1StnxlIgm8jAQBjes=; b=rFsfM+LVMVR3dj
	bvk3dZCPgDmIlt6xi3IzAqMVeKXgMUWtfje609JAgwDWYlXj4F83UP2C0TScpn1WF0xLBnGGNPPkS
	+VSdloZFxaEsosYl/uiVeZXQzX5mlEJdq1sar846aFpclcmqGkx72F+99kf2XLgDC6ksxsCBPRK4i
	H2tJzMbj+CO3jheS8FcACNBMBUzFj4YvNmE3SKBgRZbhYEVrFDJtRbLGk4N931cl5BN939kaT/mlM
	z41pWizyIyi/XYSQ6szJAJJbkDxedW41fU/5aRA1rTPbEl5nCezaYTs0FTWRVoMwerr/zllszDmQf
	U2xMzYrDQu1ovisloFtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA0SV-0003cM-RI; Fri, 29 Mar 2019 22:58:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA0SS-0003bw-8I
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 22:58:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id z24so4595311wmi.5
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 15:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=AbYcJ8DH6nLuqJUtYFNn6epLSrCdfxCkTbk1Rsz2IkE=;
 b=O1+9x8z15LbHJIhGHnrXuH0mgSS7u6SUXyhCAJZS/5qsn/1pT31WszOjeLHbvPL0HQ
 fc3H95FB08kndVgvCKi8f5v4RFVV5vHtmk6Q+WDCd0Ukkxm1rmriXP8xKrTvdlrm6yIw
 eCdp3h+p9hfsrbAb/rb4kIo40gZjSOkj/TqwSN+RyCFiB6plL0l7m97e4VFiIEakchLI
 1RVH44NJDVZd2YxbjgsxzCx9J63fYYLgxm0pg1btYRx7pdY4VR1D+Ow1/9Q0TgxwK/4e
 FlNkGW+a46r2SlvrL/SDIgEuUMsjJ7XMZa5RKTLSLqysY0I3q0RY55QUja7kqNtaMV/l
 T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=AbYcJ8DH6nLuqJUtYFNn6epLSrCdfxCkTbk1Rsz2IkE=;
 b=sScnBx9rUPLcjiB/rg/rmHc8gzM+4h6QrHG6Plms0hvaMAuck47L9GfysUJbiUeEGR
 xLS5YnCOTnM0P5hcuBsPSlm8vNoDj1c4kGVazbk8QzdZq8NG26GDtHXxqfR0pRjuWkBg
 l1KutYzlQ/C6hgY1vtnUdDHMPdE5ZnweyYr5bgUPITVlTuRUSLUqFE8NBnLDCg/mYSfN
 jnfrHpUbruFCyqxQR0IeHHbFOvfMe7QkC4etOa1jzyPCWYRiqBoT+l1ouV2kH/H/BEzd
 rV3TjSWgXgQQb1HpFRk2D3NAZMyadWjpWqviUzkcO3JgsVQPJpYB6Y8xI4W8XBJVFZLL
 i6oQ==
X-Gm-Message-State: APjAAAWS945viVMIq2AhsLNRH50yY1xyAF2estk6JOC6xt6lRwkzhDje
 cLA4UKDe9u8HYI6jR1HWwICEdg==
X-Google-Smtp-Source: APXvYqxh/CnUJ0IzIgJQ8XJFuV7DZQQxrck6TbKAen/kt4PLyG41r3KGuHKaKheF1cFEPxcaqbKGVg==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr5023420wme.54.1553900322601; 
 Fri, 29 Mar 2019 15:58:42 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id r196sm3355854wmf.22.2019.03.29.15.58.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 29 Mar 2019 15:58:41 -0700 (PDT)
Message-ID: <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 29 Mar 2019 23:58:39 +0100
In-Reply-To: <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
 <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_155844_345176_B1F6651C 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-03-29 at 15:14 -0700, Stephen Boyd wrote:
> > > We actively discourage using init callbacks. Can you do this some other
> > > way?
> > 
> > Yes I'm aware of that but init it the right place to do this.
> > To be clear, this is not initializing the clock to some particular rate, the
> > rate is preserved.
> > 
> > It just applies the necessary settings that needs to be done only once to make
> > sure the clock is in working order and that the rate calculated is actually
> > accurate. 
> 
> Ok, but can you do that in your driver's probe routine instead of
> attaching to the init callback? We want to get rid of "init" at some
> point so throwing the init sequence stuff into the driver probe around
> registration is a solution. Or we should think about not discouraging
> the init callback

Is is callback really a problem after all ?
I think we should actively prevent using it to set a particular rate.

Here, the goal is put the clock in working order. The bootloader does not
always do that for us. I could put this in controller driver, but I would have
to repeat the init pattern for each instance of the clock...not nice 
Using the callback clearly shows the relationship between the init and the
clock. I think it is a lot better.

In the same series, I have added some init for the controller. In this case
the init target a group of clocks, so having the init in the controller makes
sense for that




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

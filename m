Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545E3C07E85
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 11:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245E420892
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 11:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQho0COa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m11NhhJV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245E420892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBk1g3PuSrH0HrA4NC2Mrsbk4N9DQmqpj1jNq0aDBhw=; b=rQho0COaOHpaqM
	5o9pxLMoSNOWhun9xL4B1VXYAuWbM8ftpzJbH8KT1dzRGKYfbp6/QGUY1rTQrTodEScnLrcwMoBp8
	djMkBSlK9PDsYiwcSB+Fyn6YRzwB0+jT0Hlhk0FzV6VXBfECLWcMz0sZvlVScZSoMNAINssaGCqNd
	FigpgWD5QO29cxWAYk3ZDyo0g+N6PkFryM5NDdwFiQHp8QVMN5E35St5SwPFsEM9oGrwCBVmUC1ge
	9yB2GG52o1sXfIP8USBeJZuEdn08ZHvaufs/bSEG+6bhuBWAbUAGtTpuKfpMrvm/pM9K/enaNnYFq
	a5/C+HfGJUhJOEjt92hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVEOj-0008MC-B4; Fri, 07 Dec 2018 11:34:21 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVEOf-0008LD-Ry
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 11:34:19 +0000
Received: by mail-wm1-x344.google.com with SMTP id y1so4022833wmi.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 03:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=xr3MSuSi2kZ75Wb8/HOjNRP8i6Oh06B26pnRYoJsbs0=;
 b=m11NhhJVeJI8Zv++Kp6NZQG9qNghSmg7rn+TiQhRnwVVrH4WHXc7TsdVoomJWMssEU
 cx2zLLY4pL22uKBZpNHcxyzzBn1gbuDbRZDmcO90vmpy0iRYiQplYH9jr+rjp4j/xBQa
 sjYrhBfUJxQvhHJ98t1n5lBYIRPSpznlfRyO0l1d8dJixxAZ74AWQGVrAfy9ZUSHJRoh
 J9gcu7Ibgof+XtFilInOasn7xMgzcpffvCu81ZIbGl89Qe/ItgnmW8Kj4dwbw/dMwqrK
 fuxsSAX3Lr77l/2n5Caha8mmS4CJKOfZW4qfxnuA3luxjxkCjeOFZ4NVnCDz+CruRdZj
 zLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xr3MSuSi2kZ75Wb8/HOjNRP8i6Oh06B26pnRYoJsbs0=;
 b=VEUn3rRTb/tCBhs8ITVTzmXTH55PygiaFHIuJCnRV6EMJLhcBv0gxzl3A+Go1hnPAA
 GL3sbWQfy+vPYYn08KSFpRvjpsin8CGHg9WIVIjH43JvZnfilDIwSg5/BHZ6m+tF/7T3
 PWFAXDj38XAVpXbUp+EeMwtZtwSA4hO1EIPBPz+GFm0yY3VdYojMoZywThCm0dWFlxay
 l4OXgOcmJUvv4KPGIYxAzrLrDnOzmd9k1lqUMLM+wcPc7g5A9LHRXjT3AYkSeFZRCaTg
 WKMDQ7Qg8c9LJjJGjpITUl1weUgPRGMyc7chaY0+5S1+D8/N+/dwtUH9nv6x9kuG1euL
 YX7w==
X-Gm-Message-State: AA+aEWaf/q3TYkA6rp2MD0/5NN4iKoKP761W5GwqqClpVw90B+cvr20o
 hg5kq/KvgMTV96M/yt8nT1RwuQ==
X-Google-Smtp-Source: AFSGD/WTYj95fWZn/+rTwgHy17l4PVcgLRutFdm2F7IHC+inBJ3uRJFoQ9y/vwKTscghTpPpNCKdZg==
X-Received: by 2002:a1c:27c6:: with SMTP id n189mr1868387wmn.108.1544182446052; 
 Fri, 07 Dec 2018 03:34:06 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 m15sm2132380wrr.95.2018.12.07.03.34.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Dec 2018 03:34:04 -0800 (PST)
Message-ID: <b6eaaef6fff68bd6d0135416a78788278970bfe7.camel@baylibre.com>
Subject: Re: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and
 improvements
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Carlo Caione <carlo@caione.org>
Date: Fri, 07 Dec 2018 12:34:02 +0100
In-Reply-To: <7hva46x9az.fsf@baylibre.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
 <7hva46x9az.fsf@baylibre.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_033417_902888_E2101256 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2018-12-06 at 20:14 -0800, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > The goal of the patchset was mainly to address the following warning:
> > 
> > WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-
> > mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
> > Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
> > CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
> > Hardware name: Some A113 Board (DT)
> > pstate: 40000085 (nZcv daIf -PAN -UAO)
> > pc : meson_mmc_irq+0xc0/0x1e0
> > lr : __handle_irq_event_percpu+0x70/0x180
> > sp : ffff000008003980
> > x29: ffff000008003980 x28: 0000000000000000
> > [...]
> > x1 : ffff80001a71bd40 x0 : 0000000000000000
> > Call trace:
> >  meson_mmc_irq+0xc0/0x1e0
> >  __handle_irq_event_percpu+0x70/0x180
> >  handle_irq_event_percpu+0x34/0x88
> >  handle_irq_event+0x48/0x78
> >  handle_fasteoi_irq+0xa0/0x180
> >  generic_handle_irq+0x24/0x38
> >  __handle_domain_irq+0x5c/0xb8
> >  gic_handle_irq+0x58/0xa8
> > 
> > This happens when using the chained descriptor mode. If there is an
> > error, we call mmc_request_done(), loosing any reference to the cmd. It
> > turns out that the chained descriptor does really stops when we do so, at
> 
> I think you mean...
> 
> s/does really stops/does not really stop/

indeed

> 
> > least not completly. Most of the time, it can be seen with this harmless
> > warning because the descriptor will raise another unexpected IRQ. On rare
> > occasion, it will completly break the MMC.
> > 
> > This is mostly adressed by patch #1.
> > With this fixed, I took (yet) another look at the ultra-high speed modes
> > and the tuning.
> > 
> > I came up with new settings in patch 3 and 4. I've tested them on eMMC,
> > sdcard and sdio on the following platforms:
> >  * gxbb p200
> >  * gxl p230, libretech (eMMC only), kvim.
> >  * axg s400
> > 
> > So far, these new settings seems to be working great but I think it
> > would be nice if others could test this and provide their feedback.
> > This why  patch 3 and 4 are RFT tagged.
> 
> For broader testing, I've added this to my v4.21/testing branch, which
> is included in my integ branch which gets a spin through kernelCI.

Thx

> 
> Kevin
> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

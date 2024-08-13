Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C4AC52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxduYpnzQdJ7TNy5vhTg6ENmFbWUELcCSAoN5/Q5Tiw=; b=33FReSEdHtX/dX
	dF+W0n7/N+LjMcZCCCVdcssmSyB6qGcedIv97WQT5Mye4yn2qEaqWkZ2Z/dHhItjJygXpvF/qe4Tf
	JEbamWbPolOrREUGdyEGgxaeg5A6oILlmX/2GGLVLy+UnzDcaJeMtQg8NxSsodGTyN1dm7vs17O6Y
	f00tEvuLw9kbcP59roPm9aIxnHYWtxcr6QeNYqaaO1u3+JLzcKl+aMuWfC3DDbb9YYmBZ6poJO9ss
	MVSEHTpL5o+gUlmp4JrUL/nk6kUmb16EoLOmYdGDA1+TjEXKisP3tSkb+6SGxFK6CEYlosDhnTzvR
	4+mco0xb0iu3lXZljQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtMN-00000004CTq-2jy3;
	Tue, 13 Aug 2024 15:22:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtMH-00000004CSM-3OPD
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 15:22:53 +0000
Date: Tue, 13 Aug 2024 17:22:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723562564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5/E7ZJ4wGcPnowXOcotLGIaNe6xlDkthLXxOfxn/IM=;
	b=VJTBe3qhTwmSyv+Ep8Zivpuql5YfALl0d/U7P1AMY7WCPIA5MnJ+zsEXrNlS7fHI16EGoF
	r9S7Qu/+dQXBUAEIQWwoiepOvs18fbWedjqFtEoaIkfpz2pubpdm41RHztQPWFzWpiI02S
	c2WylEwIkJLwB7nOezbEjnl+UX9DZ6jkydFdWl5it12EHofrb88wvdwCI2nJzGhdLwDcPq
	LYO1Srf5SU+SCqTG0zO08c8BVHfeKsj0l0tLKQF0tPPhsHk0aLWu6kAC2ss5oe1uUxmpD5
	/rwXbRmAf+FyeJH/cCxnBs+l8WenvM0sZMRTwwUH2V5vc0m/uC5C1cKbiPosXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723562564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5/E7ZJ4wGcPnowXOcotLGIaNe6xlDkthLXxOfxn/IM=;
	b=AyjWMK10XA1oBwhboOrf9Z46wxNRgkQKjVvE2863FVPVuOPdvctQMbo1SBvhbdxtkkzAg4
	8gFC0gzk/LbN4NCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <20240813152243.2H3-mnx5@linutronix.de>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
 <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_082250_014479_F9FCF8CE 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On 2024-08-13 15:43:54 [+0100], Mark Brown wrote:
> On Tue, 06 Aug 2024 12:27:03 +0200, Jerome Brunet wrote:
> > With PREEMPT_RT enabled, spinlocks become preemptible.
> > This is usually not a problem with spinlocks used in IRQ context since
> > IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the upper half
> > of a threaded irq handler won't be threaded and this causes scheduling
> > problems if spinlocks are used in the upper half, like with regmap when
> > '.fast_io' is set.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
>       commit: 5003d0ce5c7da3a02c0aff771f516f99731e7390

Didn't you already apply v2 of this?

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

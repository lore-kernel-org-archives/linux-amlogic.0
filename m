Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05176C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 06:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mASo5CMyzkPWqCypb84h8ax9MeYkpQXgQ8BPpnrSCpQ=; b=PPbmpH5h+8ZmsE
	sTZ2uTZsYdyJxvtwPu8mNbg7banN53fI0cFR3HAOjZrw6LUQOT7t/6LiyXdj+zIL1SFwjORivdM/w
	n+oYCZI0kXcOCedhdi/3voNy84vIlQbJ+WQyExlLX3kFPz2POy9HaU4yc9h4KOd0qNO6PzntEg880
	hZv5VPVnCYJLBIkP/ZJX4RRL38OHfv54pxyK7EdY+I+E21f1qYt3UMl9TpZ8YYdfuafFUT8qaL7lM
	zMal2+2YoH+pjILkuPpa/LY8Y8d0tUPfO/F06F9TA6L3OcmIaSo2aP2gF/VGoBIYtRwQjq2GvfdlZ
	qPqDRsJL22F84w14p+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbwvE-00000007HNY-3hjs;
	Thu, 08 Aug 2024 06:46:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbwv7-00000007HLi-2k4F
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 06:46:51 +0000
Date: Thu, 8 Aug 2024 08:46:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723099601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvNh43nfSO4d+UD/c8WTug/9ZdIpYcc6hAsJkEvDjdM=;
	b=Si76o8jXOQPnoEKdHE8e+UndNId1Pf6tz3u+ArpvSRpnP4loGQXnRQDp1XrNDaLFQkrse0
	FuKQtJsFYDWBGcnV27A4t/VvxJskqA5r3tIbiHbrXXJN/CXg9XZ7SJtQijrLoKQ9wHWh1C
	prlF+ME+LHYgS3ENiWwm2r+dTq6JK1/9BvVlxpS80ASjePnw/DGLo1A5pYseopa13wwqG7
	jWSyvWy0MCAnvhDQPvoJLkYSSdYPFC0HsZjeRxBHho+Ccz4WWLoG1PXXUnv9S5MXpR98uN
	iesbFdD5kKegVDRzmode/8Ku8KGC515x+sf7hkc+PFNlXY8IpOg3OXaHuSZA8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723099601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvNh43nfSO4d+UD/c8WTug/9ZdIpYcc6hAsJkEvDjdM=;
	b=oKkJproIdztfQMIkb/RIwu+VvJMo85xqKUJsCSYhOVOhY2q7JdtZxHvBItv8qAbRhhAkxD
	PEV+PlHo0KG62YAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH v2] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <20240808064640.8-BmbtlX@linutronix.de>
References: <20240807162705.4024136-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240807162705.4024136-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_234645_855511_E527FE0A 
X-CRM114-Status: UNSURE (   9.50  )
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

On 2024-08-07 18:27:03 [+0200], Jerome Brunet wrote:
> With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.
> 
> This is usually not a problem with spinlocks used in IRQ context since
> IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the primary
> handler won't be force-threaded and runs always in hardirq context. This is
> a problem because spinlock_t requires a preemptible context on PREEMPT_RT.
> 
> In this particular instance, regmap mmio uses spinlock_t to protect the
> register access and IRQF_ONESHOT is set on the IRQ. In this case, it is
> actually better to do everything in threaded handler and it solves the
> problem with PREEMPT_RT.
> 
> Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-avkrasnov@salutedevices.com
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check periods")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

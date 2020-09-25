Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B968C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 15:05:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7FA206C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 15:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLwSLYNk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MJOGbF86";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yeohw/JX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7FA206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SG8B1oUFQtEdR0Xcmc8TtMkkpOLD8dmhF9Xj2pKntD4=; b=RLwSLYNkkUAaiYCXErT9N2rv7
	I4CBjSHr9Eu0KrDssbMKZc8oCoCfoktTQtpsipjKjRmEkGeI7weLfuRfPzGjZLBRmKzu2lk/nQ4ps
	xfOHXLAsmk5OFpLv3KRUY+PVOytg5xmINeeaxWn14rQekZgvWmRalTkdBx2S0fjev7qycO7rLoZNO
	DX+hn3JJgK4mx4ag5f3lWWaOh+pRrvL9teETLnvjcgPn9K+2V4hh7oh7RiIGGntEGheyyhVlYFNJb
	mNI2943y6Ck4kMX2eU7g4yWMyyDJkafR5jDfj4b7t3LcMNJ0DIOXIYMj0o1mB5rW1L/f6itREmshP
	Nfh1RM7zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpHp-0003GV-6x; Fri, 25 Sep 2020 15:05:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpHm-0003FG-Md; Fri, 25 Sep 2020 15:05:23 +0000
Date: Fri, 25 Sep 2020 17:05:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601046320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7es1yDj9/zjzMxs06+Vww2hrDHmTr8lqczgB9WnfFc=;
 b=MJOGbF86s4ulg2dwLhyiFpUwrUbKsXPpOgobXLou3xqdRJeQXF7Q5OF6REbbYec3Vqu7nG
 L4riyBPLz5XB1Ozl7X5ifiwO+7PCNFDaRPoXdXhrWEZIPM1QR2O7oB2AV93Dyv4rY8X8WC
 UoPw1uv74YznaDnkKwaMc2NdHO58KjnpX+VlC6Frp34l8Z1DYxMj36zhLz0624go36UEcc
 KXlNrxkFJhNhBAVAd9BaYatyUJakQdhnr8gObRGNN75Amz+I1EQ9tNZM+Uye1drKCANkgj
 LJ8/BpTX4Tod1gIMvXsCaPQku0HUM0YfkPYr8Ez5y/7n9Oo2xtQkuRvtGNcQeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601046320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7es1yDj9/zjzMxs06+Vww2hrDHmTr8lqczgB9WnfFc=;
 b=Yeohw/JXSR/26e4gGcNvnZlx7fiU8zt28HJO4pvel3a9b/BmscppNEfuRvko8R4VPwr27D
 GqUr3aC7ybFLnQBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] mmc: host: meson-gx-mmc: fix possible deadlock condition
 for preempt_rt
Message-ID: <20200925150519.sbzq57qphvzrdro3@linutronix.de>
References: <24a844c3-c2e0-c735-ccb7-83736218b548@gmail.com>
 <7hk0wj9ki2.fsf@baylibre.com>
 <1jzh5e8bld.fsf@starbuckisacylon.baylibre.com>
 <20200925134445.rk366jip5ne4x7em@linutronix.de>
 <1jh7rmj64u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jh7rmj64u.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_110522_872283_42DD2F8C 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: linux-rt-users@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Brad Harper <bjharper@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-09-25 16:14:09 [+0200], Jerome Brunet wrote:
> Looks like we need to do manually what IRQF_ONESHOT was doing for us :(

IRQF_ONESHOT disables the IRQ at the irqchip level. You must ensure that
the device keeps quite. Usually you mast the interrupt source at the
device lee.

> This brings a few questions:
> 
> * The consideration you described is not mentioned near the description
>   of IRQF_ONESHOT. Maybe it should so other drivers with same intent
>   don't end up in the same pitfall ?

From request_threaded_irq() ->
|  *      If you want to set up a threaded irq handler for your device
|  *      then you need to supply @handler and @thread_fn. @handler is
|  *      still called in hard interrupt context and has to check
|  *      whether the interrupt originates from the device. If yes it
|  *      needs to disable the interrupt on the device and return
|  *      IRQ_WAKE_THREAD which will wake up the handler thread and run
|  *      @thread_fn. This split handler design is necessary to support
|  *      shared interrupts.

Just the line that saying what needs to be done before returning
IRQ_WAKE_THREAD.

> * Why doesn't RT move the IRQ with this flag ? Seems completly unrelated
>   to RT (maybe it is the same documentation problem) 

It is unrelated to RT. Mostly. You end up with the same problem booting
with `threadirqs'. RT has the additional restrictions that you may not
acquire any sleeping locks in hardirq context. This you can see with
addinional lockdep magic.

> * Can't we have flag doing the irq disable in the same way while still
>   allowing to RT to do its magic ? seems better than open coding it in
>   the driver ?

Puh. That should be forwarded the IRQ department.
So we have IRQF_NO_THREAD to avoid force threading. This is documented
as such. Then we have IRQF_TIMER and IRQF_PERCPU which are also not
force threaded and it is not documented as such. However it is used for
the timer-IRQ, IPI, perf and such - things you obviously don't want to
thread and need to run in hard-IRQ context.

What you have ist a primary and secondary and IRQF_ONESHOT and don't
want the primary handler to be force-threaded. I can't answer why we
don't.
However, drivers usually disable the source themself if they providing
both handler.

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

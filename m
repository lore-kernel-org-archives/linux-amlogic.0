Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF896C4727D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 13:45:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E7C20878
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 13:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZbvhsC7/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cedLl12F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="28Dm8OwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E7C20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SH+VOUqgdBUTQPV36LUIzfI6zr7hZSK0yhY9YVdfWuY=; b=ZbvhsC7/eMVMI+pLm2cWnOigO
	7FOLibmLRaqbkaJN/IC7D810IYjo4KE//2R0Rdhm51jOMOi0QZM8FaZ6Vq/XCG+VKgaRglGUpVMIn
	OdjX0qVdTlYg0zLewF5X13A9srXtO23REjqPQe0oyloayubklvgNNSWH+Zwm9zWUD2OTmXbF98wkz
	EVMcSkpS3fyv0QZkbYINlfsmH0goevpxCYIRnTeLh0dzpnKmTbw+ImQpMkhvtc+7vCQtkxzSRxxgN
	mbT7qLKMzquq8T2irsL+GrpAMVC196hd7eOzls0dV++Di57PYLpPYtFFPf70eiVcdhguy708O83R4
	9ojr9X6Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLo1s-0000d6-Bp; Fri, 25 Sep 2020 13:44:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLo1q-0000cC-5R; Fri, 25 Sep 2020 13:44:50 +0000
Date: Fri, 25 Sep 2020 15:44:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601041487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5yjXWUCliemUXkVS/rJm2/vf4VSrQMEbNG38722oq0=;
 b=cedLl12FGt/UdUx9yMki5S9aT3zj+WqF3v8VCUxOYH+HI+xQ2pD1CLhr8UrS/wpLa0LqXV
 GM3ZKOLg3TTYDjm/BQwVyGNMqDq33tlaNMfLHnYl6nTImvm9SkhFnbPzxERuGx6AUnV+A2
 bYU9ZbfC3txRmxpYKYrB6cWdz1M4/I02sw+y5nQIeJdGbN9DsR/eaGevAmch9u5wDXY3QN
 RSItRGAij22JsD38qXk3sAC1UpWirf8PSC5BZVS4SkKzaYVKh0gw9vc55elizR58vao9t+
 gwHO2AR2dS7nmmCaXifvhknpuUnp1cabsAKOjqeqKH7E/Fcre5eBh4H2MyR6eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601041487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5yjXWUCliemUXkVS/rJm2/vf4VSrQMEbNG38722oq0=;
 b=28Dm8OwXHBIvLvccBaiOwqv/3V9yPbmae8puYhHpd0y1kvgrkGpw5Ojgb/rpzqDSRX/KV8
 gkMv2Uv3eVK0gQCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] mmc: host: meson-gx-mmc: fix possible deadlock condition
 for preempt_rt
Message-ID: <20200925134445.rk366jip5ne4x7em@linutronix.de>
References: <24a844c3-c2e0-c735-ccb7-83736218b548@gmail.com>
 <7hk0wj9ki2.fsf@baylibre.com>
 <1jzh5e8bld.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jzh5e8bld.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_094450_304256_7E4BB17A 
X-CRM114-Status: GOOD (  11.67  )
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

On 2020-09-25 11:11:42 [+0200], Jerome Brunet wrote:
> I'm not sure about this.
> As you have explained on IRC, I understand that IRQF_ONESHOT is causing
> trouble with RT as the hard IRQ part of the thread will not be migrated
> to a thread. That was certainly not the intent when putting this flag.

That is my understanding as well.

> This seems pretty unsafe to me. Maybe we could improve the driver so it
> copes with this case gracefully. ATM, I don't think it would.

Running the primary handler in hardirq context is bad, because it
invokes meson_mmc_request_done() at the very end. And here:
- mmc_complete_cmd() -> complete_all()
  There is a lockdep_assert_RT_in_threaded_ctx() which should trigger.

- led_trigger_event() -> led_trigger_event()
  This should trigger a might_sleep() warning somewhere.

So removing IRQF_ONESHOT is okay but it should additionally disable the
IRQ source in meson_mmc_irq() and re-enable back in
meson_mmc_irq_thread(). Otherwise the IRQ remains asserted and may fire
multiple times before the thread has a chance to run.

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

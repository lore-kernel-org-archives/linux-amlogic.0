Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB9DC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 08:56:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E302064C
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 08:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p+rcFCcQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1bVjaYXP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nn+A19Q+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E302064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M9nTCgbdIblM8HNwHgZGZf6dI5gYJho9OFaoP7i7me0=; b=p+rcFCcQbNGRXC2F1E00FHhSD
	i/kH/YBB6EzTr8u+tMQy1qZA0VH/4kzzq0ReOhaGIJqIACZUDVuPJ5gIo7QJI62uKk2WlBvpmdyVV
	6iEhGPwpNqlHmq8YFJYUCIqbERrb3PUgjvtG2O6GxkeGW0mk1eMZii5BKmleOQJ8lMIKws+EETNfE
	Y0VrtRpOtvlW6Urgan5F3yQ6bSlYZLWak3MpsGqF/nm6oBJsQjA152PUDxACeKpWRgXjQLbRTYImq
	fez/PTF967xJyY1FA9dOv1XUJ7NKk2es+eqRb4oiYQxeHQ2wOROZYdByoG8k5likuiw/OXvosyhxk
	fRuwwE5IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPMHo-0004yz-Gd; Mon, 05 Oct 2020 08:56:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPMHl-0004y2-Uu
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 08:55:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601888154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIhP0FuIGl8w6hVtstWYo1miB0t+IY3lSNHO1NwBAUg=;
 b=1bVjaYXPTOWxPjjCZXbGOhko1pl72m1MMxVgnEKe/Z72kbb9a8fAxnZ7B+EGasuIXh3BW6
 0Uxci4nPv8Drste3gRfkwbq4oOe3hhNIiUcCtKXEeLfyTrKIEWUYX2ZI6ZTqYzu6JHz7bj
 wk0Qt1WFy96m4OPF87gOw0oa/DYY3cnKi21RacudiD4S/POjFaBFaZXXmZ69QQdYb+FniR
 gGNjxcGOZ8fZZcm7ficHllUgV2lccAwnU7FCb5drk4Rs9XgTPEngyLbOzQbZd+OJos+ekc
 VQPZ4jDBfT2JwbnPVjI55zcZORLi2YTWEtueqYvD6+lJGRYH6Tze8AItfGMdNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601888154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIhP0FuIGl8w6hVtstWYo1miB0t+IY3lSNHO1NwBAUg=;
 b=Nn+A19Q+Lozpu8w7R4t0zbn+T9kc7/1vuZQhI5Wg6N3F0nR0r8evtwNibaf602A4ecMxS9
 m5hTCF8F9bbSbtAg==
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
In-Reply-To: <CAPDyKFo6T_P+TQQZSzFgHwLeE08f146KxKBpAutv209MXq0mjA@mail.gmail.com>
References: <20201002164915.938217-1-jbrunet@baylibre.com>
 <CAPDyKFo6T_P+TQQZSzFgHwLeE08f146KxKBpAutv209MXq0mjA@mail.gmail.com>
Date: Mon, 05 Oct 2020 10:55:54 +0200
Message-ID: <87wo052grp.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_045558_095094_49C20896 
X-CRM114-Status: GOOD (  16.54  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Brad Harper <bjharper@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05 2020 at 10:22, Ulf Hansson wrote:
> On Fri, 2 Oct 2020 at 18:49, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> IRQF_ONESHOT was added to this driver to make sure the irq was not enabled
>> again until the thread part of the irq had finished doing its job.
>>
>> Doing so upsets RT because, under RT, the hardirq part of the irq handler
>> is not migrated to a thread if the irq is claimed with IRQF_ONESHOT.
>> In this case, it has been reported to eventually trigger a deadlock with
>> the led subsystem.
>>
>> Preventing RT from doing this migration was certainly not the intent, the
>> description of IRQF_ONESHOT does not really reflect this constraint:
>>
>>  > IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler finished.
>>  >              Used by threaded interrupts which need to keep the
>>  >              irq line disabled until the threaded handler has been run.
>>
>> This is exactly what this driver was trying to acheive so I'm still a bit
>> confused whether this is a driver or an RT issue.
>>
>> Anyway, this can be solved driver side by manually disabling the IRQs
>> instead of the relying on the IRQF_ONESHOT. IRQF_ONESHOT may then be removed
>> while still making sure the irq won't trigger until the threaded part of
>> the handler is done.
>
> Thomas, may I have your opinion on this one.
>
> I have no problem to apply $subject patch, but as Jerome also
> highlights above - this kind of makes me wonder if this is an RT
> issue, that perhaps deserves to be solved in a generic way.
>
> What do you think?

Let me stare at the core code. Something smells fishy.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

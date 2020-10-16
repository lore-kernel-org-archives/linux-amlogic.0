Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80ACC433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 17:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642CA20709
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 17:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czOQoh/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642CA20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aJxu2ljI8PmFtFqZudn435W4bOLPxfqSjRqu+4RebNA=; b=czOQoh/AXyhwemckg9W+rKcpq
	kzEQjgX6V36jowZKttK3QDn+eYeRJ056hsGJR4ehMvrLH/s1TQrgMLi83SFoHX6IrDfJTQuEfXZmB
	qvsICnSIXOFGpfvqq1LI/9V1qSQYPPum+QlnIx2C7g0ivS2XJJcoemy9lC4BLDSoq9WuNrXJWz1xT
	5Qa7/VLjXDdORTS+JvXVXQxvl2ZRu8Y4jgloUt4FjzpsxY2F2QJBtf7b9HSxCIofxJDByJUsBMFmW
	NpfjHS/DSPEkJWbuMvOmX4QZLcJgLfQhJIzejPLkC5CEVHEZEEGwnu8sfDPZQxweqDajZSzCymXet
	MCmWpkPng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTsb-0003X8-Fx; Fri, 16 Oct 2020 17:51:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTsZ-0003WI-GO
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 17:51:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66ED13D5;
 Fri, 16 Oct 2020 10:50:55 -0700 (PDT)
Received: from bogus (unknown [10.57.17.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 501203F71F;
 Fri, 16 Oct 2020 10:50:54 -0700 (PDT)
Date: Fri, 16 Oct 2020 18:50:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: jassisinghbrar@gmail.com
Subject: Re: [PATCH] mailbox: avoid timer start from callback
Message-ID: <20201016175039.7xs4cafoe2uq7zus@bogus>
References: <20201016173020.12686-1-jassisinghbrar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016173020.12686-1-jassisinghbrar@gmail.com>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_135059_615162_4A044A7F 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-amlogic@lists.infradead.org, ionela.voinescu@arm.com, da@libre.computer,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 12:30:20PM -0500, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
> 
> If the txdone is done by polling, it is possible for msg_submit() to start
> the timer while txdone_hrtimer() callback is running. If the timer needs
> recheduling, it could already be enqueued by the time hrtimer_forward_now()
> is called, leading hrtimer to loudly complain.
> 
> WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
> CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
> Hardware name: Libre Computer AML-S805X-AC (DT)
> Workqueue: events_freezable_power_ thermal_zone_device_check
> pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> pc : hrtimer_forward+0xc4/0x110
> lr : txdone_hrtimer+0xf8/0x118
> [...]
> 
> This can be fixed by not starting the timer from the callback path. Which
> requires the timer reloading as long as any message is queued on the
> channel, and not just when current tx is not done yet.
>

I came to similar conclusion and was testing something similar. You bet
me. Since we have single timer and multiple channels, each time a message
is enqueued on any channel, timer gets added which is wrong.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I tested this patch too by reverting offending commit in -next, so

Tested-by: Sudeep Holla <sudeep.holla@arm.com>

You seem to have dropped the Fixes tags. Is that intentional ? If so,
any particular reasons. I think it is stable material and better to have
fixes tag so that it gets added to stable trees.

--
Regards,
Sudeep

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5663DC43467
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:25:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3EC020848
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ps6tpxFy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkd24Ytz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3EC020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vD5qSQVtznx57bF05xA7j6qkc3nzfv43m7zVPHZd+TM=; b=ps6tpxFyZyI5YqV/H/Z3QXwFR
	3gQvRvffEIElwNoo5Qmt7V1/r95xewm6AWElD9ACL+2KFbjZqnLUL4Wts1zRaC03LZFBbaYzbBH44
	WsWNxIoYezLanzPL6TPMN7ZPL4Fq94nQhgE5ww8wOGUdnbez3Jpiwgw9s7ol5Y7+C7QuB5O8tgrNW
	DhkYdnmsWDqwUVo5ODhaygJt+SG1Aj4U1k1O5CO2RcehwsbPmB8ZBE70WUEf/RNnH7ks0AyE68pgZ
	XPkZvLIpU22cuSxKySnOBcs00Bd0TbjhlczrdU4oDQ1w8z5qD9uqF1V0rWUV7rPQ7CRD4y+lPtqoJ
	oJMeF934A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUPf-00065w-W9; Fri, 16 Oct 2020 18:25:12 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUPc-00065K-Ew
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 18:25:10 +0000
Received: by mail-io1-xd44.google.com with SMTP id 67so5010667iob.8
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H94CcgSvoIFt4eb8xx+jgPXylVUqc01bZ1bzkG3yk18=;
 b=pkd24YtztESI+PfUnD1xCEGpwDBledIKaA7zmnGVNDsCkXZFfBnhxGEe5IBDuKpR8x
 TO9hO3LiOSl9qS5Y1mWNb2c7fxnr6TAOprB944NpsMlVre+AxvF460WPgPziM58YvsF/
 mpALdX2yqj4rTSqrgWD/Ixg/1w9rHhHfE/DGsY+h+u1MiIuwR6I299roQEqAI4kDKcVd
 aUxt51Yc/LLbd6cL7AnlMs2gfvX89WyU/hgci4tnl5bJbWrfL2LhMbyNz4TdLqviVUl7
 +xeXxomOiOXwdKhEmJNb70KTvO7PwJhQgoqna4Bu0JDFPSDjs7ONFCNVy1ZOPwyQ0rNi
 q6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H94CcgSvoIFt4eb8xx+jgPXylVUqc01bZ1bzkG3yk18=;
 b=PC6Xk1B2LRU8Z5vnnXe37VH16OCOuKV5UR29G4YRwFVv/sgrjHVXEmr6lwb9W9B105
 tdtZL9j6FK7+76NzGFfX6IuTgE0bHTQLWzhTYE89YyBf75NPtL1AhcmIHJFYYeLU/gJK
 Ez7Mo4ig8e+oFfGUHFL+C9Itysg0PBhNB8o+8yUkQISb5V7v8vse1nD5Mf/FLIRGJH6E
 eA2YdGWXir5G4JSUFNF6hyjGi5174kGN0KbRoe7w7wA0oxSuH22ZzynjDS0q9vwtVjgS
 M+3jjsvM85aKtCznBxnwqmxWdTgJmDkikpS2d4TGx322qM9RH9YIj3SVfv4vcV73V3RG
 wJ4Q==
X-Gm-Message-State: AOAM532rLdpdXad6jfsc8Q067dqsxkCoqyB+JYrU1BPdc/wLpn76ZJ5k
 UZvHrw60zPEeBHdhe3a93t7wgKtEYzh/n6pthVc=
X-Google-Smtp-Source: ABdhPJw5Y0eNTk6lBLN1SHs6VLBL/9EObUmdAu1lA/4RCMYltkLlgictyvVxBPeBodUqwt7bo+Q5eyTguzAXdz24nlY=
X-Received: by 2002:a05:6638:14c5:: with SMTP id
 l5mr3562028jak.68.1602872706946; 
 Fri, 16 Oct 2020 11:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201016173020.12686-1-jassisinghbrar@gmail.com>
 <20201016175039.7xs4cafoe2uq7zus@bogus>
In-Reply-To: <20201016175039.7xs4cafoe2uq7zus@bogus>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 16 Oct 2020 13:24:56 -0500
Message-ID: <CABb+yY0Mf_Nj=FoWkiVOQPFa9jay60u7+gpj-Q7bmm5EQqZWpA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: avoid timer start from callback
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_142508_555296_E451A2F7 
X-CRM114-Status: GOOD (  19.57  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Ionela Voinescu <ionela.voinescu@arm.com>, Da Xue <da@libre.computer>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 12:50 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Oct 16, 2020 at 12:30:20PM -0500, jassisinghbrar@gmail.com wrote:
> > From: Jassi Brar <jaswinder.singh@linaro.org>
> >
> > If the txdone is done by polling, it is possible for msg_submit() to start
> > the timer while txdone_hrtimer() callback is running. If the timer needs
> > recheduling, it could already be enqueued by the time hrtimer_forward_now()
> > is called, leading hrtimer to loudly complain.
> >
> > WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
> > CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
> > Hardware name: Libre Computer AML-S805X-AC (DT)
> > Workqueue: events_freezable_power_ thermal_zone_device_check
> > pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> > pc : hrtimer_forward+0xc4/0x110
> > lr : txdone_hrtimer+0xf8/0x118
> > [...]
> >
> > This can be fixed by not starting the timer from the callback path. Which
> > requires the timer reloading as long as any message is queued on the
> > channel, and not just when current tx is not done yet.
> >
>
> I came to similar conclusion and was testing something similar. You bet
> me. Since we have single timer and multiple channels, each time a message
> is enqueued on any channel, timer gets added which is wrong.
>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>
> I tested this patch too by reverting offending commit in -next, so
>
> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
>
> You seem to have dropped the Fixes tags. Is that intentional ? If so,
> any particular reasons. I think it is stable material and better to have
> fixes tag so that it gets added to stable trees.
>
Thanks for testing. I will decorate it appropriately once I have
Jerome's tested-by too.

-jassi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

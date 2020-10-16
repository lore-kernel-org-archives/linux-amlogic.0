Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA76C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 19:33:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B4520829
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 19:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SR+nkxmo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XGMTdoX+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B4520829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KH3zSsmvUXNWJk4xk8yksTbuJPoVnX0en/SFoEv8Im0=; b=SR+nkxmotfmcdSPEHrCl5SqMp
	OWiAPrwdxNEe5unH2shFlPX9+q+4oRDYIdREYbMBgp/qlZS5IRIz6JVid8wZTdcDxH46QPN0mAFuZ
	PpG7JOB0NhtsAla7AlVcp8Ig7LOCCKhmvPvyqVcirPYtXTQJLiKPqfNShSXTti/jqgVj8/NjHJ/Ix
	FoRsryBIg+J807JVNH5NWWw2ncjA5gC09uZRb3tFzo9fUpo6Kaa9KNaQyd+ruQ44/ktNzRe6Ggjcs
	/RATnWgLVVgMRp0cwHi2cFHKGgXKYUvaVoBrwN2BKvA2NP0Du3eIm9wGM7+8TWbWGV2P2xuqxErQ6
	lHJLOMP5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTVTF-0006xH-2w; Fri, 16 Oct 2020 19:32:57 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTVTC-0006wW-Pu
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 19:32:55 +0000
Received: by mail-ej1-x643.google.com with SMTP id x7so4766099eje.8
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=BqW8JiuIYvnXw5H3Z5hu1Iu1nuYkaGW3P8AQ8gC+FKM=;
 b=XGMTdoX+Gb7Re8mBkXzcfp7ph0rlqxum1dHeqeBiWns3aO0thPHJl4+fEhp+vawpfg
 JcE+EqdgCdYRH0t6sksouq6UihIaRxTB027K/2ksywUfcowTjJdzwVsSiXWItetd4bXV
 +8kiT8DyBDC01TToRWIVjPZgTjF6YBV0FZP3KOGw4d4KTruU8mPe5FZS8KTCC0WJxWws
 6aTHw7codOkvRnaMIH4gVnB4cdCOmhJJJJFDSQXK+2cbXizW2ElLWAjtzk1rNP2Cbd4m
 nSD77rNpq6UgWTVjRZgVZRC9fi27j6aO+PSIOr+XVWPBPoieKHv5sL1+ada96FYz7tLX
 BbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=BqW8JiuIYvnXw5H3Z5hu1Iu1nuYkaGW3P8AQ8gC+FKM=;
 b=EyRuR4R1tuHTKX9+vVgTrBTV4FzpzsYoUtdMgV4O1grdLWVenUlxXfxEDgVhJrJM6T
 1fK9wwH1CWXSAzHNHOsAFQQU8yHAe/MMN/PoGWCTiBHMLs+Jh1IqftGZiRr0naGLnLHi
 GFVzaOQ1Ly4UK2Wfa4I20cByLAuzH9WEsRxeMxCcxMw/Mlby6RScn8t9UDmVwN2pBJyO
 PvgqEwDd4d8+48h+p0+ZWys8DWt4IRPbDTO9DbBH/Gkdy91W8X21T3MAUiqU3vHkRI7s
 fSUsBIVBhqZfwPFvznf10e02Wj0XgrRnDiLUCCA0i3/FcP+oiXeJWstP/hr11fZEGGsK
 +1yQ==
X-Gm-Message-State: AOAM53348hC6Hz6Pr07VgkdOQpz4jH+zMoERIr+NyNiasiOagoKVToNw
 LwNrTjILu5OfRBYHaKMLcU0yrA==
X-Google-Smtp-Source: ABdhPJyBwMqo/66INsZbW1Y/UGKInEg+kHUaO9pvAn8S4dAFGvICAYgMBWhZBx84giYv3KIZEuMzJQ==
X-Received: by 2002:a17:906:c094:: with SMTP id
 f20mr5604777ejz.550.1602876773475; 
 Fri, 16 Oct 2020 12:32:53 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id u18sm2533174ejn.122.2020.10.16.12.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 12:32:52 -0700 (PDT)
References: <20201016173020.12686-1-jassisinghbrar@gmail.com>
 <1jh7quj9sa.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY3oghojLDAz2n8fio47X=we=mF=u8iA2zc7ApvcH7ySKA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] mailbox: avoid timer start from callback
In-reply-to: <CABb+yY3oghojLDAz2n8fio47X=we=mF=u8iA2zc7ApvcH7ySKA@mail.gmail.com>
Date: Fri, 16 Oct 2020 21:32:52 +0200
Message-ID: <1jeelyj7a3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_153254_853282_80DDB690 
X-CRM114-Status: GOOD (  23.28  )
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
 Jassi Brar <jaswinder.singh@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Ionela Voinescu <ionela.voinescu@arm.com>, Da Xue <da@libre.computer>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 16 Oct 2020 at 20:45, Jassi Brar <jassisinghbrar@gmail.com> wrote:

> On Fri, Oct 16, 2020 at 1:38 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Fri 16 Oct 2020 at 19:30, jassisinghbrar@gmail.com wrote:
>>
>> > From: Jassi Brar <jaswinder.singh@linaro.org>
>> >
>> > If the txdone is done by polling, it is possible for msg_submit() to start
>> > the timer while txdone_hrtimer() callback is running. If the timer needs
>> > recheduling, it could already be enqueued by the time hrtimer_forward_now()
>> > is called, leading hrtimer to loudly complain.
>> >
>> > WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
>> > CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
>> > Hardware name: Libre Computer AML-S805X-AC (DT)
>> > Workqueue: events_freezable_power_ thermal_zone_device_check
>> > pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
>> > pc : hrtimer_forward+0xc4/0x110
>> > lr : txdone_hrtimer+0xf8/0x118
>> > [...]
>> >
>> > This can be fixed by not starting the timer from the callback path. Which
>> > requires the timer reloading as long as any message is queued on the
>> > channel, and not just when current tx is not done yet.
>> >
>> > Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>> > ---
>> >  drivers/mailbox/mailbox.c | 12 +++++++-----
>> >  1 file changed, 7 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> > index 0b821a5b2db8..a093a6ecaa66 100644
>> > --- a/drivers/mailbox/mailbox.c
>> > +++ b/drivers/mailbox/mailbox.c
>> > @@ -82,9 +82,12 @@ static void msg_submit(struct mbox_chan *chan)
>> >  exit:
>> >       spin_unlock_irqrestore(&chan->lock, flags);
>> >
>> > -     if (!err && (chan->txdone_method & TXDONE_BY_POLL))
>> > -             /* kick start the timer immediately to avoid delays */
>> > -             hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
>> > +     /* kick start the timer immediately to avoid delays */
>> > +     if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
>> > +             /* but only if not already active */
>>
>> It would solve the problem I reported as well but instead of running the
>> check immediately (timer with value 0), we will have to wait for the
>> next of the timer, it is already started. IOW, there might be a delay
>> now. I don't know if this important for the mailbox - the existing
>> comments in the code suggested it was.
>>
> That comment is for when the first message is queued on the channel,
> which remains unimpacted.
> So, do I have your tested/acked by ?

Sure go ahead

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
> thnx,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

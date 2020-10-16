Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9E3C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 09:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B761E20848
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 09:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="af9Ey2ph";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RJw96zwU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B761E20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eebOMqU5WR9TZMT77ugxC3exWEyPRc659C3TeqyBHMo=; b=af9Ey2phyMMwHJChzsXAvNBsK
	NhHyuMczFeGk5SJOik+qzSdz/+Q6pn8DmzMVxPtBu5yE7jKH9KtrAME3WyVCxYDhPM0KbbDZVX+gE
	Ciy4D62n0Z9Ddt/GHcDjAqhZlgpFTvJVCHwK8i2wjzKOj0aql5B5BJSGOswmJ1Xe7xx/EQYzk7k18
	6GBpDgPxn4iwMEf+JflRY2z9okgHXOCIxT1Ne3zLBec8kZdrZ0cvFCGvyHl1A878rE+o4sIyN00dZ
	QyWpq5Z1ayBplSL+kDLalxxAkP5/gSz3tZ7iF6xXWM8I3X7EMLVV+QZI8W9deqGMe2gMY49xppmeg
	gn77mZBFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTLcn-0006z8-Jk; Fri, 16 Oct 2020 09:02:09 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTLcj-0006y0-D6
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 09:02:06 +0000
Received: by mail-ed1-x542.google.com with SMTP id cq12so1521841edb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=YRalqKr57maWSBCFfKOl28ih/XZdpqUZ21LloKcUJks=;
 b=RJw96zwU0FQkNGmsV2GHZr0VT571lwKekreZUXepXoEHLq+c8nEGV/Yh2xnNwkWh35
 x/EJLppvbeovU3HGvSOjN9+WFqQY81UrIStIrqEVatheU4A9omKh02Y9l1R5OdbPzuqt
 cyl/Ur77cYpOTUBDgvQf8OHzH+y/5gAs1/72XiCRpGhbDCCU/lPb5vtq46oUqYyyqCzI
 M0b7P1GJ+TGIyNrSG6M9dtbZ2HJW/HHhbN4MrKS0L2UJ3SKc689zxNT+ZpicuqzpwAz1
 nKtT3aDn/mQeHAuzQetX6R7puzox7w4j034Oo30H6nCxs+3vbAa+DHjp0Qs4FNY/M+ut
 M8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=YRalqKr57maWSBCFfKOl28ih/XZdpqUZ21LloKcUJks=;
 b=TtvrL92bW0goUb5WUWEiurr+Cx5kJPJX1LR3y9Vs00zcmW//hbZp/B5mh7ni0hth49
 qSQCwoQpas2QY0dZ4ZvWedkIkLcuRj1jGH/7FJsOS2QYv11vixTUoqzn076XUpoJKovN
 tHYXKCJFuSIuGHSOBE63gJPTTp3Krj3lkERrf4SkW1juYSl6vi5SB4p5ULgs0bL4CBVS
 RyEnsdpgfAhFi8wq7uqbH7XnjiIm3Aq4sTvhv1Ia39EfUchbbXcM0a/ZncGljivqqJCL
 lj/bZaBHHINS7kS7vy+H3CDTQxPERh+AIEYQ2DDeUyGHKOUVOt+n4Mh+Nzq7BDvA+Jbu
 OHgA==
X-Gm-Message-State: AOAM532Vh9yDqjYn9Tt2zVK/l0wNCIitQM/Y2fKKIj4VHKl1b2PdQqrM
 Un5pSlPmrBaDj7n3PJmzpqukGw==
X-Google-Smtp-Source: ABdhPJxJfdyU0OC1yvdvGDEZ8q85HrAiLG1l1xKb7I8SIW4X4SGJNje80ty/juGeB0gzJ6huReSteg==
X-Received: by 2002:aa7:d4d8:: with SMTP id t24mr2702751edr.247.1602838924236; 
 Fri, 16 Oct 2020 02:02:04 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id a13sm915107edx.53.2020.10.16.02.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 02:02:03 -0700 (PDT)
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <20201015142935.GA12516@arm.com> <20201016084428.gthqj25wrvnqjsvz@bogus>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
 Ionela Voinescu <ionela.voinescu@arm.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
In-reply-to: <20201016084428.gthqj25wrvnqjsvz@bogus>
Date: Fri, 16 Oct 2020 11:02:02 +0200
Message-ID: <1jimbak0hh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_050205_465383_40A45E01 
X-CRM114-Status: GOOD (  28.60  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 16 Oct 2020 at 10:44, Sudeep Holla <sudeep.holla@arm.com> wrote:

> On Thu, Oct 15, 2020 at 03:29:35PM +0100, Ionela Voinescu wrote:
>> Hi Jerome,
>> 
>> On Thursday 15 Oct 2020 at 15:58:30 (+0200), Jerome Brunet wrote:
>> > 
>> > On Thu 15 Oct 2020 at 15:46, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>> > 
>> > > Hi guys,
>> > >
>> > > On Wednesday 23 Sep 2020 at 14:39:16 (+0200), Jerome Brunet wrote:
>> > >> If the txdone is done by polling, it is possible for msg_submit() to start
>> > >> the timer while txdone_hrtimer() callback is running. If the timer needs
>> > >> recheduling, it could already be enqueued by the time hrtimer_forward_now()
>> > >> is called, leading hrtimer to loudly complain.
>> > >> 
>> > >> WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
>> > >> CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
>> > >> Hardware name: Libre Computer AML-S805X-AC (DT)
>> > >> Workqueue: events_freezable_power_ thermal_zone_device_check
>> > >> pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
>> > >> pc : hrtimer_forward+0xc4/0x110
>> > >> lr : txdone_hrtimer+0xf8/0x118
>> > >> [...]
>> > >> 
>> > >> Canceling the timer before starting it ensure that the timer callback is
>> > >> not running when the timer is started, solving this race condition.
>> > >> 
>> > >> Fixes: 0cc67945ea59 ("mailbox: switch to hrtimer for tx_complete polling")
>> > >> Reported-by: Da Xue <da@libre.computer>
>> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > >> ---
>> > >>  drivers/mailbox/mailbox.c | 8 ++++++--
>> > >>  1 file changed, 6 insertions(+), 2 deletions(-)
>> > >> 
>> > >> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> > >> index 0b821a5b2db8..34f9ab01caef 100644
>> > >> --- a/drivers/mailbox/mailbox.c
>> > >> +++ b/drivers/mailbox/mailbox.c
>> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
>> > >>  exit:
>> > >>  	spin_unlock_irqrestore(&chan->lock, flags);
>> > >>  
>> > >> -	if (!err && (chan->txdone_method & TXDONE_BY_POLL))
>> > >> -		/* kick start the timer immediately to avoid delays */
>> > >> +	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
>> > >> +		/* Disable the timer if already active ... */
>> > >> +		hrtimer_cancel(&chan->mbox->poll_hrt);
>> > >> +
>> > >> +		/* ... and kick start it immediately to avoid delays */
>> > >>  		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
>> > >> +	}
>> > >>  }
>> > >>  
>> > >>  static void tx_tick(struct mbox_chan *chan, int r)
>> > >
>> > > I've tracked a regression back to this commit. Details to reproduce:
>> > 
>> > Hi Ionela,
>> > 
>> > I don't have access to your platform and I don't get what is going on
>> > from the log below.
>> > 
>> > Could you please give us a bit more details about what is going on ?
>> > 
>> 
>> I'm not familiar with the mailbox subsystem, so the best I can do right
>> now is to add Sudeep to Cc, in case this conflicts in some way with the
>> ARM MHU patches [1].
>>
>
> Not it can't be doorbell driver as we use SCPI(old firmware) with upstream
> MHU driver as is limiting the number of channels to be used.
>
>> In the meantime I'll get some traces and get more familiar with the
>> code.
>>
>
> I will try that too.

BTW, this issue was originally reported on amlogic platforms which also
use arm,mhu mailbox driver.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

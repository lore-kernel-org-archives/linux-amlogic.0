Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22DDC433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:39:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6922084C
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kIhg3yjy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NkgS21FM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6922084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OE7LFcnyfBcuvXsBpyJZAkQAmWpWs05NqFXNcUXYjxs=; b=kIhg3yjyabt5N/qvzhm4mm/9J
	KgD+1m3TeX0y0ODz5S6RKVQ3ulJYOZP8fZrcBV6O6CaRMZj1BsSU/P/w/K14UF63/EWPpvEHylYN8
	unCEmhNLHTiMNwYdNxmj+IR1hwwkF2e8jNVNfQwvQDzAdbeNifDlHRlWz9zBr0dB3ApIy4jdhBqMj
	SX2FIfn3lO/E4AUapizhDFdXRm4yc8TFyX4nLXNAxDyvrFZ68JHHHCym4+EP1d8ReTh+t8Ki8eRkY
	by4Jm40qQvk1IN73itwJwZBI5ZFOnQK2scDNl8faj37aMC7mMM19Fi5OjEEUlWXSis1yCZ7a87+rK
	8sYGAOI/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUcv-0007er-IT; Fri, 16 Oct 2020 18:38:53 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUcs-0007e3-Hc
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 18:38:51 +0000
Received: by mail-ej1-x643.google.com with SMTP id x7so4561602eje.8
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=2zZ9Bi5ipiBfOedVgWs+s17XKliwMJJo2kx5NuQsO90=;
 b=NkgS21FMAKTdY8KfT1dAj5/BSF3aJXAiiidrcKTHLpR+HeCQgP1u8BC6v1a7WCRcDq
 l9xumpHbA3K1/ubMrowrA2PHr8aCyOQhwbhLDO8WcR1U5td02UK2KWdjaldMkfFwq4on
 2T8LxW2E+LgAqt+l2+dIfTZDQcvMFhFjYUZR/AQjAEFjQxoDkgIBcOclq6WINpwDlrc4
 otw8k5BzWxOi7Z4wQmcehzqik+2bpzbLkxVKqnDSZX3T0ezM6Oq+xTuoYVSaOsCcj6EC
 yUU8fl2fYqJzS5Q2QT6JevqBRXef1CXibpcwiAwQnB6o7CvP3qlGxjifIhFFzoPT5PTu
 FtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=2zZ9Bi5ipiBfOedVgWs+s17XKliwMJJo2kx5NuQsO90=;
 b=si3c825zCPvUk7gC7u6O8R/OQAMctk1G+crRifg75aLxQk5m+1+V5ywVSQxaS5SndH
 KDiLKiFEcbGUhHHL9YnH/QRrBVtdkNXHy22SPErSKgt81iggPq28VgAH3zvoOXJsj2Om
 Q+gz7tRdwdZDE/d04BbPv2C/wKNhRnnhT3yxgAH4x5M8WgOF0JfTz3k/+RW6Iy3ZvpET
 byUFLzuKnG1bs8QuvAAmt0kZnssmPfXDLEcZAFTXhrvceyxc+/ayfT++G2VnL97eT4ij
 8dV4YrVeyP5uUtf6GjF+PKFLKDXSTAY7oNbwt46WHZzbNutETUptUGKxam4i+L60QdIV
 smEA==
X-Gm-Message-State: AOAM532JOC85lDxU2hARWvs9OqUdgM+qp1zgbkYMZGnoB9oZoXyUdaq2
 qTv9KMiC3xGR5rOv8SmYE2iuXQ==
X-Google-Smtp-Source: ABdhPJwvdBTERxVJGMwUofl3mCYol43bxTqtNRVxrOu8OGKxuymL0NyNUXYNtTPyp+cmdarLmQUpzQ==
X-Received: by 2002:a17:906:72cb:: with SMTP id
 m11mr4941541ejl.348.1602873527174; 
 Fri, 16 Oct 2020 11:38:47 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o13sm2397555ejr.120.2020.10.16.11.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:38:46 -0700 (PDT)
References: <20201016173020.12686-1-jassisinghbrar@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] mailbox: avoid timer start from callback
In-reply-to: <20201016173020.12686-1-jassisinghbrar@gmail.com>
Date: Fri, 16 Oct 2020 20:38:45 +0200
Message-ID: <1jh7quj9sa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_143850_709723_E1D930A8 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: khilman@baylibre.com, Jassi Brar <jaswinder.singh@linaro.org>,
 ionela.voinescu@arm.com, da@libre.computer, sudeep.holla@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 16 Oct 2020 at 19:30, jassisinghbrar@gmail.com wrote:

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
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> ---
>  drivers/mailbox/mailbox.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 0b821a5b2db8..a093a6ecaa66 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -82,9 +82,12 @@ static void msg_submit(struct mbox_chan *chan)
>  exit:
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  
> -	if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> -		/* kick start the timer immediately to avoid delays */
> -		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> +	/* kick start the timer immediately to avoid delays */
> +	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> +		/* but only if not already active */

It would solve the problem I reported as well but instead of running the
check immediately (timer with value 0), we will have to wait for the
next of the timer, it is already started. IOW, there might be a delay
now. I don't know if this important for the mailbox - the existing
comments in the code suggested it was.

> +		if (!hrtimer_active(&chan->mbox->poll_hrt))
> +			hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> +	}
>  }
>  
>  static void tx_tick(struct mbox_chan *chan, int r)
> @@ -122,11 +125,10 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
>  		struct mbox_chan *chan = &mbox->chans[i];
>  
>  		if (chan->active_req && chan->cl) {
> +			resched = true;
>  			txdone = chan->mbox->ops->last_tx_done(chan);
>  			if (txdone)
>  				tx_tick(chan, 0);
> -			else
> -				resched = true;
>  		}
>  	}


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

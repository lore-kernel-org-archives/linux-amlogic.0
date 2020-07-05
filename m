Return-Path: <SRS0=0hhE=AQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A68C433E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 15:51:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CFA20737
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 15:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t/XsybUt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwvtZgKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14CFA20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U+fE4Ma6I88WvtO9zNUIUS8uwihIbAoJOyZGClh4078=; b=t/XsybUtg+5p1UpDm3rMCVpiv
	gBM4L9zrVu9Pt+iob3y7XYig5BEXk+H7vqSOuswdRxuOalSk//PmKQ5R4MCqtrKcayTOG3TN/G17W
	EOX1So5NgSAJo5sV2CASL0S1JLvUtdK4+/jX3lWU260ysIiazfSj6bm+qtXjTc3fCETEXQz5zHbNK
	ht5Df6JIsQ7D56Pf3iQVGHCBUEKjNuALCoA2u6NM1GO8zv79nvSKYC7/NUlFGxWD9V/N1PnVM3DQt
	C0pLk2V7vToxB66/a5K1ae2Kzd5jjv1QSNj1cDCVG2cZVRWVsJ9mJ5gHuXx3SeJPXILl27btk1HJ/
	giINMSRHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js6vB-0004Rb-Uq; Sun, 05 Jul 2020 15:51:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js6v9-0004RG-V8
 for linux-amlogic@lists.infradead.org; Sun, 05 Jul 2020 15:51:13 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEB3E20737;
 Sun,  5 Jul 2020 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593964270;
 bh=GVTPIN6JeTVm195DQhouXcw+0S8XftGG71U+IRzWY3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rwvtZgKBEQBs/g6m3PcAfOavB3ld744BQerauqmeOJSWmRbKD2iRvBxSznb6fo8KJ
 nXfbCyxvnczNg7EUs4hloVmuKDxtnHXJS17p8GHvaxIlGvYl5NEyEVvDQgpR4h0g4n
 5b6G06pJgnTsXM+7fURanMxS4938wPcFRN/xTxe0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1js6v7-009Cdi-8i; Sun, 05 Jul 2020 16:51:09 +0100
MIME-Version: 1.0
Date: Sun, 05 Jul 2020 16:51:09 +0100
From: Marc Zyngier <maz@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] tty: serial: meson_uart: Init port lock early
In-Reply-To: <20200705112222.GO3703480@smile.fi.intel.com>
References: <20200705092736.1030598-1-maz@kernel.org>
 <CAHp75VfFNO=oqHX9EeNdVgcQUfu7RBr6SDTWi3XF4gSQNjqzUw@mail.gmail.com>
 <66dcb907f3b9c5413cebe14e0bec00a4@kernel.org>
 <20200705112222.GO3703480@smile.fi.intel.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <e307450f24a767e08358acfe0d87ca74@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org,
 khilman@baylibre.com, linux-serial@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_115112_246422_6B72BA78 
X-CRM114-Status: GOOD (  31.89  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-07-05 12:22, Andy Shevchenko wrote:
> On Sun, Jul 05, 2020 at 11:28:56AM +0100, Marc Zyngier wrote:
>> On 2020-07-05 11:07, Andy Shevchenko wrote:
>> > On Sun, Jul 5, 2020 at 12:32 PM Marc Zyngier <maz@kernel.org> wrote:
>> > >
>> > > The meson UART driver triggers a lockdep splat at boot time, due
>> > > to the new expectation that the driver has to initialize the
>> > > per-port spinlock itself.
>> > >
>> > > It remains unclear why a double initialization of the port
>> > > spinlock is a desirable outcome, but in the meantime let's
>> > > fix the splat.
>> > >
>> >
>> > Thanks!
>> >
>> > Can you test patch from [1] if it helps and doesn't break anything in
>> > your case?
>> >
>> > [1]:
>> > https://lore.kernel.org/linux-serial/20200217114016.49856-1-andriy.shevchenko@linux.intel.com/T/#m9255e2a7474b160e66c7060fca5323ca3df49cfd
>> 
>> On its own, this patch doesn't seem to cure the issue (and it
>> adds a compile-time warning due to unused flags).
> 
> Ah, sorry, I didn't compile it.
> And after second though I think we simple need to initialise spin lock 
> there.
> Can you try below (compile-tested only):
> 
> From ed4c882e7dc3fdfcea706ada0678c060c36163b3 Mon Sep 17 00:00:00 2001
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date: Sat, 4 Jul 2020 19:30:39 +0300
> Subject: [PATCH 1/1] serial: core: Initialise spin lock before use in
>  uart_configure_port()
> 
> In case of the port to be used as a console we must initialise
> a spin lock before use.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/tty/serial/serial_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_core.c 
> b/drivers/tty/serial/serial_core.c
> index 3cc183acf7ba..a81b4900eb60 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -2371,6 +2371,13 @@ uart_configure_port(struct uart_driver *drv,
> struct uart_state *state,
>  		/* Power up port for set_mctrl() */
>  		uart_change_pm(state, UART_PM_STATE_ON);
> 
> +		/*
> +		 * If this driver supports console, and it hasn't been
> +		 * successfully registered yet, initialise spin lock for it.
> +		 */
> +		if (port->cons && !(port->cons->flags & CON_ENABLED))
> +			spin_lock_init(&port->lock);
> +
>  		/*
>  		 * Ensure that the modem control lines are de-activated.
>  		 * keep the DTR setting that is set in uart_set_options()
> --
> 2.27.0
> 
> 
> 
>> Or did you mean to test it in complement of my patch?
> 
> No, the idea to avoid "fixing" driver as you rightfully noticed a
> double init issue.

This certainly keeps lockdep quiet on my system. You probably want
to set the lockdep class whilst you're at it (keeping that code
common with uart_port_spin_lock_init).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

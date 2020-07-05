Return-Path: <SRS0=0hhE=AQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7D5C433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 11:22:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D782073E
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jul 2020 11:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRquYk/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D782073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=el+OEU52I2mBazD+iwowI491KtkKlXVfdOWOhYZtKJo=; b=NRquYk/gqBZVMAK3pmFRpnA0D
	E5cWeUcFPTAQuLm40NOThJXTubDEGxIEwGXXpXn5x11gI4MI5C2b3+kTXIYs7y2llkHmXXVGuDVv8
	FBuF7r8OShbbUp4G6dGh8hBwwzvsX1bmJEKhVP6+oe6pSrv2mythhno+gEdV5EVzyKEN/ZyRO8yF/
	M1v9B5IhzisQgtLdUXX6JnzkUVucshdZ6ujOR5j1v8yda6sQ/ee9CPcr+764TwKihHcdm1IWcYX9z
	uWoYKGmumsTZz3ir/yhRea8X+8Qt1A5I7KBgGvjoAUMEsM/etUhu1SXUXIKTGWh1yH12lUdhL/L6E
	o0eiTacng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js2j6-0002hH-HW; Sun, 05 Jul 2020 11:22:28 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js2j4-0002ga-9d
 for linux-amlogic@lists.infradead.org; Sun, 05 Jul 2020 11:22:27 +0000
IronPort-SDR: 5NMOTc+xjADZiirZGa/kVcRAjvy6xeN0XH/N3tYGo8INkE7alUPB96EIqifMRN2gcOwgFywLw5
 Dj5Gym/83YWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="208817631"
X-IronPort-AV: E=Sophos;i="5.75,314,1589266800"; d="scan'208";a="208817631"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2020 04:22:23 -0700
IronPort-SDR: T+eWFcBHP4OcUpfVbhbMXRb2QAq2qO5CtAgSKyoebURqx0EUJ5ecbJ/n4rMlT0LE01cYz0ZGzN
 YZ1kq+E43NLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,314,1589266800"; d="scan'208";a="456381298"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 05 Jul 2020 04:22:21 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1js2j0-0007gG-M7; Sun, 05 Jul 2020 14:22:22 +0300
Date: Sun, 5 Jul 2020 14:22:22 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] tty: serial: meson_uart: Init port lock early
Message-ID: <20200705112222.GO3703480@smile.fi.intel.com>
References: <20200705092736.1030598-1-maz@kernel.org>
 <CAHp75VfFNO=oqHX9EeNdVgcQUfu7RBr6SDTWi3XF4gSQNjqzUw@mail.gmail.com>
 <66dcb907f3b9c5413cebe14e0bec00a4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66dcb907f3b9c5413cebe14e0bec00a4@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_072226_469001_9A9DA7DC 
X-CRM114-Status: GOOD (  23.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jul 05, 2020 at 11:28:56AM +0100, Marc Zyngier wrote:
> On 2020-07-05 11:07, Andy Shevchenko wrote:
> > On Sun, Jul 5, 2020 at 12:32 PM Marc Zyngier <maz@kernel.org> wrote:
> > > 
> > > The meson UART driver triggers a lockdep splat at boot time, due
> > > to the new expectation that the driver has to initialize the
> > > per-port spinlock itself.
> > > 
> > > It remains unclear why a double initialization of the port
> > > spinlock is a desirable outcome, but in the meantime let's
> > > fix the splat.
> > > 
> > 
> > Thanks!
> > 
> > Can you test patch from [1] if it helps and doesn't break anything in
> > your case?
> > 
> > [1]:
> > https://lore.kernel.org/linux-serial/20200217114016.49856-1-andriy.shevchenko@linux.intel.com/T/#m9255e2a7474b160e66c7060fca5323ca3df49cfd
> 
> On its own, this patch doesn't seem to cure the issue (and it
> adds a compile-time warning due to unused flags).

Ah, sorry, I didn't compile it.
And after second though I think we simple need to initialise spin lock there.
Can you try below (compile-tested only):

From ed4c882e7dc3fdfcea706ada0678c060c36163b3 Mon Sep 17 00:00:00 2001
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 4 Jul 2020 19:30:39 +0300
Subject: [PATCH 1/1] serial: core: Initialise spin lock before use in
 uart_configure_port()

In case of the port to be used as a console we must initialise
a spin lock before use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/serial_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 3cc183acf7ba..a81b4900eb60 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2371,6 +2371,13 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		/* Power up port for set_mctrl() */
 		uart_change_pm(state, UART_PM_STATE_ON);
 
+		/*
+		 * If this driver supports console, and it hasn't been
+		 * successfully registered yet, initialise spin lock for it.
+		 */
+		if (port->cons && !(port->cons->flags & CON_ENABLED))
+			spin_lock_init(&port->lock);
+
 		/*
 		 * Ensure that the modem control lines are de-activated.
 		 * keep the DTR setting that is set in uart_set_options()
-- 
2.27.0



> Or did you mean to test it in complement of my patch?

No, the idea to avoid "fixing" driver as you rightfully noticed a double init issue.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

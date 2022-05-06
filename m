Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16059C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 May 2022 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ8ZIjq/d8sejc2p2s2NvXhsaBBe9LLxLa89V38bIkA=; b=3SfLMzJ3Hq4Kiy
	Ji7hFbjeIPvfzw6PyX6+wQBDq233HoPr2iF4mxn7YvKmZZ9e2suaWviQ1k+9+sSGs+OIyHI+sBZwk
	pffbDwBa11kChmxL57oRSXGRxvD4ZV65FQE0S2SlTGHkRTh/s2X3XNzbV4zl2+y624bmLw9yMOkVN
	iDQiHdcOiOudVUUCK9561V5ZWOYG/tfS2L5YIVqcRJXm3/7+IZ4QOG7J7rnlEWVLJIBVUEZX7v+C7
	ZpY9SRFjGOw1a8Yx1vOd2Z14IL25z78bWuyy5gw68bSEGRoJ1ynPqoZQymgJMPBu2DmW9oCRT+V/M
	5osYHbxUYmFgcU6v/9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmtF3-0023Nj-VX; Fri, 06 May 2022 08:23:14 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmt8O-0020rL-Be
 for linux-amlogic@lists.infradead.org; Fri, 06 May 2022 08:16:21 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 96AD01F910;
 Fri,  6 May 2022 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651824974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMtR9RH4hTYIsMANbyKvgkBZPC808rHyRFlpC3fYLRo=;
 b=BDN/cKlwvO99GE7qhWLk8USYXX45YH1F8Sy30e3vxmtG4E3B6lAp9+pe0VDCuA3jQJXAq8
 09OWYYPDLZtCK3iTfGb2Fr9k6sgJbBQOKNa4REs7Bb455QeO8QWOXXKAOAHBnojDeb5esX
 P70Rn/O1tBYx6sw0icRrV5yH/BLX1Wg=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3A0D22C142;
 Fri,  6 May 2022 08:16:13 +0000 (UTC)
Date: Fri, 6 May 2022 10:16:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Message-ID: <YnTZTQv/oGwMiXud@alley>
References: <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
 <87pmktm2a9.fsf@jogness.linutronix.de>
 <87a6bwapij.fsf@jogness.linutronix.de>
 <87zgjvd2zb.fsf@jogness.linutronix.de>
 <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_011620_606220_CAFE0EE7 
X-CRM114-Status: GOOD (  17.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri 2022-05-06 08:43:02, Marek Szyprowski wrote:
> Hi John,
> 
> On 06.05.2022 00:33, John Ogness wrote:
> > On 2022-05-05, John Ogness <john.ogness@linutronix.de> wrote:
> >> I will go through and check if all access to AML_UART_CONTROL is
> >> protected by port->lock.
> > The startup() callback of the uart_ops is not called with the port
> > locked. I'm having difficulties identifying if the startup() callback
> > can occur after the console was already registered via meson_uart_init()
> > and could be actively printing, but I see other serial drivers are
> > protecting their registers in the startup() callback with the
> > port->lock.

I guess that it is used by the early console before the racy
code is called.

> > Could you try booting the meson hardware with the following change? (And
> > removing any previous debug changes I posted?)
> 
> Bingo! It looks that the startup() is called when getty initializes 
> console. This fixed the issues observed on the Amlogic Meson based boards.
> 
> Feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Uff, it is a huge relief that it has got fixed.

Best Regards,
Petr

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

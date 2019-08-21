Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD06C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 13:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899EF22DD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 13:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sxt2pOiG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wj/jQxTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899EF22DD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ2tGdaei+vNFZnBKncFRNI6gC4jaOaS0x/7N4eaoY4=; b=sxt2pOiGX1RWMW
	gNNZc9osqE+BZG2QxHmPDG9xTEW/vlIQPUfmTyr2wwNhY/DhFQpoZBbEYsisD2hJDEz0yJqsP4K0C
	hg83a7WH0cmHY+QxoK/tXvBYoD1U2Rox4VBpb+uLEqnFa8QUWdc31+n1MoZeJ/4/g5qdk6ebek8fP
	uC5NtBKqMnwrO/b0/Wp5zeMmRkkSDLP+WVoxnmgcV5TuAoqBmwh6nDJw2d0fg4L1wpeBbzkpiI2/f
	wgiwiJcLNqGLD0k7mQ2T8yL5pJEevB6Ym6FaVtbWPpNz2TUGuBylEZEvFrNqlKnMVn5Xb3vKQ3Ozv
	I9D6Ax8KuwAad7V7wj/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Qp7-0005O8-TR; Wed, 21 Aug 2019 13:38:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Qp5-0005Nf-EZ; Wed, 21 Aug 2019 13:38:48 +0000
Received: from localhost (unknown [12.166.174.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D601C22DD3;
 Wed, 21 Aug 2019 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566394727;
 bh=1crXxAgFEIvSAhmR5bmvnV+IHCI5hHByods6Q3REdfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wj/jQxTaLBtd0YV/ei+OzDxETvK4ck8FQsAph4HCyuRWFFHB59YTGtsFZ7YhUN5P3
 gowgyGcIvQiD7XiYRFJyVgy/f/2LDxW0Ou1bi2aQiDqtP2KbZ9OOIoaySkfd/WOqUi
 oO7plV0xnjruCdJpmvHCkHMgt49NRj/fWKcFYWpI=
Date: Wed, 21 Aug 2019 06:38:46 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
Message-ID: <20190821133846.GC4890@kroah.com>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821131140.GC2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821131140.GC2349@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_063847_534800_F0828DCB 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, usb-storage@lists.one-eyed-alien.net,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, Nancy Yuen <yuenn@google.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Patrick Venture <venture@google.com>,
 stern@rowland.harvard.edu, kernel-team@android.com,
 Dan Williams <dan.j.williams@intel.com>, Ingo Molnar <mingo@kernel.org>,
 linux-rtc@vger.kernel.org, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
 sspatil@google.com, linux-watchdog@vger.kernel.org, arnd@arndb.de,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, jeyu@kernel.org,
 Matthias Maennich <maennich@google.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, pombredanne@nexb.com,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 03:11:40PM +0200, Peter Zijlstra wrote:
> On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
> > As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> > That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> > seems to be some consensus amongst kernel devs that the export surface
> > is too large, and hard to reason about.
> > 
> > Generally, these symbols fall in one of these categories:
> > 1) Symbols actually meant for drivers
> > 2) Symbols that are only exported because functionality is split over
> >    multiple modules, yet they really shouldn't be used by modules outside
> >    of their own subsystem
> > 3) Symbols really only meant for in-tree use
> > 
> > When module developers try to upstream their code, it regularly turns
> > out that they are using exported symbols that they really shouldn't be
> > using. This problem is even bigger for drivers that are currently
> > out-of-tree, which may be using many symbols that they shouldn't be
> > using, and that break when those symbols are removed or modified.
> > 
> > This patch allows subsystem maintainers to partition their exported
> > symbols into separate namespaces, and module authors to import such
> > namespaces only when needed.
> > 
> > This allows subsystem maintainers to more easily limit availability of
> > these namespaced symbols to other parts of the kernel. It can also be
> > used to partition the set of exported symbols for documentation
> > purposes; for example, a set of symbols that is really only used for
> > debugging could be in a "SUBSYSTEM_DEBUG" namespace.
> 
> I'm missing how one can prohibit these random out of tree modules from
> doing MODULE_IMPORT_NS().

Nothing, but then they are explicitly being "bad" :)

> That is; suppose I stick all the preempt_notifier symbols in a KVM
> namespace, how do I enforce no out-of-tree modules ever do
> MODULE_IMPORT_NS(KVM) and gain access?
> 
> (the above would basically break virtualbox, which I knows uses preempt
> notifiers too, but I don't give a rats arse about that)

It's a huge red flag for anyone reviewing the code that this module is
doing something it probably really should not be doing at all.  It will
make reviewing code easier, this isn't there to try to "prevent bad
actors" at all, sorry.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

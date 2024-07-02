Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A41C30658
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2024 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9i/tdVZZX8uD/m3Vewqt4KFCkpNC1+9xaP8atFo+9q4=; b=iJFSIMl47MTQ//
	+5hE/f87NZHbJDAeCy0U8B+h3JKlkCfl1k0btfXIeFyxwkb4UpAeSldQQXUxACmMYmtMOznsbmuHk
	5LWFIEKtaPjBO+rM0SrzqyAKXsLs4uu7utSyiNIEB8bLTRokBk8nMXYgRaNSAH6CPWyLwu/96NTFI
	zeQNRJKh08sUEzmyQTIqnXWYbBF5phNi+ytAADw1+n3ccKio9PT7KJD3G7m5sEux7OjFk26q2XA7t
	biv/IO/FNc+hljSyB3fMYwGwZByY0PHOM/yHY5J09V4tLZwkvSq7UgIHIp3UJyl3j9W0uuQG3pfvm
	RfCjM38vjzdOqP9ackHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOiiG-00000007hf4-1rh4;
	Tue, 02 Jul 2024 18:58:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOiiD-00000007hdT-3jqJ
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jul 2024 18:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F4B4CE20E5;
	Tue,  2 Jul 2024 18:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7113C116B1;
	Tue,  2 Jul 2024 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719946722;
	bh=Ar3wR6ASOgGCK1m2Gm9pQgjh2S7TBujxoLQT+MNP91A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QRdeVJpGkXLXZJEgLb1vSgrUq0fILUNypj0FCUeD5bapgGZNVHY/zDXNwa7RW5QO0
	 m/RZcgWpXfPOTf+XrS9i5uvdkjI8axpobNWyezOyWiD0p7NI+i40atSXzTHPWBzBsC
	 lzTn1uEm1sueLHmZZaaclbUZHmfLcnTZfWrB6kmTabBDL2jDBGrozp5dZsAB2W6XUf
	 c967mc/EZAbohZrO9lPxo0y8OJnXG4T44LSxzPwLLPbdH8NiqoWO1iqdSlWLJALnmn
	 w938MaezXitd7rn5N6USyPrUuhrYmoPmu7kGoFyLFp0om0E64nPIRBvbCn40lhduOc
	 CXUr+vQljQ2TA==
Message-ID: <217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jikyhp0pc.fsf@starbuckisacylon.baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com> <20240516150842.705844-9-jbrunet@baylibre.com> <68518f93af68cbc0153c8bd765dc885f.sboyd@kernel.org> <1jikyhp0pc.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [RFC PATCH 8/9] clk: meson: add auxiliary reset helper driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 02 Jul 2024 11:58:40 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_115846_319708_89A3918F 
X-CRM114-Status: GOOD (  30.41  )
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

Quoting Jerome Brunet (2024-06-10 03:10:55)
> On Wed 29 May 2024 at 18:01, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> >
> > I'd prefer we move the device creation and registration logic to
> > drivers/reset as well. See commit 098c290a490d ("clock, reset:
> > microchip: move all mpfs reset code to the reset subsystem") for some
> > inspiration.
> 
> Ok but if it lives in reset I don't really get the purpose served by the
> auxiliary devices in that case. Why not export a function that directly
> calls reset_controller_register() in that case ? 
> 
> I thought the point was to properly decouple both sides.

Yes.

We use auxiliary devices so that the clk and reset drivers are
decoupled. Calling reset_controller_register() directly must return
success, whereas creating a device _should_ only fail if the device
couldn't be created/registered. It's less likely to fail with an
auxiliary device. This also allows the clk driver to be a module and the
reset driver builtin if, for example, the reset framework doesn't
support modules. Another benefit would be moving the probe context to
another thread if it can be async.

> 
> I don't have strong opinion about it, TBH. It is just how it made sense
> to me. If you are sure about this, I don't mind changing

It seems better to put the device creation in the same file as the
driver so that it's further decoupled from the clk driver and
consolidated in the reset directory. This way, a single API is the only
thing the clk driver uses to create the reset device, instead of putting
the matching string for the device and driver in the clk and reset
drivers and having to know that the auxiliary bus is used.

The downside I see is that the clk driver can't be builtin if the reset
driver is a module. I'm not sure that's really a problem though. If it
is then we can make the registration API into another C file that still
lives in drivers/reset that has another kconfig symbol.

> 
> >
> > One thing I haven't really thought about too much is if they're two
> > different modules. One for clk and one for reset. If the device
> > registration API is a symbol the clk module depends on then maybe that
> > is better because it means both modules are loaded, avoiding a
> > round-trip through modprobe. It also makes sure that the drivers are
> > either both builtin or both modular.
> 
> I have checked with the current implementation, if the reset driver is
> missing, the clock part does not fail. Registering the aux device
> succeeds in clock but the device never comes up (duh). So it does
> not crash, the consumers of the aux reset device will just defer.
> 
> Said differently, the '#if IS_ENABLED(CONFIG_RESET_CONTROLLER)' in
> clk-mpfs.c was not necessary ... it was removed in the changed you
> linked anyway.
> 

Cool.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

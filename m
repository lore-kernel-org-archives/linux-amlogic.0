Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E19CCD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QAXMY021JELtHAECf1M5DMTS2KHOMgXyo45fuFVxoc=; b=fPMBTG14K/RPWl
	EJIe1qca3VSn+2Kc+vetI0U1eA0ZtH7LLGAoNPczA0qJ83ezg1nMwIKkfXvmWa/FRiNeDYwtioQrY
	5R1A9EuWm8AEwoNhWlgxUVwyvdS1SLF/RHO2Umcq+dHyZdWxFfcAcDDBvLvLwd4rkRdT49fLOGluZ
	bOzpZrMe3mjv5OzNX3nWO/qT534kS6mW23X7KxHBkXxVzqmYAML0K7xeaVc/ePfrBE3haVV836jxJ
	FhKbhy3ttyiruZCLgQkKvVtgcgDfn9TLfFwqqJ769VUSGE50HbO+mqO9+N75QJTq9azOGqCuqR45M
	HMDtPzhd0FxXWbx2fmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTle-000000060hh-2qEr;
	Wed, 10 Apr 2024 08:57:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTlb-000000060fW-3cy7
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 08:57:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ruTlJ-0005R5-Qm; Wed, 10 Apr 2024 10:56:57 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ruTlI-00BSie-TL; Wed, 10 Apr 2024 10:56:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ruTlI-00050O-2l;
	Wed, 10 Apr 2024 10:56:56 +0200
Message-ID: <b9ee67f1a6d782e6b6ee9e273bc8c6fa5bc1813b.camel@pengutronix.de>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's
 code to separate module
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Date: Wed, 10 Apr 2024 10:56:56 +0200
In-Reply-To: <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
	 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
	 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
	 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
	 <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
	 <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
	 <20240408-numerator-escargot-a642507a598e@spud>
	 <20240409-shallow-voice-c84ed791bc7d@spud>
	 <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_015715_944822_9A2B6D7B 
X-CRM114-Status: GOOD (  21.52  )
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

On Di, 2024-04-09 at 19:27 -0700, Stephen Boyd wrote:
> Quoting Conor Dooley (2024-04-09 05:05:37)
> > On Mon, Apr 08, 2024 at 06:05:51PM +0100, Conor Dooley wrote:
> > 
> > > > > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
> > > > > starfive-jh7110 drivers are examples of this.
> > > > > 
> > > > > > The auxiliary device creation function can also be in the
> > > > > > drivers/reset/ directory so that the clk driver calls some function
> > > > > > to create and register the device.
> > > > > 
> > > > > I'm undecided about this, do you think mpfs_reset_controller_register()
> > > > > and jh7110_reset_controller_register() should rather live with the
> > > > > reset aux drivers in drivers/reset/ ?
> > > > 
> > > > Yes, and also mpfs_reset_read() and friends. We should pass the base
> > > > iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
> > > > then move all that code into drivers/reset with some header file
> > > > exported function to call. That way the clk driver hands over the data
> > > > without having to implement half the implementation.
> > > 
> > > I'll todo list that :)
> > 
> > Something like the below?
> > 
> > -- >8 --
> > From a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 Mon Sep 17 00:00:00 2001
> > From: Conor Dooley <conor.dooley@microchip.com>
> > Date: Tue, 9 Apr 2024 11:54:34 +0100
> > Subject: [PATCH] clock, reset: microchip: move all mpfs reset code to the
> >  reset subsystem
> > 
> > <insert something here>
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Looks pretty good.

Yes, that does look convincing.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

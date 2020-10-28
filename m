Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6B8C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 19:21:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B6124813
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 19:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+djOCuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B6124813
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nxjJoB8dw3FbSfXr05nuhuV58vaYrbDz1XVATjBcCpc=; b=C+djOCuccR4NmYJAf8pl0L7/Q
	QKP4BREU3BhAOrzvHEP0VVt+yDy7glg3GIgDDT3XgeW7ATlDnPWSuqbVsqf3Ro9VLDE6XK/DrMqiA
	wVg2gZzSYceXlyHF1t+g6YYO5Ko0JDBmbYyqFX3ZlJkjMbdyx8gwwJe7moq05oNZcSVXOjqUL4Ahc
	lgtWJNOQiD3dG1xpQXId3SDD36/EY9ZQmM0zTSycwTmDDsIkY8T51by66O69RCvLlRdlz4gB1Ot9N
	19msWr0P6hSBO0S5geGXBnDcS2We/eMPL4hjJK/LzRGrlCIRt4QIouwGjc4oIdpee7sUInqXfLUBD
	or/hd7TNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXr0p-0000aw-KO; Wed, 28 Oct 2020 19:21:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXr0m-0000aC-Ce; Wed, 28 Oct 2020 19:21:33 +0000
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7BCB2200002;
 Wed, 28 Oct 2020 19:21:28 +0000 (UTC)
Date: Wed, 28 Oct 2020 20:21:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 00/12] leds: pwm: Make automatic labels work
Message-ID: <20201028192128.GF12276@piout.net>
References: <20201005203451.9985-1-post@lespocky.de>
 <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_152132_542329_4EB11A6C 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 28/10/2020 19:56:14+0100, Alexandre Belloni wrote:
> On Mon, 5 Oct 2020 22:34:39 +0200, Alexander Dahl wrote:
> > Hei hei,
> > 
> > for leds-gpio you can use the properties 'function' and 'color' in the
> > devicetree node and omit 'label', the label is constructed
> > automatically.  This is a common feature supposed to be working for all
> > LED drivers.  However it did not work until recently for the 'leds-pwm'
> > driver.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] ARM: dts: at91: smartkiz: Reference led node directly
>       commit: 02e46262af5db410da5a27783833d68e2bdfb352
> [2/2] ARM: dts: at91: Fix schema warnings for pwm-leds
>       commit: 997ebd64df39f3916c37ca67a6eff58e79a13c73

This was obviously 04/12 and 05/12.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

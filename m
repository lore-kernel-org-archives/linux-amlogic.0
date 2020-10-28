Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB50C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 18:56:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E904124811
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 18:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FAVUZPpV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E904124811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=68JVbU/Jnburl36qMyU57DUURw1x0n2jAPLn7oemKzo=; b=FAVUZPpVm3y9I008RjJQaQNW7
	swvmYYiAXqsJ+MnVrg1f9ncrog+o/ZON0TDbycQoP4/xB5pSLOK3xpcG0G8Sh8yzL+0r/mLKs5NVc
	HYBKRBW91cqjV2HoRhGYEfO4mb6xRi+mDUmuoaJ/qg4oSLvDl/LwiFnFQ0XP7NBLVmsquXZlptCGn
	ls0aEpvXlfeFvu6bQv75s1Um1ZwWz7EOMCMa34TceSmYF8P/IrelsFL9W2kmqFxC2RHXcF/RJEfR7
	mW1k5K54FSOQJU4X3Og9Fbe7+0OeU7ZMxzTmPhxQC5LsrXgke15fp/2mts7ZmhGyW8K9tasAyluJJ
	aOcQExcbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXqcp-0006I2-1s; Wed, 28 Oct 2020 18:56:47 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXqcl-0006H1-Tz; Wed, 28 Oct 2020 18:56:45 +0000
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5D5E81C0003;
 Wed, 28 Oct 2020 18:56:37 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 00/12] leds: pwm: Make automatic labels work
Date: Wed, 28 Oct 2020 19:56:14 +0100
Message-Id: <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_145644_072257_570BA071 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 22:34:39 +0200, Alexander Dahl wrote:
> Hei hei,
> 
> for leds-gpio you can use the properties 'function' and 'color' in the
> devicetree node and omit 'label', the label is constructed
> automatically.  This is a common feature supposed to be working for all
> LED drivers.  However it did not work until recently for the 'leds-pwm'
> driver.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: at91: smartkiz: Reference led node directly
      commit: 02e46262af5db410da5a27783833d68e2bdfb352
[2/2] ARM: dts: at91: Fix schema warnings for pwm-leds
      commit: 997ebd64df39f3916c37ca67a6eff58e79a13c73

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

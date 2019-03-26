Return-Path: <SRS0=zyCZ=R5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86692C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 11:33:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560F72070B
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 11:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFOJUjWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 560F72070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWcHR2+/wRLrQorz+5UMcwBCLasfU+AYHr/ZvW1hEOU=; b=DFOJUjWuC9/NKB
	lB/eBmtwJ50fI8sruTyQDpB1HxxArV7l0eKciq8OXYyooGemTf26SOjy+wc/4jRkNI9GhIsbLSun6
	jH9mFmiRxd6Pp3RyLWrNpyXo28Ldur8jFX4z0dwbQplcyzfQeKEzLp1VU28227zJqnsVLtWa6T6rN
	sDkjCRIhSxAhJNOt76zrchnGtk4biPj7Yw13kRa+u5c7OdyPPtcZH+ttxIFFwS1sfbuuKtd+izfBf
	Hsi4+ReY2+GT4ANH4uX1ORrGm+bul0jR2NWyMjxyhfaXkHreHE1odKnXSrTDIaHLarVvG4IGo1nAV
	2A3OOSlNeAZaDIx5uyhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8kKW-0002NL-5c; Tue, 26 Mar 2019 11:33:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8kKQ-0002Ge-24
 for linux-amlogic@lists.infradead.org; Tue, 26 Mar 2019 11:33:15 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1h8kKL-0003WE-0G; Tue, 26 Mar 2019 12:33:09 +0100
Message-ID: <1553599988.6854.5.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Tue, 26 Mar 2019 12:33:08 +0100
In-Reply-To: <7hbm2234i3.fsf@baylibre.com>
References: <20190304104916.3937-1-narmstrong@baylibre.com>
 <1553078122.7071.6.camel@pengutronix.de> <7hbm2234i3.fsf@baylibre.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_043314_261939_2DE82FAE 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Fri, 2019-03-22 at 15:53 -0700, Kevin Hilman wrote:
[...]
> Could ou make a immtable tag for this in your tree?  This is needed for
> some upcoming DT users we'd like to queue for the next cycle.

I have just sent a reset/fixes pull request including this patch.
Once that gets merged, you can either wait for the next -rc that
includes it or pull in 
    git://git.pengutronix.de/pza/linux reset/meson-g12a
which is just the first patch of the two.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

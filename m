Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2C2C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 15:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B4220678
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 15:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dCuSV4Ij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B4220678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MSye+KqI+GcwxhIsBy2uzbxPRfTAqLgK7AXObgo0wOU=; b=dCuSV4IjsrWboQOtCcgmtT29H
	Q5z8p82O/ccZnmkC1J37f8nLPllG7RocyEkIdp05oWA9fUl5i6mUq78lNC5zwVlA0SmSYfit2YnMm
	Qcbe9RwyiVbyTrB/6LC+b5RPxykdovS/GHoENmyiHmkHCxKv9/dYLuJlE7lw+is3PmE5+/pPP+909
	tgHLH9QneaPPUopPfUEOXi9ShHwyZ1a9l0/zTzR0kabvuvmRsnBkEcCGgMW8FzsThQeG0zBrdOx0r
	yOaMIjCLu2+3NTLI2qt1DJgg72eIdzAbGbj8DqRtVzB5YdT76K9w9zOeISny7Y01ilgv1gDMA6z/r
	zjEPqKp2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBJQo-0001UZ-Pv; Thu, 27 Aug 2020 15:03:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBJQl-0001TS-Am
 for linux-amlogic@lists.infradead.org; Thu, 27 Aug 2020 15:03:12 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kBJQe-0000so-Kx; Thu, 27 Aug 2020 17:03:04 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kBJQd-0002Rp-My; Thu, 27 Aug 2020 17:03:03 +0200
Message-ID: <b17e8cb934f223a4f6055cdc2065ba75367ccffd.camel@pengutronix.de>
Subject: Re: [PATCH] Revert "usb: dwc3: meson-g12a: fix shared reset control
 use"
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, Felipe Balbi
 <balbi@kernel.org>
Date: Thu, 27 Aug 2020 17:03:03 +0200
In-Reply-To: <20200827144810.26657-1-aouledameur@baylibre.com>
References: <20200827144810.26657-1-aouledameur@baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_110311_460541_6526396B 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Dan Robertson <dan@dlrobertson.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-27 at 16:48 +0200, Amjad Ouled-Ameur wrote:
> This reverts commit 7a410953d1fb4dbe91ffcfdee9cbbf889d19b0d7.
> 
> This commit breaks USB on meson-gxl-s905x-libretech-cc. Reverting
> the change solves the issue.
> 
> In fact, according to the reset framework code, consumers must not use
> reset_control_(de)assert() on shared reset lines when reset_control_reset
> has been used, and vice-versa.
> 
> Moreover, with this commit, usb is not guaranted to be reset since the
> reset is likely to be initially deasserted.
> 
> Reverting the commit will bring back the suspend warning mentioned in the
> commit description. Nevertheless, a warning is much less critical than
> breaking dwc3-meson-g12a USB completely. We will address the warning
> issue in another way as a 2nd step.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D57EC55ABD
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:04:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF592223C
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQc03tUJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF592223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Y4wkLJ+LkB7glJ/6o4W3rJuM09Vj1EP7WGNyK40zGo=; b=MQc03tUJ5V5r3x8RdxA8d04gZ
	PgaEiyxpOJ457+kfW8yLa6AnvwcorhvGrRt4g9adZMJfv9RjM9E/b0mT51uot3xrLu+6cm5ukZ2hW
	tpmv9Fsyd/P4mBBhJYYIxMv3ACo0CITJyI9wNaqxOsRIXxqR3eMciHVTei6obusmefPE6Zd6IgxjO
	RnLLMAtZKpYUUDYFD4lKidl6yqY6+/KHeclFwe9gNTLuKuxcPvu43qztKM9pawzOVanUkKDH2SlBf
	XrvyQMgmMGa59LCT5k3ZY7j/5pUdRHgl7kEsl8hZgAmKCwoTMyg8ULyzCvtvLlhEHUNuQrhB7pPOf
	J8g+VCFxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdacX-0006wE-Ue; Fri, 13 Nov 2020 15:04:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdacW-0006vR-C7
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 15:04:13 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kdacT-00023V-Kn; Fri, 13 Nov 2020 16:04:09 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kdacT-0004cD-49; Fri, 13 Nov 2020 16:04:09 +0100
Message-ID: <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 13 Nov 2020 16:04:09 +0100
In-Reply-To: <20201112230043.28987-1-aouledameur@baylibre.com>
References: <20201112230043.28987-1-aouledameur@baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_100412_444773_867CCC6D 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
> The current reset framework API does not allow to release what is done by
> reset_control_reset(), IOW decrement triggered_count. Add the new
> reset_control_rearm() call to do so.
> 
> When reset_control_reset() has been called once, the counter
> triggered_count, in the reset framework, is incremented i.e the resource
> under the reset is in-use and the reset should not be done again.
> reset_control_rearm() would be the way to state that the resource is
> no longer used and, that from the caller's perspective, the reset can be
> fired again if necessary.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Change since v1: [0]
> * Renamed the new call from reset_control_(array_)resettable to 
> reset_control_(array_)rearm
> * Open-coded reset_control_array_rearm to check for errors before
> decrementing triggered_count because we cannot roll back in case an
> error occurs while decrementing one of the rstc.
> * Reworded the new call's description.

Thank you, applied to reset/next.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

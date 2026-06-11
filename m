Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D4FCD98D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2tnJzYoTaNqIvae+07kzLHFe6JujiUdUnVTIZ7B/iM=; b=rDtG7+5cPYs7x8
	pG/nSAmx03sVaQIBpBKGmTueR/BwKoVnfGkBtEkWZ33KSHr2/DBLHH2o59sw0JAk9pNBYkjpiAdXF
	9rZq4Oh251MClDnkFu7kv5Sc4JP5xTtY9+CkDgTWJ6BTILi1S/kuGtaUa7K1DwwxotRFtNwO4Ptba
	++OfohwKcm2LxYQE4hIHz9EQfjgYqY1X/WqobA01fADgiHmvN/XoVW2jvyV6qXTgTh36UOgvpgVZV
	7juizJWeZ0TuiWcWfMpRcrtw+Ft/MKAJRMKA90lMmge/a9nK7PuajbZr0+40NRH3zvI24kEk4Zlk/
	07PG/MxiZDVEvzYkCFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaTN-00000008xpM-3Mi0;
	Thu, 11 Jun 2026 08:09:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaTL-00000008xof-26IW
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 08:09:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1wXaTA-0006jG-EY; Thu, 11 Jun 2026 10:08:56 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1wXaT9-002BK1-1o;
	Thu, 11 Jun 2026 10:08:55 +0200
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <pza@pengutronix.de>)
	id 1wXaT9-0000000EM0m-1rQQ;
	Thu, 11 Jun 2026 10:08:55 +0200
Date: Thu, 11 Jun 2026 10:08:55 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: alexandre.belloni@bootlin.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, ben.dooks@codethink.co.uk,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: meson: fix refcount leak in meson_rtc_get_bus
Message-ID: <aiptFzFoLzQNMlxS@pengutronix.de>
References: <20260611035605.59906-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260611035605.59906-1-vulab@iscas.ac.cn>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_010907_535509_3A56211E 
X-CRM114-Status: GOOD (  12.38  )
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

On Thu, Jun 11, 2026 at 11:56:05AM +0800, WenTao Liang wrote:
> In meson_rtc_get_bus(), reset_control_reset() is called to trigger
> a hardware reset when the serial bus is not ready. The function may
> retry up to three times, but neither the successful nor the failure
> path calls reset_control_rearm() to balance the reference count,
> leaking the triggered_count on shared reset controls.

Wrong, this driver uses exclusive reset control, which does not do any
refcounting. Arguably, it should request the reset control via
devm_regulator_get_exclusive() instead of devm_regulator_get() to
make this clear.

> Fix this by adding reset_control_rearm() after reset_control_reset()
> on both the error return path and the success path within the retry
> loop, ensuring the reset control can be re-triggered on subsequent
> bus acquisition attempts.

This doesn't fix anything, reset_control_rearm() does nothing and
should not be used with exclusive reset controls.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

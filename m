Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B44AC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywglSIMeX6CmuagjITPtIE9GHvAsuCqGIDgRIFSM+Jg=; b=dpkZeQX0vOW3j+
	3lco1yhLXRHqWmvMDMyHUOzc6DU5ZD57v6kr2b/iKQXJgpb0/wlxNPdmmib81So8qEsN6BbsC9HsD
	3JXcukGf04kdAbgWEej9YJC4v3gq5BougeFRxMIBE4KeFKcFSFzpzqRKVDU/zqwSE4ZUf9zIq2ymS
	9E82ma0e0Lrpe0YNJpioy+D/eFqupZcy0FOuM6kGx16lQhpjQpl7t0cVqxw1GkxEABI9tB0XlvP+b
	5JdTYWiSSgiH2biH6QdTAynkI97MVXs4F66hLsRSC8h8hZAoqjaFPuMJPSQb58O0cmJKUz+6Gko4S
	t1BskwmVQyy3iaOFoseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwhVt-008auK-NB; Mon, 13 Dec 2021 09:20:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwhRR-008ZGE-34
 for linux-amlogic@lists.infradead.org; Mon, 13 Dec 2021 09:16:18 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mwhRL-0005mf-Sp; Mon, 13 Dec 2021 10:16:11 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mwhRK-0005HR-Vz; Mon, 13 Dec 2021 10:16:10 +0100
Message-ID: <d1be20fb0e724598d697fba97f79d75b8646b7ee.camel@pengutronix.de>
Subject: Re: [PATCH v5 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared
 reset controller use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, khilman@baylibre.com
Cc: balbi@kernel.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Date: Mon, 13 Dec 2021 10:16:10 +0100
In-Reply-To: <20211212201844.114949-2-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
 <20211212201844.114949-2-aouledameur@baylibre.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_011617_169273_3F5CE55F 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

On Sun, 2021-12-12 at 21:18 +0100, Amjad Ouled-Ameur wrote:
> Use reset_control_rearm() call if an error occurs in case
> phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
> phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
> and the reset line may be triggered again by other devices.
> 
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework. Therefore, use of reset_control_reset() on shared reset line
> should be balanced with reset_control_rearm().
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

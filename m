Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F979EE645B
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2024 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qQfC64zIEypJYhsosJAUjdkH0kAG78PRsViZMuwFNI=; b=EG/k2FFpb0PP2u
	K6Ncb3XL4Ws/9FKFKaTbVtQ8Fm8vCkA+lH2S6kHkYr5moaDfMcVnACl38K/keTCeVE7p6hYh5tYLe
	mlDj8jarkXDPGFcXYUersK+swo1Kz9NOOf+OaTc1jUF1u6AH+bK3RnT36robwHz18jaVwUb5et/p7
	QIFY+h/vB80+KBoCY3Z8iSF4EJX538GFG4jVPX2Sv4uqXAA+p2dkRXsGlno2kJQViKc0He2sf8rN1
	WPd1eenyKnpIXpVIy12Yh1js8i8EWwA01DCemZ9kf7BebhD5+jffcu/VeMpTJzsgAH1Z/fZbv2XQr
	omz6uinMzSKBiD2vI88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soewU-0000000CJzD-0B0o;
	Thu, 12 Sep 2024 08:12:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soevQ-0000000CJn7-07Ui
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Sep 2024 08:11:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soevI-0006ZC-94; Thu, 12 Sep 2024 10:11:28 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soevH-007Kvs-5D; Thu, 12 Sep 2024 10:11:27 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soevH-0002Eh-0I;
	Thu, 12 Sep 2024 10:11:27 +0200
Message-ID: <9a4377fe27d8eb940399e452b68fb5a6d678929f.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/9] reset: amlogic: move audio reset drivers out of
 CCF
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Date: Thu, 12 Sep 2024 10:11:27 +0200
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_011136_073197_B3EDAFDC 
X-CRM114-Status: GOOD (  17.45  )
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

On Di, 2024-09-10 at 18:32 +0200, Jerome Brunet wrote:
> This patchset follows the discussion about having reset driver in the
> clock tree [1]. Ideally those should reside in the reset part of tree.
> 
> Also the code of the amlogic reset driver is very similar between the 2
> trees and could use the same driver code.
> 
> This patcheset alignes the reset drivers present in the reset and clock
> then adds support for the reset driver of audio clock controller found in
> the g12 and sm1 SoC family to the reset tree, using the auxiliary bus.
> 
> The infrastructure put in place is meant to be generic enough so we may
> eventually also move the reset drivers in the meson8b and aoclk clock
> controllers.
> 
> This was tested on sm1 vim3l and gxl aml-s905x-cc.
> 
> Changes since v4 [6]:
>  * Fix Kconfig depends and select as reported by Philipp and
>    and 0-day robot.
> 
> Changes since v3 [5]:
>  * Drop pltf/platform as suggested
> 
> Changes since v2 [4]:
>  * Fix undefined read access of the reset register
>  * Fix Kconfig symbol description
> 
> Changes since v1 [3]:
>  * Fixes formatting errors reported by Stephen.
>  * Changed parameters type to unsigned
>  * Fix usage of ops passed as parameters, previously ignored.
>  * Return 0 instead of an error if reset support is absent
>    to properly decouple from the clock and have a weak
>    dependency
>  * Split the platform and auxiliary modules in 2 distinct modules
>    to fix the COMPILE_TEST error reported by ktest robot.
> 
> Change since RFC [2]:
>  * Move the aux registration helper out of clock too.

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

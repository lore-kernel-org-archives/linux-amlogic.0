Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264EAC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 09:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E66F60F3A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 09:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E66F60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZaYfX1kyDPaw+OJX3H2NLsrNreeg3ONQUjdCn7E2TE=; b=oXdqgFEGPXhAuo
	Hoc6GHIkTLXpg0OjomGOPjrgI72HHQa8w9xstVP7UPee5vrFDcMwP5/aoDZCgD4whNBWRU+gd8Lh2
	NAOCdEeXViYR8bWeu4qYwmQ+Vh+rO672ZX2N4iHZSa53GKOQbJgl7c29BJZ74J87Nh7k1m7jKIymI
	PQXECKDL7/k+Z69cDPVwpwzUkBEhyZjp6H4ztCVODJNDtlmhvjcnJxsZUAOWiqtp81UIJTwr702ZX
	mlc2RfpYQK7O3muXQn6xf49cM49NNgsiLpAK9OFlQceU165jrX+qPBdxy3tDbZ+Ai14Tl8qHaGv4D
	G224Kb9CSoulpDCFx9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSFFA-0011v2-C2; Mon, 20 Sep 2021 09:05:44 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSFEw-0011s8-Uw
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 09:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=8Ic7rPl8wS6tSUDgDBOpnPfgXT8
 diIPVuuJEV7+3x14=; b=y3zScd6qLqQkIP3VZO9fvHA8J6/TlWpstJuxEWG+2wh
 RSUW1mVxF26O2U33Dq6EbBJ3XmayRck4KWgT5z4BxcgklO7B+9wEmZO5zVAmdCUU
 eq691H+mkSBSVXJ5b+Z4iTQ6tBhA1RnGtNmi7NlL+YGjQ7U1KmJ/dc6bhwHIpZnk
 =
Received: (qmail 2412526 invoked from network); 20 Sep 2021 11:05:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Sep 2021 11:05:23 +0200
X-UD-Smtp-Session: l3s3148p1@Lz7AlGnMBosgAwDPXwlxANIWpbLKE1Uh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Subject: [PATCH 0/9] treewide: simplify getting .driver_data
Date: Mon, 20 Sep 2021 11:05:12 +0200
Message-Id: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_020531_310540_4FD60E93 
X-CRM114-Status: UNSURE (   6.94  )
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

I got tired of fixing this in Renesas drivers manually, so I took the big
hammer. Remove this cumbersome code pattern which got copy-pasted too much
already:

-	struct platform_device *pdev = to_platform_device(dev);
-	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
+	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);

A branch, tested by buildbot, can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git coccinelle/get_drvdata

I am open for other comments, suggestions, too, of course.

Here is the cocci-script I created:

@@
struct device* d;
identifier pdev;
expression *ptr;
@@
(
-	struct platform_device *pdev = to_platform_device(d);
|
-	struct platform_device *pdev;
	...
-	pdev = to_platform_device(d);
)
	<... when != pdev
-	&pdev->dev
+	d
	...>

	ptr =
-	platform_get_drvdata(pdev)
+	dev_get_drvdata(d)

	<... when != pdev
-	&pdev->dev
+	d
	...>

Kind regards,

   Wolfram


Wolfram Sang (9):
  dmaengine: stm32-dmamux: simplify getting .driver_data
  firmware: meson: simplify getting .driver_data
  gpio: xilinx: simplify getting .driver_data
  drm/msm: simplify getting .driver_data
  drm/panfrost: simplify getting .driver_data
  iio: common: cros_ec_sensors: simplify getting .driver_data
  net: mdio: mdio-bcm-iproc: simplify getting .driver_data
  platform: chrome: cros_ec_sensorhub: simplify getting .driver_data
  remoteproc: omap_remoteproc: simplify getting .driver_data

 drivers/dma/stm32-dmamux.c                         | 14 +++++---------
 drivers/firmware/meson/meson_sm.c                  |  3 +--
 drivers/gpio/gpio-xilinx.c                         |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 13 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  6 ++----
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  6 ++----
 drivers/gpu/drm/msm/msm_drv.c                      |  3 +--
 drivers/gpu/drm/panfrost/panfrost_device.c         |  6 ++----
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |  3 +--
 drivers/net/mdio/mdio-bcm-iproc.c                  |  3 +--
 drivers/platform/chrome/cros_ec_sensorhub.c        |  6 ++----
 drivers/remoteproc/omap_remoteproc.c               |  6 ++----
 13 files changed, 28 insertions(+), 53 deletions(-)

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

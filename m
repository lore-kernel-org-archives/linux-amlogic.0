Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90398C64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA152168B
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T8EKo03f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PyDW5rz9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA152168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xr2NN8r1lS3yE1RylK3nHdTrB22tlsSQNIK3Sh0gR8=; b=T8EKo03fNiCCcG0UZNyOunRk5x
	TVck+2Iyj7YgOhHhw3LfK/MTx93wH6erb64BCiJGrDWEa6ZMBDDcaUxkt2ps/afN1Su0Jqriohn1o
	syos++LtfAy1x8CZQTjeycWwxLlip5y5vIr3DetAyBq4ef1RVY+EYLn/izUVfIik5Yja13tTg3SbE
	/B/EHWciF4NS/z9DpCUGE628GfWB28u60cAvQliLWQai+2PSuI/tmPxyZB5Loe9uKlg9PokYwXVTs
	MaSl2GUQhKbtFf715KN7wC0I7mm0F6311YE13/UUe25wFvPVBQhn7TX9HFeOWt5Y8SaXWnOqgP/w2
	5i2e1MXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkAtx-000181-MT; Tue, 01 Dec 2020 19:01:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkAtv-00017Z-D4
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 19:01:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id p8so4367334wrx.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Dec 2020 11:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G22eGyYxIipSs8w/AkbTh1vA6CiojhQuKpwoEPnVmtE=;
 b=PyDW5rz9AAyU3fm6J3ZjRcYcmz3GPTUIh6lMW7iKCGKKM+skNO8rt81pj6nZtrB19R
 FTuh7dU3kIxg3OcT4kjynAMMGRIHNVem2RgP5L+hF0GVXwM6aPHZ0ZjQJiyAf364bwuN
 LeU7hcuiUdWwVXTD/KOltCWNGdpPbwEJeJPPpfNdw4brncKHUp7kGIMU+thhEmTTKkGN
 +Z6mobzcoERS7bzx1/K8qWwuUprvVCa9x4IKFabe5pSZ/S1QD53yTs6LpahEgGfKKfZl
 05U8Hxnb0MJ4zT3OMVTZU9sthGhfxunD79G9V3p5aObrTy8sZMFlWp1A1Ly5tB7sAyhD
 Flew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G22eGyYxIipSs8w/AkbTh1vA6CiojhQuKpwoEPnVmtE=;
 b=I8nQIKD+xzD07F9MZCKXHAhS1I9vWH7OuaClhN2Q6LWV+buHINxaqtlkb6+b2ftxjs
 iTii+mIuhz+NhlZKVsraxrC61rh8bKGg4+rg1wla12b0l6DROYqcFulR7lUAdpbE4P4p
 OT+QQ4vCwF4yb2L1iEJ06ds1Pv3VVgRrubI4UyQ9G7Z3+vYGsx7Or2QPB4bzGKzili1h
 mdgr2/4PXtQOf0n4SZyrIcBWiqpIRqCbaLYU19Xz3KQGFRNUriaS5hwBSroPC6XsPtSD
 SiQPJckU4FZiNgDc5alCE/qCSlkCTC3rxGdZIx6FYY+6/5dPxJ8N6639JtPqrHzGB0rc
 VR/Q==
X-Gm-Message-State: AOAM5322Vf50YKhU95NIGE9hPpL9oqu2lYUX/UakZ1EGWZW/G0DcWb7N
 sd4VLEpREvn50Yt7gxjC4yVtkQ==
X-Google-Smtp-Source: ABdhPJw1Goa2Q0OjUHIOXSk8Lh0iFlfPPzooSWpjv2qA/Sds4esLvve/gf6qnlCpY7MINPiQdKNUhQ==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr5784812wrq.52.1606849281924; 
 Tue, 01 Dec 2020 11:01:21 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:40a4:a590:1da6:9599])
 by smtp.googlemail.com with ESMTPSA id 138sm887733wma.41.2020.12.01.11.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:01:21 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
Date: Tue,  1 Dec 2020 20:00:58 +0100
Message-Id: <20201201190100.17831-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201190100.17831-1-aouledameur@baylibre.com>
References: <20201201190100.17831-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_140123_483958_3ABDB93D 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use reset_control_rearm() call if an error occurs in case
phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework. Therefore, use of reset_control_reset() on shared reset line
should be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
changes since v1: [1]
* Moved reset_control_rearm after clk_disable_unprepare to clean things up
in reverse order of initialization for phy: amlogic: meson drivers

IMPORTANT:
This patchset depends on this patch [2], it adds reset_control_rearm() call
to the reset framework API, it has been approved by the maintainer, and
will be applied to reset/next

There is currently an immutable branch with it [3]

[1]: https://lore.kernel.org/lkml/20201113000508.14702-1-aouledameur@baylibre.com/
[2]: https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylibre.com/
[3]: git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 43ec9bf24abf..1ddf5e5e4184 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -114,8 +114,10 @@ static int phy_meson_gxl_usb2_init(struct phy *phy)
 		return ret;
 
 	ret = clk_prepare_enable(priv->clk);
-	if (ret)
+	if (ret) {
+		reset_control_rearm(priv->reset);
 		return ret;
+	}
 
 	return 0;
 }
@@ -125,6 +127,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

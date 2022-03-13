Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60460C433FE
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Mar 2022 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcgHucxlbDawam9Da/XkwFcbXZRnILNrw0jdJI1ofrM=; b=4TDz2QlTwF8dPB
	LH8wfdZEDqjS51Vy3/TKDNlzMpZggjagirrFapidjfXJiCJGQ9axnG+Ej47MBi8wIlqOs0RV94+1y
	PLgH/ma09BdZlaDlNgP1ribCksJhCBE5bjwUHUyhf08huZ6xv74tgzCJ8KGn7LQcRsMiTLGJ0ORuh
	WGwOe3lJvEWfmYbweU4iYrGOC8fRToNQDIxnKlNtdM4vUeDsUiZaA5ENzm2EJy7gfy4B5pSRWj3CS
	+7wEBogsAhLdjYsDV9Xtw2USOGagxrxqhUs/J9oMbhTjHKkkhwU4sxbBWzbSoAgpuQfdMYnBuGxPy
	JrhTIfDX/dLvY3HayFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTLqW-002ZmC-33; Sun, 13 Mar 2022 10:53:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTLpc-002ZMc-1i; Sun, 13 Mar 2022 10:52:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 631B0B80CA6;
 Sun, 13 Mar 2022 10:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30102C340F7;
 Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647168729;
 bh=W69KfAaV/x9MojJ5lep1344Lp1qLReJ8o0lhh/8yBRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OIMJAooM6omo5X4Gqi45gpj3VZ7X+WBgKbfTvJnyygcOiJF7/O2y3HLGtDhl5jdjo
 61EW/CApIUmLWT4xbumk2Ey4ejb1qPTAFGG8pDz+muO98gx7bPbHuGFnNMfhTaecvy
 /hKGUWfI7OBeEG5oe2ES3RXZmzzMOmBRuJgErdcT8UtBfBSzoBHdKoHusuYLSiSYLf
 e0L735nLGs52jYVVAL9bTxs7Vcg3UIDzeX7H1aIlSd9ZethMfEsvmBJMt/JPtxfn0J
 EC9oAZQi6m6Nk7kn7ujd2KCPBk5HE/qbR51SzUPa0bZbM74OPgFFWxmNJKNnl4VFC2
 Ku+ZsQ+s9WhpQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTLpW-001I1O-Qk; Sun, 13 Mar 2022 11:52:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Cai Huoqing <caihuoqing@baidu.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 03/24] media: platform: rename meson/ge2d/ to
 amlogic/meson-ge2d/
Date: Sun, 13 Mar 2022 11:51:44 +0100
Message-Id: <95c86693bd6dc0ebd92b3466069af9b23d6a6b95.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_035212_428407_AE369099 
X-CRM114-Status: GOOD (  10.60  )
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

As the end goal is to have platform drivers split by vendor,
rename meson/ge2d/ to amlogic/meson-ge2d/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

 MAINTAINERS                                                     | 2 +-
 drivers/media/platform/Kconfig                                  | 2 +-
 drivers/media/platform/Makefile                                 | 2 +-
 .../media/platform/{meson/ge2d => amlogic/meson-ge2d}/Kconfig   | 0
 .../media/platform/{meson/ge2d => amlogic/meson-ge2d}/Makefile  | 0
 .../platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d-regs.h     | 0
 .../media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d.c    | 0
 7 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Kconfig (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Makefile (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d-regs.h (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b83cf0eb99ce..09b0e60da4e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12523,7 +12523,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
-F:	drivers/media/platform/meson/ge2d/
+F:	drivers/media/platform/amlogic/meson-ge2d/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 5e7cb24038fe..d8436923aebe 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -67,6 +67,7 @@ config VIDEO_MUX
 
 source "drivers/media/platform/allegro-dvt/Kconfig"
 source "drivers/media/platform/am437x/Kconfig"
+source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
@@ -77,7 +78,6 @@ source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
-source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mtk-mdp/Kconfig"
 source "drivers/media/platform/mtk-vcodec/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 8b2deba4b62c..48531f93d92f 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -7,6 +7,7 @@
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
 obj-y += am437x/
+obj-y += amlogic/meson-ge2d/
 obj-y += amphion/
 obj-y += aspeed/
 obj-y += atmel/
@@ -17,7 +18,6 @@ obj-y += exynos-gsc/
 obj-y += exynos4-is/
 obj-y += intel/
 obj-y += marvell/
-obj-y += meson/ge2d/
 obj-y += mtk-jpeg/
 obj-y += mtk-mdp/
 obj-y += mtk-vcodec/
diff --git a/drivers/media/platform/meson/ge2d/Kconfig b/drivers/media/platform/amlogic/meson-ge2d/Kconfig
similarity index 100%
rename from drivers/media/platform/meson/ge2d/Kconfig
rename to drivers/media/platform/amlogic/meson-ge2d/Kconfig
diff --git a/drivers/media/platform/meson/ge2d/Makefile b/drivers/media/platform/amlogic/meson-ge2d/Makefile
similarity index 100%
rename from drivers/media/platform/meson/ge2d/Makefile
rename to drivers/media/platform/amlogic/meson-ge2d/Makefile
diff --git a/drivers/media/platform/meson/ge2d/ge2d-regs.h b/drivers/media/platform/amlogic/meson-ge2d/ge2d-regs.h
similarity index 100%
rename from drivers/media/platform/meson/ge2d/ge2d-regs.h
rename to drivers/media/platform/amlogic/meson-ge2d/ge2d-regs.h
diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
similarity index 100%
rename from drivers/media/platform/meson/ge2d/ge2d.c
rename to drivers/media/platform/amlogic/meson-ge2d/ge2d.c
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

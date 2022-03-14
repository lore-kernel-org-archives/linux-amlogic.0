Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120BFC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VKtOg0RUiEuvnEhjYS341MraFGYP39QKdpmK5UliKQ=; b=MK7/mmxz08aFUw
	QDdLcjfSkjAJfb6FRZ/k14BXJkjIHh6MmqYYatCGWdj83cNweJdxoMX6p7md1jN7XRvXD/ve0anN2
	nzGMVIWRMURx+nxtDxaJXgHtCUWNFSGTu+uto23kJ8gmr8AAsTwH/YuL/M4PpP5TqeI4hABWAaNur
	3ws0ABsd08GQxVsbvR/KqWQVn34nfI+elUua1ky8yhNMHjSAXN0BjTXBmJ/GdgI2QGPN285g1dAUM
	4nmmFnBLZay8dnvp5vy405+aUVEi3MY6AujFTzDeoEDFVWlMZfdtBvDnx0JEGGq8AHtO+lKoAiXA4
	cPyyMpfPqzfZ3Bj0+8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTo5Q-006EGj-TY; Mon, 14 Mar 2022 17:02:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTo1b-006Cfr-HN; Mon, 14 Mar 2022 16:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MXYUXXIAQpLN5IbmLBbYb7oExJbhIysPnqH10wflT0A=; b=ka+a9ljXMUOBblJraJzxihdWGU
 N5TlQUzIeYZR+TCHx7mEvxgClR6yfIKo9eFiuSan13CsWCJZOnL3g94SHRsRxhoAalVMUWt8nMcrM
 8Ccc1VB32vDqQcoixFY833NERjDAIff/W1D8I/A4RX+lBy76uj/GgABzL0m4a3BoGF9n12JM1T/yv
 I8z3275zM8pW7WwHcYYCz00Bftlhd4OhuwMTr/+9+DcYTWxfK1A7kb9u3Ki+QBldavAs39GXPJN47
 lgTTroCVbtDNpTJ5dIK2GDMsay+S3v/l6VqS7t41H7YhB1xPXfHCkb7t4K9Vgy/A6oHDidRNUxYZJ
 U41smJjw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnfE-004DOy-48; Mon, 14 Mar 2022 16:35:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F97961471;
 Mon, 14 Mar 2022 16:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFF7C340F5;
 Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275708;
 bh=D/9Pf0G1jVKyYl+J3ogGxCO+ak+TDvvT76qMp3Ofy8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pf0jVS+1Fq/+7YbCSvKy1e+BoixrGCwVhZzDFrxW9q9ESWU5GkE3zEjlmrJufK0lG
 duMzCHtFghDcdbj6Nt4tOQh5w2BEpTbiSZa6vYjy5zBqYLi0w1+JMeDARD42R60mos
 KB/W+drz9YnPj9eBSJPkIVIJuhpM/MLLhuU9w1lJnA/EeUrJtOuO4/kJHx1hjD/BdD
 dQb5HppR1ulo/NPt6VAdnod1vDq8tAFT4Ew7pHE6RvJ2X4YSsGkpOpXzwba8XiQKRv
 G2vKIOFp6NJnfBfIzCFj6DFdtDG9WtY3m6kyA/1xlP/S7jufYmijlI3QRHCHBJEyD3
 2pKfkChIx9xAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnf0-001wyq-FK; Mon, 14 Mar 2022 17:35:06 +0100
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
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 42/67] media: platform: rename meson/ge2d/ to
 amlogic/meson-ge2d/
Date: Mon, 14 Mar 2022 17:34:37 +0100
Message-Id: <83078d0edf793369710cf6a0c80981fa09286920.1647274407.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163520_411700_AE9B9FCE 
X-CRM114-Status: GOOD (  10.56  )
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
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

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
index 0a4260627a00..b4faee0a1b63 100644
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

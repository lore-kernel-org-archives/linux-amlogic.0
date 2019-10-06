Return-Path: <SRS0=uQWM=X7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85131ECE58E
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Oct 2019 10:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1987D2166E
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Oct 2019 10:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpDrx8BF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1987D2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X4csAwJ+YHOI4c6/8sRWU8Vh3qOIow0n701hIuUyBlQ=; b=dpDrx8BFFEY6bJ
	uzgCD+FWgHiSut942pvq7YnwzvJQRNQBPJ62tDh8f6nhEbD7Z+Lfu4IiaiQuhEBq/RABQ6Vc/nSxk
	bUl1aIefaxE4oC/gNFIAJY0uytHTmhq9nEW4jCVLSzlivoXqvlM7fbjuCR+uN/D9uYAfeu+AUMCzm
	9fN/EabTcyiPe7uQYW0am4nzsBue69b81lc2cRm0Y7wLbxFmdSK4MlT5j/M0tKLH41UtCQFNmDlDv
	wHeHVis8rMi5hfnGq+ro1sYUMGFM6fSAG2DGINz2yWy+b3AyKw4Cp0B4PbUqU0yrFhyeBffZ1ENQT
	jqh0+DeZiNrP36/WyKZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iH3px-00061I-Gl; Sun, 06 Oct 2019 10:32:25 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iH3ps-0005xF-Vx; Sun, 06 Oct 2019 10:32:23 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 692D91EFCA547C100FC8;
 Sun,  6 Oct 2019 18:32:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 18:31:58 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <joel@jms.id.au>, 
 <andrew@aj.id.au>, <nicolas.ferre@microchip.com>,
 <ludovic.desroches@microchip.com>, <computersforpeace@gmail.com>,
 <gregory.0xf0@gmail.com>, <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <linus.walleij@linaro.org>,
 <baruch@tkos.co.il>, <paul@crapouillou.net>, <vz@mleia.com>,
 <slemieux.tyco@gmail.com>, <khilman@baylibre.com>,
 <eddie.huang@mediatek.com>, <sean.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <patrice.chotard@st.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>, <mripard@kernel.org>, 
 <wens@csie.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <linux@prisktech.co.nz>, <michal.simek@xilinx.com>
Subject: [PATCH -next 00/34] rtc: use devm_platform_ioremap_resource() to
 simplify code
Date: Sun, 6 Oct 2019 18:29:19 +0800
Message-ID: <20191006102953.57536-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191006_033221_201050_FB3DC068 
X-CRM114-Status: UNSURE (   3.29  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (34):
  rtc: asm9260: use devm_platform_ioremap_resource() to simplify code
  rtc: rtc-aspeed: use devm_platform_ioremap_resource() to simplify code
  rtc: brcmstb-waketimer: use devm_platform_ioremap_resource() to
    simplify code
  rtc: at91sam9: use devm_platform_ioremap_resource() to simplify code
  rtc: cadence: use devm_platform_ioremap_resource() to simplify code
  rtc: coh901331: use devm_platform_ioremap_resource() to simplify code
  rtc: davinci: use devm_platform_ioremap_resource() to simplify code
  rtc: digicolor: use devm_platform_ioremap_resource() to simplify code
  rtc: ds1216: use devm_platform_ioremap_resource() to simplify code
  rtc: ds1511: use devm_platform_ioremap_resource() to simplify code
  rtc: ds1553: use devm_platform_ioremap_resource() to simplify code
  rtc: ep93xx: use devm_platform_ioremap_resource() to simplify code
  rtc: jz4740: use devm_platform_ioremap_resource() to simplify code
  rtc: lpc24xx: use devm_platform_ioremap_resource() to simplify code
  rtc: lpc32xx: use devm_platform_ioremap_resource() to simplify code
  rtc: meson: use devm_platform_ioremap_resource() to simplify code
  rtc: mt7622: use devm_platform_ioremap_resource() to simplify code
  rtc: mv: use devm_platform_ioremap_resource() to simplify code
  rtc: omap: use devm_platform_ioremap_resource() to simplify code
  rtc: pic32: use devm_platform_ioremap_resource() to simplify code
  rtc: rtd119x: use devm_platform_ioremap_resource() to simplify code
  rtc: s3c: use devm_platform_ioremap_resource() to simplify code
  rtc: sa1100: use devm_platform_ioremap_resource() to simplify code
  rtc: spear: use devm_platform_ioremap_resource() to simplify code
  rtc: stk17ta8: use devm_platform_ioremap_resource() to simplify code
  rtc: ds1286: use devm_platform_ioremap_resource() to simplify code
  rtc: st-lpc: use devm_platform_ioremap_resource() to simplify code
  rtc: stm32: use devm_platform_ioremap_resource() to simplify code
  rtc: sunxi: use devm_platform_ioremap_resource() to simplify code
  rtc: tegra: use devm_platform_ioremap_resource() to simplify code
  rtc: tx4939: use devm_platform_ioremap_resource() to simplify code
  rtc: vt8500: use devm_platform_ioremap_resource() to simplify code
  rtc: xgene: use devm_platform_ioremap_resource() to simplify code
  rtc: zynqmp: use devm_platform_ioremap_resource() to simplify code

 drivers/rtc/rtc-asm9260.c           | 4 +---
 drivers/rtc/rtc-aspeed.c            | 4 +---
 drivers/rtc/rtc-at91sam9.c          | 4 +---
 drivers/rtc/rtc-brcmstb-waketimer.c | 4 +---
 drivers/rtc/rtc-cadence.c           | 4 +---
 drivers/rtc/rtc-coh901331.c         | 4 +---
 drivers/rtc/rtc-davinci.c           | 4 +---
 drivers/rtc/rtc-digicolor.c         | 4 +---
 drivers/rtc/rtc-ds1216.c            | 4 +---
 drivers/rtc/rtc-ds1286.c            | 4 +---
 drivers/rtc/rtc-ds1511.c            | 4 +---
 drivers/rtc/rtc-ds1553.c            | 4 +---
 drivers/rtc/rtc-ep93xx.c            | 4 +---
 drivers/rtc/rtc-jz4740.c            | 4 +---
 drivers/rtc/rtc-lpc24xx.c           | 4 +---
 drivers/rtc/rtc-lpc32xx.c           | 4 +---
 drivers/rtc/rtc-meson.c             | 4 +---
 drivers/rtc/rtc-mt7622.c            | 4 +---
 drivers/rtc/rtc-mv.c                | 4 +---
 drivers/rtc/rtc-omap.c              | 4 +---
 drivers/rtc/rtc-pic32.c             | 4 +---
 drivers/rtc/rtc-rtd119x.c           | 4 +---
 drivers/rtc/rtc-s3c.c               | 4 +---
 drivers/rtc/rtc-sa1100.c            | 4 +---
 drivers/rtc/rtc-spear.c             | 4 +---
 drivers/rtc/rtc-st-lpc.c            | 4 +---
 drivers/rtc/rtc-stk17ta8.c          | 4 +---
 drivers/rtc/rtc-stm32.c             | 4 +---
 drivers/rtc/rtc-sunxi.c             | 4 +---
 drivers/rtc/rtc-tegra.c             | 4 +---
 drivers/rtc/rtc-tx4939.c            | 4 +---
 drivers/rtc/rtc-vt8500.c            | 4 +---
 drivers/rtc/rtc-xgene.c             | 4 +---
 drivers/rtc/rtc-zynqmp.c            | 5 +----
 34 files changed, 34 insertions(+), 103 deletions(-)

-- 
2.7.4



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

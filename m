Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E5BC7EE29
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jun 2023 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f8N2EvH4I0Z9BvBITI0eQVLtASD7NLPsfHf7Pu/NfW4=; b=wav/IZIEshvFZ1
	bAaxAE8s59CHrghbAb+5A1AZIbXkYfLTMXEpEmn/CA6vw5GZc8ULO3jOLvvnxL//sNmCHjJelwWNm
	qOJeIeALvQSA0EGpV1oBF2cZeuYrySOC7Kg9CEc2+yDl1VPgAaa+w0bRS4dRgImjjzn9te8fYBKM0
	X3uMBbpW5X6wy7pOTMty1mkZKy1ygK+6c8iRWaA/Bv/cc3rlom1wDmpM/Gy6z51chngio5PvzaIa0
	hOX+TaI8eQpbnldXdre08uDZjeFDwjT86lDKvvHAOW+AVrqyiGLCYgCLL3sw5SrmcK9MlWkzHYkfA
	E5smULJ9ZjFYDTKQjihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gtD-003J0T-1n;
	Thu, 01 Jun 2023 11:54:47 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gtA-003Iyj-23
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Jun 2023 11:54:45 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 1 Jun 2023
 19:53:54 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v3 0/3] media: rc: meson-ir: support MMIO regmaps to access registers
Date: Thu, 1 Jun 2023 19:54:30 +0800
Message-ID: <20230601115433.21809-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_045444_697023_8474919B 
X-CRM114-Status: UNSURE (   5.72  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

This patchset add MMIO regmaps to access register in Meson IR driver.
For defining clearly, sort/rename IR Controller register macros.

Changes since v1:
- move the cleanup/rename to a separate patch.
- use devm_platform_ioremap_resource() instead of platform_get_resource()
  and devm_ioremap_resource().

Changes since v2:
- remove unused blank lines
- update media/rc/Kconfig with REGMAP_MMIO
- all of patchs rebase on v6.4-rc4

---
v1: https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong@amlogic.com
v2: https://lore.kernel.org/all/20230517115635.31565-1-zelong.dong@amlogic.com/

Zelong Dong (3):
  media: rc: meson-ir: sort Meson IR Controller register macros
  media: rc: meson-ir: rename Meson IR Controller register macros
  media: rc: meson-ir: support MMIO regmaps to access registers

 drivers/media/rc/Kconfig    |   1 +
 drivers/media/rc/meson-ir.c | 120 ++++++++++++++++++------------------
 2 files changed, 60 insertions(+), 61 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

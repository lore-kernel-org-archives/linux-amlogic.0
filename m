Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B782C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 03:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/0fF7i2r2PEDbUcrbOTcM/jJWrr4ZaAdOJ6FNnzv2A=; b=lcVXkYJyD2aHwc
	Wsy37nZzuXVVl/tR18nvkvrhHcIXCZajjRmgUDM38Awpp4cb3SuweGNLqmOBkpdRBnZSbRUtJuTdq
	2bSiD2p5aI+knlT1o5GEo5nBEQq6O9EgPvAA4sLwge/QIQYZNqGO+dDi50cc3Sl24qb/pykz98NX4
	jNPEcb1kHy0wB8ImNQxBrf9k1qwXixXDbDD2YQc/ztdkXV20TuE3XI3IOMVX8avtq2qMFMEQesBvc
	wpoalI5bOsAYOvF/TPo7+ZfdM4fE6I5dTBPYoWqJDYTvkflVzJIV32IAkXyaPAwVs7pYdrTmvZKkH
	izAgAG4IacoIvLzTEkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7qWF-004Mrr-0P; Thu, 13 Jan 2022 03:11:19 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7qVu-004MlD-An; Thu, 13 Jan 2022 03:10:59 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Thu, 13 Jan 2022 11:10:46 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: meson: Add compatible for S4
Date: Thu, 13 Jan 2022 11:10:41 +0800
Message-ID: <20220113031044.2665-2-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113031044.2665-1-qianggui.song@amlogic.com>
References: <20220113031044.2665-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_191058_393860_38E8889D 
X-CRM114-Status: UNSURE (   7.35  )
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

Add new compatible for Amlogic's Meson-S4 pin controller

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 0aff1f28495c..8146193bd8ac 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -16,6 +16,7 @@ Required properties for the root node:
 		      "amlogic,meson-g12a-periphs-pinctrl"
 		      "amlogic,meson-g12a-aobus-pinctrl"
 		      "amlogic,meson-a1-periphs-pinctrl"
+		      "amlogic,meson-s4-periphs-pinctrl"
  - reg: address and size of registers controlling irq functionality
 
 === GPIO sub-nodes ===
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

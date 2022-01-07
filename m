Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE1BC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 02:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ/ObjpoqrWDCBqjGj+7gF1bbvWT2gOptxrzbZmChDU=; b=t+aoNL/LEa9ohK
	noUku74B7rkjEnookKmbmHoW5qFOw+TYGTSVSlpqLpUEtrkmOYUXFq2UUmOut4meisy/sEa4/LQTW
	dxsYE3n6PYMqFO/c8sbTz+QvsMtU6FEl9ZEaViHMqDUCn7wH5Hxfy9541vEDgvnJSgNKtYGzCRnU4
	KzKgKleEa3fl6eBzOxAXp0Fkm/it9C0IBxwckBO7/pUomJUc1wubYarmIKE8pK0rO8Gq4P53F6nJI
	mqxaKlR22jcHER+A6XfaktM8Tgy9cLbJ+RsO9GccCKgJLUN4BPX9ZiQqyalIJPoZiCu2VGxjfqayi
	xkYByYSvsVFOgG4WXh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fB0-0020qd-DE; Fri, 07 Jan 2022 02:40:22 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fAy-0020oo-CP; Fri, 07 Jan 2022 02:40:21 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 7 Jan 2022
 10:40:17 +0800
From: Zelong Dong <zelong.dong@amlogic.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <khilman@baylibre.com>,
 <narmstrong@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>,
 <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 1/3] dt-bindings: reset: Add compatible for Meson-S4 Reset
 Controller
Date: Fri, 7 Jan 2022 10:39:29 +0800
Message-ID: <20220107023931.13251-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107023931.13251-1-zelong.dong@amlogic.com>
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_184020_453230_0CDC92C5 
X-CRM114-Status: UNSURE (   6.00  )
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

Add new compatible for Amlogic's Meson-S4 Reset Controller

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 92922d3afd14..494a454928ce 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -17,6 +17,7 @@ properties:
       - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
       - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
       - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
+      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
 
   reg:
     maxItems: 1
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

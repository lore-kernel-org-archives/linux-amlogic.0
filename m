Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42239C48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SS3+80rI8+vfQpL2DJkIqWXahtuG65ppKN8zpfhHD0=; b=ZkJOAULyfea6EV
	UwKwgmTRLsJ2rwWs5yzgfIBShWAhe6B1TojXd77l7KvX+E7obvGTvXFK4b7xRtNdmx1vsH8RSXVv+
	aGpkDrBaFykJ9eHU4a5BhsKAZQo6m/UH63Kmc0LCS8AUMmOLUDFTmZ7H6lZUvQJKDSZlGJHTMh35V
	YJ94JlVmyaWZo+qToMmZsZbkhpeX9pIWr8EMPpZJ9eERo8LCAbHT+sVdAPEDdKrKtuann5wlm0lj3
	uvmL6/kFOPAFGqcnfwR1Nwps2tg8WSh8AwRkjF2trqScGTab5d99knPzwT2UsjqQ18fW/8uMS1m5v
	aKaQmaiB67fHK2nkAMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3ny-00000003s0v-0YJN;
	Thu, 22 Feb 2024 07:47:42 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3nm-00000003rrj-1Ofu;
	Thu, 22 Feb 2024 07:47:31 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Thu, 22 Feb 2024
 15:47:17 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [RESEND PATCH 1/3] dt-bindings: interrupt-controller: Add support for Amlogic-T7 SoCs
Date: Thu, 22 Feb 2024 15:46:37 +0800
Message-ID: <20240222074640.1866284-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240222074640.1866284-1-huqiang.qin@amlogic.com>
References: <20240222074640.1866284-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_234730_465048_0B5D67CE 
X-CRM114-Status: UNSURE (   6.36  )
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

Update dt-binding document for GPIO interrupt controller
of Amlogic-T7 SoCs.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index 3d06db98e978..a93744763787 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -36,6 +36,7 @@ properties:
               - amlogic,meson-a1-gpio-intc
               - amlogic,meson-s4-gpio-intc
               - amlogic,c3-gpio-intc
+              - amlogic,t7-gpio-intc
           - const: amlogic,meson-gpio-intc
 
   reg:
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

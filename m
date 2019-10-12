Return-Path: <SRS0=gqBQ=YF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531A6C4360C
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Oct 2019 10:06:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F92B2089C
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Oct 2019 10:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShsStNMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F92B2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tSXlgUeeUiR61So+LpBMOqN+NNvvzNU/QdI0OD2854=; b=ShsStNMk5pWn0i
	dZURjyr08hy1RfcNdUy/SpHzQaceVoYlLhWUOEso/OMVbtJIHFifNdwkc2b0ZkCe8Fu2D26d22yhR
	tcQNl1m4zoM2QUxpOeFDDnP+IeWQPvGyZnH9WiuikvYAm3t9Hg5iN9Vc2ZiDqEiHJUqquoLc7Y5wW
	iRWkV21PSWz2wjYIs6vvdfK2kW5iBAnLQXbh0EOEbTJKm9tceLPhx/sfKJFHRAda41eJiy4XZgADb
	KuCCe6QDJW7fswKxTIKMh7KzJppqCfVUpEGCUL5s338Z6R2otQsNrp3dUIXVKrQqr6Fg4VToLQ57O
	fSVTjB+m6tZ7mk5VZ7FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJEHk-00024F-70; Sat, 12 Oct 2019 10:06:04 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJEHE-0001Sr-Qb; Sat, 12 Oct 2019 10:05:35 +0000
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10;
 Sat, 12 Oct 2019 18:05:30 +0800
From: Xingyu Chen <xingyu.chen@amlogic.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 2/4] dt-bindings: watchdog: add new binding for meson secure
 watchdog
Date: Sat, 12 Oct 2019 18:05:19 +0800
Message-ID: <1570874721-36077-3-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
References: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.22]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_030532_877631_8E22A3F4 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The binding targets the Meson-A/C series compatible SoCs, in which the
watchdog registers are in secure world.

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
---
 .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
new file mode 100644
index 00000000..0bbc807
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+# Copyright (c) 2019 Amlogic, Inc
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-wdt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Secure Watchdog Timer
+
+maintainers:
+  - Xingyu Chen <xingyu.chen@amlogic.com>
+
+description: |+
+  Secure Watchdog Timer used in Meson-A/C series Compatible SoCs
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-sec-wdt
+
+  secure-monitor:
+    description: phandle to the secure-monitor node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - secure-monitor
+
+examples:
+  - |
+    watchdog {
+          compatible = "amlogic,meson-sec-wdt";
+          secure-monitor = <&sm>;
+    };
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EA0C43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:15:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EB120772
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2R2185uZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y056GuRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EB120772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VvwgubgraFCYgcoO01HlkoNmTpVltlDYIjfq31wYVyg=; b=2R2185uZ5mgoHFSLTbsW6gCC1
	xns5FheWeYDimAGgq5zVvbHT3jRHYgbkQJkd43pYewE9QKNew1oV7BKD4+dM97CumFtE+2WM3Ie+r
	3VvNzQb4pztmpFu2MsUydhpMwZzAVwaF9MZDQIoW5I10n8u56yiMT+a7s71XmTBrPCQqVJcUaQyX5
	zW+yeCf8Lsjt2e62l0lHt/v6bqBZ9Lc68vkXVpZVxFKiWehZN9ri+C/ymYTYn/P4IcpulRpt6FIfm
	nJQS8SkeTDdhsl30L+daOHHQtyB+uqJRPoA45+IuzirVSMRCGC/d4r10byN+CY1bQ434my99pt/vL
	wKybfREsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEMw-0007Wn-U1; Fri, 04 Sep 2020 16:15:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEMu-0007VI-EI
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:15:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a17so7280822wrn.6
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=Y056GuRHCxq6e0BBzqF948ztntuwIOz8bO5EXHZVceS8Jg0CfqOhBKqJlvVGpMwE4h
 iBh4LOB63DMx1RosXGJCf3erVS+BHoXJDPqtMJO7SIyyr05UVzhbEkh58RtK6t2KGkQq
 +Hy7UxD+sn6UhDGkxFCBUqtVQRBk48a+rzjkV6EVsnySbNQp2bAUVRuMQXxMJXA4J2cI
 L2hgvAP9NpXeUxdYoj7tslaf5AaEAl7u23kYEPbxTdtDBONu9Vi2bnZhz0KJQ3OZ+uAt
 vnu0Kqe0eMNoIac9xzecQ+BAnumczCrprQ4SqaeCKAcbcUtfAE+Lg5OeI0HaKwYzCfcA
 EYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=Qi6o4fTEpPtW7tKqvi21/FIgA8Ps9jm4x21F1voQ/tf9QTEGVHMUCqvJwIoveVFE4N
 z2M9tiZqAyWf7jW+ifGh4FnTcf42lE30cTRIlYooUoId7Y3AEBl5M+v3E81Y8CgzZT3U
 2vDu272oeo45gBI7ge3t3V2NpiQ8D8KHzjD4mhWZGiHWAr25+fp/K5oMvjgnOy8iA0En
 qlQcABI8cWfiko1JDnTM/u3gsXYSdokNo5ZUjaAgK6S+6XJJiip0VxZNMl1FV0busd6K
 Egy8DzizxfBKCcwaEYS5I6lhjSvdFXsn/p87cNIp3MnR+E7RYLoKug/YsnvQo0TdkusP
 odGg==
X-Gm-Message-State: AOAM532xMHdIDhH+gJ+esCmV6hbhXRe42oj5VnNBAnsEVAuTS+hD+LK/
 zs9GdpIX1vNm7Y44shlI+9FI8Q==
X-Google-Smtp-Source: ABdhPJyny9jilxsNRKY1nnZVgili+ToZTQVRduxfJ01Z1nxjj81l/gIbx4yQO5JFHzDk5dUnx3wprg==
X-Received: by 2002:adf:f149:: with SMTP id y9mr8153667wro.93.1599236115028;
 Fri, 04 Sep 2020 09:15:15 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d18sm12238160wrm.10.2020.09.04.09.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:15:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: add TDO tl070wsh30 DSI panel
 bindings
Date: Fri,  4 Sep 2020 18:15:03 +0200
Message-Id: <20200904161504.23915-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904161504.23915-1-narmstrong@baylibre.com>
References: <20200904161504.23915-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_121516_485746_4BE4F3DE 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This add the bindings for the 1024*600 tl070wsh30 DSI panel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/panel/tdo,tl070wsh30.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
new file mode 100644
index 000000000000..20f4fdedfcb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tdo,tl070wsh30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TDO TL070WSH30 DSI panel
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      - tdo,tl070wsh30
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  reset-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+  - port
+  - reg
+
+examples:
+  - |
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "tdo,tl070wsh30";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+        backlight = <&panel_backlight>;
+        reset-gpios = <&gpio_reset>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&mipi_dsi_out>;
+          };
+        };
+      };
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

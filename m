Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78652C43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C18720639
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJsx+wrJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CBEtX+ee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C18720639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rofgsuluyoima0nR1b6LXbmRGxVGqVX1I/+udg4Xj4E=; b=lJsx+wrJolXhQsK1UIjoGoSOP
	B429m2TxMvRy5QoEBmUCv35+o4NE78rMKuce4Y8JV4cvX/5Cvqjn74p1KZVn3LoEr7cC5A+iyOLvj
	8xL0pAQLvJiI/YWLhueP7Rc1zvJVt1P6yDJ+uR9N41w26uPTEpAzPTcpsia+g5F6Qucq4+WsoFgQe
	TEuMdFwzdc6tE4ozJCOMdIBCa9fImaVPX5rpAvmyRazyFXDAMzRpFjkt7sIOJfrziKnx3udznv7vN
	HW6cmaXZm+kkPQzSAwL4dNxPaAtXML2f6sA7W0cB5qMf7Jga6Ovj42WrYhOUUUAYjGz807I94qyvA
	QhgrrCdiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2aD-0001uO-Vt; Wed, 09 Sep 2020 16:04:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2a3-0001pa-Mw
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 16:04:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id w2so2822349wmi.1
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h1AWnbsFuPZ6MacypHQ8HsT3a6NqF6t9qfTWoa+8SvY=;
 b=CBEtX+eetvQyYOJlhFNdL2Py9mlE1aqXsNu2yLaDW0ofpA3brnezX+6b7BJvAYKLuT
 V68bQ27V+dOY0t21Y4cMcopxcuHJl9KObw5od6vAqTGIiccB8nljhohkaX6b988Fh2dk
 +WW6yD629U3/2fVJqNwKLxqout6WmwgAJehP3FyS2yuM8GQiUC90ENf1p4GYBpYQ1Iie
 Wpy0Soe3C+7W3P8HjatHnNJQkG2CkCbnx8oIy57b/J9dP5ITDpA9dh0MNYzSsk8BdLcY
 BApABE2lixWzfO/MPhOK6ycI/B2lwLg0mofAc4MAh5J3fNsWtMENu062OPINiimT08Cd
 6Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h1AWnbsFuPZ6MacypHQ8HsT3a6NqF6t9qfTWoa+8SvY=;
 b=S+cZ8za+TnDKe31+/GHY6NZ+kas6fWJ7lMqJtn6PD/WnhMs0Syy5GT73i6sR7CJUj/
 aZ+SZ8rXANiEGVCDzaPns+gjjR5x29ozZ5G8nxWPWS8lRV41npigJEdcuQL5D/PI0/Ww
 KFR2ZyjcRMRdRECglqxarf36Z5MgwoWEeBHcm+3N7BpMakHob9NH2zp//Yd4O9kmINBM
 Dx+tNGEZML75mkJ5Kh3rEyN8ZF0CQgyvmYhFPVVtnVXFd61S4q+a04VWuVOONStdCr6g
 bb5SA3wazzCtQQ5EngoX8bbSmfexntQRjiFImgVV+ORTUKVTS+3ruZuxgPXUXnQ07NHA
 w2OQ==
X-Gm-Message-State: AOAM531mSW/79Z6PuzcDKUK/fCB9ruAyOydsfSBKx1F2erxZtvm9/CCt
 scPQeJMDvNqPqt+FcdqK6OAnvInRryjrDcv4
X-Google-Smtp-Source: ABdhPJxj7lBo+0hk4DkP0KoDHzMJtbj02HX+VSFjyvK7FqFw6/ssYu+ZmXW2UR8kbhGhvelekB8u/w==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr4098812wmk.7.1599667458702;
 Wed, 09 Sep 2020 09:04:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:04:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: usb: amlogic,
 meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings
Date: Wed,  9 Sep 2020 18:04:06 +0200
Message-Id: <20200909160409.8678-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_120419_789959_C4DDF72D 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 5b04a7dfa018..c0058332b967 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -25,13 +25,14 @@ description: |
   The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
   host-only mode.
 
-  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
+  The Amlogic GXL, GXM & AXG SoCs doesn't embed an USB3 PHY.
 
 properties:
   compatible:
     enum:
       - amlogic,meson-gxl-usb-ctrl
       - amlogic,meson-gxm-usb-ctrl
+      - amlogic,meson-axg-usb-ctrl
       - amlogic,meson-g12a-usb-ctrl
       - amlogic,meson-a1-usb-ctrl
 
@@ -151,6 +152,25 @@ allOf:
 
       required:
         - clock-names
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-usb-ctrl
+
+    then:
+      properties:
+        phy-names:
+          items:
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: usb_ctrl
+            - const: ddr
+      required:
+        - clock-names
   - if:
       properties:
         compatible:
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

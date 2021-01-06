Return-Path: <SRS0=HsQz=GJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC48BC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8915722B40
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8915722B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u8uVVS5dVFUdlSav22T5+h4+PhaMQ/MvUhqwoQvWR8U=; b=hsfPLoe/8LOrak41vCfEwcMix
	bkjGNELPNnOegkybAeGUul5pqO++N4p/ihtE59OWGfiefOwZMwR1l3sRe6fJ6VIfrsTioCgv/huNT
	3D/5FCk2aoAxsWThvj91qiDcwNioJQ6YFIsrdzw/l/5Hj/v0TKge7Q3p4aIumDMds2wRIK3Z8u9aZ
	txuqJzX3hydqIrISc3rFA7RBOhCswxiriH1EZSCGBqNSAaqN6YP7w6cwRgt5N78XzOTr+/lu6C4ND
	voVta+WHuqHTMxZMrGxauroDTmUk+EcRMRas+rhb6gLChhkWYXAewyX406Iz6eOX+/KCPul6qosCg
	hQNWTQWuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx96p-0008DD-Ms; Wed, 06 Jan 2021 13:44:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx96i-0008AV-IC; Wed, 06 Jan 2021 13:44:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r7so2482374wrc.5;
 Wed, 06 Jan 2021 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0eZ/FWcbLMpPB1nKvHEdiJgH7uCG3jk9noO3gR5ju8=;
 b=YyammdhJo+QwllRxTXF/Ita14CK7RoS2yhZ0SyGM3FH7fXdKNjkJQnnegKYp9Xa2iE
 V4u20z5g+e4DqHbxFZTbyDYuorcMsyiRNKO3PHp9+6SeZ6mKpU7G0sy0bAK2aQ+Su6yN
 Yt1qjVupSYETmPwUOvl5szPpUMWss7qNLFg31znLT3zxi4ceqC6KAsyxIz8Nki4acmie
 Gz3Gq4Kda5cGVc7LzQ27NfKq8z1E8+s6Zu2gKv2VRUTPsQRgPrFdTb4YrEj4ifhMIFoI
 Sa1IxKjZdz1a5Efr6fm7KQtnJZry3WhC4REjwePhhCkPQp4MIFxTqTgEKIUsIyrpGy1e
 zzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0eZ/FWcbLMpPB1nKvHEdiJgH7uCG3jk9noO3gR5ju8=;
 b=Bi4FOejJr99rOc4TgYzdviISKOTy5SeyOnaEJX9dohBVAcEq1I9DLlHQbA1ffH0JTV
 +KJIQYRJLd4FgAXZ85kWzZ+A3pTogjJAMvapDeu/5lDyKZyAIS49Zf7bfoTdeGzsIK3T
 RvOkiF+dh6XKbKJh63ZEztNIz8wOxVRo549wQ22eRo1EB230iSZbtRyVqfWtCkuto+xF
 V+HvOjAg4HZo/gwlM7XUNJjogHQUZr6mA9yPLgwtTtcH23Ntwz0VFFmE3VhJSmuMg/wS
 vwT3imwtAGqaT4vj5XDf+/n85Iuh1qx1XtcCEnlVtgrNKOZcrWWjIVh3ViaY+3/eiIPM
 OknQ==
X-Gm-Message-State: AOAM530cLLq16WD55YuKa1qWXo6/wclf2ps8G7Iqekhh68vgPSjRuK/u
 CkdJjQJldSkaESX1T1dOHWXqfqpFo+k=
X-Google-Smtp-Source: ABdhPJxisIty1iQaxAOzuAu/5/SkGMbljM5mr3vpOB39Q4Od0Mjn7hqsqsh4IOdGoGVVl8nS3jCMQw==
X-Received: by 2002:adf:bb0e:: with SMTP id r14mr4500993wrg.159.1609940650942; 
 Wed, 06 Jan 2021 05:44:10 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f14sm3085351wme.14.2021.01.06.05.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:44:10 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: net: dwmac-meson: use picoseconds for the
 RGMII RX delay
Date: Wed,  6 Jan 2021 14:42:47 +0100
Message-Id: <20210106134251.45264-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
References: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_084412_646211_7EB564F2 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
delay register which allows picoseconds precision. Deprecate the old
"amlogic,rx-delay-ns" in favour of the generic "rx-internal-delay-ps"
property.

For older SoCs the only known supported values were 0ns and 2ns. The new
SoCs have support for RGMII RX delays between 0ps and 3000ps in 200ps
steps.

Don't carry over the description for the "rx-internal-delay-ps" property
and inherit that from ethernet-controller.yaml instead.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 55 +++++++++++++++++--
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 1f133f4a2924..0467441d7037 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -74,17 +74,60 @@ allOf:
             Any configuration is ignored when the phy-mode is set to "rmii".
 
         amlogic,rx-delay-ns:
+          deprecated: true
           enum:
             - 0
             - 2
           default: 0
           description:
-            The internal RGMII RX clock delay (provided by this IP block) in
-            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
-            should be explicitly configured. When the phy-mode is set to
-            either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
-            provided by the PHY. Any configuration is ignored when the
-            phy-mode is set to "rmii".
+            The internal RGMII RX clock delay in nanoseconds. Deprecated, use
+            rx-internal-delay-ps instead.
+
+        rx-internal-delay-ps:
+          default: 0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+    then:
+      properties:
+        rx-internal-delay-ps:
+          enum:
+            - 0
+            - 2000
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
+        rx-internal-delay-ps:
+          enum:
+            - 0
+            - 200
+            - 400
+            - 600
+            - 800
+            - 1000
+            - 1200
+            - 1400
+            - 1600
+            - 1800
+            - 2000
+            - 2200
+            - 2400
+            - 2600
+            - 2800
+            - 3000
 
 properties:
   compatible:
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEEAC63697
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE54B2231B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1VT3mjQw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pveyCBiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE54B2231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=flBRpqN938nuheZjEjidqAp1Z10hEofqaIj5SlUr+Tg=; b=1VT3mjQww8C6hJBGNCxRpHCtt
	l7S9WZCn6W5PKz5K55aKPXnsP5bndztz3a6JJYMnu+ofPyml8vrSJS7TzBc+U0503xVzXpdNzlAMT
	3pUbSV1JSJD3QN0zXGBBx8mXpbMND6QrzB0uv7bq+A/lF+wS/Lbo4dAndwS1sLb0ehtQtlmYhDCNm
	xeq2UbMAWlT3M35lYY4kZJIdXDXZek+wAEyNVgaaacT0+6hChrr65f9TxScbccm9q05ZM3FD7Goc+
	ILI8rY8fYqh87Av2ectaE/zcMP0Cyy84N7NBsyHWhd/r1eSQibPcStIrw/yS/ci9/ZBuaPhrwIAZ9
	cSoFd0bzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke1kC-00049G-Ka; Sat, 14 Nov 2020 20:01:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke1k5-00047F-VD; Sat, 14 Nov 2020 20:01:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id d12so14068423wrr.13;
 Sat, 14 Nov 2020 12:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GleviSu04Uw5FP7oMT3FdU05y/KDRd1HVYUy7Aq3GME=;
 b=pveyCBiKT0pSGp9hA0nzwCwtFLXJh/FT+NU6HwZPvE7afs9OfNqqQ51ac4Xmrk30fz
 MGpgfdzutTiyHEprGv3b6QHuJlME0WIsbPiar56RICQjQON1G5FEszLmXZ4CpCBlGivG
 7vdNZkqrW2pBEACXCyx1gDXxKRQ6Vmmz9mUhPpXOnT37oY9sR98al66y4wKtD+dQYDei
 nWeRjzPE3UCwLkljsETYZdUAYun2RKxlYrTrruyHH33spZsOIhzqTeUlfOYaaO5nQztS
 kZciFjLHzi1hvKHUup5QSO7xC401gwm4aSeFsBPkElEcJoZqhD8xULvXQUcWuMdCswXM
 JpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GleviSu04Uw5FP7oMT3FdU05y/KDRd1HVYUy7Aq3GME=;
 b=q3A67nR8X2HndBf6JHjX6Ohkv9Xildjk7cjgLT2omGJZWh69jwmwRV3bTaO80BppQe
 NbwXcKV7izmkr5mowUQl8zrRuYlxUcNfU2J6BSn1ZJ2mlwie6godqUpjl5e45S56ipJc
 RUGTPPN1ivPYYoeMu08vkzDHibkeCUd7gwndpIoUUfsuqN7oWLigwtbw5jRAwvPFnGve
 V12qhBqm6GEuYw7FY7gSZoSZvhINSD0q/njWEukaivC4AYbSqKZxiPQ22LCzQ0KHwNnN
 uMwJnoESW58qL/vWTLHk80AfgoR6Ij3P7W3NN8GGyUpQuHsykCu1gxJ3hW99DqONcuVB
 C7eQ==
X-Gm-Message-State: AOAM5313aX/Dwiz8fuJNRqpz8Pqvo7+/YMGeMu0Hz7ywC0XG8wNq7wp9
 a4Or1orcg80XKnzQZ95oBqU=
X-Google-Smtp-Source: ABdhPJwt9EMOX8eniG1+m0e565ea4vN9hkA+N6zCjnJQ3h/G9ouh60yZTq841c/nXKTxWP5OBto66g==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr11143264wrv.306.1605384109053; 
 Sat, 14 Nov 2020 12:01:49 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119]) by smtp.googlemail.com with ESMTPSA id
 g138sm14342953wme.39.2020.11.14.12.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 12:01:48 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH RFC v1 1/4] dt-bindings: net: dwmac-meson: use picoseconds for
 the RGMII RX delay
Date: Sat, 14 Nov 2020 21:01:01 +0100
Message-Id: <20201114200104.4148283-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
References: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_150150_089939_E8FC87A7 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: andrew@lunn.ch, jianxin.pan@amlogic.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
delay register which allows picoseconds precision. Deprecate the old
"amlogic,rx-delay-ns" in favour of a new "amlogic,rgmii-rx-delay-ps"
property.

For older SoCs the only known supported values were 0ns and 2ns. The new
SoCs have 200ps precision and support RGMII RX delays between 0ps and
3000ps.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 6b057b117aa0..bafde1194193 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -74,18 +74,68 @@ allOf:
             Any configuration is ignored when the phy-mode is set to "rmii".
 
         amlogic,rx-delay-ns:
+          deprecated: true
           enum:
             - 0
             - 2
           default: 0
+          description:
+            The internal RGMII RX clock delay in nanoseconds. Deprecated, use
+            amlogic,rgmii-rx-delay-ps instead.
+
+        amlogic,rgmii-rx-delay-ps:
+          default: 0
           description:
             The internal RGMII RX clock delay (provided by this IP block) in
-            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
+            picoseconds. When phy-mode is set to "rgmii" then the RX delay
             should be explicitly configured. When the phy-mode is set to
             either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
             provided by the PHY. Any configuration is ignored when the
             phy-mode is set to "rmii".
 
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
+        amlogic,rgmii-rx-delay-ps:
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
+        amlogic,rgmii-rx-delay-ps:
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
+
 properties:
   compatible:
     additionalItems: true
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

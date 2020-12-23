Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93C9C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A17224B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A17224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u+7tEXRjVhzkaQtJ3VtsIjMSSeRUE1dmwKhZMccSdys=; b=MoLF03/kjDb1doBC2zeXfIyB1
	kEMbM3wqCqFGctmr8h74qE8eBMeRjDikML5WWVNq/Czi/HrCJ/FGqv3bM9kfhKlG+MqOdZWDeBMCl
	jNNAh5aNncXh5JyRLpY52KTgxnq7z27u8/HfTpFB+mdVeYU5Ak2j1cFblQH2TjU6rZweDc7Kg6cEV
	L1uqUXDo7wLlxwW8Pk+081d0iOYMg3cn6rHb7bqXL++7ZIp2f5jEUQOCyYnNEMRrU8lZ4sX1x8sff
	ZFMWVPzRT97hYfobFD771iPTqHL7GcCZys1otICIS/M+DC5PF5AUWDbH+qk74AVrvl68YcKU0JGFN
	vM9a9hGjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDaf-0002hI-BF; Wed, 23 Dec 2020 23:30:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDac-0002fY-Mu; Wed, 23 Dec 2020 23:30:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id r3so716609wrt.2;
 Wed, 23 Dec 2020 15:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQPHIvsAjymwrj88eayvDfWVEI3FeVG9migi2sLEfas=;
 b=rd7j9CDFeZd22ADwPLkZVVMl3AS7J/1IrJGa6JJ1zOW2YUp/XJZEQo1iCxPfE5L+sn
 +uakY57HlN/ymRkT/2xWJvEmW7e3T2Aah+R3TEcVastQzJM9f4yUbOlrNDWF6u/t4z0Z
 60ke+dD6pN22DJ+mfaYKd8wZy+h1VAJTW2xoTQ2hftyMHWj/dga3nxt48KDBBx+aZ5TX
 m+qX4cLSjshjPR4ZTuqFbmxWgFYzNXGVTXfUtFXNiu8SrZj/RVZO9GqAFSUa2nwMgBCh
 PpMCEO4pp28IURbB0ZvygGm+3S/DpGWAg2ct6SSjgQWjiQGc8EpfgAA3bhpzBpOSKJEB
 0q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQPHIvsAjymwrj88eayvDfWVEI3FeVG9migi2sLEfas=;
 b=dKGn0QYBYYVXOek5rD1vR1yg7qtUgx4pm7nN50e8T0eRu+VGS4MzU/eB2cLezRiNkB
 wFPb6fEOMQM5P9mhZ8R64uZ9qbZa8iDXERpU3pv4qFkKGd+tSKl3UMVFlIBcq6ZCPy0w
 wJ3gyId7mtS/Ta3tsoHwUegRmBWYnadk+CFiBXJ6UHABx2oTQNJdkqEVELbUC16tIthc
 kpsOX9uhtZ2sYUg0Jyk13ieT74Uo9k/5MwCpyafnhk5sbKENRajYXlRP6jwz24f0fWvw
 fJ00K3fHAu8hp9mapj3WdqA1q4FQIr1RSs4p3Dq2tGRDdBzmeYxr5uaCgNXa6lY3DEzh
 FaLw==
X-Gm-Message-State: AOAM531Lg4XxQxyf7N4J0Zfh/P9kgLMHnMe7r6rDkxOEgJNIoBYqgjv1
 Bn7ZfiG2QBj0NgUcVBvl7Fov1EU9nSE=
X-Google-Smtp-Source: ABdhPJzAZbpyPuBWW2KBcu9dJa/qHhI0eE1CLPKrGsAQYhn1R/e7UieMPCs4eQ6SiOV0e6Noluus/Q==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr31354990wrp.239.1608766238726; 
 Wed, 23 Dec 2020 15:30:38 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1371a0900428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l16sm37926657wrx.5.2020.12.23.15.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 15:30:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: net: dwmac-meson: use picoseconds for the
 RGMII RX delay
Date: Thu, 24 Dec 2020 00:29:01 +0100
Message-Id: <20201223232905.2958651-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_183042_819301_3B538091 
X-CRM114-Status: GOOD (  12.48  )
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

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 55 +++++++++++++++++--
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 6b057b117aa0..a406e38e1848 100644
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
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

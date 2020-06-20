Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0840C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 19:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8729023B5C
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 19:27:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EN2FcSR3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lrwpfi64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8729023B5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOjczcO5FOUatvqP3uRr2lCyodOILIFJQAfaWLQ0u8Y=; b=EN2FcSR3qFVg0u
	2jgykJCiB6uQTwr4OQ1ZE7aTW4gFA+/2BMhtUvktLUT1fm6JmZ8ZM3Y7UBQ77ttMR/ZxDuDMaMHL6
	Pb3sAAF+V0Heau3jH+1DWw1LIw06D83GRSzti9B0LCRSn8gluoL1L3Q41hYM8+txs3Kn1n9PbzBE5
	nIaJ4Ftm9T8FjqUwrffwgIFfSEtLGmMx1iWjQYtm4R+74+DrPhR2I2MyR6KIOV7Wwn3oZ96RWPgik
	BXuEEyUuFgJgqdyDpElbB803511cfO+IffYGczmMhAHuWf595SXBYki2HD2+TwVPs8cakBl35Rj8X
	Rh/KQH+rfCCuSeMLDYaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmj8t-0002Af-GZ; Sat, 20 Jun 2020 19:27:07 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmj8q-00029b-G5; Sat, 20 Jun 2020 19:27:05 +0000
Received: by mail-ed1-x541.google.com with SMTP id t21so10423929edr.12;
 Sat, 20 Jun 2020 12:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xlMju2JEREJBGn1W5Gv493VuaaC7wnSC30py7qk3wR0=;
 b=lrwpfi64mqrazoNe8GDi05u/Dqj8jtbPAa1bHuWrhBwGo0iFhAYxvGp/wtaONK2egG
 azPY8nq4+52RSN3SwHreMqnjiyUeM8gc3pYnFw+WzDFY4RfXnJJCZNJ1ME9137N5g5rL
 i5gfxRJkNJ4G2mtbKei/O+itHOco3RN/HX+8nyDNNwHnwDybmkhq/tmI+h/Gmw51LgOd
 umrf2HHPzXXYhfhVxtXfPTbX3qaJ489Ql1paIr6jeitgLqXQ5D+AgwmLUayFQH9KD2Lr
 gp4TtT62XgIRJF7hrMh69aweH/jQuDN6FICg/FiDWdfvAZwQ4VWFT4dyC0ktgPFHs9mR
 1y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xlMju2JEREJBGn1W5Gv493VuaaC7wnSC30py7qk3wR0=;
 b=sJ6H5A2XPaL/6U5UAt5Yz21gLyKm2ub9W+RCvAZGbNiMaOIQTzx6Yw0hnM6KY1E9Bw
 2607734WsJOlQFfPLo/YSX3/tRULQgAMMz/g4ZyaEE4qgEnQt1BIP2H1SlMVBaQGyEJo
 rLoDHFvrMqRB21l3ZM/ZqE9Aq5/7X2W/uaTUQOQgxQPlN07RwGLQnTVVu8+P2MOkqszx
 XD3BS7Nh6cgSrs6BW/tmcPPfR1+/90k2gNz6O+EshirETX6U03t5mBzv3MQZgeNS5uNU
 7Ngz2JVxPO8h9Ajqzm6mDeE/K9XxZijpDyFjZ0/nlL9CjkX/ryq9yP+VPIRJOCnZpujs
 zsuA==
X-Gm-Message-State: AOAM533yCAFe+/rBtLB3adQqEt0xb17e1PqgYCQBklNsLsum2rLdqYRM
 REMgEjegabzgI2e9Z67hvwI=
X-Google-Smtp-Source: ABdhPJx/JXrXjP1uqPNHJEy8cBhBX22rRDG+D3WwF4EyWe0fbzvib9r//NyBQNuTtOO06TR9dd7kow==
X-Received: by 2002:a50:a721:: with SMTP id h30mr9375012edc.153.1592681223010; 
 Sat, 20 Jun 2020 12:27:03 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 gv18sm8034044ejb.113.2020.06.20.12.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 12:27:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, robh+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: net: dwmac-meson: Add a compatible string
 for G12A onwards
Date: Sat, 20 Jun 2020 21:26:40 +0200
Message-Id: <20200620192641.175754-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
References: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_122704_555692_7BCEE07B 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 have the same (at least as far as we
know at the time of writing) PRG_ETHERNET glue register implementation.
This implementation however is slightly different from AXG as it now has
an undocument "auto cali idx val" register in PRG_ETH1[17:16] which
seems to be related to RGMII Ethernet.

Add a compatible string for G12A and newer so the new registers can be
used.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 64c20c92c07d..85fefe3a0444 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -22,6 +22,7 @@ select:
           - amlogic,meson8m2-dwmac
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
+          - amlogic,meson-g12a-dwmac
   required:
     - compatible
 
@@ -36,6 +37,7 @@ allOf:
               - amlogic,meson8m2-dwmac
               - amlogic,meson-gxbb-dwmac
               - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
 
     then:
       properties:
@@ -95,6 +97,7 @@ properties:
           - amlogic,meson8m2-dwmac
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
+          - amlogic,meson-g12a-dwmac
     contains:
       enum:
         - snps,dwmac-3.70a
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

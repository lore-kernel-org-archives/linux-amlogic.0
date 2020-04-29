Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C17AC83007
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE4A2083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdFbW1jR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SaXueIiN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAE4A2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iosAQL8bcbbJOs6XcTMpemIhiklVrAF/iyI8+xJGOtA=; b=jdFbW1jRePdOI3
	M176Tx/uRzijFGlmftBT0zv4cNi2/Yqsaatjhz9hpnbX4BYIPwBAaO1MrGAmR7ZsyW6a6ERRr+JVI
	Se5ioREENDPsbkFQmgAvmFEOu8bPP414aI/FXiAxaeJ8MI4fXzAGzfGNNQ6hbyQxJXFbFTqB2CGbJ
	Z37+nfAZOAmvKoNemlsMqaDdUag7Gl7VuaMYh5QOcDi7iSXtst1K99hplF9YxdC2G+3Fg8JgJUNR3
	vnkKDCDq2MPOn0/NiNTEK8y4NZwtAXbjleADstdXiE3PgfBmsdoM00MM/3wdkTfBjwWhY0z4Mf3pr
	rVocxacse4PxbRpVARQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTt9B-0007Dl-Ab; Wed, 29 Apr 2020 20:17:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt8s-0006uW-5d; Wed, 29 Apr 2020 20:17:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id x18so4129030wrq.2;
 Wed, 29 Apr 2020 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oSdaUU1sAQef6HcUSlubHrtLR7VgXha8CU0+FaZLEz4=;
 b=SaXueIiNlafjvD/L5DRZ40ZBfjU7ncCWTZkp82EZdq2RqTSNwG7DO4yhKv9xT0JM4P
 gsZrGU0i07myKAk+AnJNw0gTgKFRU99AnstjmFZPK7epxkXLSbeBwU8eNYsodEhe7sYI
 DvL3E/tVrmqM+ydY/VIa8nLA9TCpTk+VLj5Vd5CTg8Ml7z2gpXzoa/mE9+wH04jZy9mi
 fI7IAbV2ZiNa+vGGrFLoiS+026khr3JVcyb1ifh8K15U/gwTshSrxUfZE6qeIxwrB4jk
 Jm1/QcuefdJJHVNY3g0t/kP2bpaA0Gglpc+O6bShUOa/wcEMEL5eRj4ZmAC6YENCNxXT
 BxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oSdaUU1sAQef6HcUSlubHrtLR7VgXha8CU0+FaZLEz4=;
 b=X0NDFG0r8yCc6Pu1xL5TwIwe+rZROYNDY+m9SLMepr77nLqOrQbobaOfMro1H/Xjt3
 9pWz5HA+R16Y8GgXrCAeCIMY5f85AMcXC2b+L+U2ESh6J26dPhr8jA3ZtqYcmY+53+A8
 R2FRJdc7xTqpzEyWMi27lLCsNYonmorO60GnteF4EJgEBsZD28xRhpqr7ApEim/kV5j7
 gf8XIf291bHEul/YXxjYrH3u/eTgcaduFw5Xzu1vMZH0wzb8SRzOcAoXG1UDuuFfiRGd
 +dr6GEgerMkRV1gOHA2AnpF1MmgEEawyS4N10VKvFENpbmcUvQE96oFTzTOQrFoJ+FSo
 ST+A==
X-Gm-Message-State: AGi0PuZjoXvNPG8IGIYPpSvpEtg4AR6UN6ESrxi6JibhFUuNxQ+NUv3O
 sdYU68kORMurrLuo1256GN8=
X-Google-Smtp-Source: APiQypJ5wuI3iaT4ZvqzR/XFA5k+Bl12wp/s80x5ZiluHZdu39PD2o3yNiGqS7Qh2P4c8ATUDZp5Ag==
X-Received: by 2002:adf:fe44:: with SMTP id m4mr43579071wrs.188.1588191432566; 
 Wed, 29 Apr 2020 13:17:12 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC v2 01/11] dt-bindings: net: meson-dwmac: Add the amlogic,
 rx-delay-ns property
Date: Wed, 29 Apr 2020 22:16:34 +0200
Message-Id: <20200429201644.1144546-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131714_206266_63D7198F 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PRG_ETHERNET registers on Meson8b and newer SoCs can add an RX
delay. Add a property with the known supported values so it can be
configured according to the board layout.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index ae91aa9d8616..8d851f59d9f2 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -67,6 +67,19 @@ allOf:
             PHY and MAC are adding a delay).
             Any configuration is ignored when the phy-mode is set to "rmii".
 
+        amlogic,rx-delay-ns:
+          $ref: /schemas/types.yaml#definitions/uint32
+          enum:
+            - 0
+            - 2
+          description:
+            The internal RGMII RX clock delay (provided by this IP block) in
+            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
+            should be explicitly configured. When not configured a fallback of
+            0ns is used. When the phy-mode is set to either "rgmii-id" or
+            "rgmii-rxid" the RX clock delay is already provided by the PHY.
+            Any configuration is ignored when the phy-mode is set to "rmii".
+
 properties:
   compatible:
     additionalItems: true
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

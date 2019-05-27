Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D79AC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 14:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327FF205ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 14:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K9x7XkaP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yCtt0wGZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 327FF205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrIBKnMkaiZN9yV+OKqGt+yDaErdKo7SjPISwz+QNqo=; b=K9x7XkaPLhG67R
	zGF+WekQNW2FcnBipY0TPOFUnB7oE+eYlTjHS40eM32qKSbgD/b/6bN/l3t+4sfEA4h4EJ8Ot9FdS
	sDo+Q0J6wJSaGvh2ZmOREibSS6+C+8uvnT6+ThtTnb9Zln77MeCHme6aWgnM+FJvBWt71uii4ynX7
	z22whQljVvpuW2Bi6XXR4gZUICBrseJAigpTqjQgSfLajPx8XUNFNRDuazbnx3O5chdXs1cqkAIRX
	bBMH/AAlltJFCzSs8TyyhHLiuZjdU+/TDGuuS5t1EPTIArt7h1ebmr0+cAd08PpK0PnimfELjgy2Q
	jtOzpsTLKXYHwp4jnNAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVGD0-0000cc-NO; Mon, 27 May 2019 14:02:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVGCc-00009G-3o
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 14:02:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id i3so16267937wml.4
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rO31uLodqtR0UANwODTPyvdISTtsAPEuGeRxrgglRH8=;
 b=yCtt0wGZdVi1k/2V5asoBDK6Yzs1fm4vO9CA5a2/sfxJNiiymxdYyE3uFDC0zkOrvc
 ydMz9pzk79I3IOes2wxEYa0BstMJIdAcguZkAvWLbXN+t6KXYyksuB0xoFjtVYNQrFxv
 EIPmB9PCO8wEv8tY8xwd4BzgFPk+bGfOwemmo9jjbZWv/KqNNcG3Eix6CMQUXeOyU1YY
 hE5nsT4FVw9deb/lH7/WicXP+XVxnE2fdytGMhoynk5+b9qVPtwI5hJznaof1GEs4hYN
 UBkTW59bZNupnMzY6HWq7KSAXsQNYZukZrvDDPcX9UQXpNx54Ms/BJjK7kxGd45W+rrL
 zlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rO31uLodqtR0UANwODTPyvdISTtsAPEuGeRxrgglRH8=;
 b=R8t869ApRerhDHMsx4xVQuYUemzhbIxYiKLaH5Et+CIfKprTyK3uCFkxBPMll2PO3V
 IvEVe8YxIqJWllwDO4EtOn6bcYHataQjtyHx7JIINjw5z6+FuBHVaKO5cIwlL6UNkRyD
 Ah4XRF5PTMA3qqh49Xhh7ovPLSGg3M+ysdNJNh6vlyT81gvCLvwhUakczEQbLnC1GGH/
 B1ZZ0z7UA4S/fnG28hnIZaghwYvr/j1Bhpe+XtrsIRhPK2z/YmFu2ZtiyXqK8HSiA/sb
 k3naCpIxM3wT8Z/7iHBr8tbg9Inq4Rx+YVeYjzXnmXuKZBpge/kNgboLO0Z25cZ24O2h
 yIWw==
X-Gm-Message-State: APjAAAUKjhkxEFHqivK25/IhWFypvZz0LJ04ep0IBVdgP74D9ZL5d2CB
 xwpWM4xn/oIQy8WBMKAU+CIPnQ==
X-Google-Smtp-Source: APXvYqz6fMBKbektBh6mgh4wb189td6wyNv3zG8A3t1I2yYon0EbBaq+sRg2X7rkbiVCNCbhyZzQig==
X-Received: by 2002:a1c:1b4a:: with SMTP id b71mr10259602wmb.177.1558965732652; 
 Mon, 27 May 2019 07:02:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s17sm8231628wmj.15.2019.05.27.07.02.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 07:02:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: arm: amlogic: add Odroid-N2 binding
Date: Mon, 27 May 2019 16:02:05 +0200
Message-Id: <20190527140206.30392-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527140206.30392-1-narmstrong@baylibre.com>
References: <20190527140206.30392-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_070214_171005_F82D2D3A 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
from HardKernel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 28115dd49f96..f75df4471c0a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -139,6 +139,8 @@ properties:
 
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
+          - enum:
+              - hardkernel,odroid-n2
           - const: amlogic,g12b
 
 ...
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

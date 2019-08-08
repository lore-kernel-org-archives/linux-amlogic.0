Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28036C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 11:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE4C62171F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 11:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VufSQoRQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p9L7TRcu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE4C62171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYgNylZDTcyShG+SiLu9nqPJpFpqmW6js6afKnFy2hI=; b=VufSQoRQTBag1t
	KaCERUDFHB34URX9cL113dfg1GbSlTeIQo8ZQLAHPa1B2Sml/YcfbIsaIeBmQ/utHCJHnPEBskNci
	c8p7DSz6YyzdtCTk/0LQVyRKQQ48F1kKZMWFccNH1n2Fao2xluksLdzpMA6R9i8N6jOGu1bzSQj7m
	gJgHiUuKISQMlaJzEX4pMznt6HHgZsyjoCIrC7X0c3KaTApQjzim1Z0pC0r+QW9Hhe1Egrspi5UkQ
	2IugchSigbSJIKWusSH/Y8JzU5FZuqdFuzM45NrO4nr5798gW1x1fySNal3BPfNh//r2aTyiesFN1
	MnW+0r+H6PWSqWCkkZDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvgnd-000260-2y; Thu, 08 Aug 2019 11:41:41 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvgn4-0001bc-7C
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 11:41:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id s15so2084062wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 04:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FvEHw13SSjNx0rO+Eb5GpaVPObzVB7Z/B/DYj0wmNjo=;
 b=p9L7TRcusWrL03ffcFUatHnu7a3wC88l/KhBLtA+5SK9PFmIMqlVSYH30UPzwIb8OO
 AA1Lnk1arUdN+6hDPDkXQFBLiDuOKO3qx7BQJNrxakZnrnwZdGgJl/fchkidNPmnoadz
 Co6BvOtphLt0hmzPBssqtTHX6KLQR3A4XbkT7liTQUasJpNlM49mPSwB9RKGYpLwEI7B
 HjFxhgKPGz2gi1GR+ReHnuQ78D/NCeeiPEeG6JHa2PosCVkmUiU6oF1SGjrWdFGITNOU
 08aVw/N2Ivy201GalDcBQ94wweclM56AfVzFh+hqTLHTxDjXkNBOvTbkra2hUVgzy/zX
 FqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FvEHw13SSjNx0rO+Eb5GpaVPObzVB7Z/B/DYj0wmNjo=;
 b=iW50I5WJbfSIeG/NeYs6vp6C2YyWNJKsK/HYz1dXKEBZo5KrZ7+07BIf+AzFYGMmuv
 fdhodr6DC4lqt+D7v4xx3MZygxUl7JSjIbPCr5akbHD26yUxRXRzjLJdb0pYcpy/XCe3
 e2d6il0LjwjRnU6yjAjcooRCs4E+zOiZHvYh+hMsCED/IXXgXE9cH7AHQCnoSPQS0xbx
 bUjfQDdbXh4dWcKSwO/1BMQc652SLgQ80ekRafz56FI/jlLhRluuxyrsVyvuXnIifW0s
 p5ySrFTwM4eIp855tmSX65YLaG0ciKWxhiYUn66ETBQ4LHBp4C+kH09+X21LliudUhLg
 DJUg==
X-Gm-Message-State: APjAAAWL/iYxzaf0E4PWvaFqarsPFIhHZ7el8FmHb1U6ze243RZIO3N+
 ZU9/bt2/bX+cUt5dK38W97J8pQ==
X-Google-Smtp-Source: APXvYqwwQF4nEozwvl1ltX1EUHmBeoypnEtCvb7R92cEQ+NaOXqnoC9eAitquC1kL/PNebqoN8UHpQ==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr3995039wms.8.1565264464549;
 Thu, 08 Aug 2019 04:41:04 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f12sm104555882wrg.5.2019.08.08.04.41.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 04:41:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: net: snps,
 dwmac: update reg minItems maxItems
Date: Thu,  8 Aug 2019 13:41:00 +0200
Message-Id: <20190808114101.29982-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808114101.29982-1-narmstrong@baylibre.com>
References: <20190808114101.29982-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_044106_258507_2A203780 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic Meson DWMAC glue bindings needs a second reg cells for the
glue registers, thus update the reg minItems/maxItems to allow more
than a single reg cell.

Also update the allwinner,sun7i-a20-gmac.yaml derivative schema to specify
maxItems to 1.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml      | 3 +++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml          | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index 06b1cc8bea14..ef446ae166f3 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     const: allwinner,sun7i-a20-gmac
 
+  reg:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 76fea2be66ac..4377f511a51d 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -61,7 +61,8 @@ properties:
         - snps,dwxgmac-2.10
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     minItems: 1
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

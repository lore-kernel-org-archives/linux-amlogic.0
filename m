Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A117C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 07:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 043BF238D1
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 07:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jIwzSJXd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FydfL8pH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 043BF238D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYgNylZDTcyShG+SiLu9nqPJpFpqmW6js6afKnFy2hI=; b=jIwzSJXdvXYn1N
	/zYawwPIW2Mww61LwJKTGRe1qR4ZYdYs89yu0mVuq9ktVW5BtTF9POGwKcIkcujjimTfbc4LCu/nz
	x2mBASnTUshke5tOIu8W8uqTNfqIiVapfiuot9Y4ZQRHncTRMPDS35duXApZZRnbY3mo8dzBXDtsX
	6aDpSOtWsh3oE8gRBpQuGND/fyUrY/EpMplCKchnDjXrsXIch9Hm7/fWzZQgEoB6DrCD6HtJayUbQ
	kYtsrmrMGngrBaMsxJp5B22Sm5eWKLH6ffbZovp6HhakJgpMecgvB/vJSOs3zO7AvHhXMa7Fl8HZx
	zsfq1kNwDfwakROUGEtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzz2B-0000le-Sy; Tue, 20 Aug 2019 07:58:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzz1c-0000HD-9m
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 07:57:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id m125so1739044wmm.3
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FvEHw13SSjNx0rO+Eb5GpaVPObzVB7Z/B/DYj0wmNjo=;
 b=FydfL8pH1IFg/KxMUBQwORlq9rRP+hJPHFX2ukRJ1GxBI/LZs8N6sx0MxvQi+Jllzl
 8VcOcIILZBwRg7Xub/GuO7FtE4N8AJoYYLQq41KLjkRzEHgVGHcRm9lz/9c8bXirkrdv
 hntEeiFjObQNEwJMYdUPq48RvrsXYSyy8N1FOtow+IqnqQjisiDyYhKlg5Xw9xfkbPhE
 566AZYy78ldJlFzn4ajapmh2BBq5sKT9tTDPSOQXEmebTyOb0GEA4UmpGy6JWMCj9lgx
 9c5NZ2BPO73PfNBWiSFk38q6k21OaGegzkaLvotAxI0Lmh2ewwLLMuej9lgDjIsZhy3m
 A2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FvEHw13SSjNx0rO+Eb5GpaVPObzVB7Z/B/DYj0wmNjo=;
 b=KNUJFYebI76NrUpckB/5y8kGQEJNSMyWKihHom4flmFYNcnXROjxHMiLdjeTODfBLc
 UxVGNzg7G6uyarXbIq5KHaG7+TtkGOQPlkqJWUZMAyd1zOqR8TVasiYvFkYSh46NEEB2
 ZuoKyxMcOqmLgGXAZ5blkJnSY/np7PlS6+h2NBulHJnmUcfKtovr8KHym1jgyJ6SFaSw
 ArJEO/dqLzmB4LCEpXxAdPb3XsCWalax1p1HIFStJ9PxEFqlc5pXdpHcjnjNXX71ze8n
 IwIIc2hURZthi3AjQjM4YO/8T1Z1xQvxvzK2X9UwDxowbn+9ZGv9e6hiYTKHHiQ18xvy
 b3wg==
X-Gm-Message-State: APjAAAU38qYO0bJB6qEmpkyDE6gZipxOyLutPe0ET87Hw7lP+jV3aHkK
 rjaP1suw9hjGqjAFMcsvMFBQTg==
X-Google-Smtp-Source: APXvYqxZ4XMFt3LxDKlYE+RW1ckDW1+fl4lBDePImr6M/WUYqMF4wT+8AJVCrU2RxsTTpEw51tO1Nw==
X-Received: by 2002:a1c:18a:: with SMTP id 132mr24806881wmb.15.1566287870642; 
 Tue, 20 Aug 2019 00:57:50 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q24sm1506467wmc.3.2019.08.20.00.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 00:57:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: davem@davemloft.net,
	robh+dt@kernel.org
Subject: [PATCH net-next v4 1/2] dt-bindings: net: snps,
 dwmac: update reg minItems maxItems
Date: Tue, 20 Aug 2019 09:57:41 +0200
Message-Id: <20190820075742.14857-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820075742.14857-1-narmstrong@baylibre.com>
References: <20190820075742.14857-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_005752_343108_9BCBD98F 
X-CRM114-Status: UNSURE (   9.69  )
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

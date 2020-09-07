Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6268BC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:34:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA0B207C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDrrAx0R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yFUZp/06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA0B207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wleLM30S1DqnzAXOf82yN9GLWVvUddXwUJgaPsPaz4I=; b=vDrrAx0RBkZZeJywKeeiMTW/0
	p6RnXQkmZs1+nDTNLajjMVfui1/fJyw7NQbduUW8dwBxgqOR/txHS+X1iBocu+IpDnMGRA15TF2i4
	gzNuBZiEctbnWQydhXsTPmaHcm4cfVZ1EUHE/LJMmJEQmWCFh2pG8Ku6uAxoTm1KVbqh+nIcm9yb0
	7zOVARCnwqiwcPboJ45oT5SB56RWJH4bYq9w3wbH90fOrXNoU6hocPLTh2P1Jsd7BwZ+gD/Lx8jAV
	GHFGTDO7vskXPGJfTBv4Y/8TGFvE3yNTrB90iZaO5L8Nna18FYCxhHuofdJlqOC4k+gSpMjciI9nO
	yiDl2BJ0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBfm-0001Ff-MT; Mon, 07 Sep 2020 07:34:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfG-0000yQ-LK
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 07:34:14 +0000
Received: by mail-wm1-x341.google.com with SMTP id a9so13170509wmm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnyQ6M7lKnSyvb2WTqWDs4juP1iSvzr23umTcdcFBl4=;
 b=yFUZp/06NfwHE/K2aBTW0DdB2itxHC+OR2dfwK7I+7POKFdsnbScCsblQY9LA9yS7r
 ETrI8vkClVOCkFGLgkgUweusW8/j/aLvr2jMNpgIou0UUH4xTXAtcH79On//zAX3W09g
 jLeGoZaL2a8js7u+jEtOX3092kR2mF05Glo/hErZ7UPTAqq8YjuLVB6yi/dKunrbZ2v2
 EGoQnyGgQwDQLRa2KQKiq2Ce+mjEYeifnkQ/cYGF2pcsmGF1+O16OFvnWa5vwuGZ8zFq
 4aiDnchNriBgwQPbtmI1il+gRRnx0TYGK8kQXUiHLyUjCRTIvfFhfGMXhs9OxW2qtKV6
 sYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnyQ6M7lKnSyvb2WTqWDs4juP1iSvzr23umTcdcFBl4=;
 b=pCEoTo94SXOJp/VWhigaENf3fGkukLvUFvxweLDDaNTM7hAJyXB4ghe/2ARrAuSBNg
 QA8cSiU1U5NNoX6AEF+vbdozyETEPP4pMyfScyXrAa0DmEuFnXJd1GpSALXYTTjLl0Va
 FDdHrmJ73sALOebO7iJpDTQqIP5LMIOTjLYWd3guwoNYLUTpg1GtwrOPJ5CLIqWTU0OS
 fhzEAyndxYiPetSLlYMCeheFMpoLZwpQ4JUuPtqH2Uv95pu1lSwE2KScLrK+sRaMs3+9
 j2IILjguCR8gjUSmKb8I6u/+6lyZNY1bipKxLl7ghnu/V9rCEXoO8EF7cMA3KA8iBWm5
 orGA==
X-Gm-Message-State: AOAM532uf2MFxmEwC2pG54X9m+tSWT6dGwKxGwzPxHV/7E3acnJk6igA
 uE5SUt8F08ofEhl3DWw3QpY1lQ==
X-Google-Smtp-Source: ABdhPJxkU//D39wU0M3fJ1RRtwypstB8RNHkXuu98ipJC3IiN1dKlgAJT4r/cOmwRdGakdSEQYMQSA==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr19927754wmj.80.1599464049140; 
 Mon, 07 Sep 2020 00:34:09 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u66sm527689wme.1.2020.09.07.00.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:34:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove reg attribute
Date: Mon,  7 Sep 2020 09:34:00 +0200
Message-Id: <20200907073402.26674-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907073402.26674-1-narmstrong@baylibre.com>
References: <20200907073402.26674-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033411_032450_9DA9E1A2 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG MIPI + PCIe Analog PHY should be a subnode of the hhi mfd
node like the axg-clkc node.

Thus the reg attribute is not needed.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 18c1ec5e19ad..a9040aa387cf 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -13,15 +13,11 @@ properties:
   compatible:
     const: amlogic,axg-mipi-pcie-analog-phy
 
-  reg:
-    maxItems: 1
-
   "#phy-cells":
     const: 1
 
 required:
   - compatible
-  - reg
   - "#phy-cells"
 
 additionalProperties: false
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

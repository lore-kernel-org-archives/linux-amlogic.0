Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59BEC5519F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5768020B80
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PCC1Ey1l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UjfmdbEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5768020B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZmH7LDclBAFsKcIYTCqntaeB8l/ydXPG0roI29FVio=; b=PCC1Ey1ldC2/NuoqyYOkhFDXT
	Xuz8Jt2lDNqOXngv0Rhppsh9nh/jXJHpndJDQHxvGbdA2AEdE7XgsMRz23k51IV9SApvBLJLP/TWQ
	DMntHPZ3yiiZz5a0u2jg5o8XQsGGhgOPuDKXgmUlfKkgnYRAHsnZvr0inoIgvHjNrhV0fehLDRpeB
	GGTF2RwTYhTeYGn5D+Z/nt7TZw3WUthsKBltKvwN1HT1J4ibCEpx9YT0BD9midgexXZVAspGJ3cNN
	N25fdrkC4yKsyHNrjjonJs6zEiJ4YYuSz4MtEHCI2EA6O7KEYTnNz2gqWjRvb91A1wQcUpNWkrsKf
	MHsZqXNoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebZH-0000iw-Nu; Mon, 16 Nov 2020 10:17:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebZ8-0000fD-Du
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:16:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id m6so867104wrg.7
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dYJtPTYT6zqSviFEoyuJVLQepwx0AVqn3LnihaWjaQ=;
 b=UjfmdbEmpKOGnekOBK+J4IyAP5SU0GKIh56iaq5I7d8+xqH8/n/xdP2pWWQctUzZAv
 KqSFRsa7izEvgDeYvHyUZKPmGVRvSGVMiBKkJvFtudnKQA9T2W45KyCEgSW6OsDtjQ/6
 RP9/Vc+ddEetdn6LT0JpdG6xzlcSdY3P6mzIXTQAEiklRRDK/BEeazudt016zL7F9Wpm
 bVCaA80+/VVP5CA9Y6h33zoIpDWNwyXu8fMw/eTrzKFilFTwyIibmLk/zrAKip3fXAm0
 QqmuF61H0jRFF14ALdsb2wOjjsgOYzhMLNBbhWEVWc5GemC61ioM3dDWi6TZkoer8l0J
 ZTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dYJtPTYT6zqSviFEoyuJVLQepwx0AVqn3LnihaWjaQ=;
 b=BvMgOa5Fn4MrTM713MIZyLY9a8+obf9xGJH9p3TawVBrHOZOjsbr/jEQXwh8FCcpJh
 bhWFAtoaqvaSQ4d7sWwU0xSAm1JL5YQpLLRRS0LREDqERJKvoKY6crsgSrz0ehyWhvTH
 XLmmjQxBod6H4b1PmxROJ8utqwMiGO22x5Rpy8iIGFAYVkj9yMRHn20PSgcsp/hS43Rl
 bM+1A/O9W1zltIgniS0KwRytcPp5EqJreOCH83Co33nFWokiC9jyjvyzzuP4TFxkKGpT
 3BizSyYzysWpLNYgXIbCMmQ1F7Ni6RRbC9ZWNswxRUuOMbjXcLOJCtEykuTo38tnKFXf
 88dQ==
X-Gm-Message-State: AOAM5316AASSqri5+IaV14IbMglnVAzybcYSHOy8TuVNkSchhwLELxip
 BEMpenZPnPKpDCoKjIyl45ULKg==
X-Google-Smtp-Source: ABdhPJyYONDEDIrJ1XvKWq53W8urXPyOX6Uj6h4HdNDHCqAdP91wFip1sBUTAHngykTJps8pKNkNmQ==
X-Received: by 2002:a05:6000:10c9:: with SMTP id
 b9mr19540242wrx.251.1605521813480; 
 Mon, 16 Nov 2020 02:16:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id
 c17sm22265131wro.19.2020.11.16.02.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:16:52 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, repk@triplefau.lt, devicetree@vger.kernel.org,
 vkoul@kernel.org
Subject: [RESEND PATCH v3 2/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove phy cell parameter
Date: Mon, 16 Nov 2020 11:16:46 +0100
Message-Id: <20201116101647.73448-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116101647.73448-1-narmstrong@baylibre.com>
References: <20201116101647.73448-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_051654_508588_12812EF0 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG MIPI + PCIe Analog PHY provides function for both PCIe and
MIPI DSI at the same time, and is not exclusive.

Thus remove the invalid phy cell parameter.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 702763a84dac..4d01f3124e1c 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -24,7 +24,7 @@ properties:
     const: amlogic,axg-mipi-pcie-analog-phy
 
   "#phy-cells":
-    const: 1
+    const: 0
 
 required:
   - compatible
@@ -36,5 +36,5 @@ examples:
   - |
     mpphy: phy {
           compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          #phy-cells = <1>;
+          #phy-cells = <0>;
     };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

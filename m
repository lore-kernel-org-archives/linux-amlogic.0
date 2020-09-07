Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BDBC2BB84
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C034207C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c1JsBm1t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eNNLkPaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C034207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WsOG7us/xbIQKtpewKgvd+7/YfhbPLxWsJFzm9fmARk=; b=c1JsBm1ttgZVPrlNy7lNY9Ydp
	mwRG7hcLUeF6iEloUWc2FuQ/l76DsLqb/R/vOu4JAMLPJ67LyAGKDj+U9f2fM/xdE+RvYJZNrHRnV
	fbTCB5RyVgkf2egSeVP4YL48L+0A/VzZOMD1mi6lBdHFQwJ+pBU+TJ0WgiQpkZUIDjHFOujNNggtz
	8sXyVda6GF7cWzky6ZM3QDxvcKViPqQmFyuYuhkcJlaOsPWrDG5tvtr8QYbhdT1/6nniXbJN1KUhy
	SKJdnXL22m7vTR9h9WDZxXSdVBdLe6WQHKjgTELfuTzWvv+FCNDvlJmvamnW2sw3K7OinM3aoPZ55
	YmmsA6ctw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBg9-0001SX-Q4; Mon, 07 Sep 2020 07:35:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfI-0000zC-31
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 07:34:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id e11so11723649wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HebYhZE7sImd2rEoHNhbJh9aZeuCFQtemX8HZ/zA81Y=;
 b=eNNLkPaz04iEEVXIha8aR4r7KXTo5570l9scgu2U/HeVeZWn3DYtBiCW5/oHoRaBF3
 NXSsGrqG6RRJ/HIU0sPW5RlRgzGDFJhEOY0DuRWbmsHY/3315xp3Lj1aQkCRb5/fOMdO
 a0uF2xzQRjzuvmjggxGLK9HJm6kdRsXsKSgWOqyn0K7+GfgHYqZlZF8/sw88OOoxbn43
 rhnE/hB0eEJXWJbGsGcMya2PqTJst3NTiqBoPzuTTo3ZwR2sb6R5cLzGKh+KfOQb7jzR
 Td2/BmfJWUOe7zn6njN1hK8rwWmG1bLdOAxoYszVLuL2jFWZ9JXrwEfZh1VeiNg/Tlu7
 kIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HebYhZE7sImd2rEoHNhbJh9aZeuCFQtemX8HZ/zA81Y=;
 b=TjvDeQ6MJROM9h/aj+m6ENiHqLsgJk/ScU2L9/m5u0Hf1NJoQ98TGQg8y/BRuNMuwu
 Pe/0xqsgPuAmSMM9XRBLniMj7lDWFozkRorvQ1n9vmbi+0UHyDw3FOlShaXvRt+GR/qr
 GTAR+zB/Xb4XL6f+AtT7avfXnOeKYxdklwmLEe6A/lEVCt5pap0Cn6UO7qA44w6+yQzV
 Akns1stAZjMKoIisGXpNymh7BqVXzLqpMtXBR/XhGuiRkXhYGPWF/3nl2iHrjbcql67Q
 xRagif3o8GVLR4s7wG6EJX7TPhRzDtlZkjKmHJM5j0OjYNK5cXSNzvrT0AkQkSCzZNsx
 DZIQ==
X-Gm-Message-State: AOAM533SpQODutDEyvjjR/SvNmC8aAUwLZMo5IGcXDnLrlc0m4Z8b9AU
 kRCWVt98Qqwg3C3Ll8cmgVjo3sPf8JQWRj7u
X-Google-Smtp-Source: ABdhPJxqUj+4v76RgQgGGFariH4vNyP1mLeIzZDzjKKY2kW9cctnMkgJkxXUDCK/v3rtzQpGZpqI0A==
X-Received: by 2002:a1c:7f8b:: with SMTP id
 a133mr20660312wmd.155.1599464050504; 
 Mon, 07 Sep 2020 00:34:10 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u66sm527689wme.1.2020.09.07.00.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:34:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove phy cell parameter
Date: Mon,  7 Sep 2020 09:34:01 +0200
Message-Id: <20200907073402.26674-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907073402.26674-1-narmstrong@baylibre.com>
References: <20200907073402.26674-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033412_339102_DA1E7E68 
X-CRM114-Status: GOOD (  12.89  )
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

The Amlogic AXG MIPI + PCIe Analog PHY provides function for both PCIe and
MIPI DSI at the same time, and is not exclusive.

Thus remove the invalid phy cell parameter.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index a9040aa387cf..148618b51b24 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -14,7 +14,7 @@ properties:
     const: amlogic,axg-mipi-pcie-analog-phy
 
   "#phy-cells":
-    const: 1
+    const: 0
 
 required:
   - compatible
@@ -27,5 +27,5 @@ examples:
     mpphy: phy@0 {
           compatible = "amlogic,axg-mipi-pcie-analog-phy";
           reg = <0x0 0xc>;
-          #phy-cells = <1>;
+          #phy-cells = <0>;
     };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

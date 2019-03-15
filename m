Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0F1C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070E5218AC
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FKApUNKI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SfKmsVVC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070E5218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZY9J8cQ+mgpi54HsWRVMYt2+wKxZnLWBoycuLBeTouQ=; b=FKApUNKIyOURmb
	1jHAZg1rSXXZTMvMMiPrzpckVFBL0hex/dHmcOdYq8XzWSomP2aUCAV2b961y08wcgYga2aDlX8pv
	oXDDvlOyuiQm3Y1e+EoSAb8ht/FKhE/TnPLOGdosJgu0fUolbD753+U6b3Qv9gxezHLObotU6oyz1
	C9Zs74+j7YSa5Nqsb26C0MOFg4tMWDhktq2ilfT5EllbieS1SPPOyloaib/cYKiR6AwpdWM46ppSt
	u7jUyXCh2dQ0W09OKJhjjuG2rZsa6rKsFI78hdyV/PSJRZJhkzopMZdSfY77A9n8Qsvx7HkFdlWGK
	Us5+8Z/+yWIGFKWNAiSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4nKt-0007Wg-NB; Fri, 15 Mar 2019 13:57:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4nKX-0006rK-VK
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:57:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id n19so6614725wmi.1
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZcsemXvfglAUC0jGESedl+RTzmszV5G64pnxTWiH4g=;
 b=SfKmsVVC+drcRsqXUXJ6gvPIfn1f0k9kq04SPXA216aWmztGBUrCjafC40QyYDQpNb
 a26++I1pS+z5aAE6dkcL9WhceFW6xEYvu5w7Wl8KbhOIqGo5K0q9eKFgm6yzWK/uKqxD
 4P5LjRKEEBbIWhBcqdnSxsvbnJQy2ANUpDbNNBez6K5LvN/8fMMTXcKn1ojzGQpWmN3W
 mGW5eF0CPP9U+/wOYjSOd2We8PtL6tEk3QJIpLsHvh5RLfEeSdm4qCENFrynm41sK8tJ
 ze/NUB1P5/y8vZbcacgq0Scwb9XxpUw1yVZaYzEm0wqZ00DOfjZJOibVEnrGuXL5ViX7
 /Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZcsemXvfglAUC0jGESedl+RTzmszV5G64pnxTWiH4g=;
 b=hl+EiqsMwu7MkTJsSBvvULS2ZnXN7TN2sLmII/WrLHjInE3qw2NnM+SwNq4F+wcw/I
 UzALOBj1A2fMVCKfE8skWtyGXnR7yi5gHjmnnNDezx82EwQeoxPYk++rR4sESGZVu8ja
 Gs6jqXGifbswDNtU2JTJC/D3aIezzeIKJqTR0HTlGp7IXFQlKbViqRHCCX5tm8HlGk+F
 btl4UqD3R81XkJTF+YicCA7Zw4zUQuyGz6qRdpCT3MlvxKOOnaPTcWC0yjlDORibDey5
 Q8NaXQSJldOF97StuWVuVq8lV0TcL8iyYpSg9O3bARP0hFe29GqYO/LOVIhpxIOT49tq
 m8HA==
X-Gm-Message-State: APjAAAXqAltucjmSIyuKNI9eTop9vvN3y4aKE7sHaNA8H1cynL3SoR5j
 AGJxEZPXLyvBTyxBiS9KEgLcuw==
X-Google-Smtp-Source: APXvYqzLHSWXamSAChoX0YiQ6Kh+aI9iXLHASSTbYijTh2oD7ThGAS7omC/Urgn2DNOCC/Wkh3cGWA==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr2232123wmg.80.1552658220083;
 Fri, 15 Mar 2019 06:57:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a14sm2131900wrx.96.2019.03.15.06.56.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 15 Mar 2019 06:56:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org,
	khilman@baylibre.com,
	icenowy@aosc.io
Subject: [PATCH v2 1/2] dt-bindings: gpu: mali-midgard: Add resets property
Date: Fri, 15 Mar 2019 14:56:54 +0100
Message-Id: <20190315135655.28359-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190315135655.28359-1-narmstrong@baylibre.com>
References: <20190315135655.28359-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_065702_004508_557340CF 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic ARM Mali Midgard requires reset controls to power on and
software reset the GPU, adds these as optional in the bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 18a2cde2e5f3..1b1a74129141 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -37,6 +37,20 @@ Optional properties:
 - operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
   for details.
 
+- resets : Phandle of the GPU reset line.
+
+Vendor-specific bindings
+------------------------
+
+The Mali GPU is integrated very differently from one SoC to
+another. In order to accomodate those differences, you have the option
+to specify one more vendor-specific compatible, among:
+
+- "amlogic,meson-gxm-mali"
+  Required properties:
+  - resets : Should contain phandles of :
+    + GPU reset line
+    + GPU APB glue reset line
 
 Example for a Mali-T760:
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

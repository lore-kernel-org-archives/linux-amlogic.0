Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F73C10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC132183E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HyFOgg4V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RHaboNDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC132183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+pU5B9f+aub2IB78vyE5cr9AgecNZ2WgSWXU4df7juY=; b=HyFOgg4VdlmkgaguD002bygM2d
	npbKJHu0LiaRkGiciWcKlfoTcUYUXfA715sxTgXlhN31VfNUYM7aEPQmbALELxbA2+RJZs16tdEdR
	4jYJBBVo5XbZ/2eD95J3gD8YyQ2QcvmQqtdfMzniRR1Fud/htheXYiOKG/cwICmWI4FYD+lZXvtGp
	CObejsYnD2t8gGzw6v+d41uo1v1JnH/688CgPzqFL0cGJTkCRXEAGWsr4oDgPulFjvW8dbavKXAgA
	1vv0hsns8maEZpVAPWCjIg+Zy3NXNbRqMmNdlTAZtRLaKXVjc8W7QskctcT1UxGXOi/mESXdIG9Ee
	wwu4WHFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6SX-0004SN-SV; Thu, 18 Apr 2019 12:48:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6ST-0004Mb-S2
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:48:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id r4so2812882wrq.8
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=itnTRs6GOUwiIdL7618b+jq8vSXb3yV3ONsvpSK/Nck=;
 b=RHaboNDQe5rgnbI1bLOCIU8QzZaMwlk2Q+ynWQDeFz+/osgn+tjSfKin3JoYu6L45A
 avbUVpFISIMI9Kk3VcUsdQgw5EhKsg2VAW7Up4H0T/thdSrEEvV9MnObQLc5/8VH6K42
 1B8aQiv5GP21a++WEqGYFFAWgi194CXjROJVmi1P5lnoj8FW1yQ8M+XtxfhYLZbQ4LPT
 Zgo/t+QkkpJTHhECE+rwMrVNX4XRpODdnbUPbtK/sUFXBFXK7JGY5WOVOrXwmLXDtYMF
 Hab/DAL0qNO66wux0g/sUCsF0J5Dh6fe68k8JqzIfW+iQziqcczV6uYRtnx9p53Z4A1d
 f8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=itnTRs6GOUwiIdL7618b+jq8vSXb3yV3ONsvpSK/Nck=;
 b=MJZUe9MmW46IwVgiilAq3LI+XYh67YkuYJToAKGGUszqp6Q8iMEHCbScsoUKDgJkdc
 oibEXjn3w6HYaYoVonUg3MOTmAvCHsS2GrOOGweBUBglj2KC5EUrE9tyk6eCRWc6/YLa
 qzFdDrpUWr7YGuS4OhxpUsQtF+tfWwoP1HdXVjE60+NAQYsxD1Fmu/xwE9X2LPsWzy2u
 eu9//E9UjtZOhgSqLqJk47dItcgt3oBga6YlKOYTFsbu50RS1GzHbwbDjS1J2K4B8lAY
 T5yrgKrHSSjxfARCJRPonhdnyhoaMA1ITpcLSkghwcAeH67q68k4G4MtHhOtevQ04TNX
 MkkQ==
X-Gm-Message-State: APjAAAXt0bfRHjBttYBtLvr2gpeM959qFUi64nSZ0xvfsaRDVuqe7SuO
 SQqhUvHs1dfHx+d5A1aRhPPagA==
X-Google-Smtp-Source: APXvYqwhXjUtW19hcTBd2hTAve3ZXHULXF4D+I/d70Fpfm6nwEj0wAJLBmIIx6XjI9aQx6CHZXEvWA==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr26490937wrs.250.1555591684505; 
 Thu, 18 Apr 2019 05:48:04 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q17sm1256823wrw.70.2019.04.18.05.48.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 05:48:03 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v2 3/4] dt-bindings: pinctrl: meson: Add drive-strength-uA
 property
Date: Thu, 18 Apr 2019 14:47:57 +0200
Message-Id: <20190418124758.24022-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418124758.24022-1-glaroque@baylibre.com>
References: <20190418124758.24022-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_054806_081455_CECECF54 
X-CRM114-Status: UNSURE (   8.31  )
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add optional drive-strength-uA property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..b3e4be696ddc 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength-uA: Drive strength for the specified pins in uA.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

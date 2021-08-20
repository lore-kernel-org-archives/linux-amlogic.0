Return-Path: <SRS0=Ufe6=NL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8352CC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Aug 2021 01:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245FC610F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Aug 2021 01:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 245FC610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PDfFlB14w3RjapTb7k2o22ppeNjCK8QXSabWW/SSO/4=; b=NnmlgFF5M8ntS6
	e9AW14LCx2WZGaJtLxNA49Rro13dRFt7H0zQdyMMhE4cGsfvquVN0sTgwZsSp2bhQVGv9I0aT65Lr
	CKqMJQpRkWPLRVwZstzsAvYvTIhff8eTNdhkf+dEbss5lAdJOR5oK5P2+3jkxH39yYLszPx4FN1Hz
	NnpxNima/4R4xTTLytFl+hCvuf1tsgbJokdtn3KpD1WoWCb9X8a/5Hm8eI0xK7W/QO5o7TnwX3f3C
	r6nIvt6s+S680mxnYXDIezhj5hCOgNJCQMDGJWb2GmQ1AtuFCEF6HDh2SYnxPOxj/7cvuTDzdJM0H
	+Vq3s3zCn8JZWKpkyx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGtJr-009qCY-DY; Fri, 20 Aug 2021 01:27:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGtJe-009qBe-0C; Fri, 20 Aug 2021 01:27:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso7978570wmg.4; 
 Thu, 19 Aug 2021 18:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3wG+ySzeEprV+yc+XWum1zV/cM3qSLdGZx6RBGuGrt0=;
 b=MC3iafjo+Dorj/liOIIpypUPSUXqDWuPtYKvRUvkTqfh2Gsn4aRlTg0YC39VONrvoj
 GjDIKZryQTITsJ3YUZFdJ0GVlAJWTEuzZZ3bVtZ0PLq8bEFIwv1aZdHEGzRXO7xM8yKd
 xhrwd+isreeVxgJRR8OaSRadR4oD9cJVCluZvSW7tbYKLRMULSq3LmxUCYGI+oEUZIo9
 BBqbdFF99eRBgG7y7vlTIwdIK11rbxDhRI/9dQ+IK19ZtQGo1dvivojZ6++yXljEFc2b
 V6ySFYdp03X4MVd+NGh5p2rBXx1rEteQuTzig5LpxHe3brW29c888MYr/cpuyf2OHMSi
 WbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3wG+ySzeEprV+yc+XWum1zV/cM3qSLdGZx6RBGuGrt0=;
 b=XhgFxvtKKZmFaNMdaFjowiog69V5OyeZvTx/Tqi9C+2Ul26ii9xg7cYzl9awdBuLx7
 2DJKsmQ3DxMDVOzafm9CsTlf2wxbcStWBRVadbo8XpMAob8BBFdw7/Ce3JYQR2NGXRDS
 pSUI5PBX/PoQoHsPhOq0rZgNdHVwNpNCrm4mqNmF5eQpFHDnQlgj2wYjCm6mIiyYwA50
 lw+GYp3PIV8ZG4F8xJYCZ5SOQI2GgR0dVvvF0tIomEoQBOzdBYZD67Z9Kv/HKDoHopKe
 97EFMRodjvn1Ch4fY90COdqez/DDGR1t74NJwCkYKlXbNNSBsFOZBQ+ijV4KP39nubcr
 1ezA==
X-Gm-Message-State: AOAM533FGtx/IAQIZKzRfx8lwp+5NvyqtqkpDYZgvfvf9+WGHnlmnIRx
 H+m1fDECDZr6VH68hs1MzIU=
X-Google-Smtp-Source: ABdhPJwocTP8uyu6GqN2EoUfhbMIpjrUuVQMr3ItXPa4ajbQtMa22xWFeB0vy1BpmjtownDPwNlrNQ==
X-Received: by 2002:a1c:7904:: with SMTP id l4mr1278603wme.42.1629422843780;
 Thu, 19 Aug 2021 18:27:23 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id l2sm4316517wrx.2.2021.08.19.18.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 18:27:23 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa Zero
Date: Fri, 20 Aug 2021 01:27:18 +0000
Message-Id: <20210820012718.10761-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_182726_101784_0412E739 
X-CRM114-Status: GOOD (  10.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the SOC ID for the S905Y2 used in the Radxa Zero. Before/After:

[    0.321650] soc soc0: Amlogic Meson G12A (Unknown) Revision 28:b (30:2) Detected
[    0.318533] soc soc0: Amlogic Meson G12A (S905Y2) Revision 28:b (30:2) Detected

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 6f54bd832c8b..165f7548401b 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -65,6 +65,7 @@ static const struct meson_gx_package_id {
 	{ "A113X", 0x25, 0x37, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
+	{ "S905Y2", 0x28, 0x30, 0xf0 },
 	{ "S905X2", 0x28, 0x40, 0xf0 },
 	{ "A311D", 0x29, 0x10, 0xf0 },
 	{ "S922X", 0x29, 0x40, 0xf0 },
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

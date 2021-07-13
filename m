Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993D4C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBB161004
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBB161004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORlglHwoGQ0bOp7Ookch2HJimdEjgToLPOJVgnavhCQ=; b=m9JLdQDXJR5KEH
	n5IpdbAdIzAAmkOPpkLi6nQY9rFOpnz43GbEFhpOQDZnOA/hKfOEOxxyXfTz6qj39cLc9r5AXXNfx
	vj4+tK4oujGWEKcVkgn3TZRaSQa0ongVSrheovEeIP1qYA7JiD09MotkySfJ5gHHbfYLz+0ZuZRJo
	3ODAvN93RgVFEmZmTr9lPxA9+DgWSH84EIXX0iXnU/Fh1+9Vg9nFST/I1N+04lcYkT1e/Yikq4zxF
	VacZXcy31dyWvL6dnkBM0y1sj4ab7hCXcqN174fL6++5jj1D7G8FD2wnl9IT/3OMf0wdcZL59lVOT
	1GmFH79epbV/EJ8GYt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3BMg-009BoP-DR; Tue, 13 Jul 2021 05:53:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3BMO-009BgK-NL; Tue, 13 Jul 2021 05:53:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id a127so18542039pfa.10;
 Mon, 12 Jul 2021 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqebAial/PxUvQ3x7+4RUByyPvCTdM4/Zaewy8REn3g=;
 b=rBIoJZjfWAT0sRt0CuW/uq1rjG98twshMCwuo4VaQt6XMH78VOKYuwbYlZD2OvKgfC
 WA+Orzbash1JXWVYc0LdD905jDTo2UNkKue11N0vhizpwQ1+hnchElQEiJBRU4v6SNjt
 Mp932YetKM2iQLa5Nj/9O4vS6T72OamP4Gp0oLWthTjgZqMEn8Hqaxfw3XHgTdWLAhZJ
 vNOAFY6WkHQWtbg4rtTy9EVA/q3m0LRP78HkRgMFtqdlBlTwDRm300n2ERdzYDs/3G9W
 dA1Ba+NjXPXtME0rbYx3pBJjluJAjATB5KWc6iP4PSMQA1ewHyFDULGomor4s9LVEIhQ
 v9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqebAial/PxUvQ3x7+4RUByyPvCTdM4/Zaewy8REn3g=;
 b=qASb18DU4kf8B8UkyhMbxLbpzDcu3Gvo3H6rDrHzfVItenteVCbmPp7DQvD5+ie5Rs
 4SmamRBYKJR4q5GR23N9+LNGgP1B64tritbZF0zKTM6eWukNMwS5e+6Isd4+jSUa+uid
 PlnHRSrpmRHx06lyG7RhEd8Nrw22cBAY2CeVNA+ndhrpO4Crr1OnISW4mubfJrnx3T55
 /Ozi0VOjGg7SlkZqdcDNE93rVqEBHX36zDKPl038UDdUnQwA5dPUgJmNs26a90eDyUva
 bgN/Oj7T15MHmK318S0iqk1sLZVfaRf/ipBRWHDzZ+FellpoQbzx/280Z4/16f+m7vKi
 s0fA==
X-Gm-Message-State: AOAM5317zYF6IOyj18/xuGPG3zVmOlyq6X/LLBOUEtkQCoV0yCrraGUw
 gRvhWE817p5uqzMYdOhavEW4mK5zphc=
X-Google-Smtp-Source: ABdhPJyIw7eqiXGaYJ6UUi8zfg205/gHaSO1yNYTVWBN8ejx2F1ONjtA2jg18NkFnJE8nk+PVkgMIA==
X-Received: by 2002:a62:5105:0:b029:305:324:17ae with SMTP id
 f5-20020a6251050000b0290305032417aemr2832898pfb.28.1626155616030; 
 Mon, 12 Jul 2021 22:53:36 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id x19sm17755198pfa.104.2021.07.12.22.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 22:53:35 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>, devicetree@vger.kernel.org
Subject: [PATCHv1 3/3] phy: amlogic: meson8b-usb2: don't log an error on
 -EPROBE_DEFER
Date: Tue, 13 Jul 2021 05:52:15 +0000
Message-Id: <20210713055227.1142-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713055227.1142-1-linux.amoon@gmail.com>
References: <20210713055227.1142-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_225336_790574_4113C353 
X-CRM114-Status: GOOD (  13.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

devm_phy_create can return -EPROBE_DEFER if the phy-supply is not ready
yet. Silence this warning as the driver framework will re-attempt
registering the PHY. Use dev_err_probe() for phy resources to indicate
the deferral reason when waiting for the resource to come up.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20210617194154.2397-9-linux.amoon@gmail.com/
---
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 2aad45c55494..cf10bed40528 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -277,8 +277,8 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 
 	phy = devm_phy_create(&pdev->dev, NULL, &phy_meson8b_usb2_ops);
 	if (IS_ERR(phy)) {
-		dev_err(&pdev->dev, "failed to create PHY\n");
-		return PTR_ERR(phy);
+		return dev_err_probe(&pdev->dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
 	}
 
 	phy_set_drvdata(phy, priv);
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

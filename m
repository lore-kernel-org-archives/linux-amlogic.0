Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8BFC43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:27:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF82220770
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1bVEJMBl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZvYuw0j9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF82220770
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DH3rZ50ecsLHUoRSc9bQVjk4g76HDkY4DA4AtRALF+c=; b=1bVEJMBlnWOrHv+NYzz0bIdxFQ
	ugmUcKiTE9KxWpIN5d/T0ovLqSDJsYqla2DhGtx/ilSC4Wwsf0Qwi9M5jaI/lRZ/kS3bko0szDePf
	CARbFjpqi0ACRK9ICRa8Bzbqlqe4jBijUeyHU50+t5a1d5rZmGtzYJPmsFkq8sWZsLFrrTBL30n2w
	/lQRDeNVq5MvE7vbTWeBD4rCcGsZGWmsbMfYHhRUQH143T7t02GUR/U2lAhphvTclFCFacQQ+qDqh
	q+83tUCohcHVA6wgk76KH3MbxJQqwB5FnNqNqXO9+gP1+d+RpZuLozIXL4Dy9z9AIzs2BnZaWKjCX
	PAgn25QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGbQ-0007eQ-RV; Tue, 15 Sep 2020 19:26:56 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGbN-0007dS-IL; Tue, 15 Sep 2020 19:26:54 +0000
Received: by mail-ed1-x543.google.com with SMTP id e22so4191278edq.6;
 Tue, 15 Sep 2020 12:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNJ33X1X2x2pheRlwyrmnoylDAJlzuXstxu32SG7U2U=;
 b=ZvYuw0j9+OxIp9RRQIeIkbL7ZwpGqcUGl8PqjkMNBe3A0c7KyELphhBEMdBFj3S4BT
 r1Tx/r9dJxRZveLzxj5S7ejzscSYZPtmAJBcMCfxmRJFjt6QK0PxPjXFJMskYIV8280O
 7Ye//unKIMgMRpRr9zbbDTA0FGPHuVT8ogFTgd/pvKnbv/TTmw3gn6WAD5+s/rtbGhhS
 yMhur9waNMKMb+0NVeE2tZIL6BDyL6fEuh/Cd1AfVaUV5Q8kHhkCmgK0ouUcSl2i72Nl
 VH9YOWzUZFlBO5Ai+gAveqKk9L2L8iHKBJPupObNGmqoXkhOz4t01NrRAxRd9kW+26JP
 sQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNJ33X1X2x2pheRlwyrmnoylDAJlzuXstxu32SG7U2U=;
 b=Hdubvq3ECun+jDRjFgu9DVR5bBP31Fyh5rM5bfS7DxhyORCO9HL7pjDCOcqkq5238L
 4cz+KpMauuFTa0wCJj6Xldn6MMqt9NghO/lIGIIyyLq6vyyuzW9gGeOX7nbmvbkEFpbo
 HTujsKaVQq+wpviBsvFDsJTG+vEIJhsCHoI9gLGuGQsp6qOsZERXS7B5a/6cGU9Of89R
 fpCozvGYxoXA2cCNBzN6cj5PIXGgzJxX+76zIRJCgcMNdhaOGsO6y3O6q6hxmyV0kUI1
 8UVX1j4lBbSuI8CR27qobyDTqUwqj3THvD9ARbgTaFHhwXcpDp07a5H7KufPC9FhyVd0
 mfiQ==
X-Gm-Message-State: AOAM5338LA9hJgehXP6wMnClsmCt2KKB/USjPzXesVmV3rMFtA1Gb0hU
 w+TL21EnjlGuwwBnXcsyU8E=
X-Google-Smtp-Source: ABdhPJyLyVl+bnfqF/iHpAZ2TTiUTK6ronbqqCJXBb5eGl6BjXnA0APDpW9Nf10CI8cwXaOvHV6xzA==
X-Received: by 2002:a50:ec12:: with SMTP id g18mr14656537edr.309.1600198010859; 
 Tue, 15 Sep 2020 12:26:50 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f13701d4040000000000000fcc.dip0.t-ipconnect.de.
 [2003:f1:3701:d404::fcc]) by smtp.googlemail.com with ESMTPSA id
 re19sm10836312ejb.86.2020.09.15.12.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:26:50 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jic23@kernel.org, linux-amlogic@lists.infradead.org,
 linux-iio@vger.kernel.org
Subject: [PATCH] iio: adc: meson-saradc: Make the of_device_id array style
 consistent
Date: Tue, 15 Sep 2020 21:26:21 +0200
Message-Id: <20200915192621.13202-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_152653_639072_F5DBD3F6 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, lars@metafoo.de,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use only one line for the closing bracket of the last entry and the
opening bracket for the next one to keep the style across the whole
array consistent. Also add a "sentinel" comment to the last entry and
remove the comma to ensure that there won't be any entry after it.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 95bd187de1cb..e03988698755 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1150,16 +1150,13 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
 	{
 		.compatible = "amlogic,meson8-saradc",
 		.data = &meson_sar_adc_meson8_data,
-	},
-	{
+	}, {
 		.compatible = "amlogic,meson8b-saradc",
 		.data = &meson_sar_adc_meson8b_data,
-	},
-	{
+	}, {
 		.compatible = "amlogic,meson8m2-saradc",
 		.data = &meson_sar_adc_meson8m2_data,
-	},
-	{
+	}, {
 		.compatible = "amlogic,meson-gxbb-saradc",
 		.data = &meson_sar_adc_gxbb_data,
 	}, {
@@ -1175,7 +1172,7 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
 		.compatible = "amlogic,meson-g12a-saradc",
 		.data = &meson_sar_adc_g12a_data,
 	},
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_sar_adc_of_match);
 
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

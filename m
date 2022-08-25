Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0572C28D13
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3cHSemsmPKrbPsgbKKO79U2cu/6Fx4rjF14bOU1vyw=; b=LKfOGygxbEPKUW
	gu6a/8cW841LICj0i23emMFo8oy6B57OC+nKThrIWzVhEnJcSURRBEJGNhpjDySIjmyVSxRx9uXpR
	ZaNuQ5ZxieksKg4gGfsCmfMbej6gIBXR2n7qXIKA47aj05hrMDNlOqstRku+2IM874iV87yAVQcxP
	9lFBjf7/Epr3Em8ubGb2hdkDP74m5ZhjQwL/xb6eGK7VjkwTliJsceXFbrmcHOtQV38YSBJKJQU1x
	CUDgdTsIaODsZaSESdqgVqDQfqMLLw+Erg5yVY3VAYcdbTAIiN5kn9zARI5xGp2J8TQvuM0OLy2Rv
	jxjSfviBzThqWuqyIKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7TK-009Qyn-EP; Thu, 25 Aug 2022 07:40:14 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7TI-009Qw5-0v
	for linux-amlogic@lists.infradead.org; Thu, 25 Aug 2022 07:40:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id s11so24947162edd.13
        for <linux-amlogic@lists.infradead.org>; Thu, 25 Aug 2022 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RU54cpq6xFDfYIiWI0hjya9fxH7V6i4vjs7uIhxYr4o=;
        b=hkghtKvrZenKgXZaC63trBWiQ+6Um1lBE9pUPkORWtKMQQW1/7mqvH6gmV65qY/wwZ
         5njyRbUSsIS2WeD7dEKpvJR0sYG9kBUAh1wnKPTwZYGLmBeKMHvqp+Z3ATk4xsFDxXh6
         0v+WbxpXU+ZYkAgqCzHZlwQW51CX1ceTU0l3Fo5EBdijTrAauS2Y7pNebEBBnWlcI+DG
         /r9PZs4uHUR5JpyYMmGZBYCrvdE1leRV+BGvEdMEjDHYCDLE8k6E91BLmoqiAqeaPPZn
         ZOieuFCWDMF2zfjQp5lv+d/SbRdOaI6Vb1m+vK4U+Uwyt1qUqX/3IcF8x/Hth0PfqDRj
         KNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RU54cpq6xFDfYIiWI0hjya9fxH7V6i4vjs7uIhxYr4o=;
        b=8JnSLyUMW0tXwDZTX728/U5jiqV2Y//U3HqLhj1BIidZrT/eKRZXpNF0B8kaghKl4p
         SbFmgtwqc1D2qMAJji703wtkhKB6FRPkL5/ZGErJDkvMUINbKmJahi5b/t/2bSClAt8u
         jnoQDy+0sV975kSYGvCCDdOQR+ywsrAIDIp7s5Ji/SWJUHwIeD8uVzha4l2v2KU37Qrh
         hOMorGJaLkIy95GVjjspxoH8ju6635l+H1BF8uEYXpDMOnCuJ1dzRfVAqds+PvzltCkE
         p/2+kvC2hMUI+qHCX5ho8zR9zq9J+WzKrvVoEQJjVdegSwPz1+68ZJEoEPe3roAILYqv
         RbKQ==
X-Gm-Message-State: ACgBeo1Ahn+uSlfQXYCN5664trRKfQYGwc4U9Jhh0EokhSPd1vg/VIqI
	i3D518nC+V5eLvQfQLHx4Cvlfw==
X-Google-Smtp-Source: AA6agR6UIpby530LFJIjlq4/dasFIE0oy3awaLabyiNM3p7RD/h5t86m4/Vjyk1nnS01CCrVBVeL7Q==
X-Received: by 2002:a05:6402:26c3:b0:446:c642:6b9c with SMTP id x3-20020a05640226c300b00446c6426b9cmr2126019edd.385.1661413210485;
        Thu, 25 Aug 2022 00:40:10 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
        by smtp.gmail.com with ESMTPSA id jg31-20020a170907971f00b0072b3406e9c2sm2106267ejc.95.2022.08.25.00.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:40:09 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mmc: meson-mx-sdhc: Fix error check for dma_map_sg
Date: Thu, 25 Aug 2022 09:40:07 +0200
Message-Id: <20220825074008.33349-2-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825074008.33349-1-jinpu.wang@ionos.com>
References: <20220825074008.33349-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_004012_082390_02CDF1CB 
X-CRM114-Status: GOOD (  14.00  )
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

dma_map_sg return 0 on error, also change the type for dma_len
from int to unsigned int.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index e92e63cb5641..da85c2f2acb8 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -381,14 +381,14 @@ static void meson_mx_sdhc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 static int meson_mx_sdhc_map_dma(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct mmc_data *data = mrq->data;
-	int dma_len;
+	unsigned int dma_len;
 
 	if (!data)
 		return 0;
 
 	dma_len = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
 			     mmc_get_dma_dir(data));
-	if (dma_len <= 0) {
+	if (!dma_len) {
 		dev_err(mmc_dev(mmc), "dma_map_sg failed\n");
 		return -ENOMEM;
 	}
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97585FA3743
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Oct 2022 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hm4HiWjbxt8RnCQJl7NrFHIrjjPZWqo/m0cra+t2Xkg=; b=4THyUFCSUQpOPO
	6YM6GB6pK8uosG1HR1TiPSGOEQrv1VYZFLKSY0WqOz2Vl95U6/z5RN3E7fnR9c7U5lYboYKheWc49
	7wtSElxp0QLRMaFymBPyHSNtJvEWNG9RvkZ/DAuhfdWS0ETIEfDAAmq9Yux5YMLPwZuKziXVfg9Vf
	lVBCMToS1Ox7LBmCQH8R7/dzW58vwe736Vnlq7Rs/QvJq72aLGMyv59WrIcWz2so86l1DGR/4Zoiz
	pxisGgPFPUHH583mRjl41J78oa0bgXEiP5M/El77znnJeLiiGT8eTafVHVsPEl304csQAdfk1B/LQ
	3eIvsZLVaSV1ZMI05UhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1jj-00D8Up-9q; Thu, 27 Oct 2022 12:11:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1jg-00D8TY-RA
	for linux-amlogic@lists.infradead.org; Thu, 27 Oct 2022 12:11:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h9so1872978wrt.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Oct 2022 05:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3b8progjf6nTjlRNKVhfA6lVwhcFNvYGUFDNCKIgOA=;
        b=hzJqchdz1nxotUABi97SVc6OkYYXbmXSBzNSLO4BfJWSlQ4E/TmdwAKsz5Y2AD2OYC
         tuKmAdi7p9QjnjlY0bKS/VQzsLIb9FARhep7ETn0SVYxRexqgpn9jhEyusubgxgaL1dy
         1fpOJUmwJlblJ+qKKfUHeBPhe8sCps2EGGtrTaoAT78+ZJhJRhePoMFPsqplGwCFABm6
         x9guCDmak8TBfzmnyofI7noqI9/yBqNquKt+lzSBkye+s+bRcIDx0iuza+OA4qpaawMJ
         ujGVCW3rJCAwVV9H6MieBouzPIbJyJgMpSpVtRRqi0X3RdzANId093CK5DhTMukf5s9M
         UMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3b8progjf6nTjlRNKVhfA6lVwhcFNvYGUFDNCKIgOA=;
        b=N85WwHSegnCudekKIXlPl8MlvvIyoB/hPL2G1wGiUZ07j+rDaT1zuF+TZQ2CnHhztd
         F+hE9m+p1E3/1RiapVaTdck8W2F1NpJywbrRlOlb9zh9/pbQEjAGWbBblGSFualaUY19
         67I6pCnRI+Lei68XQm2jOZqnZ9NpFctLqKU0+KOU/nNULF7z7sqjV1giFqMHJUUuA4mt
         8uhtYr9x3adU/U965jVDXwwr3qrQIX1C9ibaYcgMOEjl3l6U5TrmHcE5fxtsbo8mHV5E
         Wmzy9UedUPuABb6ytR3hqDTUocrPMrI/0ZY41eRnrUZVa7j2PwKRMVyZ65gYIZZCLfba
         XsPg==
X-Gm-Message-State: ACrzQf1I+uoW7h+6MnEaAs37v/b2eQs7tPdjGHCq+JwB6lfOZKxEDMTF
	Rx0lxKcsx/JtkC4sL5b2L8ZDWg==
X-Google-Smtp-Source: AMsMyM5rJoSQ6ICEDwXJ+doDHBP8h+Yz7A7uzCo72oHXSiDM3V7WEN6+2va2BAcuQ3qE+wUjWjLM7A==
X-Received: by 2002:a5d:4944:0:b0:236:7f32:1ad5 with SMTP id r4-20020a5d4944000000b002367f321ad5mr8985028wrs.377.1666872705548;
        Thu, 27 Oct 2022 05:11:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw28-20020a0560001f9c00b0022cd27bc8c1sm1414312wrb.9.2022.10.27.05.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:11:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Oct 2022 14:11:43 +0200
Subject: [PATCH] spi: meson-spicc: fix do_div build error on non-arm64
MIME-Version: 1.0
Message-Id: <20221027-b4-spicc-burst-delay-fix-v1-0-5a6e9a88e54c@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_051148_911501_D09B5FCD 
X-CRM114-Status: GOOD (  11.35  )
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

This fixes :
error: passing argument 1 of '__div64_32' from incompatible pointer type

By passing an uint64_t as first variable to do_div().

Fixes: 04694e50020b ("spi: meson-spicc: move wait completion in driver to take bursts delay in account")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
To: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/spi/spi-meson-spicc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 52bffab18329..1b4195c54ee2 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -387,7 +387,7 @@ static int meson_spicc_transfer_one(struct spi_master *master,
 				    struct spi_transfer *xfer)
 {
 	struct meson_spicc_device *spicc = spi_master_get_devdata(master);
-	unsigned long timeout;
+	uint64_t timeout;
 
 	/* Store current transfer */
 	spicc->xfer = xfer;

---
base-commit: 574f97ab96d6b153407161746bc127564e998b4f
change-id: 20221027-b4-spicc-burst-delay-fix-a03004454876

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

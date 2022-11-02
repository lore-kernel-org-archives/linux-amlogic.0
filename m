Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34031C43219
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p3QnB9Bw8wtzDB87eEA2s/4TSRCO90Eftvrfe7yuGGc=; b=1N/iCwP0JozXD1
	uFv7voCzcSThaCJVBDAmaByWKxmahGJFezWirRLABeuQHu/obym5uzxyyTnaTeqFU/czuuYlPMotH
	GJE971vZ1Ds/tZ6w7vx2L1aWAYp0o5/VQ9Js/rrT8O+oyGzByJddd7qk8wihuDEfQ5Jux+QDdwhiY
	qvC2Qyrz+VXrlS/iR8l59h3pGndZb4gx6RbIOsentoCN0aHDTDkph7HngR6WpXL4gF8Z3gSVntXxU
	NHsnhhvSwrvv3KF2CatxHq34ka2nktWxNQm0A19XQhQzdlNI7bdziW37r7WhhmP50qZJU2+oOXiCu
	PR0+s4UYDVmyfUMrKv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9O6-0098QP-Mk; Wed, 02 Nov 2022 08:46:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9Nu-0098F0-Er
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 08:46:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id bk15so23395163wrb.13
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ltByLIj0SyokO3we+F7KDthHs4841xVlGPJUzUCdJU=;
        b=IgamBxEBc7YoiCYjghTBlqfPvxbjKkrIcNvUoyHd+9Wb3iQifOIdSoV+omsbL7fHZZ
         iCIrSpt6zpYXU+SV9+jPrhXgwt8T69WroG5DcI+G9wZJqqqO4Dc5kyb0+KpEENT2B5NO
         lT4lns2QCSh5ZRYA1sjrpyhxWdzpjYfQEx8W+m3dc/6OEuocpOAc5jmuFbxrkx8XoF19
         lH0h2/9WZ8grA1KBG1lTTUmHiogVZbMFaD1MxmP3MW+X66CR+6u9GiPNMcrbv5xokseQ
         5jvgMQjxQRRJw9XyJOTxg8bIqX0rwy/Eq3yzK2BNc62FMbA+A0BCFOGB/AzEcmYrH2h1
         FKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ltByLIj0SyokO3we+F7KDthHs4841xVlGPJUzUCdJU=;
        b=y017PAufLt1m8QmEl8ZMi6WJC1/4+kkd6aBP6gHoM46wAjOX+NxGEOkp8WMfOjSAcg
         qeW8ynMBB0mYvrvFXU7cBnqhVouj8YUccFXeMUk1kB2hmLTAX+hG5wR6c0KOIRC9rmoS
         UNGR5sIsqVIGVB5L2JKoQk/Tuwfb9cwavj8hhb9B+FRVu/lB6vXMZKYyVCKs+6MhloDV
         B//1QDU5qjXkCxwVCQXOjiAGSU19YwCe4i2cDgTbZKML4Ubd3Z+xCiHNbosPnDIyIAP0
         EmKSwrx1pmk5PPXmAtO9HZKk5E5k/vZoWoFo3b4q7eq44J3OHVZjK+1erVfG5V165Dtx
         RRmA==
X-Gm-Message-State: ACrzQf3jm8rUeeLU35eajDShxm1vcAVLRu5eRtdnrh4yGIXBBMVH5hHs
	gmfqRGFdcZmBjreKt6eCDU8OS+msS4DienCw
X-Google-Smtp-Source: AMsMyM60FDv91EVLcYmjUas48F/vYfVv+qYpLRu4S964Onj+6CUMdQNPnSqXUPiirdAQYcaqNjTjeg==
X-Received: by 2002:a05:6000:1862:b0:236:510c:6d0a with SMTP id d2-20020a056000186200b00236510c6d0amr14604158wri.592.1667378764349;
        Wed, 02 Nov 2022 01:46:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d4fca000000b002367ad808a9sm12066261wrw.30.2022.11.02.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:46:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 02 Nov 2022 09:46:01 +0100
Subject: [PATCH v2] spi: meson-spicc: fix do_div build error on non-arm64
MIME-Version: 1.0
Message-Id: <20221027-b4-spicc-burst-delay-fix-v2-0-8cc2bab3417a@linaro.org>
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, kernel test robot <lkp@intel.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_014606_541139_1F8DEEBA 
X-CRM114-Status: GOOD (  13.16  )
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

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 04694e50020b ("spi: meson-spicc: move wait completion in driver to take bursts delay in account")
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
To: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
Changes in v2:
- Added Martin's Acked-by
- Added Reported-by: kernel test robot
- Added To: Mark Brown
- Link to v1: https://lore.kernel.org/r/20221027-b4-spicc-burst-delay-fix-v1-0-5a6e9a88e54c@linaro.org
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

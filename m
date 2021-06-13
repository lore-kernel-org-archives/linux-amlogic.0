Return-Path: <SRS0=cDnO=LH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6B6C48BCF
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jun 2021 05:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7254C611CE
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jun 2021 05:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7254C611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EIZcxSck50HKoff1ikOWU/6yizZDjW0VFSZ5YTvW+MU=; b=FgTOV7qAXjCvyd
	yFcWnN5Co5y6FS5/sQ3YM72Y/2GG75A5mMCwipfdutMyasXZ2OAMV6PUje2BZ78SRWTyoRvStw5v2
	N+iaiaQD75YnhwqvvqO6hkBTpF2YbWK86I62YOyteQ6sb9I+qa0Wf1dVB+1qV7eILbHw75Hy+dMR6
	DK/WLNQfh2zbKzNt/EXSeEzAiEWiAA3vt8nEQWxeazxbOzItmNfqy5uQRnFhthD0btmKrmiu1E0um
	oxB+QEkBZgRC2oR/qJpCimQT5IBkRfC+LglB/O0P88yK0gqZ5JSK4lx7q+cwKKH8IQb9Gaq+FGbRL
	FrWMgjpO/lDAJXho6VbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsIhv-009iMb-FI; Sun, 13 Jun 2021 05:30:51 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsIhi-009iKk-TS; Sun, 13 Jun 2021 05:30:40 +0000
Received: by mail-pf1-f175.google.com with SMTP id a127so2153201pfa.10;
 Sat, 12 Jun 2021 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=e9wgkbzyfzIDSr2mxBQKx6UIoHjiY2DxbVr5qjZ/ndQ=;
 b=vHJYnC5k2pNMcAka9+8PsEV+JyHpNrO1Q+mca4ikgwPyM7J8kx4lxeRPtqW9GZpK3Q
 whTSpSpNpB8Pk4/Gvp/A0pGwknW5N6z4PX4GwTt35nMnkbpbWJcqASxvvOV3LqelFXwX
 Yv4prjK1qW0UN21MJtRc1mV7KNYDfeK631XncDCWQKxz1GCQD2W5HS00NqV85nG2Lj/p
 twILRHztLdECx9SFbU1OZM+DLe37FoOKBW6qJKPe10t34PakAGF546XTAWkn5mb6T3DC
 gFz5/R3sIR2MaHwdxwJeoQRYChFeQkayEvgXePxTQcb/INfK9byZ+O3u/JqE2GXRNFbP
 1HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e9wgkbzyfzIDSr2mxBQKx6UIoHjiY2DxbVr5qjZ/ndQ=;
 b=ME3HcW6XG43fMcLDktUbUtExCJDX0qbNo2sgvEaxcEYO9Ua5GpNLRJ7rIeS2FQcjQD
 Qw7UrqnaQmgimuwu24dNwxmkKteLRsbDXVpzbWGucWMImqfUYneY7AKbI6V5laM9IpJ7
 RPH+8IVblTdPXOTJOqk9/fF2L9VWJrourz1d4A5n+KZpJXKzg1+D2GT2ZqNHbD2mwNC9
 bs7Le+UoeI2CPjhTMMcP5Gezdwu838FqDFFZBTNc7jjQ/Ki992zmIe13VtdL2bn3gGqr
 kxkzevipBIZDZstmK65FaXN/bkzXotaGjjHxUG3yFDZH+viFx5Q5yD1TUFIgr02bv6wO
 2G5w==
X-Gm-Message-State: AOAM532LraWfqJZvpZy2Xz4/RTXXksk6SYETixSlQifEXmLe+A1V/bNe
 8wae5RMBB9WWqYqXgkukMN0=
X-Google-Smtp-Source: ABdhPJwa1Ill6bdxHT7ix4aev3b0DeJ4kB2NxTJRs3GR1xv0JqLnWXqYaOVRXpUeqq3RSx2rpNMaxw==
X-Received: by 2002:a62:8491:0:b029:2e9:c618:fa32 with SMTP id
 k139-20020a6284910000b02902e9c618fa32mr15861684pfd.15.1623562178265; 
 Sat, 12 Jun 2021 22:29:38 -0700 (PDT)
Received: from localhost.members.linode.com ([2400:8902::f03c:92ff:fe55:8c1e])
 by smtp.gmail.com with ESMTPSA id
 a9sm8810533pfo.69.2021.06.12.22.29.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Jun 2021 22:29:37 -0700 (PDT)
From: zpershuai <zpershuai@gmail.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: zpershuai <zpershuai@gmail.com>
Subject: [PATCH v2 2/2] spi: meson-spicc: fix a wrong goto jump for avoiding
 memory leak.
Date: Sun, 13 Jun 2021 13:29:32 +0800
Message-Id: <1623562172-22056-1-git-send-email-zpershuai@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_223038_975259_F1E591C1 
X-CRM114-Status: GOOD (  10.85  )
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

In meson_spifc_probe function, when enable the device pclk clock is
error, it should use clk_disable_unprepare to release the core clock.

Signed-off-by: zpershuai <zpershuai@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index d675334..b2c4621 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -725,7 +725,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(spicc->pclk);
 	if (ret) {
 		dev_err(&pdev->dev, "pclk clock enable failed\n");
-		goto out_master;
+		goto out_core_clk;
 	}
 
 	device_reset_optional(&pdev->dev);
@@ -764,9 +764,11 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	return 0;
 
 out_clk:
-	clk_disable_unprepare(spicc->core);
 	clk_disable_unprepare(spicc->pclk);
 
+out_core_clk:
+	clk_disable_unprepare(spicc->core);
+
 out_master:
 	spi_master_put(master);
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

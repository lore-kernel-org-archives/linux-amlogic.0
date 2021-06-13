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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C812C48BDF
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jun 2021 05:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1419B61105
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jun 2021 05:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1419B61105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Bj+jT26WYH0uYIWCVjRkAmQ8DJ6RQYq8II0LwSKYmU=; b=ibKM9tz5ylQDNm
	IrA/tyxCF4yuVc+zATeBe6QZjhRnLqKu9h7zc9pzti17Pud7vOOcIJ+PYzLYt7DIj5wAVGw/cFixt
	LOW30sCOjZLgn4idVliMsT2FKY1yFTRn2DSw0g11KFS1fQoFpTcMSjnhBMnZ/REOKxTAcBNGpeec+
	4picJMsLEjNag2bc+t4gP1SgydccjAqdiXfil79HfX1j0mYN0nU02+99bpTqzVIF02EuIa6yWW+8Q
	nt1V8drybWNu8Ee31CXUMKPBjzkHCzRWeNFSVNzJOiP4wzYtauE4oj+4saHiPaJXbihKvkqcjWKVc
	Op46AaI+IE/6oGoyucvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsIgi-009iFG-IM; Sun, 13 Jun 2021 05:29:36 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsIgW-009iED-Ve; Sun, 13 Jun 2021 05:29:26 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d16so7954471pfn.12;
 Sat, 12 Jun 2021 22:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6AdJa+7WrAfZXyHfw2qNyNJLE7yY0Qr/CD/Tk8b4dL4=;
 b=aja0+fMUKycQTU0t/8Wj2w4U4OqO3dy13LeMaGgx+O5RrfQri1eEWXHsQIsQbOQhKx
 osu/Czw415aFn1JzF218SG//xcAaa+LgL2Nyg3QGG0oCyZcZW4Ver/F8cYlYdaMJ6U8r
 zBWt4sX3CwnfozqTEiQhIguXf66D9iWlsI/Klu6CnS9zmdON18V/abhfUT5eciBNJDfI
 mL8vpOHRd2ic595qzIp/v52wRHbqV43dvRxuVh0PEBWJ/qC+QnEgQZpZfT+qNxUbmPog
 g8e7+7ZqzQwgIQGZsj+p8lkof4qamrv+aFcdQOf4iRJRAkzaxNiWNZ+Y41eO/TUif9wi
 4rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6AdJa+7WrAfZXyHfw2qNyNJLE7yY0Qr/CD/Tk8b4dL4=;
 b=aii4LThkEoeBl3pIyKu1CGZw5WGkOSTA4oKdzLyqaJrVkQ4aF8Mq885qz2y0Ik8ORs
 OBF0fvVK1euivYSGwO/DsaT1gGxD0mp32fidp/MDMOVu6HFPjaKary9omDju1fXIvrAH
 KK6ihO/Zw8pWbRCoEJHTQaMgkOEwBqfZIfowY7zvVTdQkkgnA/8lXmgKcn9il7Z4r/aP
 GK9iVZ4jnJRwj2N8MahiL1pG5VOTy2NirH4lKWKBy4kXdNXjupPIlG3E3hbTtNFnsDO3
 S5RwaYt8UQBOdTl6i0zsgMiS2oIILBGW5uasaI0vfJ2abl/YrOGuEKdbzQm9Hib0xY0e
 BtCg==
X-Gm-Message-State: AOAM532rLf2MrlZJkgNfXdJpsP6gaAbxh8f1D60rcdewjyG+wiaTD0SX
 SvnFGDFzT3mzgAtSsAwsDko=
X-Google-Smtp-Source: ABdhPJzFeeQ2tdgUq7C9JKQ526BuE+bqLJ3Wdnj7gEMC6ZOwuUu/Mnc9icDaR2Ze5gpYzv82O8t1bw==
X-Received: by 2002:aa7:808b:0:b029:2ef:cdd4:8297 with SMTP id
 v11-20020aa7808b0000b02902efcdd48297mr16032881pff.27.1623562162497; 
 Sat, 12 Jun 2021 22:29:22 -0700 (PDT)
Received: from localhost.members.linode.com ([2400:8902::f03c:92ff:fe55:8c1e])
 by smtp.gmail.com with ESMTPSA id
 q68sm14397203pjq.45.2021.06.12.22.29.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Jun 2021 22:29:22 -0700 (PDT)
From: zpershuai <zpershuai@gmail.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: zpershuai <zpershuai@gmail.com>
Subject: [PATCH v2 1/2] spi: meson-spicc: fix memory leak in meson_spicc_probe
Date: Sun, 13 Jun 2021 13:29:16 +0800
Message-Id: <1623562156-21995-1-git-send-email-zpershuai@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_222925_057173_DF897DCB 
X-CRM114-Status: GOOD (  11.67  )
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

when meson_spicc_clk_init returns failed, it should goto the
out_clk label.

Signed-off-by: zpershuai <zpershuai@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index ecba6b4..d675334 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -752,7 +752,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = meson_spicc_clk_init(spicc);
 	if (ret) {
 		dev_err(&pdev->dev, "clock registration failed\n");
-		goto out_master;
+		goto out_clk;
 	}
 
 	ret = devm_spi_register_master(&pdev->dev, master);
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

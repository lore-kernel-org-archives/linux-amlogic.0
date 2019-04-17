Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7F2C282DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2802183E
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KmG0UXJG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YVXA2g3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B2802183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkIOfqkx/G9UO3lC3TBwEPLRBDOYYWpX0KDvW5BqKIM=; b=KmG0UXJGABXfeE
	ZbNz0TUbfMvs0YR2MoOq40mkGwOKuAB2gTl8iubI7ktOo0sSiiuo7H7l0xUNT0egUWGOwmFynYTIw
	xJxb67hmKOuDkQs5YEn/4gtrRozcAMeKt4nPzg3Zxq4/oXfynvjJUIBs/chQkrafnmH8g+Fq2rScn
	OcFtSc+phLevOvok9QNAEode/diAb15MWTLbO2zAmVSpC9NnF33x2dI8F/jdidQ+yj7jeiOHrX93Z
	e+auoslCzufw/5TQmMrgWHcMc2B0IcG71/JwtHVqgBD5J2Nc+zP9sBhrZO8xaru+8CBdx7izE9ESh
	TqEHhbeVmFAnZritSmxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPo-0002OM-Aq; Wed, 17 Apr 2019 20:44:20 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPg-0002Fu-PX
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:14 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so81184wre.7
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/0TdomXHBUKD3xd8SfrSE4UbCHhoD4KBzvsG8xwG04=;
 b=YVXA2g3nzw+IxHqkm2JY+V3v11I48wdnaIC3PhrF2Xg1XEc6oNhsVpPLIvUgY+45dP
 u4jH4n6UCixqWSCtDWbEzwHFxMcpjyam67IY7urAuzvFPK7RLCP+jGxZqQtBf1lF+dgQ
 FnCDtTSdFpHb5sfaEZVKoZ7mm4b3jkEurx5k2NGx+/kAjS7wvrg5J1YD6AV+N6iWQk7q
 PXDWb4mKAojHTPwwWfeKcc4e+0dJqVtTiaZtFCl/2Sgb0y7fU1ysNLM+nA9XZ0ayzGn5
 L/tZ6Bi2BW0eJBWnApA0MFeAA90zImjE1h7NcM/sOZXQvSwE8pmtr9MlD7jTUckMqMiN
 mPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/0TdomXHBUKD3xd8SfrSE4UbCHhoD4KBzvsG8xwG04=;
 b=oUP87E2g7WFbRmzepLC44tkYRVHfarRITha7m94dYQcvpQGz0gk1ZsTt/6OQsdhJqB
 U/H7glKOj+5s3tPYYvlDQZgP4wRUVudhzaXnTJrTX1iSjKfJR7gNbavmDBWiiADMsjrr
 hHDlI4BIGJc3mAnJrzjpx8ppDq1Li+d+UgQg17TyHvfy6TKESACKXZduIAKBGUn05I2+
 hpSHVWtpx67FsojVPzUGNc0GQtjfFL4PWSdw+J+teG7tetUlpz6pjzx5Xbh3Lm9K2/6K
 0AplJXrLgSMv3DHvxLu5t6ksKkiYtwGFMLUSP8c98+KR+J5Yt/olEOjM3020fAx2Vzyb
 7Sag==
X-Gm-Message-State: APjAAAVlxu+l+efPOkQQl3/Y2eW3zkF1zT+1z+soyhCO7oaZ61/fBP1A
 f52XF7Ojig/RJZNnK2JcH7yohQ==
X-Google-Smtp-Source: APXvYqyOso8aqwCNWNJSbOk17iMMMUPOaL68Da1Zo65EMmyj6V05d9Iw6hvo1ulehze7Y3sDepzRbw==
X-Received: by 2002:adf:f78c:: with SMTP id q12mr38482698wrp.172.1555533850051; 
 Wed, 17 Apr 2019 13:44:10 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/7] mmc: meson-gx: irq is not shared
Date: Wed, 17 Apr 2019 22:43:51 +0200
Message-Id: <20190417204355.469-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417204355.469-1-jbrunet@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134412_826937_E79705D7 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There is no reason for another device to request the MMC irq. It should
only be used the MMC device.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 8b690ecde4c5..3df50b53f834 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1328,7 +1328,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	       host->regs + SD_EMMC_IRQ_EN);
 
 	ret = request_threaded_irq(host->irq, meson_mmc_irq,
-				   meson_mmc_irq_thread, IRQF_SHARED,
+				   meson_mmc_irq_thread, IRQF_ONESHOT,
 				   dev_name(&pdev->dev), host);
 	if (ret)
 		goto err_init_clk;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3636C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72FB7217D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kq8heGEW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z3sf5GKx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72FB7217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0MPKYiClSO7RnYG86zBoT+vQzsfsYJgEPfx4uZTDSvg=; b=kq8heGEWlJ3B6P
	fBnhGI1UiYcpEEsmzoD3P6+UVIj9tsqMvvkpxdw6uyiYEZJ9xKxECjxBcMK76H35O+fsDyiJxwRrA
	+Ra1JYFkbNqWlX5wv0hgpvvvBVctuW3TClvfQSxetbTcI9KnVwNCGRUM878opdCi3zqFvKMRr8NeD
	kixO2iouFHzAvHu158Lr30yFoYjHbN6u1c61ILqvtUq1i+67380alkDPILlfnmq2M/uoDsojNaKf6
	etSv+Y6q/98XHFSWHPVl94QYHn8EjyypSdWYqD9dOlBZx22DdA+rXjuG00rTC4mAJLfJFnHeOrXof
	q6mJ4Gu1AL4udORwHGMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEWgF-0003s0-Ip; Thu, 11 Apr 2019 10:11:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEWgC-0003r2-DV
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 10:11:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id z6so1581990wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2nTwodp6z8HTVF3WLduDXBgplOr8t5kebWwxmrLzwFs=;
 b=z3sf5GKxcaXjnnizIA8gkhgYfaEjmadznrVU6yriIYGj9vKDIvxBfRDISAdDWel9UR
 qVtBW0cpy4BG3DfGx9qikqp9dSIFSI+heizZtRDDSqu4HTPpNf4EoITrZ+v3+5c9ze0w
 LG9N7tPb4AwDkR3XhJvkVrnEPIqBos+26hRrWdnawFvuyGJEICIE9WhfnS76+PgWZbpd
 xUz6Fq+SVLCSv3n6+Be4pUhzLcNLvj3/IQew5q4npYmicR9NJ2edYsollQ8aql0IRWuO
 KnydIFKqYkEeGRwO0pNmLz2cDaseFvGhqNnxsBAKF3S9sUV+kVSQmrzCQ/VnPUJTr8jR
 DQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2nTwodp6z8HTVF3WLduDXBgplOr8t5kebWwxmrLzwFs=;
 b=s0MPnkck6WAxKXt+C+7Pvd8OMxF32fLya9XEQF8BsbhL+qkq0+qvTioVIFK2bmGbRM
 RfFWXyNoZxI8QxVAuuyZcjtBNweQa8xIBJtUWIGPM8VcXZCnduI/OWGrnqGEJa11Ka3W
 dAVwzqv4pL12zoHTq4Ga92mVntdIWxDFd+PgFWzCErlYfAyWguIAT5rjQUGDls/jofBp
 9MgQYzzpx6Qh4kYczTZ1wPxOCwSOj+X+7qpjGb8Y0u3sbKsTsFsYp4jh3R+YAR8+8lqw
 MpH1TKw0p7t/G/5Qw4FZZ6Sw8edIOxCdKrtW9I4UdgNLvOMuRIRaVwMGdt1OMfbZ0xKs
 nuRQ==
X-Gm-Message-State: APjAAAXWCMaHUgMFJIHpKX0L5qCCzVg6qgqAtYVNcp4gqfZOkjjWeaTA
 qkAZ1dKW2K1XbRWokKQlF/k+ZQ==
X-Google-Smtp-Source: APXvYqyLMFOpEuSIXecxCV0uIkRP+oFuuDh/FySPAORzv449J10e6f4VKHxdTwh3tRyy+HlaSJgwdg==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr6188846wma.71.1554977494850; 
 Thu, 11 Apr 2019 03:11:34 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c20sm70235347wre.28.2019.04.11.03.11.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Apr 2019 03:11:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH stable 5.0] Revert "clk: meson: clean-up clock registration"
Date: Thu, 11 Apr 2019 12:11:32 +0200
Message-Id: <20190411101132.5513-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_031136_456911_AA38CDFD 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This reverts commit 9b0f430450cf230e736bc40f95bf34fbdb99cead.

This patch was not initially a fix and is dependent on other
changes which are not fixes eithers.

With this change, multiple Amlogic based boards fails to boot,
as reported by kernelci.

Cc: stable@vger.kernel.org # 5.0.7
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-aoclk.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 258c8d259ea1..f965845917e3 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,20 +65,15 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Populate regmap */
-	for (clkid = 0; clkid < data->num_clks; clkid++)
+	/*
+	 * Populate regmap and register all clks
+	 */
+	for (clkid = 0; clkid < data->num_clks; clkid++) {
 		data->clks[clkid]->map = regmap;
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
-		if (!data->hw_data->hws[clkid])
-			continue;
-
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

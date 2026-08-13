Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5658EC5AC67
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ6jrFaNxPHJOQ75QxEAe2LaYm+LlWzoE+Yly+3PEbY=; b=xP6di0yYo6a7ci
	7Fvh68yeCDgNC+zxBaRefAXyOpN7/R+zmyUYIyLiStfeqMLIzy02KvRlPE9bv73BAz/oKwrrqow0Y
	8ZY4Ek2/fpLKEF2zt+YxrNRvmE95cgRA0h8C2oXDCT2xl0nR5IUIQc5mSe2QmbS1ntHTIlNoo0Py4
	1kXocP+4iCQqBfFKEuM5HA8EuXLy6wvyFcEdnjJoPx0Q7BFLxBYqoNHZZgWbOT8vw6m2G/V/00NYA
	L8UD4xvNuAes3qp6Ng6+h2O4FcsqjMlTCIb6lGNBYwPGcEgQ3GBTwYEccl3uil8BCW2s4rzwh710v
	msU884FSwqr++wMZS3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5N-0000000HQWu-0jRQ;
	Thu, 13 Aug 2026 05:34:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5J-0000000HQTk-3oEs
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d004f135b1so25784655ad.3
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599273; x=1787204073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9jEpSymG16S90LWBY9Z/OiKp+TcgWzc+6zLqoEqqxY=;
        b=ryKknR7qbEL7WpUTsN0gnR3JIqjvL5QxXC6pQ/kL9eK58k5o/U1+YkHcJSYRPhl0Zf
         2M51ymcMHTvvjFQcdfC0O05dlYVByiFP0SresQTToI3Zy9WlPtYaiF3zZeSvXpTdW238
         vIKI5Jb2vYEwumOk6XWWL+TcCJ+7BfRXTPItCM2MzoFXARMnQ54OlSinN5U/hNBy5k2g
         +r+24VKzr3TbR83voli1LnM9z91vheL4UEfZLTPjQr0qBBhxEUpe7q97JmolwG64CC75
         XDKMu6HTrgoZVmEKYsqM0qE2moGcMSYdxbKEu3L1TwiqAD4knOwGRceRI1HqNYkGYqoa
         RXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599273; x=1787204073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9jEpSymG16S90LWBY9Z/OiKp+TcgWzc+6zLqoEqqxY=;
        b=Ta5pbMsnKXFuoqM8E0NL3pCHCAHHsS0tTPWPnnK1cq79rR1+edrZ797UREh95tZN1R
         rO/qfKJ1pTniMP55RDITzbB2Q8PVzFRsLoWu0gb0a45l7VZm5tXUHWOIc4Qwr428Y52x
         9CWqECDkuzynVHcv6vYnpK6BOGefdsAWTukp8tuHrE/rW1sIWZEZhi1aPyKKcNku63Mm
         JXgKO0SNWqz4qD0HJVorAVZzOlbJ+Kc4hLuKu2SmFiBwx74c1xCW+1HCp6T7OivhDMIP
         Lu5dRjUyRXA0FOswSVyMzO8iOxMBemKPyeiubrVV1FyEm+INxEdenH/78RmQDQ/Fmk1E
         VPYw==
X-Forwarded-Encrypted: i=1; AHgh+RpLUb1kJhvVH/A9UNoTmmAcurmdy/6O/lxzmnRgNw7lYZ4XMv5/2pIUa53rOnI3fFmWa8eoBmonUmvLPMWw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8B5iReIAXn3XWEyJNHWvA+mH/k81FRFE6Gb35Gz4jLH/NZT78
	i3HXnGNmTZnPb4necTmYT/ytoF1V2ai3vUVZHR8myiDcpQbkwRWpN9Mx
X-Gm-Gg: AR+sD10PJu5tbGyp0zomBZjVr5SSwY/cfTleK2aS8RbzLQhOZJi8RtVfUEt3ZV2gctP
	eDoLciCBv9E1oKXH6/BCUxnMFCnicLQo0s0CEWqSof3gyekoZ2uPj2LkJQwLMmcYBzBTUqGuNOp
	pN+1tjYPnYEpTJtsIWhP98G0CGhowFOR75IDQWAw9LlrTBUdHqVJc2/SBDG/cg3DAs9whbAbIoA
	a7gOP4/BQLfe0DQUuauAzU2Q7sjxeuCSX2rjiK09YhhRLHrUkaawJQw4epQ5KL8/z2muKdkhj6R
	DTIo18/k7M81evvb013WETLwNZ3w/m31OOQ4/4ykPTB+eaNUw6cjYfQaNGMJxMfe9+s6T3eb5J8
	nLggDLO8bPYKNO5li37wgaZcw+osqUh8MEGWNGapxTuBJqscFtUkHvU/YAO+GHT1SO/Uq5klmik
	r6Ck3O6WeVhkmsPvHSJXFU1Eg4mqNUcOnAPSC3jJWH391eBBu2mnyNLfkbiqlqWOehVLocbHDMS
	6fzq34S5XCinE02KGV3AI2WUih4z1PwhfAFhdJKEB+ZlqIGnE+2u5d0rcDJJHA8IvYlsJhAk8TX
	nWu2Q9fmuV7+YUA=
X-Received: by 2002:a17:90b:52cf:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3931e278f94mr3672086a91.17.1786599272978;
        Wed, 12 Aug 2026 22:34:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] mmc: davinci: Handle optional IRQ return value correctly
Date: Thu, 13 Aug 2026 12:34:04 +0700
Message-ID: <20260813053404.21553-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223433_966548_D146AC03 
X-CRM114-Status: GOOD (  13.10  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

host->sdio_irq is assigned from platform_get_irq_optional(), which
returns a positive IRQ number on success or a negative error code on
failure. Therefore, 0 is not a possible return value from this API.

Check for a positive IRQ number before requesting the SDIO IRQ instead
of treating zero as a valid IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/davinci_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 773577a10512..c503e5f5c886 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1303,7 +1303,7 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 	if (ret)
 		goto mmc_add_host_fail;
 
-	if (host->sdio_irq >= 0) {
+	if (host->sdio_irq > 0) {
 		ret = devm_request_irq(&pdev->dev, host->sdio_irq,
 				       mmc_davinci_sdio_irq, 0,
 				       mmc_hostname(mmc), host);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

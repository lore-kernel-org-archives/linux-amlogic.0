Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B0EC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Dec 2021 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MasKY5yjI8S1FVqshbIzUfhtooCEAZ/hNJ+okM1NyE=; b=WWMjxgOPHZLz1U
	WCHI4Awt3qDNg5GRRSXuAyBXQkUBXXDwGbUiOS0p8he2STZYi6r5AzX4OPszH/lgTVpZECv9ruUHp
	B62VcRlzzXXeDOgEPtVPHMk8yY1AWNZjbiaLX/03/TBXRZajr+6lgkz5sQhhTXFSdWlvusV/BObeN
	eYULFXgwh4cmIdAbnOhKDw3FWoCOEvgRDsUn+iXRpmJLg4ar7SV5ONy1kU8vx5FHoCDyJ8rwiRWov
	z3bugi4NudHpLz3u/XhnPklNHnUba7NfBMXBsK0yO9OpNTbtrC3tXO28KWp9VYGdWdEl97VoJriO8
	s9G+wIduJV5+uN1t9CIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myyE1-00GFZR-6a; Sun, 19 Dec 2021 15:35:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myyDA-00GF3t-NC; Sun, 19 Dec 2021 15:34:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i22so14826799wrb.13;
 Sun, 19 Dec 2021 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFsVzNxUTe0zVj2n7sBsxSG3rvMdpK3tm6ziU6/sth4=;
 b=BZn8XdhsazbSm+T1KIeZYU/dJkqAURt9mI5DASsIbG2584MXsCyOVn+eR7/eUCVoPg
 qaJn20CPCUTx/GM7scU6TfocKN+aekA2IlfAk5VYdkNlYFLCqrKrRU7Zfb9oD02u3Dkg
 dDPrhwUiIDfgUILDUM8xyPol4M2+JAssF785XxRU/ibVvAADQDXoF32gTK+k2qashd4n
 gCbsKWBVOZBvzYxul8E6AZRFdwfDKBCkO+RysFvGnSJ0jZfXzDBAMEwErjVOEj/Bmrws
 ChdAONYUBqaDpmtKjUvAo9H6sD2scFhteoDVT8Z+kcDL7jQ9oXSctHh8QUjaUYfk7rAs
 1aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFsVzNxUTe0zVj2n7sBsxSG3rvMdpK3tm6ziU6/sth4=;
 b=LAlxTySNQLbTRNT45hRuuvi11L4dYALJlUmXskdqJGgnpxwAGURRlDtsX1mQYGFxLE
 iMq73ERWMtgKy6NARftv2KY0JvmLE1DVuoxTE7HJ8clShhTsRVEmcevUcvPO2E3jLhjp
 tDiXY7loqjKWQyICkl9yrCI3rw885kxja3TFpsB0iWlNewt09rSZqpdxKzF5BZ8PE7ju
 wmsdM1ABbFkua7cOIEztqGW5FWoyj9FSU1Dzk1CNTo32mmEpBSawfJk4FqO5jdZUa0jt
 I8obq+y6gxCHgVc0Ghu/0YoMqW+AgULTCDpBVsCDz6LtdsALzRrvy3BAVmwXhuL1NarH
 iF8A==
X-Gm-Message-State: AOAM533EfSAO++dGHI3MxSP9ZYt773LIMguDTTX/quey8xt76LtERCMy
 rTgxD2z0bnbtyaoH39hhBFPxQQ/pQos=
X-Google-Smtp-Source: ABdhPJy8sqHQb8viceLhFm/W1Wh3gIVDSOpELbiSB6yK6CD2Q1AsC1doKHe8hShOvALzCDdj8Y8cNg==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr9933234wri.309.1639928095133; 
 Sun, 19 Dec 2021 07:34:55 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-721d-8f00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:721d:8f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id d2sm9262020wrw.26.2021.12.19.07.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 07:34:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mmc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/2] mmc: meson-mx-sdhc: Drop unused
 MESON_SDHC_NUM_BUILTIN_CLKS macro
Date: Sun, 19 Dec 2021 16:34:42 +0100
Message-Id: <20211219153442.463863-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211219153442.463863-1-martin.blumenstingl@googlemail.com>
References: <20211219153442.463863-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_073456_784154_FD511BDE 
X-CRM114-Status: GOOD (  10.51  )
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

Remove MESON_SDHC_NUM_BUILTIN_CLKS because it is not used anywhere in
the driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdhc-clkc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-clkc.c b/drivers/mmc/host/meson-mx-sdhc-clkc.c
index e1f29b279123..19200b7079a6 100644
--- a/drivers/mmc/host/meson-mx-sdhc-clkc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-clkc.c
@@ -12,8 +12,6 @@
 
 #include "meson-mx-sdhc.h"
 
-#define MESON_SDHC_NUM_BUILTIN_CLKS	6
-
 struct meson_mx_sdhc_clkc {
 	struct clk_mux			src_sel;
 	struct clk_divider		div;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

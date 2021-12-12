Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40578C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MasKY5yjI8S1FVqshbIzUfhtooCEAZ/hNJ+okM1NyE=; b=BG6olPmKzp40OZ
	2IYTQAJs+tJTkFFucgVqkReHWpSulaW9yq6XOxemHJRRMOst9Y7C7lAu9rKktBIN5aAfTUkx/X6Fe
	vHZM8PIjCPWcmin67HgsYyTEjX0vSnBZJQU+pmMhttZONzX8y1uN82F+dZiH5xW8zpmHLVpZt4UgD
	rjE46jjW2HiMANS5waAMMuFoh25WNRVU7H8QxCBcEpoH6IqSjXtWHVLMMiXMG3vTp1JnN6gVPjFSd
	EETiQ9uwslBu72I3FSE0i+RJL+5j4EJgdCzGoC8l9vq1hqMpNYaL7L8nxaqNzHpyXhrARbpwVwKfr
	kni9XLSnrjN2fRHHif/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwQLD-006gxL-Iq; Sun, 12 Dec 2021 15:00:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwQKn-006gob-CP; Sun, 12 Dec 2021 15:00:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so9647742wmi.1; 
 Sun, 12 Dec 2021 07:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFsVzNxUTe0zVj2n7sBsxSG3rvMdpK3tm6ziU6/sth4=;
 b=o8kNIO4V5DpeQn/CO4pcYqGPR8q9ooMHRa4H2Nnf3TiH94ML9bRY69YKwLjq9PsWLF
 OKwgvhneOXaHninwwOCbce3CPynUCK2SmXGS7xoyKbd8qmU4PqZDB9MEDQsVNCY5GGQU
 adzzr+E/XVktg+/Q6VheylsmpnJmfR1VI2CluHSFl8qX3DDJcmT2UBvyOcwtyS2Dfe26
 CHpvVJzTkoloIDLVAjiXLx7UvUV+XeZrSauOesllhUwTcE0dE4FXj0O+lNIsuUtwuaMb
 rWz7Zs4ygupu8R8HRwUAxiMia4ySTQCg1HgG3yQcRNmoFXVW6sawitqjv1L4Bk3cTFwi
 BhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFsVzNxUTe0zVj2n7sBsxSG3rvMdpK3tm6ziU6/sth4=;
 b=nIfBAdAYKgKmxEN9A3uhBy0B6HjwEKKmbwXh7xRBZjtBX/+RrJ97S8TFPQZi4bZNcG
 9UKIOKlnK9anTYF3AFJYLdGFChKzJzhSmTbIUrHnpDTzZsTnHld+pnNwARUQtyaKMZ1q
 zphJqbUdi7iS3gnddZzXW5eB57sSQwpSAcaOyjWZXShPuwiCtndRfd1NjskehstVN5G6
 /zEqZKCNW1eWfhSvos0R/RqSdnjFUhYJMKZ1eUcPaZDrmmnsaP9vYomZ8KJaC97eoEj4
 DxS/Ysn9vDYCU49YNOoEkb8O7Ngm65QOvoU6DFcMTsAnZqyVCkqe6W8NZIGCySjTTlaa
 OgWQ==
X-Gm-Message-State: AOAM533zlyPz0ZDKqc5MYJHqFL09OT0ViJwIsmmqWAqVmIMPndh8HVdC
 vHPgBPN2bA5vuesaJZaldZ0=
X-Google-Smtp-Source: ABdhPJyGOu4P/Sk2o4zR/guets/zV0FzqSwb8tkgl4GngGpSOa/a9EAL+b/sfF4ReYEMO38qI899Gg==
X-Received: by 2002:a05:600c:1ca0:: with SMTP id
 k32mr31048506wms.74.1639321215876; 
 Sun, 12 Dec 2021 07:00:15 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-6ebc-0100-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:6ebc:100:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id v6sm4284789wmh.8.2021.12.12.07.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 07:00:15 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mmc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/2] mmc: meson-mx-sdhc: Drop unused
 MESON_SDHC_NUM_BUILTIN_CLKS macro
Date: Sun, 12 Dec 2021 15:59:56 +0100
Message-Id: <20211212145956.1423755-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
References: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_070017_442026_F39028CC 
X-CRM114-Status: GOOD (  10.08  )
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

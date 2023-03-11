Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEA4C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dyw63UGzAADw0uGsLr2niE6+a2OmrJ4UPLzGPerycm0=; b=Rz9tRalrHiOvTH
	XNl76Y3W21PK4bhs9KEOehx2VTm7igzCKcT0IZDvy5t/oDqwS+9KneWKkmif23RWiYiaH7Li5dZPu
	zFee5dhm280Ki6vGeA5VssaxGEJ0OchgsnvoN3IRfofHhEQf9w9LCRhOPdG9gb7UMpIVeSkrm0QzP
	ajPXBS7GZ1HtL5YuQJMQN5TMJHyMDcbpTpreq4Sfvcf98by4DQARUE6jRNBpiGQvwAAfFTM1rcQ1v
	+kk+TjomKkOvUqYpQn4DrNrl0Kp0UF3AM22VUQ4Yg+kqeAzN2tq4vS8Dvq8JgglnTUv5C5TMcHn0y
	P20Nqj+SFrQaIF1fdB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7gW-001OXC-8x; Sat, 11 Mar 2023 22:27:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7gS-001OWF-O4; Sat, 11 Mar 2023 22:27:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so5611453wmq.1;
        Sat, 11 Mar 2023 14:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678573642;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkJp2eQU+ExfF0KULASIZkwRu5oZ8n8SVM659vX9mHo=;
        b=lbuJ+7x1MA+h/dKfSw81vTMEze+95PO7Mf4QMzOAmJjnFDcQ04SUj4EGtOuHtD60TO
         yB0QCymlEJ0g9QVQZ9f/46N7RlQwfSyZYinsh5XdNMcb+KSM1DwO5zjV91dZ1p5sy9KK
         TqHBK6vfsu8MDunYJXPflzGvAF1o98NpyxqjUK+E38aXEjEZKgPrQFjb3mIgVQQ6hczX
         0JfsueMnqswQLIPnVnlwU5hkdLEKmG31J2OqLZohBoIuJPLcSNpGDOmbgFhwinPikmJQ
         l7seyv6JTKROkvTxuRMNYrmWD85TzPyy26ze+4GnPiJbrMojyxO3V1WkILMOCHOlVDm7
         XyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678573642;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AkJp2eQU+ExfF0KULASIZkwRu5oZ8n8SVM659vX9mHo=;
        b=yoAr/euiKYEF4vZn401rQdipE8QSN+sbyS7A3UF4v7GGb6WytSVa92HB8L/kP70+Ut
         2FZYH+i59mymXiJ0j0p32DW4mWJ619RrK80jGVUS8J6Dx+8o4xO751RYDhvq5NTTAYml
         gNd0gJb+KIj0bnxJZBf5s0oj4LQWnUBQ7LStdcFB5D2lMcX3nXFWbzJ9tmMASMHsE/vp
         VNaesNN7vfyeflAsX/lP/mjAx0l+ym+FTeUrmYbr6tIYNOhpSLGnO5qV8sgqjhef+pD7
         23PpWPqio4tb2Ylt2yVgUoUR9lzPCs0gWDcjLEFFpYeJSwb6Ds5cQItsW3fXBq7BETSr
         UpGw==
X-Gm-Message-State: AO0yUKWLhae00yJqMu0JqdVASCOOZ/HWtVeKSM9b2q1qZFaiZZFlQck4
	tRwG5v5C4vDDwb18hg6Ppug=
X-Google-Smtp-Source: AK7set+ckb9zNk2lx2eD6Kxng1xXGiWMSX3COAHoKhx1wY6M4OBI6oa48ASD1Jw5Bm6j92WJmgIQ1g==
X-Received: by 2002:a05:600c:512a:b0:3eb:55d2:9c4c with SMTP id o42-20020a05600c512a00b003eb55d29c4cmr5453272wms.16.1678573641711;
        Sat, 11 Mar 2023 14:27:21 -0800 (PST)
Received: from ?IPV6:2a01:c22:7697:7600:79dc:4e28:a7d7:a00c? (dynamic-2a01-0c22-7697-7600-79dc-4e28-a7d7-a00c.c22.pool.telefonica.de. [2a01:c22:7697:7600:79dc:4e28:a7d7:a00c])
        by smtp.googlemail.com with ESMTPSA id k17-20020a05600c0b5100b003e1f6e18c95sm3945031wmr.21.2023.03.11.14.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 14:27:21 -0800 (PST)
Message-ID: <858a592b-ebf4-99b4-74fc-21b4ad3382f8@gmail.com>
Date: Sat, 11 Mar 2023 23:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: simplify usage of mmc_regulator_set_ocr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_142724_836234_4FE04061 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

After 087592395a96 ("mmc: core: Allow invalid regulator in
mmc_regulator_set_ocr()") we can remove the checks here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 2b963a81c..28e04dc4e 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -604,8 +604,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	 */
 	switch (ios->power_mode) {
 	case MMC_POWER_OFF:
-		if (!IS_ERR(mmc->supply.vmmc))
-			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
+		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
 
 		if (!IS_ERR(mmc->supply.vqmmc) && host->vqmmc_enabled) {
 			regulator_disable(mmc->supply.vqmmc);
@@ -615,8 +614,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		break;
 
 	case MMC_POWER_UP:
-		if (!IS_ERR(mmc->supply.vmmc))
-			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
+		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
 
 		break;
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

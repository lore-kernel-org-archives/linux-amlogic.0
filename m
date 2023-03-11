Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E3C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuMSuEPFz9Zl70hIoXvboJk20IwcvZNOj1Hhq58r0r0=; b=zU/Fx9CFljRdT1
	3NFKHHqjLOnOnLErj8DtkYAWPFQ6fA4QtqfsJ7McKaysOPtp2OaB0fuRtgRm7VVPsGOG2JN+68u3v
	g+GNODxjqBTbH1wSPToKhCu+85+i8wEEUv1z+m/5N0jC+C7s5IQAxo0wIxINSzYDt32T4XX0/pS7+
	Kos+XBICdgFUjwgBk8bQV4/P21lniRUVhqQ12QiENi3xhvvUyIdJQCfJFHdrxU6mv18Nw9eNd0WuN
	vkX5r/KxmduwQ4xzcVWmTlNYW/SIxzIqz3R0+gBuuJeTPi4mX3r2zZWqXGgGA4a1BJO9PQHMJIh2Z
	sXFO6zkR7UKOd0CYfIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7u9-001PiA-W5; Sat, 11 Mar 2023 22:41:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7u7-001PhN-6b; Sat, 11 Mar 2023 22:41:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id j3so5629978wms.2;
        Sat, 11 Mar 2023 14:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678574489;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvi3jPUfvsG2XAyxzKd1y6BonpPYutSXSWHpo/fL0wc=;
        b=UlBqPGHn+3ofxU+WKh3yGDSgIzg2cKgA6CYZLwZ/bK5xcl2Y9xhsfNj4xsNj6T91zE
         kioPWV+y+s/EJ3uaHP40JlZf+NReJ8Gw0HHE2y5MXDZFuXcj/sS7TzsnYI1Qe0k7NcS8
         aNTwEMDt/jNFmxb6idkfRb/iOD3kNlbHBVW9LxUcOHMrz2r2QfKw4x9JQ326Ko0hNUlv
         /dQ7kVmnX3Nr4wnol6Wqg6di5zAAMvhhOx+OcCnuuGqC3pTM1lA7bqf0ILQrRKS0jvkQ
         jTbPPsikDrN9/M671jHlOj670cKsdKdFfXN0x0VCPzAs0qL4F/MqljMZSHC2POZSbEgh
         9+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574489;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvi3jPUfvsG2XAyxzKd1y6BonpPYutSXSWHpo/fL0wc=;
        b=4TtlpBW2xje4AXioBziVu8d03A233bN3FvvoXFlQhA6nsMtfTjq/FsZz3sguKffvNY
         +We91ULaq2Q9bKLpKIeTcq1dlcWsCAbP0oAp6POdTqplkQn8hA5exiWsi/iDzRdcCSSi
         msZ+r/iypRYJMukWleqL9r5Z5nNwYyfouOb5mj2MbQuwreRb446Jh8uIaovVkTNvH0RX
         kIvHDHvLwKnPhzJ4xff3dRCg6yYlNeaPTHHaaXalSjkk3gV4b/c0FtUZ1/WmgoPUePcs
         VB8Fv7ocss7XNGPruQ/84ZTkXjaxcVZpHtR/k7CNDlkmzvRlxSC2WFV6wa8TVUxuTgb7
         Dwsg==
X-Gm-Message-State: AO0yUKVHBTDw9AtIkgL2J/N3t0Y+1FeReyEaV607r1tkf3mVZczokuIV
	/PtIDNWVfjpowHWI0SjZo0w=
X-Google-Smtp-Source: AK7set/RS/KQURYnNMFxCihTikNsE4hDaQL7PcvQmNglCk3NS/q4wQuwccfe37QcVjfQxoCpwaPQgQ==
X-Received: by 2002:a05:600c:5492:b0:3eb:2f3b:4478 with SMTP id iv18-20020a05600c549200b003eb2f3b4478mr6924348wmb.15.1678574489292;
        Sat, 11 Mar 2023 14:41:29 -0800 (PST)
Received: from ?IPV6:2a01:c22:7697:7600:79dc:4e28:a7d7:a00c? (dynamic-2a01-0c22-7697-7600-79dc-4e28-a7d7-a00c.c22.pool.telefonica.de. [2a01:c22:7697:7600:79dc:4e28:a7d7:a00c])
        by smtp.googlemail.com with ESMTPSA id b12-20020adff90c000000b002c71d206329sm3418842wrr.55.2023.03.11.14.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 14:41:28 -0800 (PST)
Message-ID: <71586432-360f-9b92-17f6-b05a8a971bc2@gmail.com>
Date: Sat, 11 Mar 2023 23:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 1/2] mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
In-Reply-To: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_144131_277737_DC46A113 
X-CRM114-Status: GOOD (  14.13  )
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

There's a number of drivers (e.g. dw_mmc, meson-gx, mmci, sunxi) using
the same mechanism and a private flag vqmmc_enabled to deal with
enabling/disabling the vqmmc regulator.

Move this to the core and create new helpers mmc_regulator_enable_vqmmc
and mmc_regulator_disable_vqmmc.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/core/regulator.c | 41 ++++++++++++++++++++++++++++++++++++
 include/linux/mmc/host.h     |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/mmc/core/regulator.c b/drivers/mmc/core/regulator.c
index 4fad81cd5..005247a49 100644
--- a/drivers/mmc/core/regulator.c
+++ b/drivers/mmc/core/regulator.c
@@ -274,3 +274,44 @@ int mmc_regulator_get_supply(struct mmc_host *mmc)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mmc_regulator_get_supply);
+
+/**
+ * mmc_regulator_enable_vqmmc - enable VQMMC regulator for a host
+ * @mmc: the host to regulate
+ *
+ * Returns 0 or errno. Enables the regulator for vqmmc.
+ * Keeps track of the enable status for ensuring that calls to
+ * regulator_enable/disable are balanced.
+ */
+int mmc_regulator_enable_vqmmc(struct mmc_host *mmc)
+{
+	int ret = 0;
+
+	if (!IS_ERR(mmc->supply.vqmmc) && !mmc->vqmmc_enabled) {
+		ret = regulator_enable(mmc->supply.vqmmc);
+		if (ret < 0)
+			dev_err(mmc_dev(mmc), "enabling vqmmc regulator failed\n");
+		else
+			mmc->vqmmc_enabled = true;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mmc_regulator_enable_vqmmc);
+
+/**
+ * mmc_regulator_disable_vqmmc - disable VQMMC regulator for a host
+ * @mmc: the host to regulate
+ *
+ * Returns 0 or errno. Disables the regulator for vqmmc.
+ * Keeps track of the enable status for ensuring that calls to
+ * regulator_enable/disable are balanced.
+ */
+void mmc_regulator_disable_vqmmc(struct mmc_host *mmc)
+{
+	if (!IS_ERR(mmc->supply.vqmmc) && mmc->vqmmc_enabled) {
+		regulator_disable(mmc->supply.vqmmc);
+		mmc->vqmmc_enabled = false;
+	}
+}
+EXPORT_SYMBOL_GPL(mmc_regulator_disable_vqmmc);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 812e6b583..461d15438 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -450,6 +450,7 @@ struct mmc_host {
 	unsigned int		retune_paused:1; /* re-tuning is temporarily disabled */
 	unsigned int		retune_crc_disable:1; /* don't trigger retune upon crc */
 	unsigned int		can_dma_map_merge:1; /* merging can be used */
+	unsigned int		vqmmc_enabled:1; /* vqmmc regulator is enabled */
 
 	int			rescan_disable;	/* disable card detection */
 	int			rescan_entered;	/* used with nonremovable devices */
@@ -598,6 +599,8 @@ static inline int mmc_regulator_set_vqmmc(struct mmc_host *mmc,
 #endif
 
 int mmc_regulator_get_supply(struct mmc_host *mmc);
+int mmc_regulator_enable_vqmmc(struct mmc_host *mmc);
+void mmc_regulator_disable_vqmmc(struct mmc_host *mmc);
 
 static inline int mmc_card_is_removable(struct mmc_host *host)
 {
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

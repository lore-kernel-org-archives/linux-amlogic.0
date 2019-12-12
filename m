Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CC6C43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 15:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5FBF2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 15:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szXLNECM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rdw2uwGB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5FBF2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h6dpQlSWIx551yGNAeNAdU+iXcMjES9hFecnE19+/Iw=; b=szXLNECMuvL7IvVLwQWCFVYe5w
	EleWDkCIce0irfmscPM7YKiKRNUO/afGSbwllYY1zPQOfkpFeTp3bbxeEB0RDa9YvduJd137NwyXS
	nktZu9YECgrEmXFsZFmLUDEj4uQqGC5xnL+iiEm5rROgW92zwtN3VHwg2AJ6jhWOGo8dkET6LmMnu
	+7vu2kcJi6YRS3SoGkTvviVvqcWIR9mv36qQ63yVe5dt/t5CrHcDX6Fw760d589xEUb+SWffDRigp
	7ZRDe4bWn538F/pJZt/MZhBqpsAudFwmUzW6tBHV8RrS90DRYB1pq1wK4tTf/kfSRHUkI6AI/5ugs
	KOlz49EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPwz-000839-GI; Thu, 12 Dec 2019 15:00:21 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPwC-00065y-8H
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 14:59:34 +0000
Received: by mail-wm1-x343.google.com with SMTP id p17so2852606wmi.3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 06:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wL1S1bgqlZTjVQetMFkk5eNUJ/UNdvXmJ2Kwf4J4AxE=;
 b=rdw2uwGBHujHLxO2VyLqw+p1RAJwg1bqLq7hEkKjaQKD3rskfaMQiUD91Ih87dEaAe
 WAg9407///dvCsf5zVZ1muxNJ0UAIyZAnR2s5zzwCss6z6nWBqEYQoFVuMydZg6p28dT
 TxQWqQeLGTBAzQUw4zxlXSaHvfwNXgSkjvba3egg28CqA8D9g+0rJmVKaSnkfn+JmJxO
 rHfXvzNyVmrSI6n5FUt7KHcBDOCh6sHr3/H+6fpbIMb5yjnEOXeWrACPlyoe3suFyGH4
 aGzkJttL4BZZ3jTuQpcds+iZF3UaIVKK9Chu1wro1nu2J5pfXJozLmGaoSYlW32ORDt6
 aCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wL1S1bgqlZTjVQetMFkk5eNUJ/UNdvXmJ2Kwf4J4AxE=;
 b=PQ9PcACCMNzWTHyF8N7AQ6hY/pZs0KQPkYufmYIvpKxRYdS00iwOeksqrpovzcQw3d
 8QnRerUkydTYUIg9UehIH4lGbhTSHAjg9wslKz9KctRZbAtlApiAZpCrv/ZDY8OzbqZG
 70OlfLgW/nOiO28FaTY3L13Qx/GEG+aiN7wHJTAdDEjdmG43IAyuS9GS5g5Drh/ESFm3
 WQbwYghkFNiKaGeIhAF6rZ7CYZyHNGiKti2yP+patB/6C1PwXYPZ1hO0zihxK1JaglRG
 dX/YF8PPb7/zMP6bFRytrlwZMmbnm3WUhkXDGhcfnyuocuaZFZrPTl26SW5HbAnYLMkC
 QChw==
X-Gm-Message-State: APjAAAVVPhp0n5xPnOTVorFgHUL6e4eZQ4sX22hAQIymn83A2U6Olfa8
 MKzQ8UnLCZ3FtzKHU0QeFxvjKg==
X-Google-Smtp-Source: APXvYqw+cVD/rdJCHti73dxy0wOlGDqwQNjwezLmwIy6Ao4DWzhFTD+ajeIK8+jSK/wySrgNk1ajCw==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr7227703wmg.38.1576162770429; 
 Thu, 12 Dec 2019 06:59:30 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 06:59:29 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
Date: Thu, 12 Dec 2019 15:59:25 +0100
Message-Id: <20191212145925.32123-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212145925.32123-1-glaroque@baylibre.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_065932_320723_9C890BE9 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add register configuration to activate wakeup feature in bl301

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3b39e875292e..d441b5a62b0c 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -25,6 +25,7 @@
 #include <media/cec.h>
 #include <media/cec-notifier.h>
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 
 /* CEC Registers */
 
@@ -168,6 +169,19 @@
 
 #define CECB_WAKEUPCTRL		0x31
 
+#define CECB_FUNC_CFG_REG		0xA0
+#define CECB_FUNC_CFG_MASK		GENMASK(6, 0)
+#define CECB_FUNC_CFG_CEC_ON		0x01
+#define CECB_FUNC_CFG_OTP_ON		0x02
+#define CECB_FUNC_CFG_AUTO_STANDBY	0x04
+#define CECB_FUNC_CFG_AUTO_POWER_ON	0x08
+#define CECB_FUNC_CFG_ALL		0x2f
+#define CECB_FUNC_CFG_NONE		0x0
+
+#define CECB_LOG_ADDR_REG	0xA4
+#define CECB_LOG_ADDR_MASK	GENMASK(22, 16)
+#define CECB_LOG_ADDR_SHIFT	16
+
 struct meson_ao_cec_g12a_data {
 	/* Setup the internal CECB_CTRL2 register */
 	bool				ctrl2_setup;
@@ -177,6 +191,7 @@ struct meson_ao_cec_g12a_device {
 	struct platform_device		*pdev;
 	struct regmap			*regmap;
 	struct regmap			*regmap_cec;
+	struct regmap			*regmap_ao_sysctrl;
 	spinlock_t			cec_reg_lock;
 	struct cec_notifier		*notify;
 	struct cec_adapter		*adap;
@@ -518,6 +533,12 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 					 BIT(logical_addr - 8));
 	}
 
+	if (ao_cec->regmap_ao_sysctrl)
+		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
+					 CECB_LOG_ADDR_REG,
+					  CECB_FUNC_CFG_MASK,
+					  logical_addr << CECB_LOG_ADDR_SHIFT);
+
 	/* Always set Broadcast/Unregistered 15 address */
 	ret |= regmap_update_bits(ao_cec->regmap_cec, CECB_LADD_HIGH,
 				  BIT(CEC_LOG_ADDR_UNREGISTERED - 8),
@@ -618,6 +639,13 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
 		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
 			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
 
+	if (ao_cec->regmap_ao_sysctrl) {
+		regmap_update_bits(ao_cec->regmap_ao_sysctrl,
+				   CECB_FUNC_CFG_REG,
+				   CECB_FUNC_CFG_MASK,
+				   CECB_FUNC_CFG_ALL);
+	}
+
 	meson_ao_cec_g12a_irq_setup(ao_cec, true);
 
 	return 0;
@@ -692,6 +720,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 		goto out_probe_adapter;
 	}
 
+	ao_cec->regmap_ao_sysctrl = syscon_regmap_lookup_by_phandle
+		(pdev->dev.of_node, "amlogic,ao-sysctrl");
+	if (IS_ERR(ao_cec->regmap_ao_sysctrl))
+		dev_warn(&pdev->dev, "ao-sysctrl syscon regmap lookup failed.\n");
+
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_threaded_irq(&pdev->dev, irq,
 					meson_ao_cec_g12a_irq,
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

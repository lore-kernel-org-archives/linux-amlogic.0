Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF78BC43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:29:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8511822527
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWAlgCsd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nZ9BQpSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8511822527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5AL99e+8gfAC91pCGYQiZJ6gTcYiG6Yq9pBKQnKd+vQ=; b=uWAlgCsdjnY/Ogtky/restJQGE
	RXfav5NWNGAncZPIBov+kn39lPJ71QwVJssCmG+HaBDCinzCKVhX0hPJ0DuG0yCvV384Mm22YV/Xj
	Yb9cQOdAp9WU2zvNtMu3w7ZVWTeJSj1obZar1FyVMgl/iEAWYuwJLTNA0zDzGQmMpAjJlGtlRRjGS
	wutEZ8rXPQWEH4RtUJzfl4ElKuTdeTeBXGrb/nxkZM2VfHd4tR8XE99sXfv/sz3EdzLo3DH0mAoFb
	mXZaenxNJ+YJ7Tctm4i6ywosl69xr08Bc4YlPiNz5MrKauhiQg1zg6WIbsKW0nVxMZ3T+9SZhA7Aw
	p/VItDSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifl29-0000R6-2y; Fri, 13 Dec 2019 13:31:05 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifl19-0006sn-S8
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 13:30:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id f129so6578822wmf.2
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Dec 2019 05:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VXzCIVNIyEIalSwrDVu1JlYLLJVG8LUdZccZXShpYsw=;
 b=nZ9BQpSuWb9dDeJykWlitqmovokkBjW/QjlPbblKCvaHm0mccziJSL6ajoVWDfotQt
 XnXJBWVcWNLc5JqFW+o9Tl23W+/w+x5W/n0yEqrgk6z0/klrDcJ9SfNGCgMevbuYx1lG
 PrEHbPePlNDmwl725H0hAvDzGoMTkkksqbQhhcoCR03XcDFG3miJ7j1meXOF47Dlzqj/
 PhoneeU8HryDHVuUxDu+S7zYoeFUXDwS9XIFegBzSCM1Iacw2SqzmaHN/hkDNLrrDDuR
 oN6lS4cBVlahfCWW3hMbLY9yQzsgKZp/9i5oJV08NN4dEaKFVgf18DKoGYD6cvDudgHb
 zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VXzCIVNIyEIalSwrDVu1JlYLLJVG8LUdZccZXShpYsw=;
 b=TgHh8P/BlUQdng4lJ51eyeWe0QbKqgfiprT5iQXI72g66LFZhplO6GT538RfUCrg9l
 vIRnnFkHQMiYHJqKcM3p9Agmnklqop+KXdYazw3o4E52kflz1U/+GyL3+pr2lO2dMl2o
 WJ2QOm/BJLTEM3rTIlF0XtaxqlrSi08utZ7LPMICAsRQcS2TCkapQJPxZKm7XWOV8lF4
 LUjPkRIXqd0sdM+4flS2wAsrFMzF6HiDpJpSs/+AFTsEb5e3fxdhmrNWtvLS6CtGUfFn
 YC2kOaoYYd1bNHv6CJNR3kc0kBQpo67xhdNCbP+CtdiISOLjIrxMA4c2Nc8WoHzH3ODQ
 IFew==
X-Gm-Message-State: APjAAAXaT9y9pzpleqNN/k5XZ+TRK4Y+JdC5kaeiyslXrDUur8myRo8U
 GwTvT5FHDc+V9csa8G7JRMF0bQ==
X-Google-Smtp-Source: APXvYqySye0Al7ofzrrLCFePLmE9J5EDhkpPFb1QMhV+Eca0/HHqNuayvmb667XyzUHwTfXeZTWmWA==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr13635797wmd.80.1576243802038; 
 Fri, 13 Dec 2019 05:30:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 05:30:01 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
Date: Fri, 13 Dec 2019 14:29:56 +0100
Message-Id: <20191213132956.11074-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213132956.11074-1-glaroque@baylibre.com>
References: <20191213132956.11074-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_053003_956693_2E0D9F35 
X-CRM114-Status: GOOD (  10.67  )
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

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 891533060d49..85850b974126 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -25,6 +25,7 @@
 #include <media/cec.h>
 #include <media/cec-notifier.h>
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 
 /* CEC Registers */
 
@@ -168,6 +169,18 @@
 
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
+
 struct meson_ao_cec_g12a_data {
 	/* Setup the internal CECB_CTRL2 register */
 	bool				ctrl2_setup;
@@ -177,6 +190,7 @@ struct meson_ao_cec_g12a_device {
 	struct platform_device		*pdev;
 	struct regmap			*regmap;
 	struct regmap			*regmap_cec;
+	struct regmap			*regmap_ao_sysctrl;
 	spinlock_t			cec_reg_lock;
 	struct cec_notifier		*notify;
 	struct cec_adapter		*adap;
@@ -518,6 +532,13 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 					 BIT(logical_addr - 8));
 	}
 
+	if (ao_cec->regmap_ao_sysctrl)
+		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
+					 CECB_LOG_ADDR_REG,
+					 CECB_LOG_ADDR_MASK,
+					 FIELD_PREP(CECB_LOG_ADDR_MASK,
+						    logical_addr));
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
@@ -685,6 +713,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
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

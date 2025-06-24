Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC4EC77B7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jun 2025 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vCBAgJikfbn0PxXQcVzmhHWPjswCeGt8aklnFTz+XX0=; b=w9zPAvY5sjB9wx
	f6a9wX+2jWnYOlc1ugliRrnDPGT0PMQ3b2RFwjZkrsfrpCzle6KS0btP3MFgjAf3w0FQ+kr11up5j
	kXYiHrhhh2TWgRjdBifsP+3MVfIXrYIjAyZSIr1JLt6b0qZjtUViUPV4nQCV4FbaZpXHhzUmvh5c0
	6BbhtkkdzCYxJAymLb+GIujTu/zOkRxEkXPMvbWtDiJGngEuQOgwQ3/e46h3507aOf/af8nccSbxJ
	xuZpIy3OtljMegMaFu3lthIgq90erCfZmT6zcCEeo6GcRVXytpXThll5SxolECgxlwp1cV7NbUXVV
	ZgNIdf1Qu3YdSg/qpeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAzR-00000006r5C-1uXv;
	Tue, 24 Jun 2025 21:15:37 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8ga-00000006YB7-0gwR
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jun 2025 18:48:01 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30f30200b51so71171601fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jun 2025 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750790878; x=1751395678; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ4aYOtUH2D67botXZIPmEAuCddc1X0QVoLWqw3GU0o=;
        b=sOmKickr9a+L+6+ZRtO3qgdURoJU2wX6ueQo6DKkHtGY+yaeYjhDWAvMcv7iOlRhva
         3xtI4+VfBQaCWNEOL39DNp3Vb1jCXBgq3WKNeSCT0yzjvRHeceg5lRPUpaNYY3Qbvzad
         tKE6BKuxuFLNpTZ/Vgh4SBA54w3HZNSHdJtyfJqZXyB24et3UW03ZFKrc0CPp28+vxia
         YHtcfoWWssl8RwA/XS+JI0okKSU9+v16RCZmAtl4pWehZSqb/DjJ6iOyOjsGSrcf/WiP
         ss32sCRFSSk8esQWmYf+BEtiQz2V4CV9ez8xDkU4x47rAzwhjac819IoyZ7xI9moSfnX
         /awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750790878; x=1751395678;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ4aYOtUH2D67botXZIPmEAuCddc1X0QVoLWqw3GU0o=;
        b=LynAyvOIPfRzzTyt3ICO+2PXF1ztREjMMeDEOmUpxr1bO84l5BMCaPnHd8YfxKeBt3
         4hH97tL7weP86eDw4zJcMzX96Fb2mAqm3Lm9FgSxx0CQQg3beG8KJnC5vcX0Ei4Uum9o
         eQuCBj6F00YBE3xrfuNYkMl531nWQMim9mXjQ14NQBaQ51Fuo0Ev0dBGeOBLOEp51gHv
         hNBsnSinn9hkd6lwDmk3nxQqXeZ/1IDeuJUjc7ZGmqWvvIBBsD4+6bkg/9a6LUmM+LRa
         RQtNmgEonDHYHvvkO1sBy+3GbjW/jb5Nmsp1xkLq7DC/7jrByZTyt3d4XFYDaVrGJ2TG
         pzcg==
X-Gm-Message-State: AOJu0YyYj3g8e3NwUCNa94fyv0UfQD9zAep4UkwjS52HF8VDMAgEgCiA
	vEMXSA9GZw3sUlnIHUcpoSR/pDplrvybKW/9ce6xH2bgi4Ja8QCgvbW2+cDJlmZ8+B4=
X-Gm-Gg: ASbGnct8eGalSdhkhdqLJEzMVKi0W1z8N6h+3sguumPlgdUC3VRYSNcAX5iLuHzbuFU
	69l9HYG3fiayeJMJVY2XtoT0GKP/3t54PHTMVPVhMdSzDtwEanHtIYytzVJf40zx1VNHnQiDDE+
	EK4+Feo8uzf9ymu1ZTjXBwgMGLV3kuRhdpom5njk75vxbl1QQyUGiOOGW+mjzxJJrDuMLU3pkTA
	1l+XCPo1tvr8l9k8Cy4ILreqQwz99bfQy+PWNCcm02aK3bM4Q6uL7TDDNKCK/PGJeCsvhf4tDG0
	ipin/CYIbbarDlnuOdv6ujQ1BSHguuBxoNHESSenixBN63BuTpG8t9YgQnn1GSWfXRO/2+PV
X-Google-Smtp-Source: AGHT+IGiNY2UE/DVqUZK41BbE2ZhZRACPdbBezmjb1wgmyqrkO2QOdl2aBb163iWHVwOIyBSpgPhaA==
X-Received: by 2002:a2e:a7c1:0:b0:32b:43a3:68a1 with SMTP id 38308e7fff4ca-32b98cb3b7dmr52071881fa.0.1750790878230;
        Tue, 24 Jun 2025 11:47:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dbd22sm17466651fa.90.2025.06.24.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:47:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 20:47:57 +0200
Subject: [PATCH] pinctrl: amlogic: Staticize some local structs
MIME-Version: 1.0
Message-Id: <20250624-amlogic-a4-fix-v1-1-03f0856d10cb@linaro.org>
X-B4-Tracking: v=1; b=H4sIANzyWmgC/x2MQQqAIBAAvyJ7bsHUlPpKdDDbaqEyFCKI/p50n
 IGZBzIlpgydeCDRxZnjUaCuBITVHwshT4VBSdVIqwz6fYsLB/QGZ76xdaNxWlpnlYYSnYmK/of
 98L4fhtx7lWAAAAA=
X-Change-ID: 20250624-amlogic-a4-fix-97b473067623
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_114800_222369_6AB4D76B 
X-CRM114-Status: UNSURE (   9.72  )
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

Sparse complains:

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:126:24: sparse: sparse:
   symbol 'multi_mux_s7' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:135:28: sparse: sparse:
   symbol 's7_priv_data' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:140:24: sparse: sparse:
   symbol 'multi_mux_s6' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:154:28: sparse: sparse:
   symbol 's6_priv_data' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506122145.wWAtKBoy-lkp@intel.com/
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Fixes: 1f8e5dfddaa7 ("pinctrl: meson: support amlogic S6/S7/S7D SoC")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 2541c864086d6a5a81737810dc3a65eb15fb31d8..c8958222df8c736a79155456594e358d3afbfc31 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -123,7 +123,7 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
-const struct multi_mux multi_mux_s7[] = {
+static const struct multi_mux multi_mux_s7[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
@@ -132,12 +132,12 @@ const struct multi_mux multi_mux_s7[] = {
 	},
 };
 
-const struct aml_pctl_data s7_priv_data = {
+static const struct aml_pctl_data s7_priv_data = {
 	.number = ARRAY_SIZE(multi_mux_s7),
 	.p_mux = multi_mux_s7,
 };
 
-const struct multi_mux multi_mux_s6[] = {
+static const struct multi_mux multi_mux_s6[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
@@ -151,7 +151,7 @@ const struct multi_mux multi_mux_s6[] = {
 	},
 };
 
-const struct aml_pctl_data s6_priv_data = {
+static const struct aml_pctl_data s6_priv_data = {
 	.number = ARRAY_SIZE(multi_mux_s6),
 	.p_mux = multi_mux_s6,
 };

---
base-commit: 62be3d6e481122f02364993fee8322a681072918
change-id: 20250624-amlogic-a4-fix-97b473067623

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

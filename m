Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC991C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC10D214AE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UreOBG8v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="u3zZtz5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC10D214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLGGBp2qZ9Ges9cLbv2FlXUt6Ks4eDoDVmyqxwW6jw4=; b=UreOBG8vzAiWcM
	7AdjfIsUuDSql07oNj6LzDf/KhkHIzD2+m8jTYN7A88skToRdEV/jKAn1/eLiAy21KCZLwPT1DWL2
	1bIQauJbl7R9SdNo+n7CQFVViXYLydAph19xY9bojYQMitteaOGAPm/Twgu0FIG5LStqAvj67/Tfs
	dAgNHo1cMx5ROkxgdh4CFwm7hRZindQDshnbh9O5wc4ro2HE6IhjHxey/QHk8v3CsApgzTSD2x+qm
	uRDTucAFayOfFC1RD/9ojDbwe7IZ4utz3F2tBmguX6r8gTq5r3OVsQzH21jqG0F0U8OmxLk6FTFS8
	YWygxVbrlhIyxKHMON4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIvbz-0005Cp-Jz; Tue, 23 Apr 2019 13:37:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIvbU-0004Vi-8z
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 13:37:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id 4so108024wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyIwurtaQrYXM2ZMvHhJOtIlHoFi3EeiRaMRxuyOY5A=;
 b=u3zZtz5sFySkpfmLlMM2+qPIPYjsS1x2MbKbjd/6XHeBt7UGtzwLcVeGRCcuXWUpNg
 Z6qEWd1UOYpVkB+jVJp2lALjEEDH2Aivt2mQmQpP1USZoqi2TEeVTmMZqD22B3f1DbHR
 YlwkIoPBDC8w/8dvfCyC8jc8BN0CUkJhPjf310EBWvsG9yJgGRj2XmSf5cIl5XZGI00e
 kLUoajMrbt4mZmUFJxYeYmYNkrq3qyPsOg/3UaxDIMePVClxkeLN+ZMoJ826Wpiy6EZb
 c1hdRbpII1lS9wu9vYnWx7r7RCa2s74WEGScGrf7TS4eocFg5VdrXN/QZTmRvt3lfJCc
 mjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyIwurtaQrYXM2ZMvHhJOtIlHoFi3EeiRaMRxuyOY5A=;
 b=BVncwX9vh/s/xgR3X8Jr0ZAa3kNBBCql9AZ/sMRMebukaU879IQsp2c1QlU38/XxXn
 fvJl5jyLBWLqgsuAGX28dXrPJnSNZhnS4iq/1c/JNFjz+6vV6W5m4ZOia89hCodlY2J8
 EiHSNOjAbl4161f12X3Ria14ioduwlwoAgjpaVL1XMbCqaVTIRZl5KERpUy9TZkaw2Wn
 IdpSzp1JgKgV4rQen2ChHmfyjaG2Kdark1VbjaNH58yvrsolghzw62uxL2OFuJb7Kd0M
 CH5tMeQI+U0K2ovSENn9WsxfR3HAQNUHRc8WBPbaGYhe4unwQswm6O63Ut7JrGb57r/N
 omFg==
X-Gm-Message-State: APjAAAUeE+LdtkF0PoM9fywFvkXe9/tXKUiUYvE2pmaVO2reOTRphpup
 MJRp7tR0h4vTTh931U9z4SXY7Q==
X-Google-Smtp-Source: APXvYqzxnHz5TKORqYjOKr1Gnz2ldQm6TU7EG8p0lZZBtL8k0/i+klnj7GmE/20OoQmset/OJJy/dA==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr2337950wmi.2.1556026614420;
 Tue, 23 Apr 2019 06:36:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z20sm13509543wmf.34.2019.04.23.06.36.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 06:36:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2 2/3] pwm: meson: Add clock source configuration for Meson
 G12A
Date: Tue, 23 Apr 2019 15:36:45 +0200
Message-Id: <20190423133646.5705-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423133646.5705-1-narmstrong@baylibre.com>
References: <20190423133646.5705-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_063656_549666_4A21623B 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For the PWM controller in the Meson G12A SoC, the EE domain and AO domain
have different clock sources. This patch tries to describe them in the
DT compatible data. The two AO PWM controller has different clock source,
but the first AO controller (A & B) can reuse the AXG parents name.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 2b03938039b6..bdf1b367e391 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -434,6 +434,24 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 	.num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
 };
 
+static const char * const pwm_g12a_ao_cd_parent_names[] = {
+	"aoclk81", "xtal",
+};
+
+static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
+	.parent_names = pwm_g12a_ao_cd_parent_names,
+	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
+};
+
+static const char * const pwm_g12a_ee_parent_names[] = {
+	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
+};
+
+static const struct meson_pwm_data pwm_g12a_ee_data = {
+	.parent_names = pwm_g12a_ee_parent_names,
+	.num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -455,6 +473,18 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-axg-ao-pwm",
 		.data = &pwm_axg_ao_data
 	},
+	{
+		.compatible = "amlogic,meson-g12a-ee-pwm",
+		.data = &pwm_g12a_ee_data
+	},
+	{
+		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
+		.data = &pwm_axg_ao_data
+	},
+	{
+		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
+		.data = &pwm_g12a_ao_cd_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

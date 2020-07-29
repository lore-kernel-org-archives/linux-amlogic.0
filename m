Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C80C433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229762053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpyQ8Vl+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XaVnRFyy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 229762053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GsE6Q++jQnjU3Muejoy5Ps8WrVrhuWVgv6VMlQknzMg=; b=VpyQ8Vl+yMjR1si3uoouTLZDn
	eK9/qD230Ep4VlyV7nHBUJfiswRjBobPLa5cU1KSMhyxlscb+J2V084a9dUiPenvBeI8WPQJbnJhh
	bpoHd+Wn1UJWZkv7rS+Ou/KBBGeu219q7HllHO70J4WpKxW6ITgvOLmbBxL2kbsZW8/raC//VQTDw
	/4ozbvFhgvMGt/rHYdVyJbTCsP1QFd37N/NwXKmPcLQ6BK9G55/llg6lwX2Amsp/ZKQjDCyzO+oqk
	8qnf9liqUoeT7BCc4TcYHaKQKNicpvVVMn3+OxQ2ia2guqcfYoAtK/3td1ktT7B1O4qDxS7llrai6
	mP4zy/i/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oGd-00036A-9e; Wed, 29 Jul 2020 15:45:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oGa-00034S-05
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:45:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id q76so2229938wme.4
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odKL8nfgi2JfYFNsaHMY4SKWdmff32MEW/xIQyAYpOU=;
 b=XaVnRFyyLv/CDI3rNrvt+N1NR94GoD23fiy/1/aev0VHbn3oeX9+0gLViXcHzcPViC
 mwlIFOWJmaj7nZtyvHYwX0VYgYAWhYlilB06hqnszYmsJEMA/ptUEBCYejYVctWNmLvG
 DaXtxBbRu5szTpoi/tqJKw0GDefnpfkG2ef3NB7uRsoJKp358/WBuGwCaFgmhWSEt1Xb
 TdyN1A3/uSX2bqsM9cPHzZ0isZY56UvuXLD7Dfz5VjSyrzzma3a0D2RYNurND6ap+y6s
 vdzrI/4KXtoIAm5gIupf2DJq9ssRajx8xEWOiGD5gNisR6FFXhdyhHxyuvBdWbPxj3Rl
 LPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odKL8nfgi2JfYFNsaHMY4SKWdmff32MEW/xIQyAYpOU=;
 b=IuesECNebsaN0cOmiWHJ2xYhvLI1McPTSIogd8yEfE8aHf4tvky3IAGju98fum8S64
 Uz+CyaXVpfT56zjfnlgGHtq9XPXmSA0rN+5H4ZLLuGlwDb8J0tGaDiATfmTC8A/TUWnH
 UgZfBEMoXUY+A7WJhSTtIswsf5QvtQ03Im1USMxPzUgrvVTsPeg8iIIYpSTmQUmK6+7t
 BzKl2AVLg5ZLIAT7SrxyZFyu37fs+UvNJbBnQ3c7FOeexVrVw4aQQaVm/+lOmzjQ3f9p
 kKvXwK6bB9k4u9hR2y0VhrtV3jHI6EamcrCvDD3sieLMPbYgwnkrCJeSKQgz6li5wQSK
 w3qw==
X-Gm-Message-State: AOAM5308CDEBAdP8UrfpVao128tTwShcn/qCAMpM7JTQpMYtYndLTMsx
 gGUSvC62/2u/GFr5rvSdH9AZdw==
X-Google-Smtp-Source: ABdhPJwJufUM+fr/ccstncgAq56W2HRh9FWgpXsZ5IRILScKbhvt1s8lTYaYBt7VHezKJF6mEIM+8w==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr8667635wmc.167.1596037515187; 
 Wed, 29 Jul 2020 08:45:15 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/4] ASoC: meson: axg-tdmin: fix g12a skew
Date: Wed, 29 Jul 2020 17:44:54 +0200
Message-Id: <20200729154456.1983396-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114516_065702_E56D1CED 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

After carefully checking the result provided by the TDMIN on the g12a and
sm1 SoC families, the TDMIN skew offset appears to be 3 instead of 2 on the
axg.

Fixes: f01bc67f58fd ("ASoC: meson: axg-tdm-formatter: rework quirks settings")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 973d4c02ef8d..3d002b4eb939 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -233,10 +233,26 @@ static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
 	},
 };
 
+static const struct axg_tdm_formatter_driver g12a_tdmin_drv = {
+	.component_drv	= &axg_tdmin_component_drv,
+	.regmap_cfg	= &axg_tdmin_regmap_cfg,
+	.ops		= &axg_tdmin_ops,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk	= false,
+		.skew_offset	= 3,
+	},
+};
+
 static const struct of_device_id axg_tdmin_of_match[] = {
 	{
 		.compatible = "amlogic,axg-tdmin",
 		.data = &axg_tdmin_drv,
+	}, {
+		.compatible = "amlogic,g12a-tdmin",
+		.data = &g12a_tdmin_drv,
+	}, {
+		.compatible = "amlogic,sm1-tdmin",
+		.data = &g12a_tdmin_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmin_of_match);
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

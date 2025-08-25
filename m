Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2519CA0FE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSSEGnwssdAP1YBmfyek1qQQJrFsX5LCSBJGhBfIqNk=; b=px8GvfqhgiceGs
	+bh/6AE1TmpoxpLa9M8caWAx7UTCdihFo70IkXkcz05qtozJuA/Q2quuR6k/Z5rAB1+1mBVS34lJB
	nhdfqNhfoZeUUxJJaJoP0qSOuLgDctT1zq/1xK6+5HedPVl0zNzr0NVw4aNfK+Vk5woFBA6YbQjIZ
	L/MaERUDVEbxx7duaeA6+NwMHukPBLzaK4lvOrEz8PeuufHE8TTUuJyyVsY47uCO4TuTSbiQgm8un
	L2qbclr7AqK9ogQSoxYUAPnCuq8Wwc4Pbef8TMDRlByIjEk0wVnChMFCoI8E7PmJ/iEEGrG0Co2TC
	2ZtoiE9BZi6EfFg3vD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9O-00000008WBu-1pkx;
	Mon, 25 Aug 2025 15:30:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYAB-00000008Fhf-0GC5
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so34185695e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132030; x=1756736830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=IN2TtN19D/fdwkHB0KzGpkRL8VSY+K0L962UFQgLLIJ2VK58FsjtM7sGtUef7au+wN
         hKhsqnsw6/zA0IxCCBbIDS1hw8dusBItFbfrXx4XubDAANAeg5VZIM5g00LPm3aPNzAH
         DdnA2YpiuF/IUTZ3YzuR+9fSGj85EjL7LsnEwXfiSTFv+Vrfnn5hjrgYt/dsb3iIXMIR
         4EN71ZUHOh4PYvYTLuzi+BdQNjSfFRzcBWZ4PAcoA9uOUYMC7oocQhCk51mpxNaBZzZZ
         VKUh4jVSPyKudmfO3Vqf5KERTmibyllRzzd2qmrOxBm2FXQsUoVCw+d2Tsgux0B0itGJ
         tC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132030; x=1756736830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=msvJJn2dfbiP9gc6aJzY/rXqPAFFUBHeEhjpcCyBqJ6rmD9o/2c/rRrO0jq3raAOJc
         le4lNjJnRhzhl49eMsST56mHN0nZ3yVV68znBHXnWbt/VPkCrJLDn0wy5PzI9pUhLCPL
         vT2SoFw9b9p0Q2kP2YqodwQsqrjB/w4aWD74N1JMDjqxGrT1fX0uy9+F8u4rlIVbWgF6
         Fc0vIkniqLJzaOqMPh0sRn9WA0vrWYflaAgawNxXKRlWOYbx2aQFHBoKi56TWDfZITFl
         qB6uZZh/gSjayhzEsHkl6xxvpEXdM0M/jRgSkEHsHh+cnUEN5zTe07V41jLVaIWCflCT
         MN7A==
X-Gm-Message-State: AOJu0Yx9axnm/k1UsepFcmw7aP7vShoy4D8w/nGynKU6JYsu+AbYLAJ8
	IC9h0JmFEO0VJTLdHiedeuyVEVbdeEP7SYmVDuMBdKvqAe16RtB1Oe37lhArCW4321M=
X-Gm-Gg: ASbGnctbqCngYv8MoVqMVIIRrjSreKdUViTNPkRPMJ3qDLdKFwoh0+q571Lnctkin2C
	atbqeSrnjRu6eqml3eKOXxI8lnChiHwWPiJm/OX6DemX7jaICSss+Yum9/yZyqud+pRptfQ0BZz
	8lxD/NjIp4ko6QopE/kx4dch30/E/RDdZ4bx1s5+rXg5AAJXXIy6tZAvUQITPnEmoTnF9WQPl4O
	9AXSd7Y5MkUq+fmBVtinU/tQfyVWlYV9/q0dZUhNTi7TOoTosrfrsZUIU53baNlywGuDp1qfe1U
	Cz7NMPIxEdOcc68fd8dgACFw2VjfHnu9m4tYal5TDfSpy5VzeEBAm0Z2yNkcBaDNwQiuImF5g3U
	5ORcWIxC8b9Exi/9LKUJ3vqXA8dHmH22pG2h4
X-Google-Smtp-Source: AGHT+IEPylErx21mcn6dCJV2kIoCD0AjzLCCsQU2klZrox1l+K+hy+rzX244+vSFz6N2S3mmScUSPg==
X-Received: by 2002:a05:600c:1c20:b0:458:c059:7d9c with SMTP id 5b1f17b1804b1-45b5d48ea24mr53620055e9.6.1756132029678;
        Mon, 25 Aug 2025 07:27:09 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:30 +0200
Subject: [PATCH v2 05/12] clk: amlogic: move PCLK definition to clkc-utils
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-5-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5iKLGNRbAiiV7znNVkmV2nYu93DQzEVzWcxt59v2OQ4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKy/cxvrqriA5RdgyQ8kngzsTGP4zIGETSvr
 bPIwwN/D/KJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxysgAKCRDm/A8cN/La
 hU6YD/9847LKHLtfPFP+98FtM+A/KPHuOXabho5DnlqQ4CTQm7TeTEECumy3BR3ViDcUWqmul6J
 mOcnAQ4VD/PQx47DoisFdLoyRgVYGi41vm/px3GlkNoiAoMuIbOQ1S7mK7b6Yo3bd6TARrh1yxI
 b2bXFz9x0w3hWAGTTBsDXfCyBWlUdRvSRosLINDT4bw/hFcnRljMaFx0C+8oFUMrGeKc/tblNsW
 evuqJI1g7805n992YNyaRg5OxHvkNzgwese6m7LyB+o/q/DBxPLzJuXypikMS8Ua0zCnPMMP+eO
 n5tt6cqV5DhMhAVE0bLvTxxvCRmGJZFGpe4wXSUCxZWiY08A4hLI5PVUPlnvM6l+lUOmtXU8uL1
 lVd2y0PMtirwjQ7nyoy+FY5p8EeTpFii3D3a5Mq/tgwGDGIxQUE2C0FY85NTUFd6VedNMh1I3UF
 TnAqB5i+e8vakFIzBsJU4UQXdaVIYqfYkNTOKwq8YKN8s1TMTtFoYnH42Z4WqzK6aQ+KvoG74ZT
 PwROguP/QnE9zU1S4moPZwFjiYu7Kizf0I+hI5n5/TluEiSwbiXyLsUBYSbqzbdDvCYEDjqX09N
 zB7S+wUEQ/EO+L1pciA2bfTKsUvEZWtLYGqUyQ7LUn774lybqO7VWYI9hiMuUBE6AHgYh/C/37T
 pqUsLmEEHRMIMPg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072711_115989_A0423AFD 
X-CRM114-Status: GOOD (  11.55  )
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

clk-regmap was always meant to stay generic, without any amlogic specifics.
The hope was that it could move out of the amlogic directory one day.
Even if this may actually not become true, it should remain generic.

Move the amlogic peripheral clock definition out of clk-regmap header.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-regmap.h       | 20 --------------------
 drivers/clk/meson/meson-clkc-utils.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index f8cac2df5755b0f894570305604485f54c17ea49..8e5c39b023e1334e37d5a9e0594436727f16c4f2 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -118,24 +118,4 @@ clk_get_regmap_mux_data(struct clk_regmap *clk)
 extern const struct clk_ops clk_regmap_mux_ops;
 extern const struct clk_ops clk_regmap_mux_ro_ops;
 
-#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
-struct clk_regmap _name = {						\
-	.data = &(struct clk_regmap_gate_data){				\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = #_name,						\
-		.ops = _ops,						\
-		.parent_hws = (const struct clk_hw *[]) { _pname },	\
-		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
-	},								\
-}
-
-#define MESON_PCLK(_name, _reg, _bit, _pname)	\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
-
-#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
 #endif /* __CLK_REGMAP_H */
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index b45f85f630d7190fb6509b088f05f17ca91fa1c8..0c228a6723bb2bddc0b9a4f92515f05850a5613a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -27,4 +27,25 @@ struct meson_clkc_data {
 int meson_clkc_syscon_probe(struct platform_device *pdev);
 int meson_clkc_mmio_probe(struct platform_device *pdev);
 
+#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
+struct clk_regmap _name = {						\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = _ops,						\
+		.parent_hws = (const struct clk_hw *[]) { _pname },	\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+	},								\
+}
+
+#define MESON_PCLK(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
+
+#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
 #endif

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

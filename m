Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8FDC83F0D
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSSEGnwssdAP1YBmfyek1qQQJrFsX5LCSBJGhBfIqNk=; b=r+gpnukZik+8uY
	qCJdHYBzyezhCuHwv9nSSacPKUO4e+2Dc8H/cx1gMJHZ58hCyAts38NulAD7qH+1+jQXA70+wK6mA
	wiTUc8q0jGmMrnxOngpUpA6c6e/F6jyZ/rotV+UG2bC7PuXoYAiIFTpliZR4P2O0wyqg94TYIAn7t
	CKgmphxK1Wx3sT34ex/w7r9Ltfmr5P/reCHySAK1JbgRbyRadrD1sLYe7tBrGdiISI8zBZ4OKFIRo
	jXxQ00vkelg0Cm9vv/OJBCYGxKTJ/+wLlGuX++r9Ih/c53uGmbL3osPsG63ZtTb1Ej6d0M7nb5JE8
	nGQL5wdHkRScZI0Bt+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VF-00000008zN5-0hQq;
	Wed, 02 Jul 2025 16:40:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN0-00000008mxV-0CrR
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453066fad06so47757985e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470052; x=1752074852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=FwYrAni/HD3jqn07rXVPlpVg6xamazcE3iK/AMgvnQku3xCSk9PTqKNrm2i8YEs3Gh
         V9rG90aPalGDaBLxpKTdS1RCAqLe5GRA8Ad4CkLmrbefi5G12xTjK1aQkiYKDX1DZ8tS
         bVUTHOwQ4tv7OGxMTqysTs/DMDTOm8h59fp0RWturzTh9fikOYY8tKICtkBLDo44qAYf
         5I1Z1aELXKHutgxkbdZtuj8Eb4QUhE2VRjRllOKGjEEUeF8CrqaIAXlji3aNRW3MgfYp
         r8MvOZnUTWpckQbfbK0UeEX8oBP+gJfAr++diA3kGHdgr27vNW88jq3ErEjUYx4WmVMZ
         OKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470052; x=1752074852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=EYJzKbZ05DA0fSxTVlA/Q736cw8D9i1Gr7npXotdfSocH8YTFh85LCFoZDRFjknAHU
         LN9wlG6FAz5ct84fZPtPHzTjd1Yj6UBZsexWHqJUxbVHRJmKplbe/2glJ4w8a07Nr1gT
         qBDMbP/p0G76adw4y/SCdfaYNOgZK4+8aR//a5OAsF/NwXnU+EEPWXjnEQiQB8AGwQgw
         oplO8rarMO4/g+vAmz5N9Gj+Zk8wpYVtS33/s47wYv8/yqDD4RS830ytbY0NkpLemuax
         jMOPY9laDeUwkZ2QqL0tlIbrEh9hrYqY7oEhYvyF4F9N5COHYn7MHAOgzCEw+4Y0cA+L
         dbig==
X-Gm-Message-State: AOJu0YyuEnQzyuKgRInoKOjlifWownSzWLN/3IAYXg+UfvbnSoYymFfv
	h0wQRCgAw3Hkr0gHHjcSI6vbOVIq9kd3Uh6JdYfpIMuha/gtibjciEvj1RtayoiSfKg=
X-Gm-Gg: ASbGnctS4lGkt+KXRcYWojdGbgFzrpsDFl+beBSCs9yqaTthyjjZg+z1OKyhqyEGKXk
	0klyuOK/JQenOEtlyDKEFxMs3/PgSZVOp8x79Meg120FYmQtpjtM1vnBpz0LogTz6YgIUxenmrJ
	YwSEvwi/+89OdUeuEbn4GiUrbhK1freHI+RUp6LxB1RzZGpMvWeISxEWjrrcWRkFVXxt4nhNmQT
	LDhTg6z/QYi4LqhjTzrFwM8JGSqb1zHGefJMWSw7sxdLINunxLleqJH+U09eoNXtkadXWMKzidn
	Dk6209dptfr4iFtsl1xS99MiUiRc/VxG98qLBxypECVD3vzUdEHDfWWiPM7YeQzhyBDw6AIdfTw
	4gKe968KuDJ0=
X-Google-Smtp-Source: AGHT+IFCn7amhlgcqtX+UD8IcMW9MxbWI9v5wNTP+g8n4cqZhj8+Pbn365refzLH0EBKrHJrQ0uuPw==
X-Received: by 2002:a05:600c:3e8e:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-454a372586emr32398255e9.23.1751470052525;
        Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:17 +0200
Subject: [PATCH 19/26] clk: amlogic: move PCLK definition to clkc-utils
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-19-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5iKLGNRbAiiV7znNVkmV2nYu93DQzEVzWcxt59v2OQ4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/IIiBMGn9iqSHruxarbiEawriZEm/qe7t+Q
 kko/xVpz8qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPyAAKCRDm/A8cN/La
 hfRJEACtLVmX7LKvp41w3fFN9EJyDm5mhKNqdEki0DLX7q6IYxCHvILikQ9NZU80YF15KiipS8/
 w/3epbrRge1V82kBLqqvuC1/pJxDujsaPZx6eRdq9GcPsLOZZ1VL9U5yabv1Nb5xcyyiZpouYPI
 53hAIDeHXy2UYczA4biFJ4oug+DetAqhUM0Bf65uuzTJhdOpwlGozDBk90jdWJ4hhgshAc7VNpU
 mHhYJPtY2JGHDjKAyJA6TtmP2DjO0djhWexJ+7Vgbu6AuaehSJE4+1KmQ82Eij/SE8e/1tVrU3X
 M95ATbRRZKGB+qGBaIpttNg0iP7nB+RlcQVESGJw07dlFcUU355FV6C1xkF1QzB9xDL4PmrtyUl
 7eGDV+bEV6c6q/RwkUjR9OGLHXUpzsL1OZePKS5cNICwXWe0EfZs2s9PnrpCc/P65VaPtgyvd0E
 jDVrxv5ADLPtUIulVHsRXLeSti4Doezo5r7grQOW9321qOEHx1Zi7NnyeOocLj8WeiZlyv9BsZg
 kbOhbRbOgHbZfp0z/WEX2uxsb85tX1Ta290MKTgtV3kPWQhphtZZcxfOymbdgSbXk6m8T1EAa+0
 E+8Kd2aE384jfEKW9wvFohfi1fsEyNmIuAeVbWV12cFuTFEecKtAitUhTSjsN5IRNst6hrJuQSr
 mNYj563CodTwicA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082734_096571_70EFE1E9 
X-CRM114-Status: GOOD (  11.29  )
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

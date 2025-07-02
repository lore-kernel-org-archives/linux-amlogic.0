Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C7BC83F09
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKvNpYNi8OxxjnYbeCyJBI54GB4C8VWMdWL5Ag98TNI=; b=WNZHX8iEEMcWeq
	fj7F+aGy/PXebuCyE1iy8VCF4HHGQ18TYMtxDsA8a/3tuoKYUzbSAqaTPVP87Mr48F1eqoD3BXvNy
	Emm2FQZzqIp49HXhsRRJwESan4bjvRApjDDejyJza0D/Lq2/eXsd24JzLQn5mhLy0xed5QVvhj7zR
	X1p1zqmL7PXslSAmt2/uNvqhVI7Dg9M6xmJPFkESYyL3yyrbtzJkDbBUN9IWVXiWTbQIOeJUwzWym
	uEDbcWO3WTIqj6k/t7J32S1v1VFA/uzGLi5qwbCfC91LbcyPVBWWkGIGeDvYk5uJmyfFY+gCzfhGM
	BnXrvvWAq4mBWfVE5nJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Sr-00000008yWd-1EFE;
	Wed, 02 Jul 2025 16:37:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMp-00000008mt9-32mN
	for linux-amlogic@bombadil.infradead.org;
	Wed, 02 Jul 2025 15:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fI3DlWOnnd0aurKDJoapIA1+dK2lw8MPJUblFG2X40I=; b=J7QrYbm3mutPy/mzFnEnMHKyPW
	Em7UR6h5J7aBAtuGgUSN0Ve4UhI9mZfVEl5RHav99ZOHOUnVacIjv1xuor0kg1XLOO0DxwzmqlrjA
	wnZV3uMQX2uQEIQH+v/b9yHKwOS3/qzKpDXsUlERZRGUiGbaCkKRAjx31WA7ofrb67vvisNrSvCbF
	90mPfQXPiW7LzRSJMh1lryw5lBBS6CYj+6qIzojXKChtRui0a7wBKDKPPsJTvfFDTyPHxeBZo90qb
	RFdSt3u0iRkI1X8EgAIlwqJ1i9SNY76h9H49LVqWfhj21wstX3p6U4DOH9Nezcz1fR/CoWzHW32gt
	ovFyMaNw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMm-00000007To4-31Ch
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451d6ade159so32808845e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470039; x=1752074839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI3DlWOnnd0aurKDJoapIA1+dK2lw8MPJUblFG2X40I=;
        b=A84Dp0mYnhRZAn/Urf79rTZWaN7hoQLhH0sXosx6xMFcVW95jE4ojjEXGSoBdi/knh
         cGEO8JsB10Nv8IX2Rb/AtxiDOU2kxC7BthzMlXoQPp7F0nfMjUipXGELknf5VU9kBalM
         bkoqaxReKdVjLQxg2Mykl0r8vpCY81Jo9pIfZT63YGUs++IaEtdOCgL3riSoO4LtD0R2
         0wRED5gcZjgP3riANaBukbJjhVq9JsiAaB/u6CXBdMlGK4d0J44Iv/rjspG3oyteMpUd
         nVm2eNwjINyLRdHwAmfM0XbpahoR7TUUMDKqExjgV2n6jLBDwjHeh3Ukyan03N8kRDuI
         10BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470039; x=1752074839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI3DlWOnnd0aurKDJoapIA1+dK2lw8MPJUblFG2X40I=;
        b=WRo4u8dxXYwGGezCPtBNH+w786/O3UJEBNytdZDrPgI6hdekwKNp4g4A6oHzBtHP7/
         FNrsaDjaa1qKJDjm5RSQBFfJK4VGN1kUwEC3bMQJ6mYbRTxc2V7iCpqFMeGb3tN3SRLr
         zBTeF/pbSlksFkJcK73o7XqJiGN1MVd4ItbU8WzEE0nVmNR3VTinFPbKOUDEXYO+iSF1
         vXx6/sY2k/rkMBuileWx3hpXfnv193KBWudeFgvr4UejPwS2BPJxRdC4pOaaCsNvD/ZH
         Z5J9I+2xGsYCkrgkbaE+cvrO9NGgk7azDwl59h5StYrlT3OJIcmu9oTDBJmmIhf8YnsW
         V94A==
X-Gm-Message-State: AOJu0YyOPw8eOLUDGJCm1vrSeoCrGWWAX55L8X9yQQLVPtxOBSi4fIY9
	kXk8IWtOv/U30eWPLopb3ouq2FCiwKHNU28nEzPJ5u2XSi2uC9us75Bxs/W/hMb9YOE=
X-Gm-Gg: ASbGncvDrWPc3OV7G6stwcBJ/EbpJZpQz6QWYijI2Hvk+VSlach0F1H3hFNnpBMIDCq
	Q4A6mI/OX3W5EHMIWZOIg+7L37Tt57+TguTNIWPncrioVbhZFzkQMlaLrnhvZeM5zoJyuQlmV7x
	s3nL5Jxf9dkdd5Lnu9qQSGxUR0qCZEC+2qCtXDIIbkQ9E5bPTWaMafi+UO4t9bIdyYm+JC2b+xq
	oayOv8lsmpMc1n5Fj4h2+O/XaPpuZgJIq/roUsYamNdekWM/f51j0I3IJH8M+1fbjXAVIlmgkSd
	5jKzfW1bDte2H9bD7ToBM5DGWocoYV3cTRt4TSaqo4eVQwolKLhzHvzt8q6RNoUPQhUUMdV6Pz1
	b
X-Google-Smtp-Source: AGHT+IGdf4Pc01W+pZa0XR2pnx3Xm5uctuY+whmFl4OOEXxmbz9gy0IzZHv6GyBjuL8FtZYBQ4sOsg==
X-Received: by 2002:a05:600c:3b82:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-454a3b34003mr34377555e9.6.1751470038780;
        Wed, 02 Jul 2025 08:27:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:04 +0200
Subject: [PATCH 06/26] clk: amlogic: c3-pll: naming consistency alignment
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-6-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20094; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yOm38eTZvabW5H/bpl3wA3m76Dxn3du6/Pat+KXsn0U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+8Cz37WQ0mbrfNHfuHTkiUMh375Px7qylqh
 Pf2tjJ/baiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPvAAKCRDm/A8cN/La
 hfazD/94+trGwXFPnvDfqp37T3fHqdk8Lmuc4P2Cw0zXybAf083vLBsezQpTiEgvAOtVFhBgsWu
 /+Bi4Y10Lf/h9Hw8AL7ybRbWwEyvGGbt7UhGN8lkVRxWirq0T4IWB2BoyvQSXkSrdHi6zR4/PwH
 v8jPcO22pbygGGcPObtSYVyozvyA9/hwAysMpQWzRXdn4sG8q9uhNlaaz94GzOJwtfsnzNdai5w
 6Ms0oS9qToSxbzH9BlSpMOHoFfJd4HyYhg1MWMVJG3qpZGbYRXAyDjOWiozQKPIvgS92ta/W+GY
 amc17OT/ggLdA4aWZyIw21VakfPji2j6Gf8nIIS3xgGWjLPfRQdnYgfA2CsD1xZF/0/I6is+Ibp
 llbFE3nzC741TcBYVooxhauwr7PkgFSEcKIvsSsJC6hIeL9qpIiZrQ3QRYYvtgYPZQENafEXJSD
 W5x/J4n2z+xOym2IhPLqk0EeF10JsapFVki3C91WXpfYPtzdqkmOPkkCiVH1ri2CvyiYNP/GmTA
 A7yPSMkDMz6v7rVm0bA93O6PzYl2OboNqDDrRqiy8HQaLICdopIMpBdxneNZovEr6+KyDzzIR+R
 HPbQ8ABT9b0U4ZHJW00mjnsDAp3rLFZ3tLlwUoYEsvmJBNbrZBhSkENwp0oucPNnjrjUT61F8IV
 9BM+seg23jZ69zA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_162721_078200_21CBD2F0 
X-CRM114-Status: GOOD (  14.89  )
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

Amlogic clock controller drivers are all doing the same thing, more or
less. Yet, over the years, tiny (and often pointless) differences have
emerged.

This makes reviews more difficult, allows some errors to slip through and
make it more difficult to exploit SoC commonalities, leading to code
duplication.

This change enforce, wherever possible, a consistent and predictable scheme
when it comes to code organisation and naming, The scheme chosen is what
was used the most already, to try and minimise the size of the ugly
resulting diff. Here are some of the rules applied:
- Aligning clock names, variable names and IDs.
  - ID cannot change (used in DT)
  - Variable names w/ SoC name prefixes
  - Clock names w/o SoC name prefixes, except pclks for historic reasons
- Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
- Parent table systematically named with the same name as the clock and
  a '_parents' suffix
- Group various tables next to the related clock
- etc ...

Doing so removes what would otherwise show up as unrelated diff in
following changes. It will allow to introduce common definitions for
peripheral clocks, probe helpers, composite clocks, etc ... making further
review and maintenance easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/c3-pll.c | 202 ++++++++++++++++++++++-----------------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 2c5594b8e49a24ae8067117465ee4c0e29d7420d..ccfcd4b5be8996592c27df31fa62d4871c826926 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -34,7 +34,7 @@
 #define ANACTRL_MPLL_CTRL3			0x18c
 #define ANACTRL_MPLL_CTRL4			0x190
 
-static struct clk_regmap fclk_50m_en = {
+static struct clk_regmap c3_fclk_50m_en = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 0,
@@ -49,20 +49,20 @@ static struct clk_regmap fclk_50m_en = {
 	},
 };
 
-static struct clk_fixed_factor fclk_50m = {
+static struct clk_fixed_factor c3_fclk_50m = {
 	.mult = 1,
 	.div = 40,
 	.hw.init = &(struct clk_init_data) {
 		.name = "fclk_50m",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_50m_en.hw
+			&c3_fclk_50m_en.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor fclk_div2_div = {
+static struct clk_fixed_factor c3_fclk_div2_div = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data) {
@@ -75,7 +75,7 @@ static struct clk_fixed_factor fclk_div2_div = {
 	},
 };
 
-static struct clk_regmap fclk_div2 = {
+static struct clk_regmap c3_fclk_div2 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 24,
@@ -84,13 +84,13 @@ static struct clk_regmap fclk_div2 = {
 		.name = "fclk_div2",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div2_div.hw
+			&c3_fclk_div2_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor fclk_div2p5_div = {
+static struct clk_fixed_factor c3_fclk_div2p5_div = {
 	.mult = 2,
 	.div = 5,
 	.hw.init = &(struct clk_init_data) {
@@ -103,7 +103,7 @@ static struct clk_fixed_factor fclk_div2p5_div = {
 	},
 };
 
-static struct clk_regmap fclk_div2p5 = {
+static struct clk_regmap c3_fclk_div2p5 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 4,
@@ -112,13 +112,13 @@ static struct clk_regmap fclk_div2p5 = {
 		.name = "fclk_div2p5",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div2p5_div.hw
+			&c3_fclk_div2p5_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor fclk_div3_div = {
+static struct clk_fixed_factor c3_fclk_div3_div = {
 	.mult = 1,
 	.div = 3,
 	.hw.init = &(struct clk_init_data) {
@@ -131,7 +131,7 @@ static struct clk_fixed_factor fclk_div3_div = {
 	},
 };
 
-static struct clk_regmap fclk_div3 = {
+static struct clk_regmap c3_fclk_div3 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 20,
@@ -140,13 +140,13 @@ static struct clk_regmap fclk_div3 = {
 		.name = "fclk_div3",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div3_div.hw
+			&c3_fclk_div3_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor fclk_div4_div = {
+static struct clk_fixed_factor c3_fclk_div4_div = {
 	.mult = 1,
 	.div = 4,
 	.hw.init = &(struct clk_init_data) {
@@ -159,7 +159,7 @@ static struct clk_fixed_factor fclk_div4_div = {
 	},
 };
 
-static struct clk_regmap fclk_div4 = {
+static struct clk_regmap c3_fclk_div4 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 21,
@@ -168,13 +168,13 @@ static struct clk_regmap fclk_div4 = {
 		.name = "fclk_div4",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div4_div.hw
+			&c3_fclk_div4_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor fclk_div5_div = {
+static struct clk_fixed_factor c3_fclk_div5_div = {
 	.mult = 1,
 	.div = 5,
 	.hw.init = &(struct clk_init_data) {
@@ -187,7 +187,7 @@ static struct clk_fixed_factor fclk_div5_div = {
 	},
 };
 
-static struct clk_regmap fclk_div5 = {
+static struct clk_regmap c3_fclk_div5 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 22,
@@ -196,13 +196,13 @@ static struct clk_regmap fclk_div5 = {
 		.name = "fclk_div5",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div5_div.hw
+			&c3_fclk_div5_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor fclk_div7_div = {
+static struct clk_fixed_factor c3_fclk_div7_div = {
 	.mult = 1,
 	.div = 7,
 	.hw.init = &(struct clk_init_data) {
@@ -215,7 +215,7 @@ static struct clk_fixed_factor fclk_div7_div = {
 	},
 };
 
-static struct clk_regmap fclk_div7 = {
+static struct clk_regmap c3_fclk_div7 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_FIXPLL_CTRL4,
 		.bit_idx = 23,
@@ -224,13 +224,13 @@ static struct clk_regmap fclk_div7 = {
 		.name = "fclk_div7",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div7_div.hw
+			&c3_fclk_div7_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static const struct reg_sequence c3_gp0_init_regs[] = {
+static const struct reg_sequence c3_gp0_pll_init_regs[] = {
 	{ .reg = ANACTRL_GP0PLL_CTRL2,	.def = 0x0 },
 	{ .reg = ANACTRL_GP0PLL_CTRL3,	.def = 0x48681c00 },
 	{ .reg = ANACTRL_GP0PLL_CTRL4,  .def = 0x88770290 },
@@ -243,7 +243,7 @@ static const struct pll_mult_range c3_gp0_pll_mult_range = {
 	.max = 250,
 };
 
-static struct clk_regmap gp0_pll_dco = {
+static struct clk_regmap c3_gp0_pll_dco = {
 	.data = &(struct meson_clk_pll_data) {
 		.en = {
 			.reg_off = ANACTRL_GP0PLL_CTRL0,
@@ -276,8 +276,8 @@ static struct clk_regmap gp0_pll_dco = {
 			.width   = 1,
 		},
 		.range = &c3_gp0_pll_mult_range,
-		.init_regs = c3_gp0_init_regs,
-		.init_count = ARRAY_SIZE(c3_gp0_init_regs),
+		.init_regs = c3_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(c3_gp0_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "gp0_pll_dco",
@@ -300,7 +300,7 @@ static const struct clk_div_table c3_gp0_pll_od_table[] = {
 	{ /* sentinel */ }
 };
 
-static struct clk_regmap gp0_pll = {
+static struct clk_regmap c3_gp0_pll = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ANACTRL_GP0PLL_CTRL0,
 		.shift = 16,
@@ -311,14 +311,14 @@ static struct clk_regmap gp0_pll = {
 		.name = "gp0_pll",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gp0_pll_dco.hw
+			&c3_gp0_pll_dco.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct reg_sequence c3_hifi_init_regs[] = {
+static const struct reg_sequence c3_hifi_pll_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x0 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x65771290 },
@@ -326,7 +326,7 @@ static const struct reg_sequence c3_hifi_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL6,	.def = 0x56540000 },
 };
 
-static struct clk_regmap hifi_pll_dco = {
+static struct clk_regmap c3_hifi_pll_dco = {
 	.data = &(struct meson_clk_pll_data) {
 		.en = {
 			.reg_off = ANACTRL_HIFIPLL_CTRL0,
@@ -359,8 +359,8 @@ static struct clk_regmap hifi_pll_dco = {
 			.width   = 1,
 		},
 		.range = &c3_gp0_pll_mult_range,
-		.init_regs = c3_hifi_init_regs,
-		.init_count = ARRAY_SIZE(c3_hifi_init_regs),
+		.init_regs = c3_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(c3_hifi_pll_init_regs),
 		.frac_max = 100000,
 	},
 	.hw.init = &(struct clk_init_data) {
@@ -373,7 +373,7 @@ static struct clk_regmap hifi_pll_dco = {
 	},
 };
 
-static struct clk_regmap hifi_pll = {
+static struct clk_regmap c3_hifi_pll = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ANACTRL_HIFIPLL_CTRL0,
 		.shift = 16,
@@ -384,14 +384,14 @@ static struct clk_regmap hifi_pll = {
 		.name = "hifi_pll",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&hifi_pll_dco.hw
+			&c3_hifi_pll_dco.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct reg_sequence c3_mclk_init_regs[] = {
+static const struct reg_sequence c3_mclk_pll_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL1,	.def = 0x1420500f },
 	{ .reg = ANACTRL_MPLL_CTRL2,	.def = 0x00023041 },
 	{ .reg = ANACTRL_MPLL_CTRL3,	.def = 0x18180000 },
@@ -403,7 +403,7 @@ static const struct pll_mult_range c3_mclk_pll_mult_range = {
 	.max = 133,
 };
 
-static struct clk_regmap mclk_pll_dco = {
+static struct clk_regmap c3_mclk_pll_dco = {
 	.data = &(struct meson_clk_pll_data) {
 		.en = {
 			.reg_off = ANACTRL_MPLL_CTRL0,
@@ -431,8 +431,8 @@ static struct clk_regmap mclk_pll_dco = {
 			.width   = 1,
 		},
 		.range = &c3_mclk_pll_mult_range,
-		.init_regs = c3_mclk_init_regs,
-		.init_count = ARRAY_SIZE(c3_mclk_init_regs),
+		.init_regs = c3_mclk_pll_init_regs,
+		.init_count = ARRAY_SIZE(c3_mclk_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "mclk_pll_dco",
@@ -444,7 +444,7 @@ static struct clk_regmap mclk_pll_dco = {
 	},
 };
 
-static const struct clk_div_table c3_mpll_od_table[] = {
+static const struct clk_div_table c3_mpll_pll_od_table[] = {
 	{ 0,  1 },
 	{ 1,  2 },
 	{ 2,  4 },
@@ -453,25 +453,25 @@ static const struct clk_div_table c3_mpll_od_table[] = {
 	{ /* sentinel */ }
 };
 
-static struct clk_regmap mclk_pll_od = {
+static struct clk_regmap c3_mclk_pll_od = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ANACTRL_MPLL_CTRL0,
 		.shift = 12,
 		.width = 3,
-		.table = c3_mpll_od_table,
+		.table = c3_mpll_pll_od_table,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "mclk_pll_od",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk_pll_dco.hw },
+			&c3_mclk_pll_dco.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* both value 0 and 1 gives divide the input rate by one */
-static struct clk_regmap mclk_pll = {
+static struct clk_regmap c3_mclk_pll = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.shift = 16,
@@ -482,20 +482,20 @@ static struct clk_regmap mclk_pll = {
 		.name = "mclk_pll",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk_pll_od.hw
+			&c3_mclk_pll_od.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data mclk_parent[] = {
-	{ .hw = &mclk_pll.hw },
+static const struct clk_parent_data c3_mclk_parents[] = {
+	{ .hw = &c3_mclk_pll.hw },
 	{ .fw_name = "mclk" },
-	{ .hw = &fclk_50m.hw }
+	{ .hw = &c3_fclk_50m.hw }
 };
 
-static struct clk_regmap mclk0_sel = {
+static struct clk_regmap c3_mclk0_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.mask = 0x3,
@@ -504,12 +504,12 @@ static struct clk_regmap mclk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "mclk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = mclk_parent,
-		.num_parents = ARRAY_SIZE(mclk_parent),
+		.parent_data = c3_mclk_parents,
+		.num_parents = ARRAY_SIZE(c3_mclk_parents),
 	},
 };
 
-static struct clk_regmap mclk0_div_en = {
+static struct clk_regmap c3_mclk0_div_en = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.bit_idx = 1,
@@ -518,14 +518,14 @@ static struct clk_regmap mclk0_div_en = {
 		.name = "mclk0_div_en",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk0_sel.hw
+			&c3_mclk0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap mclk0_div = {
+static struct clk_regmap c3_mclk0_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.shift = 2,
@@ -535,14 +535,14 @@ static struct clk_regmap mclk0_div = {
 		.name = "mclk0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk0_div_en.hw
+			&c3_mclk0_div_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap mclk0 = {
+static struct clk_regmap c3_mclk0 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.bit_idx = 0,
@@ -551,14 +551,14 @@ static struct clk_regmap mclk0 = {
 		.name = "mclk0",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk0_div.hw
+			&c3_mclk0_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap mclk1_sel = {
+static struct clk_regmap c3_mclk1_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.mask = 0x3,
@@ -567,12 +567,12 @@ static struct clk_regmap mclk1_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "mclk1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = mclk_parent,
-		.num_parents = ARRAY_SIZE(mclk_parent),
+		.parent_data = c3_mclk_parents,
+		.num_parents = ARRAY_SIZE(c3_mclk_parents),
 	},
 };
 
-static struct clk_regmap mclk1_div_en = {
+static struct clk_regmap c3_mclk1_div_en = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.bit_idx = 9,
@@ -581,14 +581,14 @@ static struct clk_regmap mclk1_div_en = {
 		.name = "mclk1_div_en",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk1_sel.hw
+			&c3_mclk1_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap mclk1_div = {
+static struct clk_regmap c3_mclk1_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.shift = 10,
@@ -598,14 +598,14 @@ static struct clk_regmap mclk1_div = {
 		.name = "mclk1_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk1_div_en.hw
+			&c3_mclk1_div_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap mclk1 = {
+static struct clk_regmap c3_mclk1 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ANACTRL_MPLL_CTRL4,
 		.bit_idx = 8,
@@ -614,7 +614,7 @@ static struct clk_regmap mclk1 = {
 		.name = "mclk1",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mclk1_div.hw
+			&c3_mclk1_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -622,38 +622,38 @@ static struct clk_regmap mclk1 = {
 };
 
 static struct clk_hw *c3_pll_hw_clks[] = {
-	[CLKID_FCLK_50M_EN]	= &fclk_50m_en.hw,
-	[CLKID_FCLK_50M]	= &fclk_50m.hw,
-	[CLKID_FCLK_DIV2_DIV]	= &fclk_div2_div.hw,
-	[CLKID_FCLK_DIV2]	= &fclk_div2.hw,
-	[CLKID_FCLK_DIV2P5_DIV]	= &fclk_div2p5_div.hw,
-	[CLKID_FCLK_DIV2P5]	= &fclk_div2p5.hw,
-	[CLKID_FCLK_DIV3_DIV]	= &fclk_div3_div.hw,
-	[CLKID_FCLK_DIV3]	= &fclk_div3.hw,
-	[CLKID_FCLK_DIV4_DIV]	= &fclk_div4_div.hw,
-	[CLKID_FCLK_DIV4]	= &fclk_div4.hw,
-	[CLKID_FCLK_DIV5_DIV]	= &fclk_div5_div.hw,
-	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
-	[CLKID_FCLK_DIV7_DIV]	= &fclk_div7_div.hw,
-	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
-	[CLKID_GP0_PLL_DCO]	= &gp0_pll_dco.hw,
-	[CLKID_GP0_PLL]		= &gp0_pll.hw,
-	[CLKID_HIFI_PLL_DCO]	= &hifi_pll_dco.hw,
-	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
-	[CLKID_MCLK_PLL_DCO]	= &mclk_pll_dco.hw,
-	[CLKID_MCLK_PLL_OD]	= &mclk_pll_od.hw,
-	[CLKID_MCLK_PLL]	= &mclk_pll.hw,
-	[CLKID_MCLK0_SEL]	= &mclk0_sel.hw,
-	[CLKID_MCLK0_SEL_EN]	= &mclk0_div_en.hw,
-	[CLKID_MCLK0_DIV]	= &mclk0_div.hw,
-	[CLKID_MCLK0]		= &mclk0.hw,
-	[CLKID_MCLK1_SEL]	= &mclk1_sel.hw,
-	[CLKID_MCLK1_SEL_EN]	= &mclk1_div_en.hw,
-	[CLKID_MCLK1_DIV]	= &mclk1_div.hw,
-	[CLKID_MCLK1]		= &mclk1.hw
-};
-
-static const struct regmap_config clkc_regmap_config = {
+	[CLKID_FCLK_50M_EN]	= &c3_fclk_50m_en.hw,
+	[CLKID_FCLK_50M]	= &c3_fclk_50m.hw,
+	[CLKID_FCLK_DIV2_DIV]	= &c3_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV2]	= &c3_fclk_div2.hw,
+	[CLKID_FCLK_DIV2P5_DIV]	= &c3_fclk_div2p5_div.hw,
+	[CLKID_FCLK_DIV2P5]	= &c3_fclk_div2p5.hw,
+	[CLKID_FCLK_DIV3_DIV]	= &c3_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV3]	= &c3_fclk_div3.hw,
+	[CLKID_FCLK_DIV4_DIV]	= &c3_fclk_div4_div.hw,
+	[CLKID_FCLK_DIV4]	= &c3_fclk_div4.hw,
+	[CLKID_FCLK_DIV5_DIV]	= &c3_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV5]	= &c3_fclk_div5.hw,
+	[CLKID_FCLK_DIV7_DIV]	= &c3_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV7]	= &c3_fclk_div7.hw,
+	[CLKID_GP0_PLL_DCO]	= &c3_gp0_pll_dco.hw,
+	[CLKID_GP0_PLL]		= &c3_gp0_pll.hw,
+	[CLKID_HIFI_PLL_DCO]	= &c3_hifi_pll_dco.hw,
+	[CLKID_HIFI_PLL]	= &c3_hifi_pll.hw,
+	[CLKID_MCLK_PLL_DCO]	= &c3_mclk_pll_dco.hw,
+	[CLKID_MCLK_PLL_OD]	= &c3_mclk_pll_od.hw,
+	[CLKID_MCLK_PLL]	= &c3_mclk_pll.hw,
+	[CLKID_MCLK0_SEL]	= &c3_mclk0_sel.hw,
+	[CLKID_MCLK0_SEL_EN]	= &c3_mclk0_div_en.hw,
+	[CLKID_MCLK0_DIV]	= &c3_mclk0_div.hw,
+	[CLKID_MCLK0]		= &c3_mclk0.hw,
+	[CLKID_MCLK1_SEL]	= &c3_mclk1_sel.hw,
+	[CLKID_MCLK1_SEL_EN]	= &c3_mclk1_div_en.hw,
+	[CLKID_MCLK1_DIV]	= &c3_mclk1_div.hw,
+	[CLKID_MCLK1]		= &c3_mclk1.hw
+};
+
+static const struct regmap_config c3_pll_regmap_cfg = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,
@@ -665,7 +665,7 @@ static struct meson_clk_hw_data c3_pll_clks = {
 	.num = ARRAY_SIZE(c3_pll_hw_clks),
 };
 
-static int c3_pll_probe(struct platform_device *pdev)
+static int c3_pll_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -676,7 +676,7 @@ static int c3_pll_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, &c3_pll_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
@@ -704,14 +704,14 @@ static const struct of_device_id c3_pll_clkc_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, c3_pll_clkc_match_table);
 
-static struct platform_driver c3_pll_driver = {
-	.probe		= c3_pll_probe,
+static struct platform_driver c3_pll_clkc_driver = {
+	.probe		= c3_pll_clkc_probe,
 	.driver		= {
 		.name	= "c3-pll-clkc",
 		.of_match_table = c3_pll_clkc_match_table,
 	},
 };
-module_platform_driver(c3_pll_driver);
+module_platform_driver(c3_pll_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

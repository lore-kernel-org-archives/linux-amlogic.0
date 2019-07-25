Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B418EC7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C772238C
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LfPsF+SF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bjuEcobo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C772238C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ca/YtrirfE7wu/amRdCF6qOOzVmJH+ScUo8c+Xl2J5E=; b=LfPsF+SFPyUsbTr9mGNqSBYpap
	KgRfBpPWy4/9t9GrKhRR9q0f5lFMUcrtKmHm/RLzcl3LqAk0IPzd8bWMBxRj/H1vz8GXLg+HNGDBb
	sqkn7pUu8W+QU38r4nGG4DwBvTzpP+tqmAJmN4Ig+2Z2bqawKlVYSscCdIq+RrFmypdrLlf8apFlL
	zyjUB/nWHh2atXSC/yp/qMt5Lu1shZ+lbOmhXt7nOfwg1GzkU6dAGGiZ2tv0QJelfVbIRubnGqqdS
	1ZoqWsmbn5hPdD4zQ0PjPIK2rEeFflGZ144cgnfq2J/i2pybo6++LnBQkF5TXqFR59vtAzbI2Yyo3
	6N6OvWQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgp8-0003wA-0f; Thu, 25 Jul 2019 16:42:34 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgoO-0003HN-1U
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:41:50 +0000
Received: by mail-wr1-x442.google.com with SMTP id c2so48274082wrm.8
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ookaJsEM1c9+mJiyULUo/W8hYZX1ldIWr6q0D9akHHk=;
 b=bjuEcoboV1HD+t1ArWKkoSGnenLwO0vKH/nMxcb8+46hqW9Cel+01K/H4EoaK+SClE
 GJKcj7jUP+hn5BOBXBsybjZwP5k6u+OPm/1lK5o3n8fFXUXQgciw9hsdjVbUh0TQC8Lx
 jw+3i42AwS8W3dMhuLSA9Pw/KeG1//LcKtv5rIrzQPXUNI+X5nZzMxetzVTW5E+mVzbk
 CE/Q+afbaO3QZiOQnKAbFFyZsWyNz4jHN1d3ekKh4Se757eyaMzgF+8lus0dcWSIBlQp
 ovr07Qy6WGmO9/cYvWhQMMYe/9cfeRUkDjO7lCzeEaWiRZwsVM4L2suMy1gT83AaRPbU
 QdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ookaJsEM1c9+mJiyULUo/W8hYZX1ldIWr6q0D9akHHk=;
 b=XnSlN2OWtQHMrYQzpgCuASaB3AP34tFtnP8buSJheHuhqggGyywmOfmBJD9+Fo3jfW
 rhdG66s7FDM9tytF9n3KufH4VwyxuPVK4/NYQHqdCpdPiAaZvt9XGm8uP1+DtexrF/11
 gQkw+kgTY2EzjumAImYfoL7hGHCSsq61CBBAeN/IqNzZhkoz8O2h0EF8RucPC9jKg8fw
 bHEpAPd0E7hv9zb2quVhWxcf4wBGxGJ8rEtjNrrra242jIsJvqLF/RcELielaOFJutR5
 c0SaMO/6FRIZyGDS+qeQ6xxCBUahNou7QHZjDxFjuu+wan2fUA/ZzMeRl4XaEMloTeaz
 4QNA==
X-Gm-Message-State: APjAAAVwKYXuO+O2VHrmYh2VG4023DY7hRUc4pNvqjKR2jeygTJnwsQA
 Pvj3yp50rIB5wk7b0CHRL/tL5g==
X-Google-Smtp-Source: APXvYqyBR1WYCdm79WeDP3xb/aWV98npTC5HMV4Rc2LYR8W0pm63SwAFPuvQ39Uk9oIPpioTWzeogw==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr55137751wrn.269.1564072906709; 
 Thu, 25 Jul 2019 09:41:46 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
 by smtp.googlemail.com with ESMTPSA id
 y16sm102488858wrg.85.2019.07.25.09.41.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 09:41:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 2/4] clk: meson: gxbb-aoclk: migrate to the new parent
 description method
Date: Thu, 25 Jul 2019 18:41:24 +0200
Message-Id: <20190725164126.27919-3-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725164126.27919-1-amergnat@baylibre.com>
References: <20190725164126.27919-1-amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_094148_089876_59B945F1 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This clock controller use the string comparison method to describe parent
relation between the clocks, which is not optimized.

Migrate to the new way by using .parent_hws where possible (when parent
clocks are localy declared in the controller) and use .parent_data
otherwise.

Remove clk input helper and all bypass clocks (declared in probe function)
which are no longer used since we are able to use device-tree clock name
directly.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/gxbb-aoclk.c | 55 +++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 449f6ac189d8..e940861a396b 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -11,8 +11,6 @@
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
-#define IN_PREFIX "ao-in-"
-
 /* AO Configuration Clock registers offsets */
 #define AO_RTI_PWR_CNTL_REG1	0x0c
 #define AO_RTI_PWR_CNTL_REG0	0x10
@@ -31,7 +29,9 @@ static struct clk_regmap _name##_ao = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = #_name "_ao",					\
 		.ops = &clk_regmap_gate_ops,				\
-		.parent_names = (const char *[]){ IN_PREFIX "mpeg-clk" }, \
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = "mpeg-clk",				\
+		},							\
 		.num_parents = 1,					\
 		.flags = CLK_IGNORE_UNUSED,				\
 	},								\
@@ -52,7 +52,9 @@ static struct clk_regmap ao_cts_oscin = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_cts_oscin",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -65,7 +67,7 @@ static struct clk_regmap ao_32k_pre = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k_pre",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "ao_cts_oscin" },
+		.parent_hws = (const struct clk_hw *[]) { &ao_cts_oscin.hw },
 		.num_parents = 1,
 	},
 };
@@ -112,7 +114,7 @@ static struct clk_regmap ao_32k_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
-		.parent_names = (const char *[]){ "ao_32k_pre" },
+		.parent_hws = (const struct clk_hw *[]) { &ao_32k_pre.hw },
 		.num_parents = 1,
 	},
 };
@@ -127,8 +129,10 @@ static struct clk_regmap ao_32k_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "ao_32k_div",
-						  "ao_32k_pre" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&ao_32k_div.hw,
+			&ao_32k_pre.hw
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -142,7 +146,7 @@ static struct clk_regmap ao_32k = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "ao_32k_sel" },
+		.parent_hws = (const struct clk_hw *[]) { &ao_32k_sel.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -159,10 +163,12 @@ static struct clk_regmap ao_cts_rtc_oscin = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_cts_rtc_oscin",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "ext-32k-0",
-						  IN_PREFIX "ext-32k-1",
-						  IN_PREFIX "ext-32k-2",
-						  "ao_32k" },
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "ext-32k-0", },
+			{ .fw_name = "ext-32k-1", },
+			{ .fw_name = "ext-32k-2", },
+			{ .hw = &ao_32k.hw },
+		},
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -178,8 +184,10 @@ static struct clk_regmap ao_clk81 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_clk81",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "mpeg-clk",
-						  "ao_cts_rtc_oscin" },
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "mpeg-clk", },
+			{ .hw = &ao_cts_rtc_oscin.hw },
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -208,8 +216,10 @@ static struct clk_regmap ao_cts_cec = {
 		 * Until CCF gets fixed, adding this fake parent that won't
 		 * ever be registered should work around the problem
 		 */
-		.parent_names = (const char *[]){ "fixme",
-						  "ao_cts_rtc_oscin" },
+		.parent_data = (const struct clk_parent_data []) {
+			{ .name = "fixme", .index = -1, },
+			{ .hw = &ao_cts_rtc_oscin.hw },
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -261,14 +271,6 @@ static const struct clk_hw_onecell_data gxbb_aoclk_onecell_data = {
 	.num = NR_CLKS,
 };
 
-static const struct meson_aoclk_input gxbb_aoclk_inputs[] = {
-	{ .name = "xtal",	.required = true,  },
-	{ .name = "mpeg-clk",	.required = true,  },
-	{. name = "ext-32k-0",	.required = false, },
-	{. name = "ext-32k-1",	.required = false, },
-	{. name = "ext-32k-2",	.required = false, },
-};
-
 static const struct meson_aoclk_data gxbb_aoclkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(gxbb_aoclk_reset),
@@ -276,9 +278,6 @@ static const struct meson_aoclk_data gxbb_aoclkc_data = {
 	.num_clks	= ARRAY_SIZE(gxbb_aoclk),
 	.clks		= gxbb_aoclk,
 	.hw_data	= &gxbb_aoclk_onecell_data,
-	.inputs		= gxbb_aoclk_inputs,
-	.num_inputs	= ARRAY_SIZE(gxbb_aoclk_inputs),
-	.input_prefix	= IN_PREFIX,
 };
 
 static const struct of_device_id gxbb_aoclkc_match_table[] = {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042DEC3815B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64D820780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W7Zk++6T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qn2RXZm7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D64D820780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsSEy7f10tEX3uGWLM8c5BPU4g64UMabXZl0Cbw1YCQ=; b=W7Zk++6TbhHz7l
	7+183XKrnS4qZxvFyndfo/Np2mmcxiqFMCG5vgIScjFs2hZF+vytVDDU9x/GZWIdWN2gPIwfYwQ8y
	gD+aQQnx90JdgyUGjEiD3lBU9Oy7yfKcc+1gFyU/BAoK4hMUJUOJb3m+qlun7/IVnwAoSG1r8hGTr
	Lo85x9x4XlzPDlDw2Tf4kM2RQSqAKKr1pCTLRTVv500lxXwVJU5Cop4iWW/k+bcxWeZGCwrSun7+B
	QJgWwZiEIzNz522XHzBSSpE3bg2Pwapchvw3jBnB1wdI8GQ8Mc1xCBlJ7L7k4IXsSLmqJE+fRVZdQ
	EeBfb4Qa3pTj8KkPO06w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVwj-0007th-SZ; Fri, 17 Apr 2020 18:42:37 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVvs-0006vc-Fl; Fri, 17 Apr 2020 18:41:46 +0000
Received: by mail-wm1-x342.google.com with SMTP id e26so3905032wmk.5;
 Fri, 17 Apr 2020 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oIYf6yLD6cGcNKPjnKZPwHWTMLSS0PgTGD6+kLZWz24=;
 b=qn2RXZm7CQEK2b7CVa5xl9uSvLy65ZGWZ0dZZyISbrsJb0LQXt9eCD5+2BKd5jWT68
 VCDk+2Q/hdoCN14v015Es9d2FxTKYVxbwNVCpE/Qq+Gi/PdgvV+E2s4jGLDOLZFZvmD6
 Y86H7Ly/R5lc8w1vv95JqOXTMV0Z68GhtE14x2IL9owKM9Fbki6GTH3M/aS69WUB9in7
 Yl/Elgwq0qrwv+nOpwN9fZIB3ZQJ6+egCW1+yuD+qCod6igLfPrTHd8OR2aRCiFZGzgU
 lXuZDJCZ5/VBQMHUj2vxUKZLeXkEdTPvjLR3L3gTzks39bsVsBlhOVZzvhH6vPVoWT+s
 uh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oIYf6yLD6cGcNKPjnKZPwHWTMLSS0PgTGD6+kLZWz24=;
 b=mOBQkbtbzGxGZB3AbFH6L1P4XRHEh2YVGMjTH7rc/ZFmA9DE3QLlagnAl2yyGEqHU+
 ywhG3g1zvpdkhwzNRg5q2s3zc31gb3XPX0yfdMsdKHbualzVVp76aUfBF9fKVMMYbrW1
 WjgzZXzx1Erd/0mmjO5iIloqtwbG64gdBXXqtt81Q0W3f043VG30h5I5A0fEci7KJRv/
 kGxpwwWvn6DN+mphFIS6frptLVCUvsvWuqYGKbW5YiEUrIbtU7NWdhTig2ktcKoEh/Uc
 WFJiXMGvnL7d2pTn4xZnstgDhAlFtffIl5qmmGkT38FJvjxF1479P0p/3FXRVMCPbIhp
 ttHQ==
X-Gm-Message-State: AGi0PuZ+bq3ArY96gUNxb4JhtNs7BwyirgKroPweFAMf+jHys0MMJufx
 MLXW850SO9EOepfCbNuS/k4=
X-Google-Smtp-Source: APiQypJiOSadIsSFqxeGifhueVFxB5KQwrbt+IM4+8elJn17pL0qORQex4+o6XKw8z/L7S4uNIk+Cw==
X-Received: by 2002:a1c:98c2:: with SMTP id a185mr4892260wme.85.1587148902117; 
 Fri, 17 Apr 2020 11:41:42 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c17sm33237391wrp.28.2020.04.17.11.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:41:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2 3/4] clk: meson: meson8b: Fix the vclk_div{1, 2, 4, 6,
 12}_en gate bits
Date: Fri, 17 Apr 2020 20:41:26 +0200
Message-Id: <20200417184127.1319871-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
References: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_114144_547334_4F3857B2 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The DIV{1,2,4,6,12}_EN bits are actually located in HHI_VID_CLK_CNTL
register:
- HHI_VID_CLK_CNTL[0] = DIV1_EN
- HHI_VID_CLK_CNTL[1] = DIV2_EN
- HHI_VID_CLK_CNTL[2] = DIV4_EN
- HHI_VID_CLK_CNTL[3] = DIV6_EN
- HHI_VID_CLK_CNTL[4] = DIV12_EN

Update the bits accordingly so we will enable the bits in the correct
register once we switch these clocks to be mutable.

Fixes: 6cb57c678bb70e ("clk: meson: meson8b: add the read-only video clock trees")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 1dec8d5404a1..6d1727e62b55 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1213,7 +1213,7 @@ static struct clk_regmap meson8b_vclk_in_en = {
 
 static struct clk_regmap meson8b_vclk_div1_gate = {
 	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VID_CLK_DIV,
+		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 0,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -1243,7 +1243,7 @@ static struct clk_fixed_factor meson8b_vclk_div2_div = {
 
 static struct clk_regmap meson8b_vclk_div2_div_gate = {
 	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VID_CLK_DIV,
+		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 1,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -1273,7 +1273,7 @@ static struct clk_fixed_factor meson8b_vclk_div4_div = {
 
 static struct clk_regmap meson8b_vclk_div4_div_gate = {
 	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VID_CLK_DIV,
+		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 2,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -1303,7 +1303,7 @@ static struct clk_fixed_factor meson8b_vclk_div6_div = {
 
 static struct clk_regmap meson8b_vclk_div6_div_gate = {
 	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VID_CLK_DIV,
+		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 3,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -1333,7 +1333,7 @@ static struct clk_fixed_factor meson8b_vclk_div12_div = {
 
 static struct clk_regmap meson8b_vclk_div12_div_gate = {
 	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VID_CLK_DIV,
+		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 4,
 	},
 	.hw.init = &(struct clk_init_data){
-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F4BC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 12:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAE8F20851
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 12:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XzSCfj3K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ang4smmJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAE8F20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cdgtwcltH0PLL/XN4OaOW1Bv2h/3xClKD66KYVj9/OI=; b=XzSCfj3KJxofTK
	jqHbcvtcFjwJVh2gaKsD3p+P3LlguFHQXlkKtc0NGHv6Uc9Ae6HgsKKEbJw5cqApTexlUI/6BD86f
	+VmLIIkmRaWb0H0bN0eDTWoK/JV6B9RTqlPJWnBETvrypxEwi9y3+LbOquoUe2ggGkraNBpX22dnH
	NDsf6ZhVjFICROZsRVSppgLP3IaKVcGdXJC96x9Tb6hXMQ6Lafatepodo7yNIOqD5h1pWx/CbQ4iT
	uphk4qa4sIj1BRuafDquF3jMCuoy9NookVlpAFHBlODnAb5tVPz5Z5hmE0xBLKbSXlHTEd+f6nMsc
	ykRBPt8RE2QU9vifvOng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUAHz-0004Mm-48; Tue, 04 Dec 2018 12:58:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUAHu-0004Lq-VD
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 12:58:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id n190so7045744wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 04:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BU1XjBeD1tQVwVbfyiuvmz0QDxeExllOnoq3LKOaY3M=;
 b=Ang4smmJ++DtTA2vrJRVBtWTNlQRY92MjF8dkXlEXMIW06OjtDPpjBHFatjBIje349
 3QzxzYVnodRKvqZQugAEg8l3fIAcnHz6z+dfM2qy/bWXM6OnBKqQbhYOqUpuoAOcTKsX
 SF+62ydEh2Qu61hyJ7sH1KJMqjrpvPnIe5LoMxbrqoSFY8vvsuucVIBaEEvJ8TbYeG9z
 PoKnxWjV9A5Zbjaka8IeZy3B7Op8HDXsYz0To9xteAtx6YnxsD3SnWAyvAQ8MZ4RrsxO
 g0118DrH4/ZB4kcUFmU9CQyt6LkvY2R2v3a8Ov964PBa2jHJLtbwAc65NWS2RtKqP7oH
 KOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BU1XjBeD1tQVwVbfyiuvmz0QDxeExllOnoq3LKOaY3M=;
 b=JUVwMgABaqSOdHwg4JStyhB/ncOXwKz76Qc0s3sVV/OIKdvoBTe3yAjbqdPnEwLImX
 SmJi98RZYKbNTTEh7RNlm+Iw6aBVCznd/kkjPJNYE0oLOtzrJ5fJ4BVLFix9CsPaLN7C
 LuVnO77SwjxT9BYnm1lskaFKW1EHBt6+3b/zOPAecoVETP8w4GEWVl1D5lCIXy1e+Ufv
 EsoLBnczeAhfFjedmoZJ12+AVaOO8UrFj/uB+HONPbIU6UGalqWDHp2kroWMTR5CGY5Z
 gxJcztWvfZ2JXPvCUYsIBEc78xMB8ViKFrVx3amfw9cK/qvZMHjaK0l4CbQgLXBZiitC
 ZKkg==
X-Gm-Message-State: AA+aEWZBJGw8odWWfWrsOSHS/uSwx0+ND09uULXqtxOQXnn5AQ3kmgj2
 VaksVYYziNqrIboTpytGdSL5W0n9V4u9fA==
X-Google-Smtp-Source: AFSGD/U4nBudV5Gfw98oP845UsmbX5+qejUymLDyCs40ISEmWDnL+hQL87edtB4kWljA/vnpplQvdg==
X-Received: by 2002:a1c:709:: with SMTP id 9mr11210770wmh.39.1543928322316;
 Tue, 04 Dec 2018 04:58:42 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm19623606wrq.53.2018.12.04.04.58.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Dec 2018 04:58:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH] clk: meson-gxbb: switch video clocks mux tables to static
Date: Tue,  4 Dec 2018 13:58:39 +0100
Message-Id: <20181204125839.14505-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_045855_006523_CA3AB067 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Makes the following sparse warnings silent:
drivers/clk/meson/vid-pll-div.c:58:26: warning: symbol '_get_table_val' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1585:12: warning: symbol 'gxbb_vid_pll_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1620:12: warning: symbol 'gxbb_vclk_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1980:12: warning: symbol 'gxbb_cts_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:2036:12: warning: symbol 'gxbb_cts_hdmi_tx_parent_names' was not declared. Should it be static?

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/gxbb.c        | 8 ++++----
 drivers/clk/meson/vid-pll-div.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 794f6492a93d..9290465c0589 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1588,7 +1588,7 @@ static struct clk_regmap gxbb_vid_pll_div = {
 	},
 };
 
-const char *gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
+static const char * const gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
 
 static struct clk_regmap gxbb_vid_pll_sel = {
 	.data = &(struct clk_regmap_mux_data){
@@ -1623,7 +1623,7 @@ static struct clk_regmap gxbb_vid_pll = {
 	},
 };
 
-const char *gxbb_vclk_parent_names[] = {
+static const char * const gxbb_vclk_parent_names[] = {
 	"vid_pll", "fclk_div4", "fclk_div3", "fclk_div5", "vid_pll",
 	"fclk_div7", "mpll1",
 };
@@ -1983,7 +1983,7 @@ static struct clk_fixed_factor gxbb_vclk2_div12 = {
 };
 
 static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_parent_names[] = {
+static const char * const gxbb_cts_parent_names[] = {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
@@ -2039,7 +2039,7 @@ static struct clk_regmap gxbb_cts_vdac_sel = {
 
 /* TOFIX: add support for cts_tcon */
 static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_hdmi_tx_parent_names[] = {
+static const char * const gxbb_cts_hdmi_tx_parent_names[] = {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index b3370ea7beac..88af0e282ea0 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -55,8 +55,8 @@ static const struct vid_pll_div vid_pll_div_table[] = {
 #define to_meson_vid_pll_div(_hw) \
 	container_of(_hw, struct meson_vid_pll_div, hw)
 
-const struct vid_pll_div *_get_table_val(unsigned int shift_val,
-					 unsigned int shift_sel)
+static const struct vid_pll_div *_get_table_val(unsigned int shift_val,
+						unsigned int shift_sel)
 {
 	int i;
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

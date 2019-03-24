Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3C5C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05575222C4
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZMLKLcb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Nkga5jgc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05575222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4nK8Idp66drPaKscjLL+Jf6nec3paQrZd1PbLyXMCc=; b=KZMLKLcbDrIfKH
	Fxv3G/JeYTSWZLUs7hxoQVcPoVxAsDil71XPZyyMvvz37jQXUuILnfEtO0NM7JnMTc6iQz83ydwsk
	z51xC/K50uFwf1S1ziJjAnofp9CJPLgNBNZmNNDwrJOHhmnWqP297Q9XTKyVyCHbFNyc0/90yWpFK
	fUYIXE2515Y0pXZ8Y5/yprJmBeIHodYrKzIfMjPkBNMjcBPysGQKALWChcj1wTYK+f7D1iXuhBt81
	tHG/GhhbGKIjSfbdpBAb8PVS2sfQYnUw9LW5DEWtSPw0DEVD6D9d6zdc+4hXPtXcoCV+nxNpUksN8
	4QY/OP/lelonmQkNgdzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h84pt-0005Fw-8r; Sun, 24 Mar 2019 15:14:57 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h84pf-0004xM-S0; Sun, 24 Mar 2019 15:14:48 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so7337552wrp.2;
 Sun, 24 Mar 2019 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HjrKPLeE4jE6ur5TxTVKm7wXzszT1eOtBmFkpv/Rzbg=;
 b=Nkga5jgcaR+uOEU0zufdWX1L+Es6j62840ff046jYGeBcEwjgE6jKEYoCE72xwE3kc
 dnuUwTOmaiPKXy9NbB13AsR+jjggUs+N4/xOj13b1kws23aZZCKOowvBr+XfUkw/ciDV
 dNAcM40XffVUZGzWw6iz7POxP0uM0ONVIOfB34w0vl4WiRJGiO9EZaWBGXBrS4Umn/MJ
 oYehgcp0nAqtxcKUuG8ybggGy1c347MG8VIgG9TgSWsEsmLFW7PwuW+vqX8psFUTM9I6
 NFccVybsh+GvlRP+z+QtDBr/+UBnrPz1F5oPdg7z5JJ5M63A4QfBF7cY+QlNaMl+J6SS
 Xk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HjrKPLeE4jE6ur5TxTVKm7wXzszT1eOtBmFkpv/Rzbg=;
 b=QmDVjlONSoMaN8AKXd3Z/Kd69uB/Px83Fj/u9J0Ab0EI2ShKRY9LwV1T54Tm2im25X
 PDr/VCAMNRKGKzVT/C/iwHHwKoK0sujLAdOkK7qHOYlKWLxygLtbQeZh1BaHvQk5jmDw
 QkOFrpo0dPeDG9TJ2zhywKO4GBvGYtEFKYTJAeU+44weLynFp+mMIQqljSr/LUgfEgw+
 IirGwRonKjZNFcxjkKsYUKp2GCyJrHda67v/1UJqc8+qwxXUNJz1UyJieS9kweiyVc3O
 BcSUPB9NL34q9R3S4TDAEUX0hUwdpZj15XGzy6MQW2QTchdipL4OJFnSZcRj7WOWVSKo
 BQqw==
X-Gm-Message-State: APjAAAWa1+gEwasU36e/nk+PUpF6HcXfu5dNaxSGhrO+Wpua0E58xQHP
 rabQYHe3V2jTZ5RZ+qFiV1U=
X-Google-Smtp-Source: APXvYqy6oJlq39dvuZr8ifbpOUt310iVy8oTPgBSSCrTwWLIHfkjauPyPTpMv1vqljwnpYZMfKM0DQ==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr13207748wrj.118.1553440482470; 
 Sun, 24 Mar 2019 08:14:42 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r16sm376889wrx.37.2019.03.24.08.14.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 08:14:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
Subject: [PATCH v2 2/2] clk: meson: meson8b: add the video decoder clock trees
Date: Sun, 24 Mar 2019 16:14:23 +0100
Message-Id: <20190324151423.19063-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
References: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_081444_064105_485C0ABA 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the four video decoder clock trees.

VDEC_1 is split into two paths on Meson8b and Meson8m2:
- input mux called "vdec_1_sel"
- two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
  and "vdec_1_2")
- and an output mux (probably glitch-free) called "vdec_1"
On Meson8 the VDEC_1 tree is simpler because there's only one path:
- input mux called "vdec_1_sel"
- divider ("vdec_1_1_div") and gate ("vdec_1_1")
- (the gate is used as output directly, there's no mux)

The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
consisting of an input mux, divider and a gate.

The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
However, the register offsets of the second clock path is not known.
Amlogic's 3.10 kernel (which is used as reference) sets
HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
to 0 afterwards. For now, leave a TODO comment and only add the first
path.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 312 ++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h |  17 +-
 2 files changed, 328 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 8e091c2d10e6..37cf0f01bb5d 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1902,6 +1902,257 @@ static struct clk_regmap meson8b_vpu = {
 	},
 };
 
+static const char * const meson8b_vdec_parent_names[] = {
+	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "mpll2", "mpll1"
+};
+
+static struct clk_regmap meson8b_vdec_1_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 9,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_1_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = meson8b_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_1_1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_1_1_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_1_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_1_1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_1_1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_1_1_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_1_2_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC3_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_1_2_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_1_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_1_2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC3_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_1_2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_1_2_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_1 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC3_CLK_CNTL,
+		.mask = 0x1,
+		.shift = 15,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_1",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "vdec_1_1", "vdec_1_2" },
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hcodec_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 25,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hcodec_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = meson8b_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hcodec_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.shift = 16,
+		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hcodec_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_hcodec_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hcodec = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_hcodec",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_hcodec_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_2_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 9,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_2_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = meson8b_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_2_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_2_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_2_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_2_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hevc_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 25,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevc_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = meson8b_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hevc_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.shift = 16,
+		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevc_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_hevc_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hevc_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_hevc_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_hevc_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_vdec_hevc = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.mask = 0x1,
+		.shift = 31,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevc",
+		.ops = &clk_regmap_mux_ops,
+		/* TODO: The second parent is currently unknown */
+		.parent_names = (const char *[]){ "vdec_hevc_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
@@ -2168,6 +2419,19 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_VPU_0_SEL]	    = &meson8b_vpu_0_sel.hw,
 		[CLKID_VPU_0_DIV]	    = &meson8b_vpu_0_div.hw,
 		[CLKID_VPU]		    = &meson8b_vpu_0.hw,
+		[CLKID_VDEC_1_SEL]	    = &meson8b_vdec_1_sel.hw,
+		[CLKID_VDEC_1_1_DIV]	    = &meson8b_vdec_1_1_div.hw,
+		[CLKID_VDEC_1]	   	    = &meson8b_vdec_1_1.hw,
+		[CLKID_VDEC_HCODEC_SEL]	    = &meson8b_vdec_hcodec_sel.hw,
+		[CLKID_VDEC_HCODEC_DIV]	    = &meson8b_vdec_hcodec_div.hw,
+		[CLKID_VDEC_HCODEC]	    = &meson8b_vdec_hcodec.hw,
+		[CLKID_VDEC_2_SEL]	    = &meson8b_vdec_2_sel.hw,
+		[CLKID_VDEC_2_DIV]	    = &meson8b_vdec_2_div.hw,
+		[CLKID_VDEC_2]	    	    = &meson8b_vdec_2.hw,
+		[CLKID_VDEC_HEVC_SEL]	    = &meson8b_vdec_hevc_sel.hw,
+		[CLKID_VDEC_HEVC_DIV]	    = &meson8b_vdec_hevc_div.hw,
+		[CLKID_VDEC_HEVC_EN]	    = &meson8b_vdec_hevc_en.hw,
+		[CLKID_VDEC_HEVC]	    = &meson8b_vdec_hevc.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2361,6 +2625,22 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_VPU_1_DIV]	    = &meson8b_vpu_1_div.hw,
 		[CLKID_VPU_1]		    = &meson8b_vpu_1.hw,
 		[CLKID_VPU]		    = &meson8b_vpu.hw,
+		[CLKID_VDEC_1_SEL]	    = &meson8b_vdec_1_sel.hw,
+		[CLKID_VDEC_1_1_DIV]	    = &meson8b_vdec_1_1_div.hw,
+		[CLKID_VDEC_1_1]	    = &meson8b_vdec_1_1.hw,
+		[CLKID_VDEC_1_2_DIV]	    = &meson8b_vdec_1_2_div.hw,
+		[CLKID_VDEC_1_2]	    = &meson8b_vdec_1_2.hw,
+		[CLKID_VDEC_1]	    	    = &meson8b_vdec_1.hw,
+		[CLKID_VDEC_HCODEC_SEL]	    = &meson8b_vdec_hcodec_sel.hw,
+		[CLKID_VDEC_HCODEC_DIV]	    = &meson8b_vdec_hcodec_div.hw,
+		[CLKID_VDEC_HCODEC]	    = &meson8b_vdec_hcodec.hw,
+		[CLKID_VDEC_2_SEL]	    = &meson8b_vdec_2_sel.hw,
+		[CLKID_VDEC_2_DIV]	    = &meson8b_vdec_2_div.hw,
+		[CLKID_VDEC_2]	    	    = &meson8b_vdec_2.hw,
+		[CLKID_VDEC_HEVC_SEL]	    = &meson8b_vdec_hevc_sel.hw,
+		[CLKID_VDEC_HEVC_DIV]	    = &meson8b_vdec_hevc_div.hw,
+		[CLKID_VDEC_HEVC_EN]	    = &meson8b_vdec_hevc_en.hw,
+		[CLKID_VDEC_HEVC]	    = &meson8b_vdec_hevc.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2556,6 +2836,22 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_VPU_1_DIV]	    = &meson8b_vpu_1_div.hw,
 		[CLKID_VPU_1]		    = &meson8b_vpu_1.hw,
 		[CLKID_VPU]		    = &meson8b_vpu.hw,
+		[CLKID_VDEC_1_SEL]	    = &meson8b_vdec_1_sel.hw,
+		[CLKID_VDEC_1_1_DIV]	    = &meson8b_vdec_1_1_div.hw,
+		[CLKID_VDEC_1_1]	    = &meson8b_vdec_1_1.hw,
+		[CLKID_VDEC_1_2_DIV]	    = &meson8b_vdec_1_2_div.hw,
+		[CLKID_VDEC_1_2]	    = &meson8b_vdec_1_2.hw,
+		[CLKID_VDEC_1]	    	    = &meson8b_vdec_1.hw,
+		[CLKID_VDEC_HCODEC_SEL]	    = &meson8b_vdec_hcodec_sel.hw,
+		[CLKID_VDEC_HCODEC_DIV]	    = &meson8b_vdec_hcodec_div.hw,
+		[CLKID_VDEC_HCODEC]	    = &meson8b_vdec_hcodec.hw,
+		[CLKID_VDEC_2_SEL]	    = &meson8b_vdec_2_sel.hw,
+		[CLKID_VDEC_2_DIV]	    = &meson8b_vdec_2_div.hw,
+		[CLKID_VDEC_2]	    	    = &meson8b_vdec_2.hw,
+		[CLKID_VDEC_HEVC_SEL]	    = &meson8b_vdec_hevc_sel.hw,
+		[CLKID_VDEC_HEVC_DIV]	    = &meson8b_vdec_hevc_div.hw,
+		[CLKID_VDEC_HEVC_EN]	    = &meson8b_vdec_hevc_en.hw,
+		[CLKID_VDEC_HEVC]	    = &meson8b_vdec_hevc.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2729,6 +3025,22 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_vpu_1_div,
 	&meson8b_vpu_1,
 	&meson8b_vpu,
+	&meson8b_vdec_1_sel,
+	&meson8b_vdec_1_1_div,
+	&meson8b_vdec_1_1,
+	&meson8b_vdec_1_2_div,
+	&meson8b_vdec_1_2,
+	&meson8b_vdec_1,
+	&meson8b_vdec_hcodec_sel,
+	&meson8b_vdec_hcodec_div,
+	&meson8b_vdec_hcodec,
+	&meson8b_vdec_2_sel,
+	&meson8b_vdec_2_div,
+	&meson8b_vdec_2,
+	&meson8b_vdec_hevc_sel,
+	&meson8b_vdec_hevc_div,
+	&meson8b_vdec_hevc_en,
+	&meson8b_vdec_hevc,
 };
 
 static const struct meson8b_clk_reset_line {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index e775f91ccce9..ed37196187e6 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -37,6 +37,9 @@
 #define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
 #define HHI_VPU_CLK_CNTL		0x1bc /* 0x6f offset in data sheet */
 #define HHI_HDMI_CLK_CNTL		0x1cc /* 0x73 offset in data sheet */
+#define HHI_VDEC_CLK_CNTL		0x1e0 /* 0x78 offset in data sheet */
+#define HHI_VDEC2_CLK_CNTL		0x1e4 /* 0x79 offset in data sheet */
+#define HHI_VDEC3_CLK_CNTL		0x1e8 /* 0x7a offset in data sheet */
 #define HHI_NAND_CLK_CNTL		0x25c /* 0x97 offset in data sheet */
 #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
@@ -156,8 +159,20 @@
 #define CLKID_VPU_1_SEL		186
 #define CLKID_VPU_1_DIV		187
 #define CLKID_VPU_1		189
+#define CLKID_VDEC_1_SEL	191
+#define CLKID_VDEC_1_1_DIV	192
+#define CLKID_VDEC_1_1		193
+#define CLKID_VDEC_1_2_DIV	194
+#define CLKID_VDEC_1_2		195
+#define CLKID_VDEC_HCODEC_SEL	197
+#define CLKID_VDEC_HCODEC_DIV	198
+#define CLKID_VDEC_2_SEL	200
+#define CLKID_VDEC_2_DIV	201
+#define CLKID_VDEC_HEVC_SEL	203
+#define CLKID_VDEC_HEVC_DIV	204
+#define CLKID_VDEC_HEVC_EN	205
 
-#define CLK_NR_CLKS		191
+#define CLK_NR_CLKS		207
 
 /*
  * include the CLKID and RESETID that have
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

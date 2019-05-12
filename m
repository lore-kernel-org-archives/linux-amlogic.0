Return-Path: <SRS0=vTSx=TM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82840C04A6B
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 19:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51FEC20C01
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 19:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kk70ryw2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="D7EZkZWp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51FEC20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVq2qMnjBupSHKlB4L4acnoa2b+FeZ7n2h1dfO+bsS0=; b=Kk70ryw2d2UFWD
	gV6wZNmTR1BOAl58O7gqmD2/a5ZKfdrdDmqi9mlXCsbCUAUE1iuoGQgD4EFsu87DEuQwwb+jUlWZo
	GZ6uyri1RuwofROUfCShxbw7ikDuZ3lzuNMQoPYWHZfvko7cocjIvFGFqOXUY5rjD6jtzHqcjOE5d
	plelWeWF0ykNvH0b3DC+FSevfANEk5HsOzsdw7MFrKAYK8YfwB93tJ/6CHneI5uSb8KC6UvgQ18vl
	wkYrKbF9v/FEVY8hD0FQRj6UtrIGw5e1qBLUmwO79Wax2BCZ78y2K1ArsfKLsuXCYOB/k1RdmOjPu
	3fLcjBfIWhhQUizunfBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPuNW-00037r-9F; Sun, 12 May 2019 19:43:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPuNO-0002y5-Cu; Sun, 12 May 2019 19:43:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id f204so6316152wme.0;
 Sun, 12 May 2019 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AqfzzZgYh773xcVhaI6uUR4lAMlHwzAkWA/UkOzUZ64=;
 b=D7EZkZWpd252npUWFhFf2WXhLBZPNYbIIOokNB+eEc385EcmLuDkq/0rM76ytoIXDr
 /IK0+sF2f3Kq+kT3hmPV72GWZQcj3u0QMXdzOgIX3XpNA7ZQpALbltmFzMKv4XQiLK2H
 c1U3v4RL7KyYKkQrVi63+MaDyF9d1Fz60n5I45HUiwBAlRQbCJe8QXCmj7UX8GUzoFek
 daRr9vIwh/67yncmj95i022mp8xph+BoaQoYH3oG34oxJkM7tdK9/vnNfZxjwDCBMxJJ
 bhL2X2He7dHlJSZbLupQWgPQx1EHHRGMLuNJZG7HrF/DYnzx36uAHq5E0EnUvPeFyRCe
 e9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AqfzzZgYh773xcVhaI6uUR4lAMlHwzAkWA/UkOzUZ64=;
 b=UTzrI4IZdaxTUeb6XuPn7NhScei4YMLb7KMV+1NT6llNvOShvEzgsqvCajv1WOfSKw
 1bAUWyVTsTA7VC22DzW/cWS2a55SsOPZrgfbX+1FSSPhXa+Qz/XgGIDRzZUHLAadce2A
 9Fdt7iYPVamQ6x/FD8yPM4b5MCWDA/NjybwgQeOqly0/04yMgLVRETHGjTgC2NoHDlKG
 fPztxLpY/W1MU3F/bH34f+bIfzs9S1V1yZ3EUrqh/0V1Bhxh+vE6izW52aomn7nutjyA
 dqOeGlIDnv4nqBmfpYeoUQpajGR/sc7MecRXot6RN19o12a0gEJmjPHmuUiGBe0FwM5O
 pULA==
X-Gm-Message-State: APjAAAUp6tmu2quvaAK4XBUhjRIahRBkso+fC5UeQrDp2MYajWUyWfUk
 XnFc0tCUa2IjwllDKDVhDRk990/px4U=
X-Google-Smtp-Source: APXvYqxst1IMmq0aCd4wGUOWu4F2rwedBjwlTWWdXmF/1nnjuBDeUJsPP7ROf9mWcgMxqv5G7bnQ2g==
X-Received: by 2002:a1c:ba87:: with SMTP id k129mr1518472wmf.132.1557690192455; 
 Sun, 12 May 2019 12:43:12 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00ECBE9107EA8EB108.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:ecbe:9107:ea8e:b108])
 by smtp.googlemail.com with ESMTPSA id r23sm13685178wmh.29.2019.05.12.12.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 12:43:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com
Subject: [PATCH 1/1] clk: meson: meson8b: fix a typo in the VPU parent names
 array variable
Date: Sun, 12 May 2019 21:43:00 +0200
Message-Id: <20190512194300.7445-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190512194300.7445-1-martin.blumenstingl@googlemail.com>
References: <20190512194300.7445-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_124314_437279_45102758 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The variable which holds the parent names for the VPU clocks has a typo
in it. Fix this typo to make the variable naming in the driver
consistent. No functional changes.

Fixes: 41785ce562491d ("clk: meson: meson8b: add the VPU clock trees")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 37cf0f01bb5d..62cd3a7f1f65 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1761,7 +1761,7 @@ static struct clk_regmap meson8m2_gp_pll = {
 	},
 };
 
-static const char * const mmeson8b_vpu_0_1_parent_names[] = {
+static const char * const meson8b_vpu_0_1_parent_names[] = {
 	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
 };
 
@@ -1778,8 +1778,8 @@ static struct clk_regmap meson8b_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = mmeson8b_vpu_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(mmeson8b_vpu_0_1_parent_names),
+		.parent_names = meson8b_vpu_0_1_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_names),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1837,8 +1837,8 @@ static struct clk_regmap meson8b_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = mmeson8b_vpu_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(mmeson8b_vpu_0_1_parent_names),
+		.parent_names = meson8b_vpu_0_1_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_names),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

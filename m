Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8D2C2D0F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 23:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C73F20733
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 23:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwN7ys8t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U4dAz5Jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C73F20733
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mu6JbQHLwVjBjJKtJonB/YvSh/Dav3lUiR+K1yaEItA=; b=PwN7ys8txLvnJ0
	1ob7RVJD69h6LVc244ZVjxaVR0iWcWlg5QqquAO+ebWG6nY7fsulQdIHsbF25ba9qk/3utfpAt4D4
	a6knUmUoaGJdCn8tUcb795v6cYkolGMxJiywZKWYNIkz+9JTxeIs0Z0zmXxlgj77xKdTINwZASAU0
	yf08ppL+U3um34W8wPWZWdWCeqgSrG3RSnx3/JGVKUvRyTWdl6Myz4rNGmRPXwteiXRtZQ56zKV6v
	w4FdQQRTBqlpuxmFV1tPNTjvzwGP8xA7+tZZRuGTr4BD2vtOk6Exm+n+oapel55FEx9d2Qg+u3SZ3
	rO9cO9ElkjDCld179OKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ46w-00050L-BT; Mon, 30 Mar 2020 23:46:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ46M-0004Qp-8H; Mon, 30 Mar 2020 23:45:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id c187so647786wme.1;
 Mon, 30 Mar 2020 16:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5uzSi9/VYcTraEBB9HY7h/rXS2xZdLMR03bizri5gj4=;
 b=U4dAz5JvC5Fm0PIcTcWwiVNghqf0QdYuFyDYQm3OPsDtjHrCfMpE46Qo7orMdSK05Y
 P5DXJy38lM1lC7YIgMPBGH16GG5xBtNDRcaO6VhqWdmxtggajwky/+qcHKKF6NYHg00G
 W9dFPn3vX5HJ5BC7X8j9SbXwS6bz5LpzRR4vsM7CdR1Yyyr61PXhKsAsfJFGgRFavQaF
 EZ9CIwME/Ja3sdR3Y3OZLi5gA0KPfwcKI1DMz0CqjqajGHI5/TQsHPOpEJQX0P7FH1xD
 51fdQHUq+OFjP3ufeY+q8KJZYGaed/SA62fyiiORqKhq8vCQbVrEpKBxkAZ4+oEyOazH
 ZXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5uzSi9/VYcTraEBB9HY7h/rXS2xZdLMR03bizri5gj4=;
 b=KVGSgoKH7IQ7aP6qBsNRyWcWcoa/C44/398a60hUDiTwSjPCbzSQpnhFUYvQP/vFJD
 k7jgu0MTbe1XqEeAi6D+DEUjXWX8+RCwFiTkmJxYO0Di3WH1KK6bz+ZsdVckZqWib6W1
 otL7ASBxsv6VI0yR7URwEqqImPhYr4ZjQ7VHqfXgSNqh47H7OOEeFMHOeBzTrTR+mOx0
 bMXoIZ9YZniDTTICYf71aeWKxamoQioRG53a/NHqZpoRN2ajL/F8RWdJZqvEy6Nts/yC
 WjrGIDcg1kTBWL8nd1ppV/KTCj5MOsfzlsDYwyUm1UvM/InqCAiteiAiv9aHo6Lwbypn
 t00A==
X-Gm-Message-State: ANhLgQ3YMp5TXqf60nOV76thWj89HZblXWSV3yqXM8cjMzz3wAg6uVcA
 8NMmyIHyiTJNTsiXj2Gly0G7z/Sa
X-Google-Smtp-Source: ADFU+vvtXm6WQtlMFz5iqFRMXzrlv57Bxn7PrxUOdXCnqT1tXpKTo5A1T4R+dQC9PFDeLc8AG/pT8Q==
X-Received: by 2002:a1c:2484:: with SMTP id k126mr575356wmk.52.1585611949773; 
 Mon, 30 Mar 2020 16:45:49 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v186sm1392953wme.24.2020.03.30.16.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:45:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH 2/2] clk: meson: meson8b: make the hdmi_sys clock tree mutable
Date: Tue, 31 Mar 2020 01:45:35 +0200
Message-Id: <20200330234535.3327513-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
References: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_164554_322518_9DE9F7DA 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The HDMI TX controller requires the hdmi_sys clock to be enabled. Allow
changing the whole clock tree now that we know that one of our drivers
requires this.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 34a70c4b4899..7c55c695cbae 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1725,7 +1725,7 @@ static struct clk_regmap meson8b_hdmi_sys_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_sys_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		/* FIXME: all other parents are unknown */
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "xtal",
@@ -1745,7 +1745,7 @@ static struct clk_regmap meson8b_hdmi_sys_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_sys_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_hdmi_sys_sel.hw
 		},
@@ -1761,7 +1761,7 @@ static struct clk_regmap meson8b_hdmi_sys = {
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "hdmi_sys",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_hdmi_sys_div.hw
 		},
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

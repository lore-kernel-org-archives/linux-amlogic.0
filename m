Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2DAC4740A
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415B120C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ur7HwWEi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tyKJBdOM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 415B120C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyDvlGKU4hkh7sbs4x+D2bKDPqV85dr0vR/D1qJueRA=; b=Ur7HwWEisBugCK
	j1RvOaswuxj3PI3wOUZWRp64/07Ur/88QAQtgDV7LhlftayVdqm1jgkgJxjz9CbPA1vfEGYm80WO6
	+MYeIvyz1sFn6bh3k/eKaW1PjrDELv4E4dlxqZTcyentF7IIrFDn4RzRTYAinnGNoGf67ZccUQ1CD
	1+MS1NFJCD+NIPGtpST0zWHylG2lu6Ola9aslJWrldPyI6IKH7Qy121i1oLwFLAxh2niFwQDer5IA
	7KlPW3o/qdgqZplEumUl3vUpu318ByIaVSaF3tjrEZ4wY022TIRgLoUljZxK/Ino45GZaKPIcwXIk
	0zkIuZ7KY0tknxjRKd+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBh4i-0007ge-HF; Sat, 21 Sep 2019 15:13:28 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh44-00077h-0J; Sat, 21 Sep 2019 15:12:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id h7so9579110wrw.8;
 Sat, 21 Sep 2019 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CPQNzivuVZNWDtPwgDvWYp9o/YTaW3TY1ny0gNcTyh8=;
 b=tyKJBdOMcUtbyFEEuDYriQySbMRUnzXuTDnHyk5sSVY9vIyXw98fB0hQyP6qVFJ819
 DfquyskfRywLFLSYTc4YKTG24fIDU9iNeW3oT3mQyd4k/jSF63Gc80ivqn1BpQzJ8NDC
 Cm6xzIST6MSIpYsoLgu6bkosOUGBDKvWKf5IX7aX6bljDyWXSMafPMACH/PZIZeC9Bjz
 yW18+/FdXg4beschyz7151ft/qab39sCKXnygfB7RmGcCLjddnDATjrI3w7hiqsTboo9
 dRcPgHweDogzdhcO2WbGaTDqIGsedGomszlBQYyR8RQd+fa4D1NzjHWhYU/0+2LY8+Qa
 FNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPQNzivuVZNWDtPwgDvWYp9o/YTaW3TY1ny0gNcTyh8=;
 b=TQcAPhuiMiHn+Fb8h1y1IJOrFYMMQwz2cIGKyI1UNwAHtEyf9QZoXf1Xf+tMC3vi1x
 GbzC93sCqE7Fd1bOeBqK+FXd7M/xgUV+s73wfKwWekbp60jJRMDrkbnscAOpUi+27hnM
 wqO+0g6ZiF7sQUyvaNdqQ9CrjgpJCjbsOGkIKRCB1EC/tpad+oMunyDyRrNIf2A4jHKC
 8KGaczOT2XM/EUTe/StsG3oftftyV0L2V8X2HVogLHXmpCE9O52wGXEjs2yVn3FTfxq1
 oKi8TTYHTk7I+nPgCGZUbezGjwb5QchpIaxcC+W6EctAiw/odrjCGZjRxXLHgE5lq6bw
 yiqQ==
X-Gm-Message-State: APjAAAXJM/glYuo9a65WmB/v4D7+MhpmXFk+f2A5ePEnDEaS8Zo+Drr5
 w8FhSVWq7q3Z7WSEkAfXclA=
X-Google-Smtp-Source: APXvYqwnd+5qIx487C1bZirqZ9rqerQUlrUb7EkYpyDE0y3bXL3OIoYGID3wBEp9e0T8xvje4DoNEQ==
X-Received: by 2002:a5d:5592:: with SMTP id i18mr15044038wrv.316.1569078766284; 
 Sat, 21 Sep 2019 08:12:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id
 y186sm10712491wmb.41.2019.09.21.08.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:12:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 2/5] clk: meson: meson8b: use clk_hw_set_parent in the CPU
 clock notifier
Date: Sat, 21 Sep 2019 17:12:20 +0200
Message-Id: <20190921151223.768842-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081248_049623_84082CC6 
X-CRM114-Status: GOOD (  11.74  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch from clk_set_parent() to clk_hw_set_parent() now that we have a
way to configure a mux clock based on clk_hw pointers. This simplifies
the meson8b_cpu_clk_notifier_cb logic. No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 67e6691e080c..d376f80e806d 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3585,7 +3585,7 @@ static const struct reset_control_ops meson8b_clk_reset_ops = {
 
 struct meson8b_nb_data {
 	struct notifier_block nb;
-	struct clk_hw_onecell_data *onecell_data;
+	struct clk_hw *cpu_clk;
 };
 
 static int meson8b_cpu_clk_notifier_cb(struct notifier_block *nb,
@@ -3593,30 +3593,25 @@ static int meson8b_cpu_clk_notifier_cb(struct notifier_block *nb,
 {
 	struct meson8b_nb_data *nb_data =
 		container_of(nb, struct meson8b_nb_data, nb);
-	struct clk_hw **hws = nb_data->onecell_data->hws;
-	struct clk_hw *cpu_clk_hw, *parent_clk_hw;
-	struct clk *cpu_clk, *parent_clk;
+	struct clk_hw *parent_clk;
 	int ret;
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		parent_clk_hw = hws[CLKID_XTAL];
+		/* xtal */
+		parent_clk = clk_hw_get_parent_by_index(nb_data->cpu_clk, 0);
 		break;
 
 	case POST_RATE_CHANGE:
-		parent_clk_hw = hws[CLKID_CPU_SCALE_OUT_SEL];
+		/* cpu_scale_out_sel */
+		parent_clk = clk_hw_get_parent_by_index(nb_data->cpu_clk, 1);
 		break;
 
 	default:
 		return NOTIFY_DONE;
 	}
 
-	cpu_clk_hw = hws[CLKID_CPUCLK];
-	cpu_clk = __clk_lookup(clk_hw_get_name(cpu_clk_hw));
-
-	parent_clk = __clk_lookup(clk_hw_get_name(parent_clk_hw));
-
-	ret = clk_set_parent(cpu_clk, parent_clk);
+	ret = clk_hw_set_parent(nb_data->cpu_clk, parent_clk);
 	if (ret)
 		return notifier_from_errno(ret);
 
@@ -3695,7 +3690,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 			return;
 	}
 
-	meson8b_cpu_nb_data.onecell_data = clk_hw_onecell_data;
+	meson8b_cpu_nb_data.cpu_clk = clk_hw_onecell_data->hws[CLKID_CPUCLK];
 
 	/*
 	 * FIXME we shouldn't program the muxes in notifier handlers. The
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

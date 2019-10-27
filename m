Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9FCCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14745214AF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e6NVNn3f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eh1WeQJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14745214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyDvlGKU4hkh7sbs4x+D2bKDPqV85dr0vR/D1qJueRA=; b=e6NVNn3fgk89Hj
	7iyO6x8cQcqWeMSs5OFnoiTuXylIC955CpOwE9u5hEAz+O7ORs0nIdC5YNB7ELbG+azfQZ8NIxYm7
	Qr9DUAAcr5t4TAnwR/qlh+6b5CdmXKUVholVr73AkWaaDSG/dkk2SEhDq69hNSkXT0OyUSNtuKOM+
	C9KO+NtnveI6jlp4vkyAGIZ/OxnQmrB3efEoUyWmuffdhykuc0DkGbrpP3nAvKXefejAdysQRy44q
	fPGgcOY9xIQu4KbzUKQiYNa3qXyfELM7uhT0I88OWld+MfYuPxvJFty2NPKWDPoZJsg/UPRKMyssL
	oNyPVtdCasKHDmT9pR2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlFb-0006aD-IH; Sun, 27 Oct 2019 16:18:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlFE-0006C8-D9; Sun, 27 Oct 2019 16:18:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id g7so6953387wmk.4;
 Sun, 27 Oct 2019 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CPQNzivuVZNWDtPwgDvWYp9o/YTaW3TY1ny0gNcTyh8=;
 b=eh1WeQJUqLqmNq7P5g77WEfxAuW9neRhh+Met5oYqfM/347j8sLtzsTSeh334FZcke
 mdSDPnwhvk9xiHA8r404dwDpMZQfA+3v7HOFnzcNVF01PiBTcW7xaRUBKAAVPPffJWUp
 n8TH/PSO82uFK1dIBcVzajImWj23r6JJmJOMKLXqwoXG7ycIbJj2vbn/2K5OInyOFCMc
 e4ePBKVK8O5xCHy8FQoUhdTP0Hz9TL4fFH0sLCzwsorlgV9cD3GbHGCnv9Qw9Bv/Mvd8
 TAjg0bZuKIGThrBMSx2Wj03CnIsphlJsMouXd2kqscALnb1TFq/oDfoZHP8HdCOJCYRX
 8Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPQNzivuVZNWDtPwgDvWYp9o/YTaW3TY1ny0gNcTyh8=;
 b=d/wVX+TbRRqJrezfs5Hd2ki4cPDuwPRLmuma2yohyjEJG2T/99H36DNldF6Y3qtHR4
 cT0wyiEIAHwRP2ocSUFtiqjm/AAgo1RJ80OkNmhgTaeDakfNs1lEhOF6NYxLvIVHXx8B
 pTs/vrK5j5o+pV9NKmIxgnyd9FoJGVhl3L6/Bc12XZymmoBh3QEApjf05V6p06l43G9P
 LdfiUcAAyqrXDbyorg8M0A8aWOTW2mnTBtWzzxTkkKy5VIUYQ3wa/noxbDDwi9yZEt1v
 9NXNJbiHB9n1Ksw8HdN5E6DJUMktNyyRMCjETi1UO9jStoGf0NZSeHn5PbWuYRnUIjPE
 LaNQ==
X-Gm-Message-State: APjAAAWKHbCqTuppQOAo75jYb2dyqOW0Nj7ctg6juj0/7ne0/NCyxP2t
 agCeRvbTD0cGNOH2XBjQ0BkJyAC3NhF6gw==
X-Google-Smtp-Source: APXvYqz30NtrWX/wc/G4NZzRKZdUoiVvN3FqVKpNKl42zjz3/qQTlrYB1xwMJ+Fi2jVmhppWcoPaMQ==
X-Received: by 2002:a1c:b4c2:: with SMTP id
 d185mr11147241wmf.159.1572193094673; 
 Sun, 27 Oct 2019 09:18:14 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j14sm9585014wrj.35.2019.10.27.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:18:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 2/5] clk: meson: meson8b: use clk_hw_set_parent in the CPU
 clock notifier
Date: Sun, 27 Oct 2019 17:18:02 +0100
Message-Id: <20191027161805.1176321-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
References: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_091820_544838_D2F2C6AC 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F9EC48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665CD61469
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665CD61469
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNvuEqjvze+ntjpGdID/WJ7hY22y5MnOpkq0UloD6Rc=; b=aFIgqMs46g9Ho2
	ngyAO/k1fFfN1ZQlN0KTt8mvo6XNsexcINRYkg3nKjm+IfPiSqtHs+C24snlisWa2G4NEgkQ+e+Ay
	3NCT10jFEVJ/C5whVVqFfP6Vu1HR+AXAYb9qvisVp8nGqUo5GjH8008XR0IZvDpiMGzbpuEvaBRp3
	m1DlWS0W21eBCdBrknF5QKzzho2uChTbyIEgXCDWR6uePaT/RgHzuw29Y/+n3rc25o4UtFXfHgzf0
	0yS6rNzRJ6CSa0vKg7KBuWkGlFUcFEGUcTT21tQ/JpeQu3hoibd+NWrYk3cd4DGZaxiGwC53XzJi2
	hlpnB5ZPPDY2oFrVsIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxdSG-006Fj1-HB; Sun, 27 Jun 2021 22:40:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxdRs-006Fbl-Ri; Sun, 27 Jun 2021 22:40:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id q14so22642303eds.5;
 Sun, 27 Jun 2021 15:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqEIUvOwohephlofOmmLb1b6WQ3FllXjftCHIKtplvw=;
 b=HAfLAE1x+EPiIb0XwvCnjIHAB8HTdRQi7GAec5mhFOjoxeTGDf79Eaq3apk/rFqNEl
 6NbS2Qeahwd0zvVZxd1YLlrtTAiFSQK5KF5GCIBsv2I7jO7i3FTKK5K9Oubiu7RbTZTz
 aS+dpZALDh3S6XbJCIMKSUFWgXez3r1L3x8LSY/e29h7aNAk0qq9O1z0N4R5rW3xTKU+
 NJiYHE7+0DPmm2/98nR87AC3svI7wdBliptt2jjgEeS1kL4GCJBCMBcOQ27dWSnJs6km
 ajcKvt2ptrSBK65Y0wknPaXO08qdzGGpWy1YxNbJ+Zi3SNbJpwoDQ9aHxCO7WKVlrKxm
 8MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqEIUvOwohephlofOmmLb1b6WQ3FllXjftCHIKtplvw=;
 b=cPz5qdrgMfuVya46jf4zfYwdbPudv9ISV08TWW0LHZWRL31YrXF1uHL418j8mhdJRc
 1ZGWC458orYG+CGXdHhriBnwWuousF6M822dTVbz8oKKIGv1H89+oEFTYq7QRXOsekCR
 4rbebMKi752kYuk57VP2bISz2amFi8d5Xd50ZRW985QUpNPovGgjpM5e9iW7cY9yZv6F
 db/d/ruj1sxa6qkQCJwWWP8zIVrpeM/+zYZzaSb7h/R7NPBWz4HElFgH2xjjmp62UnC6
 NTmJRkJ+hngjlg50ND7okVxoiklBzDi6LEOdqLzvaGq47+ryS6+ae4ZZBz4kH6Pie6Be
 Bang==
X-Gm-Message-State: AOAM5331V4rlb+z8dLUo6Yoiq3IZrW23iEtzJc9cQKSqSBrDSBHgaG2H
 MBz+lNN4bJ4rtTTrhurZOxA=
X-Google-Smtp-Source: ABdhPJywEW1+u5KxW6llw9kTPdI0GqiJdUzUBLg1j+arDS1xVMKwcrZwv0PdPAqjmPwah2kzL+H9Kg==
X-Received: by 2002:a05:6402:1d11:: with SMTP id
 dg17mr29628425edb.30.1624833619402; 
 Sun, 27 Jun 2021 15:40:19 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-bd64-8b00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:bd64:8b00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id jz27sm6048861ejc.33.2021.06.27.15.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 15:40:19 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
Date: Mon, 28 Jun 2021 00:39:58 +0200
Message-Id: <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_154020_937758_D15815BF 
X-CRM114-Status: GOOD (  13.59  )
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

.determine_rate is meant to replace .round_rate. The former comes with a
benefit which is especially relevant on 32-bit systems: since
.determine_rate uses an "unsigned long" (compared to a "signed long"
which is used by .round_rate) the maximum value on 32-bit systems
increases from 2^31 (or approx. 2.14GHz) to 2^32 (or approx. 4.29GHz).
Switch to a .determine_rate implementation by default so 32-bit systems
can benefit from the increased maximum value as well as so we have one
fewer user of .round_rate.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-divider.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 87ba4966b0e8..9e05e81116af 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -425,8 +425,8 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 }
 EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
 
-static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_divider_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 
@@ -437,13 +437,13 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		val = clk_div_readl(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-					     divider->width, divider->flags,
-					     val);
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width,
+						 divider->flags, val);
 	}
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 int divider_get_val(unsigned long rate, unsigned long parent_rate,
@@ -500,14 +500,14 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops clk_divider_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
+	.determine_rate = clk_divider_determine_rate,
 	.set_rate = clk_divider_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_divider_ops);
 
 const struct clk_ops clk_divider_ro_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
+	.determine_rate = clk_divider_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_divider_ro_ops);
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

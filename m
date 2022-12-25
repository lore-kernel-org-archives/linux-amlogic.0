Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7518CC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 01:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH81SF29nlyZY0TPW8B57lkXC8TuLJC4Zfg3e/YPERc=; b=prK309FnkE7F+Z
	sdgsekdLhgib0Umr0RY37aymq6iQ7T9lTzxc97FeFTm4qj1TbGreuO4kNiRTkuBSMAn6JwbKVk864
	pPVpGci83w1Echm2b3pN4etC98vRWb4Nf07YwnypS4CzqOX5zcSVH7n8pUjF8rowPYp+CFiz/nF9U
	JlKkMFaE1C3QLaBMv/dMfcE3S03hdR8UzKz4+B5paH/8EwDIwt+SpxjsLGcvDmdV56xQ7aOXZ74s2
	90mHDsFHHtrjsc9YJyuL46hKIWMezTe32Re3p6M05eYP3wA/qeaoojck58rEAqmJFerP7oDA31xg7
	0pkoGHkBDN/9AblPXIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9cAr-000ADT-1A; Mon, 26 Dec 2022 01:21:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9YW4-00FdSY-Gb
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 21:26:46 +0000
Received: by mail-ej1-x634.google.com with SMTP id fc4so22959182ejc.12
        for <linux-amlogic@lists.infradead.org>; Sun, 25 Dec 2022 13:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q0ndmNr0G5VO5mmrpAzqld+fYwSSkJR22yhfnom9II=;
        b=hZzER+iF+6hFcPJzUmNyCqQJO42nRu6a+rSLJdUpP4qgdSLC0kNAdio44GrPx2rp9s
         7JW7lZSrypqXi/G5o6hCj8apS25LAMJhksaUUPytaSKi88V8H98y4cWDn9z1jUiEI+Js
         NFzHnJRIB6xFdV+pZQlrvUUYYbfwSyCVbmUFMxgLxXCKyMku5rBfEEU9rPIuVH1D7B5C
         Tgn3rNX4zOvZOZj+04gmtAhksU2ObGaiHPvEQQNSpN7hTYFKkrsTSXr5Er8nOhQLRhPa
         CfVFb9GnAXMDFgnt+MtVLTPDyknH3kJ2lNrApx1w0SH2x6Jx2r21caCKweEGr6Z/+7Ep
         yPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q0ndmNr0G5VO5mmrpAzqld+fYwSSkJR22yhfnom9II=;
        b=bv2300/vJJJnQsrk4/86/jOtJFDI1FmHemmI2+3YZXDn8MWeiJYS891j577BWL+iGM
         CexQd6SU90QCKmw3d5QeVTEvLntsbvUx3wTIUWHKMtqQjN9XQfteRJaswWXvU+eIHxhA
         d0LH0Jy7WLK9GbgMuwRI/vQTHC++5hxwt5ah7QVl1SJL3bq/VB80WnJnKtaLVlOMqrCz
         biUIqM6Uu02YaMuGFoeO2HHKBlVSCvY5ApiXiiUSKIgAMYXmtf8AUNJuoroLtbuztS2m
         2ekxQx8W3xsBPpf7G4L2gMGypoW9lj7NItCOVJyIdEXtPnhCmSfeG6q44FAVQhwk87xK
         gQsw==
X-Gm-Message-State: AFqh2ko76ArELFh1JC/ohfTcVEXcWdJJ3WDbShqKmK6m7pPGYcdEh6dW
	wOWWOWu5dG8ZMtgVE7PuIMXkJp07rNQ=
X-Google-Smtp-Source: AMrXdXulU6HQ5AbjrG194lmk0/WASSPSZALAdNIlkF8e/aZPlXkPMtxRnnbn210+u+td80qyWroVAg==
X-Received: by 2002:a17:906:374e:b0:7c1:f64:61f1 with SMTP id e14-20020a170906374e00b007c10f6461f1mr17775820ejc.45.1672003600942;
        Sun, 25 Dec 2022 13:26:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c49f-b200-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c49f:b200::e63])
        by smtp.googlemail.com with ESMTPSA id ku22-20020a170907789600b007c10d47e748sm4062567ejc.36.2022.12.25.13.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:26:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/4] clk: meson: mpll: Switch from .round_rate to .determine_rate
Date: Sun, 25 Dec 2022 22:26:29 +0100
Message-Id: <20221225212632.2760126-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_132644_680519_4032E212 
X-CRM114-Status: GOOD (  11.62  )
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

clk_ops.round_rate will be removed at some point. It's replacement is
.determine_rate. Switch clk-mpll over to use .determine_rate.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-mpll.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index fc9df4860872..20255e129b37 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -87,16 +87,22 @@ static unsigned long mpll_recalc_rate(struct clk_hw *hw,
 	return rate < 0 ? 0 : rate;
 }
 
-static long mpll_round_rate(struct clk_hw *hw,
-			    unsigned long rate,
-			    unsigned long *parent_rate)
+static int mpll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
 	unsigned int sdm, n2;
+	long rate;
+
+	params_from_rate(req->rate, req->best_parent_rate, &sdm, &n2,
+			 mpll->flags);
 
-	params_from_rate(rate, *parent_rate, &sdm, &n2, mpll->flags);
-	return rate_from_params(*parent_rate, sdm, n2);
+	rate = rate_from_params(req->best_parent_rate, sdm, n2);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int mpll_set_rate(struct clk_hw *hw,
@@ -157,13 +163,13 @@ static int mpll_init(struct clk_hw *hw)
 
 const struct clk_ops meson_clk_mpll_ro_ops = {
 	.recalc_rate	= mpll_recalc_rate,
-	.round_rate	= mpll_round_rate,
+	.determine_rate	= mpll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(meson_clk_mpll_ro_ops);
 
 const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
-	.round_rate	= mpll_round_rate,
+	.determine_rate	= mpll_determine_rate,
 	.set_rate	= mpll_set_rate,
 	.init		= mpll_init,
 };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B2EC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 01:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kxgxlu5+FkXFTcyCK5u8HEtdlTR9FsncDx5zXaG500g=; b=dzSQevFlheMXid
	CK8i659JGF7qUuJ5jtYmNtzH9gzKkchOBjGoEemOSy2cq4lEUlGKxsriKabj3U3BRIbPMYqOGe3DS
	/a/WQs3ISRXtCmxs4DsKF1zmPTwRvles1liX/y1FpHfZ5nTw4Va0LAJz9HGsMkzq2dKZV+ks1EMG7
	fglrIj/EbCW/CpeYGRzxbXmGbycOkniW7Zqy0fOhXLhDPvFl8LnOYfczaFVtgW4ceHwofHXjTYAjp
	YQ0uOVfJbJJVJamX0dGBD/Vjtt5P1G+qPaATjHWsQuKkhs85cY9vTmSMISIGQtgfMezQ1ZuEveJqL
	e8i7WujIznFdVqp69pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9cB0-000AID-Cs; Mon, 26 Dec 2022 01:21:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9YW5-00FdTB-MR
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 21:26:56 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bj12so22971125ejb.13
        for <linux-amlogic@lists.infradead.org>; Sun, 25 Dec 2022 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u624ykL0rVa4TXbrwRaAQyInF1fSqtT2CkhukAfQEcQ=;
        b=f/MsTWFfmvfxD5qcKbMT7oSwdnOKOaRdPUMvgkI2Jq8dI4tvIFNTeHhXg9Bwd/ruae
         tzb+0N1eg5KRzMTTLUa+3EGQAe4FBSiyKw0PN09VvPKBp5z2cEQdgN1n/RZ67Pi3DxgX
         zqVP99Ebigki9FcU1vJEllBPWjXQoe1LCQ1giR/X5qmveAWPNFNdMtGyd80NfY9mcmXl
         3YLoCn9h46stJVIgEukqaVwNM1AdsRrfOIHJHEbf2Z0R5rvnaR45bf7qxlW9rFZBoARu
         FTTr6DSfpszUmwVcM86NR9YW2Pvu10+gfzhcstH/oSgc2s1aIe4uq2SAQ4UwHla9mnzq
         DcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u624ykL0rVa4TXbrwRaAQyInF1fSqtT2CkhukAfQEcQ=;
        b=WDbP3eH86MgdKBp87ssoly2W6ltpInzYQ6tkIMy4J9XPd42sfon/ArTHo+Y/Tfj9Uu
         bAjiS6mB4oP+I5aeX+z6qfrSnaY32OD2PY5Z0VQdrhIn25CyVNvGmMqY4ibA1Ai2Rqu9
         DusBqOwW95JlXgWoWSTm8UEHPwNZbx8PpVlKwtEG3HFzf51jL+r1efdw8mwozhYuT1Ij
         uqnYxEgQxhZwKqYuRG3ZS64X6FuXIEU1C+y9TNsRPcVeBY2CNN6r/unXdhkIhE72UMwt
         YEO1YZf5QWS42bKpjO17bcGv1TzvDIyNWP/S9zA3NcoPiXqZ87CmCq9VRrKazG2sym23
         iPdA==
X-Gm-Message-State: AFqh2koMRTthIECd2fIBHxfbU+huomCgD6XNnQJWhD69lirWTyKi/PXy
	hot8D2WfsERGxbrxjUyUA7XOUs5u4nQ=
X-Google-Smtp-Source: AMrXdXuCzu/HDHjuswM3QCZzhciUAtgvKrG9dMjbyMfkd/nCUrMHqfXuaTRTRxok7K/obbmNdWAs8g==
X-Received: by 2002:a17:907:d604:b0:7ad:d62d:9d31 with SMTP id wd4-20020a170907d60400b007add62d9d31mr13566696ejc.67.1672003601830;
        Sun, 25 Dec 2022 13:26:41 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c49f-b200-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c49f:b200::e63])
        by smtp.googlemail.com with ESMTPSA id ku22-20020a170907789600b007c10d47e748sm4062567ejc.36.2022.12.25.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:26:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/4] clk: meson: dualdiv: switch from .round_rate to .determine_rate
Date: Sun, 25 Dec 2022 22:26:30 +0100
Message-Id: <20221225212632.2760126-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_132653_260741_AF24D9BC 
X-CRM114-Status: GOOD (  12.15  )
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
.determine_rate. Switch clk-dualdiv over to use .determine_rate.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-dualdiv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index c5ca23a5e3e8..feae49a8f6dc 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -86,18 +86,23 @@ __dualdiv_get_setting(unsigned long rate, unsigned long parent_rate,
 	return (struct meson_clk_dualdiv_param *)&table[best_i];
 }
 
-static long meson_clk_dualdiv_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int meson_clk_dualdiv_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_dualdiv_data *dualdiv = meson_clk_dualdiv_data(clk);
-	const struct meson_clk_dualdiv_param *setting =
-		__dualdiv_get_setting(rate, *parent_rate, dualdiv);
+	const struct meson_clk_dualdiv_param *setting;
 
-	if (!setting)
-		return meson_clk_dualdiv_recalc_rate(hw, *parent_rate);
+	setting = __dualdiv_get_setting(req->rate, req->best_parent_rate,
+					dualdiv);
+	if (setting)
+		req->rate = __dualdiv_param_to_rate(req->best_parent_rate,
+						    setting);
+	else
+		req->rate = meson_clk_dualdiv_recalc_rate(hw,
+							  req->best_parent_rate);
 
-	return __dualdiv_param_to_rate(*parent_rate, setting);
+	return 0;
 }
 
 static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -122,7 +127,7 @@ static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops meson_clk_dualdiv_ops = {
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
-	.round_rate	= meson_clk_dualdiv_round_rate,
+	.determine_rate	= meson_clk_dualdiv_determine_rate,
 	.set_rate	= meson_clk_dualdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(meson_clk_dualdiv_ops);
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

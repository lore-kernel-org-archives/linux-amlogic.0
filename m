Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F24EC4708E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mUBDdAEqDdMQ+upFKdqIpxs42sv3A/+lnOznEic0II=; b=etgK9oJ9dJJVSw
	gNVaFFiMwIecZaH/FM1qPGIsGP1pi2d4OZXgoMmj93DSMc85zazEXkGsdmIVUaDRgDQ0abHfb1sAb
	8E6JYFfff/3lAzl1GiBdo4dFieVs/5iJGtG2moLMLsUjU+0ws3Pm4uHY8C9Ik1o6zK/rKt7FfgGZu
	0PEJ0tKRPn8y0FC27d6Gt6GIqxqANeZIXUdPQICiayr799lI5ycAS9Kcs84ppSagkArYdAYA0XCq2
	+rWclb1xB6E0LnVVrR42/dizwodcUixPVJcACFwNF/WwkGgkbdPxSODiqsChOazMmmFvAJiLblm6V
	iPRrkDBykrqzq5KiI+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9cAy-000AH2-V4; Mon, 26 Dec 2022 01:21:13 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9YW6-00FdUG-0s
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 21:26:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id t17so23044722eju.1
        for <linux-amlogic@lists.infradead.org>; Sun, 25 Dec 2022 13:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mS2mnfCDe8WfSbHmKHSJQj2MrPkmcqdFMVHuqcZiyk8=;
        b=E4mBLrjCAk8pk5rL+QRgcUmvps2R29MC3VaGBiwIw9+toDwRp5M4jlsenqTdLtq9Or
         7hQI/3vT/bnEiAqmUzimN8PfM2Xb7nHplHXfwuhpbSrOpwjtqY33hWzux2IDJ3FiORwJ
         zll0s73BQqoZAD2+sFAcXAHAofcAoz9Li/s8au7yaqdm7SLot94eHeKyRwIZ8GyZ4vvy
         CU/KIf2EOu59AIPSIhSZQeZrSq+vffPZqgysvkQM9jHcOAef3mnIVbDWxNDzBWVTmPTv
         PyrVswKYtDf3qfSOgYjnJtKDFefnRFuIKZDkCsfNmY8/oC2h1jiuZiQkz3o3SBrEjHwi
         xsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mS2mnfCDe8WfSbHmKHSJQj2MrPkmcqdFMVHuqcZiyk8=;
        b=kBMj9Y4EgV6iipOssweFbMJOpwRyfR1Bk0wUuARqEBM+Aak1JsbY+v3ObcW9VXOkUJ
         xgkwDgiDYhTtgj9e7QwmmnSbRUuF4QWsh4Hk9IhbXTMmHH7+4YLUqJqQ06qQ3TOr8yOJ
         Qj+dwJJ6G4i6Pe8/RT1eXnCkLkCJU5neUqzkaS4GNE+SgXaH1Vp6/VfbPvWhLIP7xKkE
         F1PbnVDhaLk0X03ab4UTbT6Eq0rbEaFtNZq3pGLhnXrN5+C27EAeSEJEsrRmMHcQxS+O
         XdRVQ/5bMU2nsR1j7HEHonYwu3KA+hOtXTOW1WvnJ3+mU00mwzQKcKa/gE9cyYZrNzaE
         2acw==
X-Gm-Message-State: AFqh2kr3w6LORYCEkOBcxr98040ZNZKMcQWurJXfDfzrk/57OxS2eUMR
	iW8jXoClBWQpoFYQo/cX0Q2VHmt6IxY=
X-Google-Smtp-Source: AMrXdXsRrd9q9OWeC8AnStIWOxpDaW977IsrARLPCsgjW7H43dn1dDU5swzaVavSTGLR0IJVptIGag==
X-Received: by 2002:a17:906:264c:b0:7c0:cc81:3d94 with SMTP id i12-20020a170906264c00b007c0cc813d94mr14307502ejc.13.1672003603392;
        Sun, 25 Dec 2022 13:26:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c49f-b200-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c49f:b200::e63])
        by smtp.googlemail.com with ESMTPSA id ku22-20020a170907789600b007c10d47e748sm4062567ejc.36.2022.12.25.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:26:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 4/4] clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate
Date: Sun, 25 Dec 2022 22:26:32 +0100
Message-Id: <20221225212632.2760126-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_132653_222272_B3AF06A9 
X-CRM114-Status: GOOD (  10.84  )
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
.determine_rate. Switch clk-cpu-dyndiv over to use .determine_rate.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-cpu-dyndiv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
index 36976927fe82..8778c149d26a 100644
--- a/drivers/clk/meson/clk-cpu-dyndiv.c
+++ b/drivers/clk/meson/clk-cpu-dyndiv.c
@@ -27,14 +27,13 @@ static unsigned long meson_clk_cpu_dyndiv_recalc_rate(struct clk_hw *hw,
 				   NULL, 0, data->div.width);
 }
 
-static long meson_clk_cpu_dyndiv_round_rate(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long *prate)
+static int meson_clk_cpu_dyndiv_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_cpu_dyndiv_data *data = meson_clk_cpu_dyndiv_data(clk);
 
-	return divider_round_rate(hw, rate, prate, NULL, data->div.width, 0);
+	return divider_determine_rate(hw, req, NULL, data->div.width, 0);
 }
 
 static int meson_clk_cpu_dyndiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -63,7 +62,7 @@ static int meson_clk_cpu_dyndiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops meson_clk_cpu_dyndiv_ops = {
 	.recalc_rate = meson_clk_cpu_dyndiv_recalc_rate,
-	.round_rate = meson_clk_cpu_dyndiv_round_rate,
+	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
 	.set_rate = meson_clk_cpu_dyndiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(meson_clk_cpu_dyndiv_ops);
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=v4K1=EY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD99C5519F
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 02:48:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C905A22228
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 02:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2mYNpdix";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHefq22z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C905A22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4p14J2jATH2tv9ogqo0Rj1x+dvqHpTNEG2Pdmyzqtaw=; b=2mYNpdixFaD1ALMMS76OZEIJTH
	MiQ8itI3GbDIcF0MljD0RLuKpShOYRdl6GK2yft+7bHmT9M7nideNwlo0lHM179yvgjEj6BtIYUbZ
	cTsuiqzKsAs4JXU3mA45JJqtTO0CFV2TdroaIrpbJuChuiYvpoqhxb3wtWvoWsxffF8rIfQ4gHS3j
	UBZkF1/CzCyNchu5PiQ4mtbgbEhmZSAiQlablNqUw3C/+NZbpeXlJkm1KfKSmWbh+R97wYnrYRwg7
	w42wCO/zKlfa48sX2YHv7hqrxtLe7u0sgHrFCxvsAbn9pVzhgpON7VS+z3xFjb4ugHGTOwo7Q5DUQ
	oLiIC6Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfDWZ-0005J7-NG; Wed, 18 Nov 2020 02:48:47 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfDWU-0005IJ-Ob; Wed, 18 Nov 2020 02:48:43 +0000
Received: by mail-pl1-x642.google.com with SMTP id l11so207637plt.1;
 Tue, 17 Nov 2020 18:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U0A4hiVticV1l5BqvGEE7R9HBABEK4fgnMLNNOiuBJg=;
 b=KHefq22zv+bEgFPsZF2AFCWK/gy7NrJb5KRoX5dp6VQsNI57tjTAD5I2QHj9eWzLn9
 0gXrKWkoVXXEWkTSgJX2fybMBtUVNNIA7i9jRpda+7rI2OdGRs3+f6lFHkBNm8024Dg3
 xiGuldXdCNxplxosFCKcB2H7oYfSZiZ58Y6OYcno6uKscR0QOYObym68dNNeRDe8Oz8w
 yYnL9rTMkLHmRjWyi1bInRM4mfG4y9v50oPqrgEbxEw+QM35ql4lRJA1d9n1a9T/x6Qu
 Fc54vPLKwznPi3Czss4ku98tkj/5FNprZdSb4fKzNBjfLh8HI8V81WAfdy6/jyIOB++D
 89rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U0A4hiVticV1l5BqvGEE7R9HBABEK4fgnMLNNOiuBJg=;
 b=BjJtzmSlcLd5rm2/j5+S8KahpRs7X36aEj7Aw7FQ9cMyIPhGLr4UR/rtRIvPedbxNH
 jv/S/n/37ehlXv1LzzaO9bHs92y6AdSD1RnUmmKQs/k19bX+VUahQ8RlkV1QQveM42UF
 8hwddgPZUdEFbKD7Mxt+0DZRZJ5m9SSZS+4u5IRZ/KGt9I1khh9CahHEdQw1cvOQLzGA
 2HityhhDy4mUW00G5GQVn5QDxvLinxMOobXWOT55bhj18+aAVZeOdWL3Age/tjyhDD+1
 9JXHDBUGX1ZIIJa/OKANgs6eXlCCO70tmmFdd6NtTS6eEhwfLRGsq4uT5Os1BFC3EqPb
 yYxg==
X-Gm-Message-State: AOAM532u+JQyyX1SUqkdxdgwyqyvMh/+BMWndPaOMfkogCYtdWARNQJ2
 WNOhN4RdgYLnvGmjAiLMJ0Y=
X-Google-Smtp-Source: ABdhPJxIMw3Foqrh7O45iqPiJSYAeYwg1U0lRJyJOohG4ydpCZXYN0bwy+rQq4hzPFQUd25nsJBGeA==
X-Received: by 2002:a17:902:bf43:b029:d6:8b99:3ca2 with SMTP id
 u3-20020a170902bf43b02900d68b993ca2mr2097731pls.43.1605667720900; 
 Tue, 17 Nov 2020 18:48:40 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
 by smtp.gmail.com with ESMTPSA id z3sm22970686pfj.219.2020.11.17.18.48.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 18:48:40 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de
Subject: [PATCH] soc: amlogic: replace devm_reset_control_array_get()
Date: Wed, 18 Nov 2020 10:48:20 +0800
Message-Id: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_214842_852638_798502EC 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yejune.deng@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

devm_reset_control_array_get_exclusive() looks more readable

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c     | 3 +--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index ed7d2fb..50bf5d2 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -413,8 +413,7 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 			dev_warn(&pdev->dev, "Invalid resets count %d for domain %s\n",
 				 count, dom->desc.name);
 
-		dom->rstc = devm_reset_control_array_get(&pdev->dev, false,
-							 false);
+		dom->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 		if (IS_ERR(dom->rstc))
 			return PTR_ERR(dom->rstc);
 	}
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 8790627..b4615b2 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -304,7 +304,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap_hhi);
 	}
 
-	rstc = devm_reset_control_array_get(&pdev->dev, false, false);
+	rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(rstc)) {
 		if (PTR_ERR(rstc) != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "failed to get reset lines\n");
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

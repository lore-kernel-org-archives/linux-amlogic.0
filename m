Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40586C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 14:59:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86A62073C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 14:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5qN1n6f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UBvp/ytW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86A62073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYPuj0bhu/02L9r1Ep1yzWMK8Q7R0QSC3CUFE0UMhHs=; b=f5qN1n6fyUqNXx
	T7dgwUwVGTKE1ZyKlJNNFg8d5Xwf8YDa82+oF8Nz7ygVFx+ylN+Vsa0EjY0O6s+jfRLGYUKFus4q7
	mgSdht525I0Hx3VGK5cOWGilLrFdyVg3XNGCu7mRJ/uRq+sOWxQi04HmTbp5DQ8Z2q4cd1aYBOISy
	xTfsoB8byAWvG8wx9k09YPH1SZ5nBzsu74TXhJeQ/ZeIpAz/Yr2BGodRbqYhTmts3JanQTjdhcn4Y
	NaDZIcHTAQ7RC0e6ZOBI9ponlujZWKagCC9TDbMDjg6UasbOzD/HnI6yZKLKDogrrIHkohlMSAkoE
	ylj49Tzf1SZGpuBO0NAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib4DJ-0008Cw-5e; Sat, 30 Nov 2019 14:59:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib4Cd-0007e7-VW; Sat, 30 Nov 2019 14:58:34 +0000
Received: by mail-wr1-x444.google.com with SMTP id q10so2292017wrm.11;
 Sat, 30 Nov 2019 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUD5FdR6g2ASiBzE14YJrcmNzasb1Y2tz62iUE7N/xc=;
 b=UBvp/ytW4dLm9uvAfDdpEY+sIk0DHBNJsf9eC1RyWRYMIsvDbpmkW8ofy4BC422sTB
 +M1vbn1upImJvydQUcRb4uFJUGQ1E5v6u5UUXQmjkpNllnVCIKwLpd/Loc1l0imHGbNh
 vGOWZTXZ/SHfuhcvMyCAtqoL3oewv7FnK3qiAL4MVjFYXNpK7qUD09bx+r6UDzuqvVqT
 7Q/uxFF/rrWw9q3VcXMdweNFjbc4ehrHVXkXTRN6bX7tGo6FHh3ZqvzJNv9vbfG29tl7
 3TUbqM4XsXs+xz8ovggd2m9Mvwlk81d855Xx9aBSCZjxWhua+JIFgMgcO0zHtV8/riLJ
 MaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUD5FdR6g2ASiBzE14YJrcmNzasb1Y2tz62iUE7N/xc=;
 b=dZLMxa70mEEF39wnUlLxviA5NsR9KBpGVrfrCEpVyhkY4cnpYh5Qrbks7ls9J1XGfl
 HA3EYLlckRAVqNBejuF2VhocxAkHlBOsxe5JzgRgwvNXFUCAtV+jnCCA6tKsQNN2CgXA
 gd8GSqv8cJlx69TfDZiyQHJRJ3x8RU6bAyQKgbnQink91LgEFnjtxgPnU/Ltp5DQLqtm
 zKFtqNFjTK/P2CGQuC+R/D5HXQfo0jRqVpH8fwmOqDS3h1zu4jgsfXMtp/eqvs4oOep2
 h7/Dkf6ynWkpV+J2LNnCJBJRTVzeBdT3cKkBj556wXsE3Is5h2UM6N24YcYY3bzKtMn8
 89Nw==
X-Gm-Message-State: APjAAAWQ26fJUHjxmMtduCOjhhi5zKJvCbT8mB3HJ3Q21oU7E7NITngn
 QSSfFaE0LPw6Bmc/b2vNaK/VVeSy
X-Google-Smtp-Source: APXvYqw7/FFUtU7ZgBNzxnCt5W3VfthKgCKSSFdtQHPDyIi7xYUPTHYjqDMaMOPtQVwn54Dr0WNesQ==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr42788144wrl.307.1575125909679; 
 Sat, 30 Nov 2019 06:58:29 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c9sm3510202wmc.47.2019.11.30.06.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 06:58:28 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH RESEND v1 2/2] soc: amlogic: meson-ee-pwrc: propagate errors
 from pm_genpd_init()
Date: Sat, 30 Nov 2019 15:58:21 +0100
Message-Id: <20191130145821.1490349-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130145821.1490349-1-martin.blumenstingl@googlemail.com>
References: <20191130145821.1490349-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_065832_013452_9608B906 
X-CRM114-Status: GOOD (  12.55  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

pm_genpd_init() can return an error. Propagate the error code to prevent
the driver from indicating that it successfully probed while there were
errors during pm_genpd_init().

Fixes: eef3c2ba0a42a6 ("soc: amlogic: Add support for Everything-Else power domains controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index df734a45da56..3f0261d53ad9 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -323,6 +323,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 				     struct meson_ee_pwrc *pwrc,
 				     struct meson_ee_pwrc_domain *dom)
 {
+	int ret;
+
 	dom->pwrc = pwrc;
 	dom->num_rstc = dom->desc.reset_names_count;
 	dom->num_clks = dom->desc.clk_names_count;
@@ -368,15 +370,21 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
          * prepare/enable counters won't be in sync.
          */
 	if (dom->num_clks && dom->desc.get_power && !dom->desc.get_power(dom)) {
-		int ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
+		ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
 		if (ret)
 			return ret;
 
-		pm_genpd_init(&dom->base, &pm_domain_always_on_gov, false);
-	} else
-		pm_genpd_init(&dom->base, NULL,
-			      (dom->desc.get_power ?
-			       dom->desc.get_power(dom) : true));
+		ret = pm_genpd_init(&dom->base, &pm_domain_always_on_gov,
+				    false);
+		if (ret)
+			return ret;
+	} else {
+		ret = pm_genpd_init(&dom->base, NULL,
+				    (dom->desc.get_power ?
+				     dom->desc.get_power(dom) : true));
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

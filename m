Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA094F55132
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2026 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ISSGpBtGyNya3XYXn7J45R+SZrqawGUIee6bApOWWCI=; b=pc/fQymVoiLrRK
	+Mfoq+5bvAmARKxRQE2eDUsgGQglK1vPOdMEyk67jGlero992nd7v+Tet+m8GZPFBdWOd+1K6+wyA
	o0AGS1FhlBDcADEW7NBKRONNA+foiyymabPs02ivBNEg1PZgtomvyD64AO39lhJBpYGSNZFd04z/q
	cuNOSHk6iuHnuLkFy0KHp0ZYNFBUozSngbODUWXwnxHCL1BwGiJcw7wi5Ws+181lJZCxVVxvYSoox
	/7FylyqnRV4D2b39uGbwmK0QQ2DkkkSi0AzJAARkI8B+HAVZCrc8yTCBJa+X4tSdiMRHzWn5Ea3Sw
	SFz0c5jEzctP6M4uoEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz87M-00000005ln5-2C7i;
	Sun, 08 Mar 2026 07:00:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz87J-00000005lmd-1tCz
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Mar 2026 06:59:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-358ed696623so4406775a91.0
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Mar 2026 22:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772953196; x=1773557996; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0nWv8X0cARRJ4XJPERkEaD5MqJj6WxTqHyPFa/TlB8=;
        b=Iw+GZ2LKBxEcr7AmDIpFeOZQgD/JEmFxEWqmdfkYuYd58duhTpoKPw3M5tVCg2/Nyo
         xN0sotQ3tm4HEfdra8LQVEDavakS67gw9YRNZaSbIBKvAy1gfp9VRUbOQsM3yKCLnLPm
         wId2Gf099lAxyorOxSuXEDyeb5uQ4jkahYDytZWX2DUBrfWmbi84r3P9kirU8dX0gvpT
         k0mjy28Ahs6wkz76veVyhVVD+Nw1ZwaToWyeXboHFJEKfFBB3/X1p5e+2pxcP7MUqYPn
         4v6GHqRiyxUf1TSMLTPAonQugLH6TlIGjPFVmCz71GYxY7pfOxeJeXsL9azQ1KuyqteW
         2oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772953196; x=1773557996;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0nWv8X0cARRJ4XJPERkEaD5MqJj6WxTqHyPFa/TlB8=;
        b=UHMqX0/+qyX3CczS3nbARIXtL4sV658I1pR42JWT6nBVfc11hG35vEBGwD3BKXfxQm
         5Xq5Xjq9mWb5YHE6PraH4AuL5lvLAfwKn70CZYR9/pb4GATa99DFyEQJ6rG2Uug5uBgY
         zGj+2nYPqcEXW5WCFPHHPSN+F79/wvDFQDXfo8Nc3visOsRO7MnLGvLmWHN8anvfncmn
         u31O0DDZG05bUodqL+k3r3R246tcNvdokFDKADmpM2UQnoxP9NdQLYPHiNcjMelc3+hX
         7zc9MFnbDWTYuDd7swTaKeoyBGVCBLyY5MUNlKNcITzeJOdjgBLLfkQMxFgjudr+DzRX
         uT7w==
X-Gm-Message-State: AOJu0YyJN1ig6R6SmolwhUH9kFFWpwydXtaoIF/ocA/ghyE4U5E2K+rC
	DjZ4PRjZhTStIf9vPndYokx3/Wqu98m7mipnnQEoa2LEtuKVS3yMKsYh/cIQ93YBsQ0=
X-Gm-Gg: ATEYQzzILB7qYMCnHBinthqqdzj5TW7lbFbbnJj6BY5GaS1yt9dECaqndaSw0ybv+v4
	p23qN/HtLpwAJF2jnmX+QLTAyCGn5pYUBKZyDGxHj/zCtW0LykX3OdmN4rzr5UxTD3AMv+J8WTt
	3YYXgGHWH6kYmiETC71zrmlGc4Il6u4ksK788q48IiRkc35mK8H1EYWE4TZfJFUZXQ0u2CCUdrs
	JXzx4VRi790YQHZsHXtzM0yPVqhmVqE8I0PIWH24XSfcIRopEW2Y7kSj/I0yjMyhw73k0gqNtOm
	pTN5MAdf6L3bAhZVmvmDTbabxT0lBK0qtGdz7/fYxSbyq4guqfhESXOXVWmVIgb2slg1dFhSlXo
	8MEAFQ7f78cn/PWf6ZOVZwxXypkT/JmGX8FWdKnqolieYkEhYI24RM2OrzsLDAKeLiS0zB/U+9H
	8vHtgMqwuhd/L6f5CUn3pu94yzy5JOGuqmGGBxAiPG9iSHCjk=
X-Received: by 2002:a17:90b:3c4a:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-359be28d404mr6645265a91.1.1772953195878;
        Sat, 07 Mar 2026 22:59:55 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:4507:7fb4:bc3a:eca9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e00177sm14464792a91.14.2026.03.07.22.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:59:55 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 08 Mar 2026 14:59:50 +0800
Subject: [PATCH] spi: amlogic-spisg: Use IS_ERR() instead of
 IS_ERR_OR_NULL()
MIME-Version: 1.0
Message-Id: <20260308-spisg-1-v1-1-4e209faf228d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGUerWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwML3eKCzOJ0XUPdNGMTo5QkC4skM/NkJaDqgqLUtMwKsEnRsbW1AEG
 WhcNZAAAA
X-Change-ID: 20260308-spisg-1-f342db88b67c
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772953192; l=1524;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=+RNmhyrfQMWHwu+8od84odlXgRn/4U7kSubd4dXtgmo=;
 b=IivQ04b4Vat5+bqGtsxOs3thUBaQ4qZSzLSCErKbdMYgH9O5udI1OrEO0OIVeU7zaYEynhEKL
 7JVo11RZSD5DP1oCd8kKsBx5xoGTFTrr5ibxXTg2UI39dFfvBr8ZQfn
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_225957_551840_83A1C987 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

devm_clk_get_enabled() and devm_clk_hw_get_clk() return error pointers
on failure and never return NULL. So IS_ERR_OR_NULL() is unnecessary,
replace them with IS_ERR().

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-amlogic-spisg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 1509df2b17ae..665f889dc8d3 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -647,13 +647,13 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 	int ret, i;
 
 	spisg->core = devm_clk_get_enabled(dev, "core");
-	if (IS_ERR_OR_NULL(spisg->core)) {
+	if (IS_ERR(spisg->core)) {
 		dev_err(dev, "core clock request failed\n");
 		return PTR_ERR(spisg->core);
 	}
 
 	spisg->pclk = devm_clk_get_enabled(dev, "pclk");
-	if (IS_ERR_OR_NULL(spisg->pclk)) {
+	if (IS_ERR(spisg->pclk)) {
 		dev_err(dev, "pclk clock request failed\n");
 		return PTR_ERR(spisg->pclk);
 	}
@@ -703,7 +703,7 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 	}
 
 	spisg->sclk = devm_clk_hw_get_clk(dev, &div->hw, NULL);
-	if (IS_ERR_OR_NULL(spisg->sclk)) {
+	if (IS_ERR(spisg->sclk)) {
 		dev_err(dev, "get clock failed\n");
 		return PTR_ERR(spisg->sclk);
 	}

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260308-spisg-1-f342db88b67c

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

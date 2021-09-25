Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C506C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:34:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D32161076
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D32161076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ML2tflYx1/OviHO3Wdb3qDQPvIDd9yVvWSvbVlJhiMU=; b=vC1UTuq2eAJm8B
	bi8N/DQPXefUTEvKKgHZom2X1es+4q4Wjus+Ly8cVfNK140Zdbw4Hb/3IJ/yWwLeWHl6QcRWMOiCN
	QoRnhSRgB6Tytc2MN9F9l8AEhUKJ8sOlB+fypHDy5XrFFoa7e3sbaLNbyv8gX1LzV89hzMWaoO+Ub
	6ys1fpGTbLklccAmeDGn8vulQozpHSTJdXoPtzYDWpo6Kp36O2/uuQY1JbuHlZmVYgOXWcELlBGP8
	mdHN/YwtZyZGOK91dyFx6gdW9i47mrZaKwTo3Dmm5G8CjbBkAfah6SayFD0LOxoGLHJIgr3/JTR73
	vW/S1CdxgAH9p6EcPYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUBZN-00Gyd1-39; Sat, 25 Sep 2021 17:34:37 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUBZA-00Gya4-0F; Sat, 25 Sep 2021 17:34:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y8so11729173pfa.7;
 Sat, 25 Sep 2021 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOGXsR2lrn1dvNa/qlhz6wa9pGiy56aLxSKQi3X0iXU=;
 b=PCr602QkRq5ChttjxjsGMbOGLlm57bxLWVzHhG9I8KLAMRBFiMXX2mctmlGH0+wpzK
 +85vmB/dnmriHyyruQ8N2kWj3/x2a+61M0aamLwLNqj5dczTkXpeXS2ymEQHA50K+lBi
 XrTNd4n+tI1kq483mN0G8pWY1dNBQl+zUU/CLFZR8foGuquw/D68VsBh/gOK/i3rco9R
 7w7jFS8K9GR86np6LCLeCaJ3ZdOIUcmJHMDF/rguCD4u3TCcyvu4lG0PjBcgQM3iYoug
 9R8wL4g0V+VEll+NuJsxv2r9Sbb2qxpt/ZqrPHhexlUgPlXnr2jt3Ti5h4WIGGy8jRYe
 Xegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOGXsR2lrn1dvNa/qlhz6wa9pGiy56aLxSKQi3X0iXU=;
 b=TaMDnndjPYPnUOmHSbNNAIDSWH+X9TWE4w2hCe3CepBBvm7voMQWmXQlfYwU5EQ7jI
 NSqlvADBncWCKJajKsBQX5WgZakckGLbmvn/dxAyLhAA4n+uKTxQeqmPPETbSFFMZGna
 hzhtBbpjc3d6SPRDLS1BTE9mFhnQREuxwGNLxVrxfe7XoM2RPbmlUka21dhTaU6lHT0J
 d8vHm3EHzuc+KCeBr5X01F3DUG5S3Okv2854frifSUeidxrztTro6lbstsrKd1J6m0Cj
 niMmH4j01OYWKgQhA+XojmdRmNtsqA8nBLDdh54HKUL2PL0y5fFya4drjgGG23IMHiY1
 tlMw==
X-Gm-Message-State: AOAM531vuspi7JrTBgpSSo/AxbCAQVd+1g8RIUv2g6kRAlpGgxXRhtRC
 lTW/C6H8Op9acDxy/TghIvKYDgCrvi/NBA==
X-Google-Smtp-Source: ABdhPJwow57UKHvlSPfIR1Ttemgg4A161D1G2paG/eKWqU5i7Y195BpJgW85Igoabj61Qo65/5L3fw==
X-Received: by 2002:a63:a70e:: with SMTP id d14mr9093741pgf.431.1632591262567; 
 Sat, 25 Sep 2021 10:34:22 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.30])
 by smtp.gmail.com with ESMTPSA id j6sm13113980pgq.0.2021.09.25.10.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 10:34:22 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCHv4] regulator: pwm-regulator: Make use of the helper function
 dev_err_probe()
Date: Sat, 25 Sep 2021 17:34:12 +0000
Message-Id: <20210925173413.1019-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_103424_069293_F1187FB6 
X-CRM114-Status: GOOD (  13.36  )
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

devm_pwm_get() can return -EPROBE_DEFER if the pwm regulator is not
ready yet. Use dev_err_probe() for pwm regulator resources
to indicate the deferral reason when waiting for the
resource to come up.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V3 - Fix the coading style issue. dropped { }
V2 - Fix the return message and drop the FIX tag in commit.
V1 - Fix the wrong probe defer for devm_regulator_register.
   - Fix the commit message.
---
 drivers/regulator/pwm-regulator.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 7629476d94ae..b9eeaff1c661 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -352,15 +352,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 
 	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
-	if (IS_ERR(drvdata->pwm)) {
-		ret = PTR_ERR(drvdata->pwm);
-		if (ret == -EPROBE_DEFER)
-			dev_dbg(&pdev->dev,
-				"Failed to get PWM, deferring probe\n");
-		else
-			dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(drvdata->pwm))
+		return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
+				     "Failed to get PWM\n");
 
 	if (init_data->constraints.boot_on || init_data->constraints.always_on)
 		gpio_flags = GPIOD_OUT_HIGH;
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ECDC44536
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jul 2026 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vnHn95ltfeqvzfpTYYtTUGVxH5G3nO8mNMcTBwsCXyY=; b=njYX+Xo2sAAqc+
	YKyAEBjDdId0U+ZeJp+55hj22KotBs2FFbi7j5xsuxa053CBQ4IaqHRu0O5B9pcOP+YMEvzrB/hUg
	6y99qhYfudO09pNeSQ1veN4IzrtG+azvnIfQHqUGly73VvLeMQg/ylmAm2zhAC0SxAr8RFAhZyVq+
	985W0VUsZ6+AiL2qNfvuygmqtPBfQ8I5T6EGKRMMu7OsuxLUboNfxptEog4BqZNl+o5EWguL02sZ9
	ijOwZabdWpEbiwFvvhnyqxAsIGiCndjZE904UBYTY+iEY1pypfucsx7OhIKNEzAvTmca9x1Uj50bg
	lWRSR0nHDSgc8eJ6R37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVlN-0000000BiIl-18kG;
	Wed, 22 Jul 2026 12:09:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVlK-0000000BiHa-3mNx
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Jul 2026 12:09:24 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1468096a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Jul 2026 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784722161; x=1785326961; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnCZkgkGfZi2Ykzq8Jw5LKRVV2duYzk4jC1BEsMVF60=;
        b=Kdo9470Mgy3hB+wedcBCiLhaOSIt4/MkNLe+liimcwgzTEEnBhFptTLeQvTvTCSvTy
         kR1jVhIuUeFQMdBYcuyvlLrHHbotJP1cJVh5QsofglAZzF647B1lKC3h7iTbX3xV37BH
         nNXbS/USJDAgHo0PRzDmLHEM6+8eHho/zdEJLQLPSGfth1a1bTg2vhXQOlT/pjN9M9Ip
         UCpY9lovLCny77S2IHa62+1ADavjXo56QasWPjdgGTuyuCL6jk7zZ7D5j0VLx50tGG8Z
         weqjsRIKBtAcKCxW9IadU2MdQvfSYkdCNbTp53bB2gQDQ0FSy7SNbB4KAH4i2odSm/wQ
         gH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722161; x=1785326961;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JnCZkgkGfZi2Ykzq8Jw5LKRVV2duYzk4jC1BEsMVF60=;
        b=oaLzDJPK5zP25YEPOGIyshC9meBU60AQCgGR3XN0X/QnJZb0tua8j+Y7n5gmrEMLsA
         Mg+cavCOQd2YX8Q44hH36cu+0k9UpgpqB0jd2lNDD3xqm3327DTO7h85wsZL8B45Pecg
         0Tqp6At6u44Qm2Nigi6ycfUDNNFykdj952QZd2yZ5A0VIR94iaH7DOrcB9N1bRuAszI4
         HZvkLc3/Vl7dKkOwtLhxeX3liUmx5LzpqeAyqeoPaNhpu4Iyvd2ywTx9e0WvaFi7tR9S
         /Nb6JaM4MteQOutLK/jBlWkC0GuFdM+icZVcjKXSGbFUhozixzGfFrLoPXaog8med6X0
         jpaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9pu3n1Lr7UQVlRqMmL/7mYrx+6LgJS8h+1PIFlx9tnMNmbhd/CnyPywMAx4d30qGTYHGJVUs59z6ux+st@lists.infradead.org
X-Gm-Message-State: AOJu0YxOXqdT7hoLFbq2t8FcDYdlB/nz2nUQ6wx64C1b6+AUzKkFmeo8
	3b2ubVlApDpMBTDKB13biqJdctDpS+DFtrSWBpjz/OdWGiDrkW2Flz6qbjDtvUvk
X-Gm-Gg: AR+sD11TYR1lTiFXas5jJtxUHwpmHPy+akhmd5A0B43XsAsFH7xs2VHBxMw3k+an3Z3
	hOrN/8DxX3ieQ6SVGFGm29sgxavMN7PrX19anhYTpXIQbKhjfH3Wokh5VPzHI7fD0BYzu9NMEai
	vOqikMxkp/l2W6MYO09XJ4CtzLpnrZSTffT/BjOU2A1Reuwe3St3XmXlR57Qem5NNAb+hT2IWR9
	Zxh2xx/vRC01ZVrIDAjCaWlOnU0ZNeP4Pi8QgR2tw19q+zw8Gi/sj+Qr0N0+FKgDc8FZ76AcULc
	atSVtMY8g4lfy0yna26vvV+CEdHYz6Zq9YSPg8AA9rnxvM1Wgi+cIOlCzizmg7RYbrBku2nJm6C
	fD2cxIcs86yueO0ZCby4oBdC9yksRuJdVC0wgwDn9qpSAX26YU0h3ClPti1KBiJQgtEPgdkKNRu
	gBi0agCJ+q4aArKHs8LthJitaOt6NJp3O6cK4j8oyjMNZa3+kxrdmpx94G+KpwZXctJqAXMA==
X-Received: by 2002:a05:6a00:3c92:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84c29305401mr23707166b3a.2.1784722161238;
        Wed, 22 Jul 2026 05:09:21 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17286798sm1200884b3a.23.2026.07.22.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:09:20 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 22 Jul 2026 20:09:17 +0800
Subject: [PATCH] spi: meson-spifc: use devm_pm_runtime_set_active_enabled
MIME-Version: 1.0
Message-Id: <20260722-spifc-v1-1-e4462a4c6a06@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOyyYGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3eKCzLRkXWNjs7SklFRLU0PDJCWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBIqdjmaQAAAA==
X-Change-ID: 20260722-spifc-336fbde9511b
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784722159; l=1841;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=c3pkZ4yaYJT5mT5XE0KdrjdNHM42/8KaKebxAgWgvPY=;
 b=LoDm1A0vxhBozG2ZbQAhtbUdmBpLnVMM36EGCfhoSXvay3NCvKqH10RJPwYb3BAxDUP0e9oA9
 12dhC8v+Fz+DGwjb2Oc++chA1I4nvnKvYojwuuCva2XpeIw0bXba4yQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_050922_990266_2BCDCCA1 
X-CRM114-Status: GOOD (  11.80  )
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

Use devm_pm_runtime_set_active_enabled to replace
pm_runtime_set_active() + pm_runtime_enable() and drop the out_pm
error label and now-unnecessary remove function.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-meson-spifc.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index e36aa94bbdae..f67a0d10b602 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -325,27 +325,15 @@ static int meson_spifc_probe(struct platform_device *pdev)
 
 	meson_spifc_hw_init(spifc);
 
-	pm_runtime_set_active(spifc->dev);
-	pm_runtime_enable(spifc->dev);
+	ret =  devm_pm_runtime_set_active_enabled(spifc->dev);
+	if (ret)
+		return dev_err_probe(spifc->dev, ret, "failed to set runtime PM\n");
 
 	ret = devm_spi_register_controller(spifc->dev, host);
-	if (ret) {
-		dev_err(spifc->dev, "failed to register spi host\n");
-		goto out_pm;
-	}
+	if (ret)
+		return dev_err_probe(spifc->dev, ret, "failed to register spi host\n");
 
 	return 0;
-out_pm:
-	pm_runtime_disable(spifc->dev);
-
-	return ret;
-}
-
-static void meson_spifc_remove(struct platform_device *pdev)
-{
-	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -423,7 +411,6 @@ MODULE_DEVICE_TABLE(of, meson_spifc_dt_match);
 
 static struct platform_driver meson_spifc_driver = {
 	.probe	= meson_spifc_probe,
-	.remove = meson_spifc_remove,
 	.driver	= {
 		.name		= "meson-spifc",
 		.of_match_table	= of_match_ptr(meson_spifc_dt_match),

---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260722-spifc-336fbde9511b

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

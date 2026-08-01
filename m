Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5156C55172
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2026 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k2cm8FyOQjNO35ELYZkZ4xX7S2RClVUu85KPwJMnObg=; b=B/1CUPQ/sqbJTr
	/yJGO01bfBl3cI4ela6nAwPIm6tnM6Ge9pJ5TgUuFVNLvYyfoSk7AZU/NrOMuasED5uH5IFh880ot
	AkYe8vDs9oiaVX/lPw6JbWViQGhDRxvkkY7xwyzzr2UuuaMOmcfqXe27EocrLHkL86btM01CEghrV
	WIs/sTYVbrdaHYkcM+2V+v1r+/N2GdXjE5BVGJn9YGXORio0TSx4IOA1K/7KzmGO2KNyw7y1Mrfod
	eU+oEjpUqhyYbPDpwNbKxxNQQEQggEq8CR4Aanwyv7ZeKKKXiknWao7az5NEb7L4bo1LqXX1U9hg0
	n57pg8jxUDBN1TwVGksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqDs2-0000000Ew7O-2Tjm;
	Sat, 01 Aug 2026 17:51:38 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqDrw-0000000Ew6T-2x1u
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Aug 2026 17:51:36 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2114157b3a.2
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Aug 2026 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785606691; x=1786211491; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s9EB+RS//J1LVLQYmJ1F9JsoVjN8nQoD7T3vVQUG2DI=;
        b=FPCQlo3YE7Whw8hplz5FjTtHCOb/Y17rK1JX1UdwlYdWMchz03GPZyoKmgkArofoZO
         rnC6IAFQU1Te1wpObvaBDid/cDwMdaJ/6i7Yjk2zU2UoRRTnR8SfcKqhy4hPYmvIyj5i
         e3mcZ4UI4LTBhvNSJLlUInIyOQZ2SsxIxjBHMekX73J5qTdH6MtckJITEoVb6OJQQ4Uh
         7n0ye3KqvgLOzbToPcvIjxb5z+Ks9Y/TjhAyCiU3V7ZLr7N+LDMhLniKyZi2mwYuA6uZ
         sg3m1aZXr83thGFJ0eUOh5e5rv8UEVnFpwHUp/ZtrfyZsOlaiX3Qlgt/KVdQH5h0C+FF
         6Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606691; x=1786211491;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s9EB+RS//J1LVLQYmJ1F9JsoVjN8nQoD7T3vVQUG2DI=;
        b=JSNdf+xnympRg1lCjM7d15wvHbtMLeDQa1sq9bMsVk68PBZIiKTmP5zbO67yuqajfs
         /Mvf4b2gWXQtCfcrAVF5U0UqUh06UjX1T4Iv82TSKIbI0qa165ffYh2EVlpfOXT0JaGc
         jxXptJ1Mc9gqWxb2IYrx3XRVI3U9h8QQHGTUFyNsLgqwvvNWBSrQE5y8cQRm2h9Lf3I2
         lrrarbWOVHG8/KHIxRkCgAG8mG6sm4zbuztwFg7JNuR0kYMQ62VSz+qaGil2nZKzA4GT
         i2n7hg9kwK6X/Ec4EDzS4VQLlx0cNFSeHH97NHGPyHTj4zNXzixhwn072n9tuuVC71vz
         VbWg==
X-Forwarded-Encrypted: i=1; AHgh+RpUJZBByox5ErtvG7oaj9t8ADd30Z/5BY8opPMhmbw7rvSUmDKYZ9YuUSfzL6GxVjUwUPfAPNdVDgkNMS1L@lists.infradead.org
X-Gm-Message-State: AOJu0YzorqVSgnQ2CFSSp9J0/3oQc1XihBntHYeBTKzLRyfSy2nldrT9
	MrOPFy+6Z346hkD5wrt+jWEdWbuhlJD2nrYcL61MQ15r5BZ8QaMJMKm2pW//LaXgJp4=
X-Gm-Gg: AR+sD12beunkHNW7mb0cnezVj0sI+nLer+PkjSDlM1VlyJWH35CEep2BHwCkmK6F51p
	pGpRt3hpZKvr2gQlPh9+ov6OVDRaAVFzPMp/3hNOGLwx+J9VTdAHOKehaqASe5YsVdej3G/MlAZ
	iilz3CxCeGM0iiC9dETvBGB55lZZBTsSj6HXJT8Vzv+CLv+qwuJHE56LlratbhcieSQpiF7m9ba
	z5UQKuksWemtVCfnS8SP25L+uzrSdDUsTnabWFr6JD+VtLjA8p80ou/fXcwCWd9kOqCW/dVPsrL
	P9rI81Id2l08cKegUrKSHDHumPoQCXmmHvRwVHOvnkkL9+W2HIrzZXOmScJndUHzw+AGTp5g9Yo
	2Mj46aL/uWcJ8LMxVek3XyvVN7lzIWF1hNIgKS+oZ/NL/+J3Yrcs8n37L4gTxfqZV6QV6AErBvw
	DOvsXhDLj8yAb6tlmTJVDnQVrFSCAJ2oie07p4KErxE+l8IDTRh8piLLmdQAh9SRpurj0R7fbon
	1hoPzpYXxIu5/7KdWm11lJIWDlQEEsyITN08Q==
X-Received: by 2002:a05:6a00:4f81:b0:848:2f77:e2e2 with SMTP id d2e1a72fcca58-84ee49b4dfcmr3807979b3a.75.1785606690871;
        Sat, 01 Aug 2026 10:51:30 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963da0asm1851610a12.4.2026.08.01.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:51:30 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 02 Aug 2026 01:51:24 +0800
Subject: [PATCH v2] spi: meson-spifc: use
 devm_pm_runtime_set_active_enabled
MIME-Version: 1.0
Message-Id: <20260802-spifc-v2-1-46e9d06a3217@gmail.com>
X-B4-Tracking: v=1; b=H4sIABsybmoC/12NwQ7CIBAFf6XZsxigiNGT/2F6ALpt19jSQCWah
 n+X1pvHSebNWyFiIIxwrVYImCiSnwrIQwVuMFOPjNrCILnU/CwlizN1jtW17myLl5MQFoo7B+z
 ovXfuzY/jyz7QLdt4MwaKiw+f/SiJzftvJsEEQ6W0NMppw/WtHw09j86P0OScv8eNlqKsAAAA
X-Change-ID: 20260722-spifc-336fbde9511b
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785606686; l=1987;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yMtI9BK0fNpSFzuJ+wAyM1BWD3SMOzrFcrsFwAmmawo=;
 b=6VtTQY9UDzYuad/EIaTRPmGT2JECVibG+R/klKIvnybHeF+an/RrExy+5fAkpr9Oe+g01/wW8
 UUVpgKTTUSeDht2aim/cUJxJiQ9JMVeQyIA2/Wk55yEu1mpxU2IROTf
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_105132_771912_E4C9888C 
X-CRM114-Status: GOOD (  12.66  )
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
error label.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Mark's comment.
- Link to v1: https://patch.msgid.link/20260722-spifc-v1-1-e4462a4c6a06@gmail.com

To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/spi/spi-meson-spifc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index e36aa94bbdae..82c1c3c0c84b 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -325,26 +325,20 @@ static int meson_spifc_probe(struct platform_device *pdev)
 
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
 }
 
 static void meson_spifc_remove(struct platform_device *pdev)
 {
 	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 }
 

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

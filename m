Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261C1F55137
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BZelI9g26W/HSvhaNEd2/EkF6kUHdAUYKvEVgQ0Yxl0=; b=DW9tOahElUFKDw
	JptFHiqokWOBs+pIofBTRYF+jIOuKm+UuEGHLvV4oQichWyXbpw5lNgphwPrvA9mPkUTB6o/aQdeo
	y143UBPIoaiCJCgHnZAXp3+6RzbmXA6YyDu8CkXykTUJNiLQhHIrddERBha4HoZPiTFjbF4gQ/Yh0
	2yD87uyi//putXzXWLAXTd43N/tLZoTQBZ38Om8eENMBSim9B9BUw/uOdp43NNIl8QJFDMhBsKewC
	D/Tzuk/oKNAb80RLr37/KZKHE801Ue7S7SPzzjmsifkXq/IEW8SXlKW2wBs5cw5/We8cZvNHoOkSX
	TSxR4gTqqmBJUeb014Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz7xF-00000005lWV-1o2J;
	Sun, 08 Mar 2026 06:49:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz7xC-00000005lW5-3LPj
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Mar 2026 06:49:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ae4e538abdso68470815ad.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Mar 2026 22:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772952570; x=1773557370; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oHZ3b8kIQa/ldmjcMemF0gGgYf2JewffGcklskFCxDY=;
        b=KlbkOOpRlBASx38yNoIqSitTAawsOG5abJf3JfdZraxEpi13TOHHcXLYqw0Xi1ssmr
         XRENSzZbh3ETv+Rlp5hqV0HjZHQgo/68kPB0ZfMLQFahTohRVJ99FOYVMQhKQh155iiA
         5Esr4D/iPO2oe5grCh65GoKdkgKNwq3jo1D4HA4oRU02TcyXEicVRyhjju/+03FXbvuT
         6ahlDaDLNHPQpFTB+np2rCE7MMgyUCc8K+CXqP+WWA9lSUPpXPxumOdSmi9upp0WqC/B
         G0hP21KNiwOFQ5cnqlDvojGfGrwIJj6gt8GGy5qvfIeaSECDEJFDO5XCvgtv6PMkFBrf
         ez9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772952570; x=1773557370;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHZ3b8kIQa/ldmjcMemF0gGgYf2JewffGcklskFCxDY=;
        b=o8QzSwN6e6s2ju0Jmzq3V3NvgdvYV7Z/5jC1WkAvl59c/xaQdNBVapt6WO/dqJPUfN
         0fH6nHn8LXg/j94X6yDnktqrXtpmJ0y5vj20awi388YCoG0mvMzTMCvbwkpGgr63hHuu
         HOVfxjg36dvfIMC3J3dQLabWOipJqvF+kLZxXD1gX9+hoLtC45embsun5KWGUJo2CxKZ
         IYwEFo8+H1RzSdLjs4fZFvJYp8bDHHyXkfOz3cSbSUhKHpFMIxCfw8XYDI5TVsng+qZO
         TQmjfa+yCuPpSqaIk7/pbDfGZ09oCxMdgc2mbr32hQ4GAq8FKWZrRAaBezpFBKGxl40b
         Rgbw==
X-Gm-Message-State: AOJu0YwseJnDU7XLpZpGuIwWzHq32VjSgvyQ96DWfEXV4NAYXPAg8g37
	l8FOaClUwLPp0OeCXUsCGKQuX6jn1XNEgPV9Q8kyzvLy9yV+b8Rg6T/hUYFy9qvidGM=
X-Gm-Gg: ATEYQzyL/0RydCwB3EDmNcht1to0vf7GA5ufeWK3xO6f45c6N0XngXLjWN4GLMxDOC8
	B2YE1vIDCJ7IWaufE4rWaqoBbhs3oZBYub9tfByNbiRX7CKMoQj1o+rDSq9Z+z7KpB9S6lXxohm
	diN2jWC+bLYfZH8ny1QmQaAUHckWRNYeXUF8Y2DO9V3Lo6QtOBKQDeb6x75EIwiJrt/BL1NSy9A
	iJLClj0d6AeYGoL/kIsF+Zavl+tvr30pqUDHHcXqRUveq/XVPh2HiJAFpzT4kTeJkSVdIRMcMBz
	x/DaZG9rvEfUXBzA9MsIIOtqYnn5o7sDlOHDv03iiZ5BFUNu6rOOqO4WlMZFNIWjYBqO6TJR437
	lKqyzpxr68F8djmIk0kJsG/PJcxH4sKR/wGoyzE0Hq2Pk7RB/P2Cfmlb8cKsLpQUgEhP4MY7a3K
	y5ou8ulDqyX4Og50CIvm34ZlmLZX8/CHoBnBl0FPDOamUzWIo=
X-Received: by 2002:a17:903:182:b0:2ae:8077:b1c7 with SMTP id d9443c01a7336-2ae8242d3a5mr82140785ad.37.1772952569794;
        Sat, 07 Mar 2026 22:49:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:4507:7fb4:bc3a:eca9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8b9e4sm68061485ad.64.2026.03.07.22.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:49:29 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 08 Mar 2026 14:49:21 +0800
Subject: [PATCH] spi: amlogic-spisg: Fix memory leak in aml_spisg_probe()
MIME-Version: 1.0
Message-Id: <20260308-spisg-v1-1-2cace5cafc24@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPAbrWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3eKCzOJ0XVNj02TzVMsUS3MzYyWg2oKi1LTMCrA50bG1tQCt9OM
 RVwAAAA==
X-Change-ID: 20260306-spisg-535c7e9d9763
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772952565; l=1876;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=/BKTkOJbNK8vWv0xzW8hwFc3TcYc2Ah5zzUcDxFOowk=;
 b=vqPfmsD3moqSuGNU//cr5LUBXukDIbjFj7/CSdRC3m4i2jFFtcz9i39Ori8w8ss8YVIkLBES7
 sJ2vompmXO+AQdSJ9BACro3T5AkTRjSLiwE1/jgb9LMxnG6ea3eBrLp
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_224930_850888_6E8EF949 
X-CRM114-Status: GOOD (  11.27  )
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

In aml_spisg_probe(), ctlr is allocated by
spi_alloc_target()/spi_alloc_host(), but fails to call
spi_controller_put() in several error paths. This leads
to a memory leak whenever the driver fails to probe after
the initial allocation.

Convert to use devm_spi_alloc_host()/devm_spi_alloc_target()
to fix the memory leak.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-amlogic-spisg.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 1509df2b17ae..9d568e385f05 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -729,9 +729,9 @@ static int aml_spisg_probe(struct platform_device *pdev)
 	};
 
 	if (of_property_read_bool(dev->of_node, "spi-slave"))
-		ctlr = spi_alloc_target(dev, sizeof(*spisg));
+		ctlr = devm_spi_alloc_target(dev, sizeof(*spisg));
 	else
-		ctlr = spi_alloc_host(dev, sizeof(*spisg));
+		ctlr = devm_spi_alloc_host(dev, sizeof(*spisg));
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -750,10 +750,8 @@ static int aml_spisg_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(spisg->map), "regmap init failed\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto out_controller;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = device_reset_optional(dev);
 	if (ret)
@@ -817,8 +815,6 @@ static int aml_spisg_probe(struct platform_device *pdev)
 	if (spisg->core)
 		clk_disable_unprepare(spisg->core);
 	clk_disable_unprepare(spisg->pclk);
-out_controller:
-	spi_controller_put(ctlr);
 
 	return ret;
 }

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260306-spisg-535c7e9d9763

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

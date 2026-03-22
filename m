Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12DFC72C6
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2026 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ywiFt2XDOQeeQieUW7PXChaxovPcPX7DSKYtpYwVDMY=; b=tSiHoJmjrvDttk
	3o82mD1v63ndJf3rnM3DmrtOednvWpa56GqvXpPmXSssGHb1s/bQHnBQQHJyEzHvX4hqaLaKYS/Tr
	MTW6eeETTbvTmrbSQZJ6dYAzSyGWGtMDixau6hPBhdr+6TzOilScwj33I6sX6IUB27spUldMVLRAl
	s3lP3394eI0HdfKnjX7H6HO1eZlDLDXk2Z0uDibMHyJEPBN27mWyOvnU3wlhJJ/Gxxhf8YhLypkSy
	MI/kfJCmVLmYvQ0NWL5AvWtSsIcXP/hzNU4s3PKzRP0ytZ+YkaTZzFPpAe3v27nYM4GcJhglCTIsE
	KiZGrQRTvT+m1SZq10Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JnT-0000000FPlo-3YUh;
	Sun, 22 Mar 2026 14:28:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JnQ-0000000FPlR-3dqx
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Mar 2026 14:28:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c742824e1d3so1086120a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Mar 2026 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189731; x=1774794531; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kva3CCELe9ArRSfLv8LT8G/ktzyF3jm4fohVcwRoSAI=;
        b=KW46yZ2V9sb98P88rVBXWMkhQemeDlW/gM46CazW3U5CsnlXS+C+8qpLPKqSG5EMAK
         YDonrrA1zO3W0it1KVHJ6y7JMUoxEH1cX2PGboMKIOoeGWBdkgAXXIixOVia6QUD4HbD
         gB+ksVXuskKGcFy146YIxK1Z/PUJNoyfxXPfqRPgew/NnWUfp4+cx0hbLm+wwZEuCwDG
         EtV0qSSf9yFGuQLq3c0gdJnTKV6GVPImPgv1xII94CzP7IY4ZMBWZPj4o5EJpWJe9ods
         EeJED0++OnIaRKsTDGLw3zuzUvax+FxsyXy20dYqPwYTw44ecFf7SjlKoA160CEvQf6w
         2hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189731; x=1774794531;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kva3CCELe9ArRSfLv8LT8G/ktzyF3jm4fohVcwRoSAI=;
        b=VdhFqZppDH5jeru+qJ+ru+vh3ZMWOP4yEl27JwLJe31ChoNxHF7B5XhvDnAbkmLm7t
         rZcbYy9Qmo9N0Xeo5VkI0f4uvaD0AscR66eT2TH4AsEOSZwiz87aPjEn1qTXRpPsGlzC
         15eYx+P7i9Q5UR91c5j0yrxGBlFdULmRFTUOWaiqt6Q5TljrIC6TfoEPJjCvCTjUpnJ+
         D4xCQ55vjjbX4Ei75il0P/Q5VuqTLMzpfns6hQ9/bzM8aseb/EL2Vnf/KRcOVrxwG1nI
         FYvqPDRm3jJ224G7lqKoj+kgCNYvoHhq0A0MmD+RBA1mGjUN5lLiuKCxoI2H0d/2tgym
         uYVQ==
X-Gm-Message-State: AOJu0YwdgAO/aswe0ULqjUcqF9w20nIoRZ4YTBJKsmXVWROSboJi+4jk
	yHcNqxRr0fP45tcLWFHTPdnQbqRuVNXebQK+JSXvCLrnJmzmeKbUCyVjZF9YxNHP7t8=
X-Gm-Gg: ATEYQzxy8KFnfJMiRgolMiOZbYoFAZZuhu2IK+0zHtoAwuWB3HpJr7pcIz2rkKEDSOw
	cgfUj8orkE+ibOlc5rokspp1Uu6Z+rorKQsZNSRIePgOHccYLEkzF455Djn9Cb9xho27zSbHPHo
	G6Yz5pcKcaNA2qR45YkapdoDWaKwnrWoYydMIz86gAvRUeZU3v0R1vMWP6qrxSi5HyBcx6YghCG
	zklxT0rWjP3BUUi/DUK2PrinxF2OAkjxYwTA+QfX4j/cQop13/Qnji7eu3JYtePuFlc/iyMDTjS
	Ql9mOceTjVtv4la+XfrzCcTPs8GU3RPzbfI854lQAMLBr27/kSNeqO7Rjncc0akBZ5CiWlarxf1
	V783we73WdZw0kplnqOrVS8kzQMc2SVkDwjbZJGY6z6erpxYwRUcxdm6Du5JCjIQgyOrqEDP5l2
	aoY9PpOTLmGx6vFi7utEXeK11yInmgLJFcJzP8
X-Received: by 2002:a17:902:e74b:b0:2ae:4555:479e with SMTP id d9443c01a7336-2b08275dfd2mr79474025ad.18.1774189731357;
        Sun, 22 Mar 2026 07:28:51 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352a17asm78621825ad.24.2026.03.22.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:28:51 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 22 Mar 2026 22:28:45 +0800
Subject: [PATCH] spi: amlogic: spifc-a4: unregister ECC engine on probe
 failure and remove() callback
MIME-Version: 1.0
Message-Id: <20260322-spifc-a4-v1-1-2dc5ebcbe0a9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJz8v2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3eKCzLRk3UQT3RRD81RLU1PL5CRDUyWg8oKi1LTMCrBR0bG1tQC
 E6zG5WgAAAA==
X-Change-ID: 20260322-spifc-a4-d17e9559cb15
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774189728; l=1775;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=nlDpkeLXmC3IbASLOK+T58E+TXrmqad8q7Jcp4v8ME4=;
 b=6PPv7Gwk4qHZTVUtPhWZUbWk3CG9V6WimJMR6ooi/C5l+BmRfIlDlvzSzM0K3W9eHE6uoqYpq
 bEeMFhxkud6CY8aUF0J6b/hLclw4bxwZ6k9M725k25c+rmAoE6bJzla
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_072852_923978_449ED905 
X-CRM114-Status: UNSURE (   9.59  )
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

aml_sfc_probe() registers the on-host NAND ECC engine, but teardown was
missing from both probe unwind and remove-time cleanup. Add a devm cleanup
action after successful registration so
nand_ecc_unregister_on_host_hw_engine() runs automatically on probe
failures and during device removal.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 1aabafa36e48..16346f50c7d9 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -1066,6 +1066,13 @@ static const struct nand_ecc_engine_ops aml_sfc_ecc_engine_ops = {
 	.finish_io_req = aml_sfc_ecc_finish_io_req,
 };
 
+static void aml_sfc_unregister_ecc_engine(void *data)
+{
+	struct nand_ecc_engine *eng = data;
+
+	nand_ecc_unregister_on_host_hw_engine(eng);
+}
+
 static int aml_sfc_clk_init(struct aml_sfc *sfc)
 {
 	sfc->gate_clk = devm_clk_get_enabled(sfc->dev, "gate");
@@ -1149,6 +1156,11 @@ static int aml_sfc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed to register Aml host ecc engine.\n");
 
+	ret = devm_add_action_or_reset(dev, aml_sfc_unregister_ecc_engine,
+				       &sfc->ecc_eng);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add ECC unregister action\n");
+
 	ret = of_property_read_u32(np, "amlogic,rx-adj", &val);
 	if (!ret)
 		sfc->rx_adj = val;

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-spifc-a4-d17e9559cb15

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

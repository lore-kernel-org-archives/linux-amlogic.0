Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FB1CE7B14
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZhANUihhiEJVx7SrnlhiK6NoVSRVoUVqz+LiAYcykc=; b=uW4wU3vfdiYbK6
	bDRBuoe6MZHHnKK/+0/FxyXL1r7z+yIS/woR6H4UEYZwDdS4dJnFOAqBlcoyCoT0ZOSWzKokjNzQh
	Aco+VU4MmYCacQPPLQ1nnfSKvyJEw3e6o+I3HqRZsM79vrlNmA+TdwZi2cf/Vc30SkxGfCeE+n6fD
	nulNIxN2VZkDFuvI4vOm1skVFWPfKTzhwXTPCoFlx8g0YzRHb4mHZ7VbZu9C3+K8gw9Acc4Leb2Mb
	0manZuCWD3LTSeA7k8s97NrowhRch6nU/SjjzNJ4WOUVJTEouqzwsC/EpBKOqHIIpsQ+h4R7vmdCa
	MnVW2xEhFuK5xnfO+06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZDy-0000000CNl4-3nzr;
	Fri, 06 Sep 2024 13:42:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7V-0000000CMCE-3aey
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-374cacf18b1so1370177f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629724; x=1726234524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yr1sayqKxsWDgBZHQ1bM3Uke54ske3bCnU2ZK9PgUEo=;
        b=gatNDuKD0PYES9QNY2sO6pz6EQOYVm6Td6VCdLo56hAkeeVvUIkGvHTcGSIjfwGBbk
         oCdZXV5MmviJQyuFLpjTOkIs/SgQ+p++JVOEEb7ZzFGDJsznGz+p51x+nftwBJYrGmcu
         /OY34tzy+R8MxoAYdPKr7OmOoFyaNQGC+QGcVoIgx2/yRN/Ruo4n+EOLlrG/Hsmzj7RM
         x1lb6ey0WIyahYx93FtRU65N7evbmAVaH1wpMscfAbZ61dhzEN2ZtlOIEKPcPiTACm3w
         i4cnkM4BHLUOErrgrpXqarhGmaB+LVd+dgRkhxcsOG9d/jUyyknQPFREnARk3Nd6hebb
         29VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629724; x=1726234524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr1sayqKxsWDgBZHQ1bM3Uke54ske3bCnU2ZK9PgUEo=;
        b=jyvM0xwQQ1EiFgJKN+csghwUHrubDDSAkAyZUhBbRiFKjt++72YLfmjwxY5YC4JdKt
         hcb3E0WSexuL6CGb3XhDolHBI2mTYlsgY1oe5vIviIm1wDwauRruVptYbxgPlZxR8CS1
         /L6r1p4oLVZk71oV70TMjsMGO3HO77exTHowVMr2Slk1oHMWe5QFMO2BbMMu7NLn/ihD
         T8FTtQpVJS1YS/Foiw6IQsoMJ8z10RdVDzBXZdO031CR958x4zqddtkN4ezfSymi1bm4
         NDVL/fOdbdSnJzxFV9DUXN/t+mjqrthEk/oaSDIYyqYObmHdsws09me+F60llpFwLRml
         nEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVubOCmfRvgQBVULRYrwqSSBuIYjRUHSXyW88nSY5+ucuRx3ozDz1cZtKCDQ6UQ9ZIY5ij2REn9KVMZ/+zQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyF6yaZeLp9VVlh8mCEbNakaXIYipI8USjZ5kQNcSDvCW3OdB03
	Cewq37JPWR00E3WWVme6ZIrOqccp6ES6kMbhwtZQ1hxsLUVcuUcbdo0usbM3ma8=
X-Google-Smtp-Source: AGHT+IHtyPvrZcVdwFmw8XQihKzwGBhzTpX6IW6Bq3OFAXKmFfW1m1vMKo12rNUklRp2d6TUNkaT6g==
X-Received: by 2002:a05:6000:223:b0:374:d1dd:1cc1 with SMTP id ffacd0b85a97d-374d1dd1e44mr8801291f8f.2.1725629723501;
        Fri, 06 Sep 2024 06:35:23 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:50 +0200
Subject: [PATCH v4 5/9] reset: amlogic: use reset number instead of
 register count
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-5-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iSedGQJkeoX1rk7eD0ZddgTbF2MZs7+12PeFSEIOANY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUSHEcD7K2lLWF6rnCrk05yGhK2svJKDRc0t
 qPznnAbxlWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFEgAKCRDm/A8cN/La
 hX7fD/40NAGXsNPZZOklKjEefS6iDGIJJ66e6aq5vjJ4tJFkgU1UCHM6HtnWyGrwVH7bCATlkrc
 zfdZW5t3tTl4pqOCl+vOKaRSGrHBT35G8Ox9hJlFRW3Snso5iJyPuQ+CTrYma1JrEHyGz7krZZS
 847buYbjmFRvpRorM2qQfwsNbhDXNzhoPGlb33dLmRRHSobID92DGHGWH1qfLjv1l1LQEx2yTwJ
 NgfluH6D0qkQUH0bvGbO8Ci2nIdl39PfEYyvHVG9MZw1mvwlUs1Qc72y0OXci599sge1sDLvLdS
 h0Zaj3/tu0HSDSprt8k03YFFg5NoAUvEVoJiAvpb3itN5TnzzVk20dnXth6oHFnijLTrN/2jy97
 A6LoYexCGpUx2EnQkiBdXc56R8qlL8X43hA86h4rZzo33O4F8bXsleFUZXGUESfHWpgJWdk7Gfq
 uutDTN//4THhTnzPuOUe9x2+wpjasBkUm5AeSeXWg2eukaSOc6i5WVbS2g+hem1WolVvXIFjlO2
 jgbjZIMP8OdSA274I0TiF1VItV2l4Xkpj6dt1ZD+H3p1zQuQrzmPbXjPgKFSARxvBYufdW3kejF
 MB/0K6fkFBtjMUv1nnkv6T4sXp24yjYyFokjOzjEUV6kYajijkoNJftGFrmewhrX3n1ZHwmaj2W
 XVQkI2IQt/4Pf3Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063525_995844_2FF13C82 
X-CRM114-Status: GOOD (  11.96  )
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 6a90613c8095..e31c1b7c9e4d 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	unsigned int reg_count;
+	unsigned int reset_num;
 	unsigned int reset_offset;
 	unsigned int level_offset;
 	bool level_low_reset;
@@ -87,28 +87,28 @@ static const struct reset_control_ops meson_reset_ops = {
 };
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param t7_param = {
-	.reg_count      = 7,
+	.reset_num      = 224,
 	.reset_offset	= 0x0,
 	.level_offset   = 0x40,
 	.level_low_reset = true,
@@ -156,8 +156,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
+	data->rcdev.nr_resets = data->param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

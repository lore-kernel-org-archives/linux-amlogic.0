Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2214C5DF71
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 03:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EwzWVcioc44NIXmp6KgcTJDjWYYAbSPnAoXMiYHXB30=; b=P6HwsyAyWzKGdw
	yRmR/CqyFGQW7U7FW0rgs+wIr374oVHOYZJzga83GIcQAyVsmNLuEA248Cu8FgICSyBaLnMubj0hi
	15AQKcBF7bTvfSIQlGD+liSNhzDbEjtNvLDjglZVW5PAcyFwiAMxpgrM2lmoYlsPkWU1A6r6mGpQx
	OQwnwJDUvCMbEIzBLYLjOUejAj0hQSC6ZwoOSWOsbBy/Dys5rs3z+LxFn//CjBYXJ5/fWOfy6kyoa
	ps9YGURlWDhKlaZE77RookQORA65Oez4HBRmHZmoXe6RZBypkbSo0Zw+3XZvuk7jprGTCYeV5Zsw8
	PvBwfwrPStyUd1U54HNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGAw-0000000CFRp-2sSe;
	Tue, 02 Jun 2026 03:52:22 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGAt-0000000CFQZ-12Ac
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 03:52:21 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-304d555293aso7141007eec.0
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jun 2026 20:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780372338; x=1780977138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=db4ZDp99XGdk8QVglDB5KTc3dov06pGrTY3LBK3e++o=;
        b=bcYTCw71kVzKYHUJsbelay3SSkW20GP3Qz55tnRYYoJFlW8ndRYHz/ufQ/GEHQcfkV
         +ZC4UhOuCGBZHTSf2b1dh+y4kLdtoEdrbJ9rVXf0d/NWEq9f8eq0RxCNfbSLLc6nbLqY
         GxYqLXht4G38cpck0UeS4OCM+lrDRFR7oJQObIzzDdvgcPR9ig9kMyvjK6V/eho8Bugh
         l0BapDfWY2Bs/2W6lo81shAZ7iR++trw1/CmxAy8UklV/dPIS6abWGiI7SNHoU6Uqtgc
         tj/EDaPfLQDKm/FYZ5OLJb5uYrH6r6ER3BVqbkDb6dIHJxpdrq+SdefjfdwcTp8HvmjJ
         uFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780372338; x=1780977138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db4ZDp99XGdk8QVglDB5KTc3dov06pGrTY3LBK3e++o=;
        b=oV8iMS9nK1oO6Fub0k+KQQhPPuqK1QNt+GkGz/TrP2Sdvi/3ssBcuLkLNTNKqnABdw
         BWcg+1/p5KikEf+D8C+AGdAp9r8AyZq737mYhQ0fXmKywjyqhlvCQLsJ69hlXwKLGGda
         JRAy7umCG9KsWJR2Y75fMFM8LVzayNTwxE5xYETRm/aKaMbI2wx3VQa6vUhoD7Deun4g
         XK3nmFTEJP0cPjrH7YFl7y5FnHpYtVECyvH8QxU/gHqswWFTek8bho3pewW9mruopGpX
         lq+Z2sPuyW1IHOJmdOIiXEV9jLomEKTGspiThFg6J4Vh0g4UO+eckncj2QCTFHci4jaH
         CKJw==
X-Forwarded-Encrypted: i=1; AFNElJ8IXxlSABzm4DQGdddsLaCvq6N2OyRpT76thMpp8j6BIhqieXk26TbVlZhjcTeq9iktyTPrv0KVB1EJU1Kd@lists.infradead.org
X-Gm-Message-State: AOJu0YyfvdfGRsXP9UpNbFxn0tzosXYtW1CRwO3L+oclsAxaDXRt8YvM
	+mZsAaGHMGwq+QoUNMv8A4/R5JDD9pQnb18m+NhfgaH7fyHVUsfizpBL
X-Gm-Gg: Acq92OFyJUHSeD2XbrKfHFKOPjdwIx8ZlhnpGfo7znIXNUds5NDOlFeWV+x8e3DNJ3Z
	QjjlEgS+I1mtq8YLRcH1HRmmV3nh77q74u7c7VAsa9vHlAf6uWMaIv2V1rpoepBknbAzVsLV4kc
	6QlBgxLG+tjkOLzvtf1lVseHbf8W+yQb21LwGV0QRYrE9SbmLOu8i5KcMRaArb9Fliu19dH+cBJ
	Pv35F/bWKA4QNkMGG7Y68mggOSrmltaP/3dRhGw9lhWvia0tY8E8G7Hx4qTZj3Dd09jVyl5iieG
	stjwyReruF1G6Z2rEC3llpEQzu/GcgC0qhAmAzmQqvV0qEL01XL4XBgfHAT9yWKOZ1voq8p6gF6
	pjYGiMPwZgNt8OU8IlLsQtnZUzwz8Jc2IernuTXKwMnd4zvtaO8lwtZq4KWFD27IMDmzvdumJks
	6y3okjJ5tN8qsQ3cthQVFgvrDdgDW5AyYLE2dGnYR+vkyq6uBRXrQzwwnCuYdFE54WH6rdfbM48
	suQI3UKqWAK4bpSAS9EA5wyK2lOMUZHHyjzaXDaOgQVz7JlVapyrnFA6nn5K2qatVF6VlnEbUJW
	Yw/wMGqLZ7VNBf524Ywdidjte9fwS69PA6stHV0X4iH/CywQsNVSsSuQ+MoCHeg2ehY=
X-Received: by 2002:a05:7301:5803:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-304fa4fd14fmr5878983eec.10.1780372337755;
        Mon, 01 Jun 2026 20:52:17 -0700 (PDT)
Received: from odroidn2.. (c-67-180-34-11.hsd1.ca.comcast.net. [67.180.34.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d06asm11425664eec.14.2026.06.01.20.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:52:17 -0700 (PDT)
From: Yi Ding <yi.s.ding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yi Ding <yi.s.ding@gmail.com>
Subject: [PATCH] soc: amlogic: meson-clk-measure: fix debugfs directory leak on unbind
Date: Mon,  1 Jun 2026 20:52:09 -0700
Message-ID: <20260602035209.62335-1-yi.s.ding@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_205219_276989_20DAE8C5 
X-CRM114-Status: GOOD (  12.59  )
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

meson_msr_probe() creates the "meson-clk-msr" debugfs directory (and its
"clks" subdirectory) but keeps the dentry only in a local variable, and
the driver has no remove callback. As it is registered with
module_platform_driver(), unbinding or unloading the driver leaks the
whole debugfs tree, and a subsequent probe then collides with the
already-existing "meson-clk-msr" directory.

Register a devm action that calls debugfs_remove_recursive() on the root
dentry when the device is unbound, tearing down the directory, its "clks"
subdirectory and all files.

Fixes: 2b45ebef39a2 ("soc: amlogic: Add Meson Clock Measure driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
---
Reproduced on an ODROID-N2 (Amlogic S922X, G12B), v6.18: the
"meson-clk-msr" debugfs directory survives an unbind, and rebinding the
device then warns:

  # echo ffd18000.clock-measure > /sys/bus/platform/drivers/meson_msr/unbind
  # echo ffd18000.clock-measure > /sys/bus/platform/drivers/meson_msr/bind
  debugfs: 'meson-clk-msr' already exists in '/'

 drivers/soc/amlogic/meson-clk-measure.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index d862e30a2..1bcaac7b7 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -902,6 +902,11 @@ static struct regmap_config meson_clk_msr_regmap_config = {
 	.reg_stride = 4,
 };
 
+static void meson_msr_debugfs_remove(void *data)
+{
+	debugfs_remove_recursive(data);
+}
+
 static int meson_msr_probe(struct platform_device *pdev)
 {
 	const struct meson_msr_data *match_data;
@@ -967,7 +972,8 @@ static int meson_msr_probe(struct platform_device *pdev)
 				    &priv->data.msr_table[i], &clk_msr_fops);
 	}
 
-	return 0;
+	return devm_add_action_or_reset(&pdev->dev, meson_msr_debugfs_remove,
+					root);
 }
 
 static const struct msr_reg_offset msr_reg_offset = {
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

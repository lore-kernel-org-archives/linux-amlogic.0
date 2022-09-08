Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62250C38145
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Sep 2022 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0YdTNfiKZCJV/KHnbSw7NNWh/fHD4y2I+Ti19/pmz2M=; b=cUfDiGpt+pGShm
	t2OPKA1XdrHspHUH0BUDm+0ZQKheQWAe3dlQCyOeaFni8H3SMdAJiRsSoYyyh4QMXel+iQoxfG5uz
	PXxdrwNn3nmg4GiQW3E2J7KPiyZVF2pPohCS3veSSEIbQIgIW2QepO10Iff+4f7W1MSk0uTVq//jo
	/O6TG5sJe19R0tlsuVvgyndhs19FlO75qPY8E9BUv96a+PLJNhk8nSnr8KKdvpxz9+U1evkPGEWLd
	X1zcHa7ClZb7GdeRc7UeS2+oSy6rIi+BEAIheYODoDDGOKfTkGXII+aZUaglblgrRx6aWPzvAGZRi
	S11BkGJZbDAVc3mptQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGU6-00396P-AP; Thu, 08 Sep 2022 12:18:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGU2-00393I-Sy
	for linux-amlogic@lists.infradead.org; Thu, 08 Sep 2022 12:18:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id n12so1829183wru.6
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Sep 2022 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=36szBVL2Cn+cs2NB42v+LawQS2D430mbQOaqyu/Olfs=;
        b=Pde3JYxD/Xd7HKAURItyoFTzSLlbMdkJZf1gK9a32JrxfqoSR6WT7zjXJ30ox8O3HB
         zs49UqsyBuLz6xVMI0aQekGt+BTmG/KUBFlcAcB4ZlBhVS4aceqzdh64Ic+v0Q9TghVe
         Aj/TPe9IXO7rMvvRs7GxgWDEzruAd5C+rvoMrKPgJBNEga4t2DPEKGfBsVAGA3D/wXvf
         xd+pRbnIomRsdTKedKKrUE5WcNF5tavoZCeGkht64YQiI7mu9TrAQggoHu26KZqdzI1g
         uUfXz4zxxI5PDVkuze5GMqJ+cv5HZyf+XodaHVXZFDWgij62kVXc3yFRzpgs0gCuv8ws
         xr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=36szBVL2Cn+cs2NB42v+LawQS2D430mbQOaqyu/Olfs=;
        b=TkiZ7ipvIJqA7HRVvOTyjOxfbAQMU+7iXJsqNPdpHIIqt5cYwKrKBYYfSekPyQHDzh
         yUOyu3eOIRTfmXz1QkylO68JkPoroXJVMXwdKQj9uYCdq8QuhHFgf7TS5hAwqkMreNnM
         RyI19r2K/2U4EwpnBhuUMTihPIU/izuE6aW8JZJHOq0iTVU4BTyUd3wrxMogXv7+eRfQ
         QJyyfrj6Ovs3if/H1grCOTmWvpE/I7RCFmrs5sfBYtfasAalZkDSFCI5n9rgCrS5az6F
         72UaSgArF9MGvj53D4MBU6jgyb8BqQVCe18+JL24LfGCT+jvfYV5225bJ9tjrD920QW/
         E2rQ==
X-Gm-Message-State: ACgBeo2H2LWPMSqs6yTaytRyrXZOnJnznoqlI5vIAgYjmngRCkBmbDW6
	gzyB6kU2mICrefDtChh+sVec/g==
X-Google-Smtp-Source: AA6agR5EjA56judCPtRCeCyzyYiLIg54xxck9hVsX0853urdIxfPbSabM8hT3pDh8JwKOyA8tSzDaQ==
X-Received: by 2002:a5d:6e8c:0:b0:225:5f3f:1d8f with SMTP id k12-20020a5d6e8c000000b002255f3f1d8fmr5262682wrz.610.1662639490672;
        Thu, 08 Sep 2022 05:18:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:666e:a053:1034:922f])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600c4e0100b003ab1a870daasm3212208wmq.5.2022.09.08.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 05:18:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] spi: meson-spicc: do not rely on busy flag in pow2 clk ops
Date: Thu,  8 Sep 2022 14:18:03 +0200
Message-Id: <20220908121803.919943-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239; h=from:subject; bh=yaCMBlN3USyF395Qdq99BsDpbkdWYyZKbFBk4XoweKc=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBjGd1q0Ohn/nMUpBJQiilkpVXCK3b8I2QACUHiwbG7 HNL0O1GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYxndagAKCRB33NvayMhJ0RtJD/ 4mdK7zWsfF1Ga9qsaLSDth+NlZNgABEsh3oscJvCZlBD9qZNExO3Glepq2g1FnFmbD7FIoK6kN+NP2 nRT3URxR0tX2COW7gxtfywqW3N8Pu7l4HDr2MXnjhL+3q8dw/+TtjRfHPgWb+uyXg1N1vScKU6dnRy lBUilgIhBTygZl2E1g6vtGN3tFZG1idUwIT+YIgxbb7EcWCXac6Z+L6omlKS2j8L4gpszEIM10YE0x nE5TE5gsbHciqfxc0X8pd7wI2oxugaw7fz7ecDy3pWZh6/+ofNiRrGjwjgbwGMlV45UTncwv4O8SF7 5Dd1I3IyZjWQ5I0v+oQNCOKb/gs3QG7zOwgkvBSR9UQjbVFBOXIoJZ3UafQQP/wmFXaeRr4oJKR+OD NymFVCG3+6NC/vqTZnmkGBSzpNbmOeaD4SWXHM8M2eDEDgY98wclVDLCkyi2fV9fOeIVWKnzeRJ3RB a74K42rUBbN+t37jcwZxObMWH8XHSAWqjcWxz80Dc4hjhaEvGjMO2QNz2LzsYEjJhzkxwcB0+HV5D2 lPKPpS1AXR1EF7U8pfxcpl5G/BtrabXa6bGz42Pb6163yqzFc4NjjNWb4POhBpZgWzgO+gzgT3HQBl xy00lqqUJqtsPMaQBtJUHSMUSD54ssFtW/sHjSpttcvgZMTjwEAi28AtZ43w==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_051815_195221_07803F7D 
X-CRM114-Status: GOOD (  11.66  )
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

Since [1], controller's busy flag isn't set anymore when the
__spi_transfer_message_noqueue() is used instead of the
__spi_pump_transfer_message() logic for spi_sync transfers.

Since the pow2 clock ops were limited to only be available when a
transfer is ongoing (between prepare_transfer_hardware and
unprepare_transfer_hardware callbacks), the only way to track this
down is to check for the controller cur_msg.

[1] ae7d2346dc89 ("spi: Don't use the message queue if possible in spi_sync")

Fixes: 09992025dacd ("spi: meson-spicc: add local pow2 clock ops to preserve rate between messages")
Fixes: ae7d2346dc89 ("spi: Don't use the message queue if possible in spi_sync")
Reported-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/spi/spi-meson-spicc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index e4cb52e1fe26..6974a1c947aa 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -537,7 +537,7 @@ static unsigned long meson_spicc_pow2_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	struct meson_spicc_device *spicc = pow2_clk_to_spicc(divider);
 
-	if (!spicc->master->cur_msg || !spicc->master->busy)
+	if (!spicc->master->cur_msg)
 		return 0;
 
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
@@ -549,7 +549,7 @@ static int meson_spicc_pow2_determine_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	struct meson_spicc_device *spicc = pow2_clk_to_spicc(divider);
 
-	if (!spicc->master->cur_msg || !spicc->master->busy)
+	if (!spicc->master->cur_msg)
 		return -EINVAL;
 
 	return clk_divider_ops.determine_rate(hw, req);
@@ -561,7 +561,7 @@ static int meson_spicc_pow2_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_divider *divider = to_clk_divider(hw);
 	struct meson_spicc_device *spicc = pow2_clk_to_spicc(divider);
 
-	if (!spicc->master->cur_msg || !spicc->master->busy)
+	if (!spicc->master->cur_msg)
 		return -EINVAL;
 
 	return clk_divider_ops.set_rate(hw, rate, parent_rate);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

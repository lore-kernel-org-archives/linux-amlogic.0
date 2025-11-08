Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2AACCFA13
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC5skZFxbexPUOKKDJuU9UqTKmXCDt+rzpyunioNjPY=; b=VOfDqvL6guUc1A
	Da1isajpjiM5M0lDptCl7+ibgyO49GZAeWqilytRIfXC7q4qeqsN98izVU/edwTffOh6KLbhyTdhU
	Xd5aONC7fl8fpLEzM713dnFGWeAJVC5st6IUA8NQxavr3mg03/uTg2qMbEDqemCMyOXfS6xtzRiY/
	ZK/pfhoTXOq0whaEEq4lpGWGckN8f5dcpeofjPSHvIwnRLV4S4mdwihIQh/dKUKD38ffFP/q6eyVJ
	Ks80XIfh3OJHVrpYbDu0uNojebUK8UyvOpAeSuPp2Wsc6JPq2c1MlbUKyERgYKNw1z2Nbu7Derp3Y
	kpmUpn5q0owi/vy7lErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7o-00000003YoB-40Hz;
	Sat, 08 Nov 2025 23:13:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7j-00000003Yf8-0IA8
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so23672a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643613; x=1763248413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp3aBA3u4fWo7xiq7xdD0SMcDBXI+jskP2t4r2Vw08s=;
        b=dHmkxpTM3ESsnDkMjMdmNNcojyzhAZI2kOk2Ccw0WDx0a7WBGWB7IGLVLRLiaH+qyX
         LQkwYY0qz7rUnQ7D+mgQkYgt8KhZ/5QKodm3CqTdIvj3Avb1EHzoa5S0rtVljrVJG76T
         yQeaMvzmzyilwmKD31N/ggisVQ+zRbOQAUwsAsi8LXBNAF9Tc0o/0Au0UhJbPWNuXM5O
         BiSTgcsWmOmDXiXtSYzAJb15Zv3I41yVPZUbOZbsAxhQjqkbVbZAnznGAYw8sMYbBK/E
         Qq0IwK2+7U8CgxGWV3X8Et7nW2u9zVDsnNqkLwh8MyAZgtPiPhkgntAJwli4PkfsdZhL
         do0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643613; x=1763248413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jp3aBA3u4fWo7xiq7xdD0SMcDBXI+jskP2t4r2Vw08s=;
        b=CYdtdTtYVQmqEdy8qUR9GuKDvH1BX1jc2YT1OhFiAAVThRPGR8ZE+17JZajBrI+wxx
         b0b3QNkcK0Aen6GPYU+9ht9/MpqKz3Gtndf+N6V5qll4TNakNg7uFRlwJwBzgQVpOGz7
         261goD5TfcVd6v3P9icQLyo4SB3VZmtGMcymE6fyneoUZhU/Q58a55CPjlLolxPC534U
         ohGXrIm6ew1HeMDfnvyJhGnq2eKO1/8lbYFU2IUquotxs5E/IcL12wOyHTLIXG4fBDtQ
         ArchE/HXW7pVlE7xM4Iadr3SGk7HyHi3VegvpyJZOqjgGXj2ucF2ReN9VRJ7j2t/ZKF0
         ScIw==
X-Gm-Message-State: AOJu0YxLxxVH+tbh1uI4QvXABml8PPYGE386f/A1xV9kYDKGqbFCAEe5
	C5pL6Wl1AH4SoubvbJ0N7SmbT2Pm/Kxw/v+uBnW6VKVIh5jN1u1ioIF7kY6JJA==
X-Gm-Gg: ASbGnctHlsyc72XRq0AMY2cNGcUttsARch1iCj3GybSffP9JXsxMG0wsW3R1iT5Ci+x
	ubsXAWV6/k7dVUzxJdpgD//lTxses3gww+pYYovzV7nTD6AIKTXzJUQDDS0EmldL4Vzc1q517fg
	C3G13ZFlxQ3BUDbxBtqX4S1usHddcF9elXKjE5s0u4BHfWNn8vw7j4+aLi1cAmW/qwVnA+ErVDi
	Des2I25tZGU+k2lRLgwJqp/ciDCvI/pNqPuEBbSQJ7MbrEtoRaiYEBPWENLNZiQ7URU+yrRGMsZ
	pqh+ObZ7w8Rv8s+e7ij2L0SUarMBoBxRbFF2AG8y2mYKyRBqfQntRHP18H+5q65j1GPfjyp14y4
	AxOf6z2RmDoQfLuac2+3GBVJoufyVENaxJ0UKNRlVXxnMEgpL2CEEiWKGHd5I5w2N/KhqhhqNLW
	P2rC6KFsIAZ3bTiLM/qXas0ma+cHRU4mE2Xer3JbUtGpPMPE5diClicK/Be8EGM1x4rS9af2jQp
	L1Xqnb0o+zfhbpXV3nyRXdGoKVwevxH
X-Google-Smtp-Source: AGHT+IGemsR0OuxveqoCLuvT35vA4jAjT0f4VTJglt6MI1GNIHLfcz8g6Jk7qZLukmNg7JdbfDQkvg==
X-Received: by 2002:a05:6402:4415:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-6415e856c10mr2612380a12.35.1762643612939;
        Sat, 08 Nov 2025 15:13:32 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:31 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 7/7] mmc: meson-mx-sdio: Ignore disabled "mmc-slot" child-nodes
Date: Sun,  9 Nov 2025 00:12:53 +0100
Message-ID: <20251108231253.1641927-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151335_129742_8700E102 
X-CRM114-Status: GOOD (  17.43  )
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

The meson-mx-sdio (and mmc core) only support one MMC/SD/SDIO slot
(device) per host. Thus having multiple mmc-slot nodes (one for the up
to three supported slots with one device each on the meson-mx-sdio
hardware) can be problematic.

Allow specifying all slots (with their respective device) connected to
the meson-mx-sdio hardware in device-tree, while making sure that only
the enabled one(s) are actually considered by the driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index e8b63dc45dd8..5921e2cb2180 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -493,23 +493,30 @@ static struct mmc_host_ops meson_mx_mmc_ops = {
 
 static struct platform_device *meson_mx_mmc_slot_pdev(struct device *parent)
 {
-	struct device_node *slot_node;
-	struct platform_device *pdev;
+	struct platform_device *pdev = NULL;
+
+	for_each_available_child_of_node_scoped(parent->of_node, slot_node) {
+		if (!of_device_is_compatible(slot_node, "mmc-slot"))
+			continue;
+
+		/*
+		 * TODO: the MMC core framework currently does not support
+		 * controllers with multiple slots properly. So we only
+		 * register the first slot for now.
+		 */
+		if (pdev) {
+			dev_warn(parent,
+				 "more than one 'mmc-slot' compatible child found - using the first one and ignoring all subsequent ones\n");
+			break;
+		}
 
-	/*
-	 * TODO: the MMC core framework currently does not support
-	 * controllers with multiple slots properly. So we only register
-	 * the first slot for now
-	 */
-	slot_node = of_get_compatible_child(parent->of_node, "mmc-slot");
-	if (!slot_node) {
-		dev_warn(parent, "no 'mmc-slot' sub-node found\n");
-		return ERR_PTR(-ENOENT);
+		pdev = of_platform_device_create(slot_node, NULL, parent);
+		if (!pdev)
+			dev_err(parent,
+				"Failed to create platform device for mmc-slot node '%pOF'\n",
+				slot_node);
 	}
 
-	pdev = of_platform_device_create(slot_node, NULL, parent);
-	of_node_put(slot_node);
-
 	return pdev;
 }
 
@@ -642,8 +649,6 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	slot_pdev = meson_mx_mmc_slot_pdev(&pdev->dev);
 	if (!slot_pdev)
 		return -ENODEV;
-	else if (IS_ERR(slot_pdev))
-		return PTR_ERR(slot_pdev);
 
 	mmc = devm_mmc_alloc_host(&slot_pdev->dev, sizeof(*host));
 	if (!mmc) {
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

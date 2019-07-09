Return-Path: <SRS0=xgMo=VG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FEBC73C46
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2019 17:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD6521537
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2019 17:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OtuspRvY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWAQGZKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD6521537
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fNlr/rQRhW978Ll2mjVMISANqwoefYhaWOhSHtOGFO4=; b=OtuspRvY9ZlFdt
	zTGGnEI2tRR/SeNDo/pQpujhP+2UCwmNqtIARaMztP4Ru/uyRxEgWaAbJPHBT3zyScVNkLTOvbZ/h
	ouQob9yIUrLyIUxCgxFt4H+3WI1k5h0rq212PtorjcRx8IP3QcKtU/M5vewf8Q6KVr8uAkjvM8aSM
	8dSH+dorSAqDCo8mQ2uQ23GtvpOsIKIT6W+A3LAPQeeMmT5qfWVIKkj2SAhFRFY2tGzY8kMIC7EZ8
	JPmrelrULR0BXqGDkgnTZ5SPPaCQayjLLeoU5ElyrUeNU9dj+B1lrN+xrNLsK6VzctJq7mPNkEfRI
	iuHKxaFg3JrhDerSJgGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hktjr-0001Ph-EJ; Tue, 09 Jul 2019 17:17:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hktjf-0001EL-Tu; Tue, 09 Jul 2019 17:17:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id c14so10412140plo.0;
 Tue, 09 Jul 2019 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRtVZWK4MTGxEwKYhzR6M7REzjy7te0i7wdR2g1MuQM=;
 b=QWAQGZKy6CrgIhflpOFh47kI6dHDA+nDD/sN9GIvQhstjbDy8JIFLwhPeZk/OaMHLT
 +kHVwUkMXB/MOP5bxRAqHXCI7qtLLBWsTPwUtB5At8TkJ1TFeJNdw1xOzHmmM8TdywXD
 inO9tm3kc+/WTEiDDasB04YI/MzxqYKEm3nHMEcTdc6Y2ntv2py6yoTA59i/uykACuDS
 igCnacXSODbr4UjtV4RPF0CaiM/ME0g4JZrEz1pKWxKIIhHhws8D4jbL+pn/4RI8S2BJ
 32cErmebH5kI9o2bpQ/OYv8XGhdBs2ZfrkWp3IZHjgW8qDkgvJ2XeMI8CprD01wxHRBu
 4nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRtVZWK4MTGxEwKYhzR6M7REzjy7te0i7wdR2g1MuQM=;
 b=E+iNcwm1O3MGJ3it1DV3E4aWfDIF1VSZLWIAIP/tLwfbP7E9BNODo/YR/gis0ddCJR
 zrpOFs9uWP+lcvfkNfaOX824bieArRfdGloFJRnsL3DEJRn3VN6BeaqiMibk7maSoJle
 o2fm6CJ0ZeD5z0+VbcbvuXmsQr1Z8i28SLtqOVpQfdT7MTklm0lA+8PcdFm8EE1tbu3H
 xCqDl5xxYnPgKe/m2JnKRZMV2nyV5YkGpKvNQyYKgSakhqDLEBtnrJz2I3LdbtS4rZXJ
 +aTZQzANqecXbQUTs0BPPHqdaqm/47EFUNQoOXMzK+9DBaWijqhN6mEOQLZzeiEdj6LC
 mkNw==
X-Gm-Message-State: APjAAAVB8oWrVfYzYs/hp6eHrmThnjcPrGwaPkWPx28EFvUETQqu608v
 hq3IzQT+v0Ts4+pPM6lhQyE=
X-Google-Smtp-Source: APXvYqySGMj+xVnFBw6DoIow5YRNbAGRrtbuTNZrHqsVIA/EDf/TslUB/3GW9gmVusPNHl4OaFqc2A==
X-Received: by 2002:a17:902:28:: with SMTP id
 37mr31327361pla.188.1562692615742; 
 Tue, 09 Jul 2019 10:16:55 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
 by smtp.gmail.com with ESMTPSA id b3sm32709107pfp.65.2019.07.09.10.16.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 10:16:55 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 liang.yang@amlogic.com
Subject: [PATCH] mtd: rawnand: meson: Add of_node_put() before return
Date: Tue,  9 Jul 2019 22:46:40 +0530
Message-Id: <20190709171640.13511-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_101659_968439_FE2D7AC1 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index ea57ddcec41e..1b82b687e5a5 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1320,6 +1320,7 @@ static int meson_nfc_nand_chips_init(struct device *dev,
 		ret = meson_nfc_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			meson_nfc_nand_chip_cleanup(nfc);
+			of_node_put(nand_np);
 			return ret;
 		}
 	}
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

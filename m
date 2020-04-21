Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B301EC2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8998021473
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PxoHIzRb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dGTNCcnG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8998021473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrIs+aEmW4FLFaWLSC5vofvqGi7KyV5NqbNS2QH/DT4=; b=PxoHIzRblqZyJe
	H2pia5LqKH5WylEjwwKXrRQHsuC8Ff6ekRTeZ3ecwL1waXkgO/SICam2pReku39Aae3IYM2aie5tR
	YcmK5lz1xjyL3ltENwbF00FOJ+wkbKNybGEfHfp+5fES8RKtwVysrnvM+2FwJxmZ+svNi0kcqRJi4
	66yDvHOynxBuu4y9ibcihl+Ru8XLGZ9Lm6RaqgI2LwHKcszMjuUoQY5dGdn/rdYZkTbPsBpVmG1qZ
	mjhi/E23Ly0uVhsfkFu8fnLZdoGBsqoW1fYhNcuOi8Ll5Wd1+gCNhBdVwiVRxb3ALM5CvOl93Q+nF
	gkV+nvPERPZBZLFlereA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnry-0002zJ-IG; Tue, 21 Apr 2020 08:03:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnqG-0001Cg-RM
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:01:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id i10so15300637wrv.10
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8x2qbrmvJrvzLhSdZyiezkJo4hKvmqVH04B778IZt90=;
 b=dGTNCcnGr7YtPFf7J6XDaRYOU2CiBaCJhYNx09RmlAPeojd7c14ojBOwblaGyqje5J
 WlHC8CdEZ5ZGd2aGNslxywnwSLnzXx66X945Y1gGFesYLDy7pTBXaZVH2xHQ2llnHRJE
 vDYT9lWrKI+Xl6GV5za29OV/+p9Lnm7qhD7moZpHDPwhUYzF301asuOKHkFSC0FrJ5eb
 8Coh7+dbLi4ywxt7d0Wxl/e2rvqbPOGO+/6LRv7cJrOZkSqXFinuBl0ytSHkNtPqWvOM
 sTPL5jKQ/j4QtCgLNgZYIl92+Xf5k0fU8Bdgrv98mdvjRzX4hbDwRD5PWihG8IOAlhAA
 UdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8x2qbrmvJrvzLhSdZyiezkJo4hKvmqVH04B778IZt90=;
 b=ZZU4r94qYOvFzqomoEU4McsXwIuq6FE8hxRMy3AzbZ1jw53+KDDs/DVHk5ArR3TP/4
 jYhlZekPQ0dxuoUwODHM54H9O4EvQjKiF4tn97rPA4aSZLVZlwkv4IGQyr+jT6g186tQ
 rri8jhbsL75QED4PeV6f3UR3BG33UcipwbqmvsOdXCf4dMrGbZEBPsEct3lBNmNELRBl
 vqWMum93BnFqvea1dw6SUAbzHWrBqdFVKD552aa5BPXxtcOVUFBXzuShHKauDaNYJpL+
 pFByS5TpcKv+h8+mdQrRw2fWCgkInK5i3okA8leE0fF2bzjbi16cqnuJZhnf+/P4V2Eh
 kK/A==
X-Gm-Message-State: AGi0PuaFBxPg/4imvxPepux5jNnS1Asu7PSlQuCwKLUCks2BRamGXaDt
 EgtUUBjy2SLujf1ocZukJm9tHQ==
X-Google-Smtp-Source: APiQypIiWqXPmC/5mQtYcIdPcfFDsrYy87KwONuuyBh3FM0Eo21Qb7uC8L4gifzvCSJ9ml9PyD7LFQ==
X-Received: by 2002:a5d:4381:: with SMTP id i1mr22202504wrq.194.1587456074451; 
 Tue, 21 Apr 2020 01:01:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 x132sm2561552wmg.33.2020.04.21.01.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:01:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org, jdelvare@suse.com, linux@roeck-us.net,
 srinivas.kandagatla@linaro.org
Subject: [RFC 5/8] MAINTAINERS: add myself as maintainer for Khadas MCU drivers
Date: Tue, 21 Apr 2020 10:00:59 +0200
Message-Id: <20200421080102.22796-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_010116_995284_D69A4FC6 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: linux-hwmon@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the HWMON and NVMEM drivers along the MFD drivers and header
as Maintained by myself.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b816a453b10e..4484fa568d42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9431,6 +9431,17 @@ F:	include/linux/kdb.h
 F:	include/linux/kgdb.h
 F:	kernel/debug/
 
+KHADAS MCU MFD DRIVER
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+F:	drivers/mfd/khadas-mcu.c
+F:	include/linux/mfd/khadas-mcu.h
+F:	drivers/hwmon/khadas-mcu-fan.c
+F:	drivers/nvmem/khadas-mcu-user-mem.c
+
 KMEMLEAK
 M:	Catalin Marinas <catalin.marinas@arm.com>
 S:	Maintained
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

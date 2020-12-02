Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00334C64E7B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:45:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BBC2086A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BBC2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DIfgz2hMjPSrJTPcnzhCievO2SmeRM4alF+5uP6nkfc=; b=vbaKdetooDlR8aXJ+dtMqT0xz
	DGeUkEWG5kKM4wb2/IDiSPK1hXzXfH6MCB6UgvhA64jdDBh/K1EyqKab38hraFTIDNOLelNRzWgq+
	ST67N4Zp8VWJIlhD/aO9nx7gDFimYXegvbjiMdWJvxxz6wrSnmPvxqT3Wa6KdrxYC0qPm9gjBJq4S
	jmr7Ygulg9LKTwvz6BtxUl6K6wp3pBppYIalIoDIVbjbhLS6prPHVwDyfPNtoM0hjhpuLuiu5hv7X
	toUtHJ5R78AzevZxfMEB67520aLSJHZItsS9dEeoGnt+IV12wRY7POUgcwqL2VNeRL2Od3KkTvjy8
	xq3ExdaQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkWBq-0007MS-Bi; Wed, 02 Dec 2020 17:45:18 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWB4-0006zg-C4
 for linux-amlogic@lists.infradead.org; Wed, 02 Dec 2020 17:44:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id t4so4900958wrr.12
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Dec 2020 09:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gxPSG1/jKCExtEHHvCtcVieFeCsXRCYyFJFBc+BdEMg=;
 b=EAkad4/IyQDVuOEVtUWGNRb6tU7jCcx2PbwpCDuo2+jDE33qVg9wNhjmDnuheQ0Iwr
 ox851w381UOR9wh4QY6QKkC+I9XVkclZmkbL2q28pRlb13UwdGyPn3dZY61xJpW0Aa0+
 fDhcVd2kOqMjrCljRjACBFftcWM11u0J3v+LuR5d1oZ0NDYob7bHkhDdh4vuTLKZbDHq
 urNSKWFVVV1SSVbbDSWA306Q/5oQ2XI2M4hk3Eh71r0h2C2oYBkHoB9ljcGoei27iUml
 e6Jsra9d8wbHrcSe0T4S36C4aYdFpWQ4fttgw2neHD3wzyyP5kdRwJ8tTcCR+t35U5QC
 HQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxPSG1/jKCExtEHHvCtcVieFeCsXRCYyFJFBc+BdEMg=;
 b=Tl4CunNB2wPXTAZEjUxOi03m/3RPleQpROaiNbKUhDgbimUEjVgDLhzoXZn+WSQ/WL
 TypHMi0kp4ly2h1o6A9Sz8BNPIOejKZAT/YPjzLIlET2tSNDj1ZczqvlKJpMsjngZEs8
 ggLozThFqjUmoNtVT3UFHJbqDyQjrdp2QiFIayBVjeDEDzXfKHM4WLQstUiX3KB15D63
 2hHoG8qJZpb8WtAOJ73KQMSpx6j9k3ZJOJsNerl2qa9J86VjIU+ldMsW4wlUR5zMxh+N
 SlxKFL8oTJlMTS+GotekykGegwPK7ll97mdaey091pLjxAOtExciDuNIZKphiPoMOIAn
 iDAg==
X-Gm-Message-State: AOAM531hgqRU07923UtrFjs92cBdTAB8Ons5Bd83MFV0m2AYaUPK3BXY
 HxzBxrAxPtXS/6ntH++BfYEBeg==
X-Google-Smtp-Source: ABdhPJyP6rFAQ8WXLvl4FjskdfY6uLmqQw/N7YlH5pLf+59FEarNuMiJryaEGmn/GzrmuGwyehgVhg==
X-Received: by 2002:a5d:6046:: with SMTP id j6mr4721952wrt.317.1606931068691; 
 Wed, 02 Dec 2020 09:44:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
 by smtp.gmail.com with ESMTPSA id q12sm2842915wrx.86.2020.12.02.09.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 09:44:27 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl
Subject: [PATCH v4 3/4] MAINTAINERS: Add myself as maintainer of the Amlogic
 GE2D driver
Date: Wed,  2 Dec 2020 18:44:16 +0100
Message-Id: <20201202174417.3778306-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202174417.3778306-1-narmstrong@baylibre.com>
References: <20201202174417.3778306-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_124430_555992_DCB1757A 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 02437abc94c9..29b5ac0e7a74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11381,6 +11381,15 @@ F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
+MESON GE2D DRIVER FOR AMLOGIC SOCS
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-media@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+F:	drivers/media/meson/ge2d/
+
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

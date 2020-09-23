Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AC1C4727E
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 16:09:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E48F206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 16:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IP4qWX06";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q+a+88KM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E48F206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o7gsZgJHj6wA16Oe7AlV0nyv35MW/Ora1FXoLYaZFzc=; b=IP4qWX06wIOJhupWnawsTp9af/
	LXUTQm0QzDdHNKEUJWyxPiP9/hUcrIR2UG/Y+RBSJHIycHn27QezWhvkII+I7d+QJhg2x8VuxEAP9
	akDmB2/93u99lJFIW5ikSYafxq1m0MdXuzHmbRGDfgX+rMZOKe26WhoUv9PUGiMU3N/powAWtbSlP
	g5upLhyloYfJCv6jaRFmJ3ggm5QZPg4Lv6OukV38AfqOZZw5wqjqTDdVmMkFUI+qcn8MqwhC8Qtb4
	TXBQ1FAxS4qt/PQr3OON9ctB6eoq5/Uy5DLIUnICMAQMtFxABU0muezOAdLa7yvZsE0vcGWTOetuU
	FIa2Z8LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL7Ke-0001z5-1f; Wed, 23 Sep 2020 16:09:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL7KY-0001xU-Ds
 for linux-amlogic@lists.infradead.org; Wed, 23 Sep 2020 16:09:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id k15so603873wrn.10
 for <linux-amlogic@lists.infradead.org>; Wed, 23 Sep 2020 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3P/ZxpNJo4PSk7Ep/fF4Gu3Oz1IinM7von/Sj/dKjYs=;
 b=Q+a+88KMJKfYyJmtJGcC9p67yACHUBTsddpjNbsAYg17ZlcFjmZBgsM1kpms9i98B4
 gX6157evJeTYbkQkd+iptaTFKMlByOsDAQlbXJDzGYIP2Y27QcHK6Calx+erxYT3IK0i
 +y/lRvHxs7Krm6szOxn+4/eMtbKpIHNcH8ba+TJs7xAnzqjtnUgKoRm7r0mQStyUX+vc
 DI0tVnSCzUtlu6Dd24+QThRIX5OtVImQ/FlUfkwcuVbWkdFhCLPlj1i7WsdhKA8umn/X
 AZnjE2qh6yjrAGrGdOlESpYn8E857i/1oudG8pz/KUPcKPsakRlyAmOzaU8HfDizuoNJ
 FxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3P/ZxpNJo4PSk7Ep/fF4Gu3Oz1IinM7von/Sj/dKjYs=;
 b=SIKaX9GUxel6upgeu8+P0LEM8+U3EyrQYjA264eP9086SSFzWw83Nwz8ogY0C3FOu5
 74ARF4i81kpP2IShSXK5G/gMX5ueLS0iBLpblGeRYMaC93E4GNjJdVXeraHxmdq3Tz3w
 yl5yMhvhECyGhJzu5iXpk7f2ydvP3Oidy8tc8WOBG/cjzodL6IBQKk381J4LN6gDIDHQ
 hWEb17jnx2ODrpax8pIWTyJewi3uKMhQs615/coi9OiNSZjzH3V4XWhItp4EwIRLPNxq
 /q3yVW3bbcfaWvt953p5ycMzq239O7ILJgpbsCZE5Qnh+XyCLw6QpUDhsU4cZJgIPhaU
 s2BA==
X-Gm-Message-State: AOAM5301x6JqCGrz1vlDNM6BHpbksmCnYyrZEhLoVFL8TgR7QWD06LRK
 zJ15vZzpqLVZv9BB4TQHDQtRzh29tMIcb1Sw
X-Google-Smtp-Source: ABdhPJxJa9JbXjuoS6k/d1Yja3vveIuq2rji2Ep/SXUrtBlo3aF/ie479LMXzqBqWUPuJ/CEn96+RQ==
X-Received: by 2002:adf:f14f:: with SMTP id y15mr378893wro.69.1600877356110;
 Wed, 23 Sep 2020 09:09:16 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:28ac:1772:9398:891a])
 by smtp.gmail.com with ESMTPSA id c79sm249769wmd.41.2020.09.23.09.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 09:09:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic
 VDEC
Date: Wed, 23 Sep 2020 18:09:10 +0200
Message-Id: <20200923160910.31968-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_120918_648612_A6832F9D 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Maxime is no more a BayLibre employee, and his e-mail address is now invalid.

I'll be happy to add him back using another e-mail address if he wants to continue
maintaining this driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3126fc2cca2..7364ac24ad6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11320,7 +11320,6 @@ F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 F:	drivers/mtd/nand/raw/meson_*
 
 MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
-M:	Maxime Jourdan <mjourdan@baylibre.com>
 M:	Neil Armstrong <narmstrong@baylibre.com>
 L:	linux-media@vger.kernel.org
 L:	linux-amlogic@lists.infradead.org
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

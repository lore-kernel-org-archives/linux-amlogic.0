Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C8C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BBF920854
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lL+ZGQB/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey2hqfA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BBF920854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FvyUCsEBWmQXNWL7gNZytGBwOrX0Lpb/hdgdzBX7XfQ=; b=lL+ZGQB/Uv7U37
	Lv6ZV1h0gRjGkrtOVjQU0Hk8Jtv4dI6bg2KnoahptLbFyN5X4pEmo21LGGY+PA3+jFWVCDoOQADXa
	1hky5qROKZl9ESxFk2Tq6FkhHNcuapLy16V0iIgcg2NaDr43DM9BP7yyvNkxbvc1AZovIcnGCRdeN
	FipqRYclbqtEP6Jt8AFLVES3nQ2A6zBaM3QfpuzXbJSUiklKCfBmzolNuuxacJFx8y361YHbuW+r/
	4wm5c36gi+D5Jbpe66igzA5K778K67fY1PBTYWH1l4DGsSOwAFiPJ+FrfwLtZABZZq6GssW4XDM16
	cYVehbv8+htKV3o+/FJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6DQT-0001Vp-4e; Fri, 06 Sep 2019 12:33:17 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6DQL-0001ON-1g; Fri, 06 Sep 2019 12:33:10 +0000
Received: by mail-pf1-x442.google.com with SMTP id q10so4396307pfl.0;
 Fri, 06 Sep 2019 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz8E2Km3qb90hXAs0IYE6gU7l6QgyfYQZCSLqivyf6E=;
 b=Ey2hqfA7IQvWIjwaZRXLK1MJoLAYZ3w+rNkhCSb2zOJvC3mTkVwW4A3QD/q7u9b5Ru
 84ARDBD6Hxgad++SUaJVDTD20qNcP3oTvxITLv8nkFhFFP562ePZK8saL8OE/oHb10jj
 R32kFFJSqkH2XltA6GO5F1ZEdhkERcUULQytBhvCx/v/iPAmL0qxt9szZqHHL02NhrxH
 uBj1NDFBL2ZljD9+V9/98u7l7lNX5aHrqko49U5yXC80L9KOHHde2J07RPH91rEwmshU
 zKHMvFFtYRNeWaydN/C3775jUprLyNNwkOtEjrp/x02h2+YjbyRQJek7qsulMR8724Vc
 uvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz8E2Km3qb90hXAs0IYE6gU7l6QgyfYQZCSLqivyf6E=;
 b=aAh6iyQkHNjsssE2r8/gO46Ly3vuBu/GKEMBipFEFkzCWY4DX2m9UUn9r1d4hTW7Iv
 yxkTItq6E5rpjDbK9mzumEDTjbIQk0iMKKCbKjY9OZ7IIbrky2hHTx7856HyZTdadXt3
 f7ymewlU448M0hvr85ulgeRCd2oUoUnOoBAd+jHX3jmbZMsIR45UeIG9QEPtRnxWYWUi
 adw/GZ/1HJV1Zc+Mb/kZOSa5fyyylFtwaNBTKmcPrI238PSybcbFZhkldAwMJQjpw/wk
 PkCSLZRdnytd5alEpYjSIW5HKaaV49LEsUHNMoAJEMMXWetQNZ2oFMgwtgS0a381yZdG
 n0Sw==
X-Gm-Message-State: APjAAAUs/0C6mXJBYV/cLhSiDpXGZvYrsdpsiqM65eFjpo3WgnY404Yv
 SUPgJ6wAGIkLkOhgl5qfQR4=
X-Google-Smtp-Source: APXvYqyyFCOHTFvEoDeCLFQhX/mZ4AJ7iNpCfpGLKwFKukF531c5Ct9E3LFVHRm7nIXjQiD0S/lk7Q==
X-Received: by 2002:aa7:8592:: with SMTP id w18mr10425002pfn.237.1567773188389; 
 Fri, 06 Sep 2019 05:33:08 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id h70sm4752933pgc.36.2019.09.06.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:33:07 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3-next 0/3] Odroid c2 missing regulator linking
Date: Fri,  6 Sep 2019 12:32:56 +0000
Message-Id: <20190906123259.351-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_053309_116788_019C19A8 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Below small changes help re-configure or fix missing inter linking
of regulator node.

Re-based on linux-next-20190904
Changes from previous patch's series.
Build using Cross Compiler.

Added missing Reviewed-by Neil's and Martin.
Added few suggestion from martin for rename of node.

Dependencies:
Changes based top on my previous usb fix series patch's.

[0] https://patchwork.kernel.org/patch/11113095/
[1] https://patchwork.kernel.org/patch/11113099/
[3] https://patchwork.kernel.org/patch/11113103/

Hope this series get picked up for 5.4-rc1, finger crossed.

Changes for previous changes.
Fix some typo.
Updated few patches as per Martin's suggestion.

I will try to commit less mistake in the future.

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
    regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to
    VDDIO_AO3V3 regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
    supply

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

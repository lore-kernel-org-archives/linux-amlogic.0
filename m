Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C77C4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0E9208B6
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:18:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zGEkVnh8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TuI+K5EV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F0E9208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WK+HwbFe88ZfPLIMYEQFay9kkJEGVWLu9sC2ISEkD5s=; b=zGEkVnh8ky4jORzDdHUJyKrNd4
	jgkmT/i9d9pRXuAHqkl5XUlMIxRo5izUr9gOzd9WTKYxrRPxNGtlu5zrRdZHavP05NqPSo1qq14cM
	zYPOQUPt50e5n136kIDNysiTACX83cuBlY9rdYEXJYQ//zJPy/7vFufYt7UfonYssT6QzLKrsRnp9
	sXIttdjzUcHqtEIiz1VqH0/I9nkoZJ/xDlFsXIAEAC+TfSx+bNPOA1WoRYM+2HDpMj1QWGq78Zrd6
	gDm1UnudPrlJYHcryaOZhQoPtN+np7G41nr7Mq0Cq4binw3JMrLxZLLzud6DJ8h2IZtNlpCXE3DsB
	yXKqLOWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLv6S-0002ui-Jl; Fri, 25 Sep 2020 21:18:04 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLv6P-0002tx-W9; Fri, 25 Sep 2020 21:18:02 +0000
Received: by mail-ej1-x642.google.com with SMTP id o8so502467ejb.10;
 Fri, 25 Sep 2020 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PAQL73JxnyO64OF/vV552MTwfHMx4yBDlPAMR5RmT4=;
 b=TuI+K5EVjlYAKZzjy64Udjow3kM9Y76TpG769gzwOWYXYEnYdWeuo9J56l8DASw367
 ZqOY4MsYSqzrUnwb3W72LXTY/eRde/WezRymRajG/sidYLVnmN3NLOtE98JTv9HafGDa
 Ivzw3daQW/9OQURpJFVm4E70ln87m6BjB2lIjzlZeBgp3Ph2ER22CmYknxBV6zi8r6wI
 t3t/DF7E/VsmKBxPL2J6FLbpGsMMqNf7NMK+Wxv/ahVB2a1SDQBPhaJMXQma+6t1K/l+
 n6aJ8ADAnXKtGmuL8QhWMobfOjk7DqhJQnJ1+K6XxMR7v+gYxfGWENjZD2pD2BkV7TgE
 lBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PAQL73JxnyO64OF/vV552MTwfHMx4yBDlPAMR5RmT4=;
 b=P0Pt+UteaIMiC14C6FqmrmzSQK4ky0fqPF0W++coacQ948/QnZLcrx4XWXaMSQWZTE
 SxcOpNUmHuu+bSZrFoQgWo5NTpYP90V1HoMWGAnjA7XUNf5U/ODZqlFD/zffNiM5INWH
 2Y6e2lQymsxwzcaxE0k5kwwUe0uJmiy5C8H9ckUCPmvjrqUMdL83UlEBcJRmDTjSVP8c
 uB2yYk+wTKYG1FGY29ioMcazj8YcjI2it6d/0hS/b6NnTebNhe5Z77//quNLqqhF7VM2
 +bXdGnR8xpaK8SEVZ+uTIVKRlQqtvi15lf0NpxeJ3mjsit9Q272xamboZFXRc1Ane53A
 jcGA==
X-Gm-Message-State: AOAM533IW3ggX6he2MoXtz23sWxTsrZMRS3hWB6K0vCgNeT72KHkDLAH
 K0d7tKDaSvY5nkdj4aKoxLtHfOzi8VI=
X-Google-Smtp-Source: ABdhPJx/Sl4V+qETIIIaZG/LmfKXs+Oe/amH7m1chwyu5aoMo+BXwwx8BulxQJyrKwM8Y7lEAd9RYg==
X-Received: by 2002:a17:906:d11a:: with SMTP id
 b26mr4568914ejz.191.1601068678647; 
 Fri, 25 Sep 2020 14:17:58 -0700 (PDT)
Received: from localhost.localdomain (p4fd5dca7.dip0.t-ipconnect.de.
 [79.213.220.167])
 by smtp.googlemail.com with ESMTPSA id c8sm2710057ejp.30.2020.09.25.14.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:17:58 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH] arm64: dts: amlogic: meson-g12: use the G12A specific dwmac
 compatible
Date: Fri, 25 Sep 2020 23:17:43 +0200
Message-Id: <20200925211743.537496-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_171802_034289_7A781601 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

We have a dedicated "amlogic,meson-g12a-dwmac" compatible string for the
Ethernet controller since commit 3efdb92426bf4 ("dt-bindings: net:
dwmac-meson: Add a compatible string for G12A onwards").
Using the AXG compatible string worked fine so far because the
dwmac-meson8b driver doesn't handle the newly introduced register bits
for G12A. However, once that changes the driver must be probed with the
correct compatible string to manage these new register bits.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..d4e7cd68170a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -209,7 +209,7 @@ map {
 		};
 
 		ethmac: ethernet@ff3f0000 {
-			compatible = "amlogic,meson-axg-dwmac",
+			compatible = "amlogic,meson-g12a-dwmac",
 				     "snps,dwmac-3.70a",
 				     "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000>,
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

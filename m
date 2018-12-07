Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBF2C64EB1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:53:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFBA20892
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:53:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jg5jXji0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I9UynWzG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFBA20892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tyTRoowC0D+RZ8Dp6ahi2QYZmS2uWenpqDEdl552cUw=; b=jg5jXji0dzlFG/
	Zmto0X8Sxj8yS+nC3JPU1fLitdE/jTkKPD/YftHbdIRqeVXWZpfuVG4xHY3debHcbYB+1Qw6O3H3h
	vDqYRTUi57Rv8LV9kKMQQ3yvvRnphVC2rwWZpincZ386u/ZiVEAriL5xaFqP3dK7dv4Fq8SZDFh/e
	ulK70qlaV1XPJI22EXLJTdoKcf8Ata78R2z3JGK+EyMs7G/aSxPtWHyRabWE7bi8holT61HZAxsyW
	wfNTnDg8mnQGf8fSpjLJsPjfD2lkdrv6rsUA6moKgGaCewTFQKTkLK1tlt+toC+kb+bLKidhOkxln
	zHTVPPveMIjc7LOFenbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVDks-0007PS-Jc; Fri, 07 Dec 2018 10:53:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDkV-0006xy-Pc
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 10:52:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id u3so3377993wrs.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YzzlPukRIDBbl29H3I+Hn78F1pKuWKnK/2eIhv+3xQU=;
 b=I9UynWzGo0X9gLuTXk5aZDDM1EgzGFm5Va38AHSZSL9vxnk7jE/9s+UoyW3Q5vb4+l
 Wc1aNzvzGEBTQvDQ0qUmcymTNboZpZxHy7cJRDPoNFJe1vyw8PdHWmO6z+YLj5AjZ+Fw
 MhK4bwlt84/kRlzvm0mLjJADrHKYyRkRd5ra83H4rP9qRtMi0XYftp8OUWlPxPvYMePU
 1kTruYzAD4dzXhUYbwef0D2KBeHLyS2td5yJO97h1YqT/R7965FEXAbEjvtbFmA1tYXs
 jXK90qRdZWM2mwvES+qq4PrhxasT73Nxwh3JtdpaL1RKkP1N4WCB17gFP5Z1dzg146Xo
 IRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YzzlPukRIDBbl29H3I+Hn78F1pKuWKnK/2eIhv+3xQU=;
 b=lBuuQXnqweiEShhgU0HSe0bjty/sK49IKslEAIvIUC6IoCcJus4tjyOhtPpHSpDRWf
 XL0KDmGNY+uXTp9SKaqBLlmJCH5kGdOOK8vv6Bt08VMzCZbTHQ9O4hFeSRsi0qC1QTDI
 MiNfohDyQPxUUT54aDtmjn0676/9HTXLiRq+zpAdaIoxqQAyNBZ8tbdgSXUdkTbZ+dx+
 FRMkbAtEabMh5eUk5Gz2kWtwjwwRS0f51n9wdDQy300yM2OlKefM+/X30VxciuUogH/E
 k7+iBCfxtgSVpumGyKIYrdyt5MGwNahbYUo+a0KKGvydM5gNMnJoyPs9LNF7Hinxm4N/
 Xqrg==
X-Gm-Message-State: AA+aEWZUvg5RJrS3tTfCcEe9XTYObx/uOyokgATklWU695vLhLF//0TP
 7CPBq2PKvJ6CXh1d5tMgmT7MGw==
X-Google-Smtp-Source: AFSGD/XVz6XtnkP2jeUtJOZX62IegNJGiDb3RbXR6x29UzF6xx0F7jQPQdYB4Gg3xjUrp5TIy1wdoQ==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr1485462wrx.149.1544179955674; 
 Fri, 07 Dec 2018 02:52:35 -0800 (PST)
Received: from xps.home ([2a00:23c4:f7a1:ce00:800d:14be:d1d:88c5])
 by smtp.gmail.com with ESMTPSA id v187sm1234684wme.0.2018.12.07.02.52.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 02:52:34 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com,
 ingrassia@epigenesys.com
Subject: [PATCH v2 0/2] meson: Fix IRQ trigger type
Date: Fri,  7 Dec 2018 10:52:29 +0000
Message-Id: <20181207105231.25593-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_025247_875749_8FEE3CE2 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The wrong IRQ trigger type for the macirq was causing the connection
speed to drop after a few hours when stress testing the DUT. The fix
seems also to fix another long standing issue with EEE.

The fixes are tested on a AXG board but we think that the same fix is
valid also for all the others Amlogic SoC families.

Changelog:

V2:
 - Merge arm64 patches in one single patch
 - Merge arm patches in a different patch
 - Added T/R/A to the arm64 patch

Carlo Caione (2):
  arm64: dts: meson: Fix IRQ trigger type for macirq
  arm: dts: meson: Fix IRQ trigger type for macirq

 arch/arm/boot/dts/meson.dtsi                        | 2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 7 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE7FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E85960F43
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E85960F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nz3+if8pPnMcTMBH247h7Kk27JiBHu+im7XhBnk6VRQ=; b=0zoIR3YYjjM5Zv
	RDjC5AODTl457G9r7vQG/FrGd+o6wHzZbCyrMHE/TVN8q2XhUjWwLdfJzlbI0kwJk6U22lCG+jwHG
	OHxyU8pXnCetxkXlmnlaWUxTYeKDa8IC/JGRuw58v1nJDl10otLd670X6etdyl4ChxTb06GzPEGni
	cOt2pxgrDNwBb5kpnoCYUTJCU/t9zqHt6u2vsTDyt7lg7v4nq+vmed4hIXScFjZRCKJGyT2uVeePC
	Irpbc4GRj4mnAgiz3nAgf5ChPKfWamp2px8syoOwGUyBIQUhKMstMZZ58SUs+sBlA70LZXAWPJhiy
	gcZZSQTIYjzuhi/OH4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSQCs-0034QJ-Fb; Mon, 20 Sep 2021 20:48:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSQCg-0034PB-Tq; Mon, 20 Sep 2021 20:47:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id w11so2350564plz.13;
 Mon, 20 Sep 2021 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=negJEmlBwychqQvUaf9DSXZmOiuLhN4g0dv45lSP0LQ=;
 b=L3TNF6EN7cHguOBzCM0Arz5/bPR7CEAfuw4xkWoHYts2enJhLBfEBEDkFF6l5aGrEo
 tX9Ks9e+ivtQjfJzm3LHaVWI85AI0UNW8/c3BF8+yhmLCz21mt2+EQgMJUtdcdcekk04
 kfT53llaWsbMcSClBYIVhVVUQ3YWIzjhZVrhmwFmp+o6lU/ecOhSy6wegKdAgsVG6wEl
 eSiTmtEZ9pEhulNUhBvo4YZQi0lm0eJEL8QKIwJr8CXkJ2t+4qAjbq2Jabdhb0V9nJQ7
 OiYBYythj59uoJ4MBLGbToI3NULR6fQLUFade1YEPIgHFjD/eBnJNPs10d5kRCeWMT41
 ncfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=negJEmlBwychqQvUaf9DSXZmOiuLhN4g0dv45lSP0LQ=;
 b=njxdqXfHk8R/iQLzXkxWmw9MbrWClvCfDQY4f4HYMgLxSwGIlE9iJZX/uScZ6FM6zq
 Cec2XkEBdx3Yp1y98j2SVTRqLx7TQru2QPdWVqyU9uCBKmJ3czK/9w3lPe/LuoTjcrqt
 E7Xebr9hAmDhxj7N5d/C7VgRywq2tELD88pkPJ+aUzBLfGb28n86+mCv89wFz5r165/I
 +Bam+ICZf+FufYvFUk4Vqe3x7pijGruKH/Cg2R6sxe443d2yLxfXoRVFNDzhT4kh/xf4
 OVCxvZoNmUlhZeCJOp3R98jlaSQDRAG6HYiGwjEDRRNPI/L4s1DiJ7MD1bVvY9VnDnsB
 FTBQ==
X-Gm-Message-State: AOAM533t+Z7/fLvExUT6fEicTkpwWSfnmxqdWR5RlfM+rgI6YMFBDvUT
 xwvYfeU+hDtccMUHJ70fz95AG9Z4AFEFGQ==
X-Google-Smtp-Source: ABdhPJzM7a6CEuViVnduDd3u0m+ZsprmeQW+c4ZNJ6T0udLTS8gWdvP73PxgnLhxbPjlGU30vi6qLw==
X-Received: by 2002:a17:90b:605:: with SMTP id
 gb5mr1031850pjb.51.1632170873344; 
 Mon, 20 Sep 2021 13:47:53 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id u10sm15250263pfn.147.2021.09.20.13.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 13:47:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
Subject: [Patchv2] arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio
Date: Mon, 20 Sep 2021 20:47:37 +0000
Message-Id: <20210920204739.950-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_134755_012686_6B382360 
X-CRM114-Status: GOOD (  10.73  )
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

As described in the Odroid-n2 & Odroid-n2-plus schematics,
the 5V regulator is controlled by GPIOH_8 and in Open Drain
since this GPIO doesn't support Push-Pull.

Fixes: c35f6dc5c377 ("arm64: dts: meson: Add minimal support for Odroid-N2")
Fixes: ef599f5f3e10 ("arm64: dts: meson: convert ODROID-N2 to dtsi")

Cc: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V1- Added missing Fix tags and update the Neil's Ack
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 344573e157a7..26943c53dfa7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -99,6 +99,8 @@ vcc_5v: regulator-vcc_5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		vin-supply = <&main_12v>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
 	};
 
 	vcc_1v8: regulator-vcc_1v8 {
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEBBCA5FCC
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:
	Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zjQBgBUtVIl+ZZJBibEZ5yxW7paYr/x6LRAMMFAn1IE=; b=MWBUto1inkeuOQ
	WnTQE9p2+WJ1TIhJ505zy5UWYw1FylCz2jcbjOyn2Lc4Rcn8zpVaFioItMXjMR+Ums95FlL0YhShW
	TL/o6b+bJO595VAdUgQQw/iEcUkxDW3jm88blSAiGehwpbYiMS/CseYhXQekiAScxrFQl/MkMlvws
	Z1iFLI/vutAfuTJSDpUCcTMa1eik7LsAgKoevJxetRs/fUwVdx6mkjOYFNW8zD/sxyuuGp+R1oH7m
	zRgUgNp+bZD0OSKXJhcnkbGMk+3yHCV3ZdyCvuyPipEHNKtBf7ljRg+B6QA3Hg5u0OEyejgHjPHZb
	LC7oJ2Zu+252J+9RHl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxXc-00000006kXK-29iQ;
	Wed, 30 Sep 2026 16:52:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxXY-00000006kWY-25ZQ;
	Wed, 30 Sep 2026 16:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9633460258;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DE0BC2BCB9;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790787139;
	bh=FkTS1J850r7Vj79AJGPS5AoW9XnMem2eGQVjUeS1sP0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lckSvKwt9uj2sA4OcHoQgoHsE0dffyzGcWOAzHJiVv59EeBnnec0g11ALlfc9bxor
	 LVaIdi7DdeORzdo/WOfCosWO4YMMT0QIzV1/PBaB97npNcetJA8/RzMUIMHu9pVfa4
	 RbN1ETezqlQXdOxL9VowXGRSJgWTqxQMcPbWup7TbjERXTuFa0qL5mYCCpA3qNPwCn
	 R5zeSicjup/NtJlidOMxT+wW79Nmo2jLdaTmtKEnfXF/vRMhiADp+A1MhXhn4Np0aH
	 n3PrKWsR2F8/fwLqjlo3JTXI/WkTDxG12ZLr5/PKmslrUqcEkxq+bd2WqS6VU0dPuS
	 l4E01elod9Rxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A483CA5FC5;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix the SPI
 NOR
Date: Wed, 30 Sep 2026 16:52:13 +0000
Message-Id: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD0+vWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3YxkE93igkzdvPwi3UQLA0NTo1Rjg9REQyWgjoKi1LTMCrBp0bG
 1tQBEQpybXQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=FkTS1J850r7Vj79AJGPS5AoW9XnMem2eGQVjUeS1sP0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl77Ry+ae2L8vxTvSl2tdjba93Cf4SeTfPdmyhyauPpT
 a01a7vmdpSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJpP9n+CtQL/L8hb3782ns
 JguX1ZY/FWj5UX7k4/PN2fzcutNfB1oy/BX5NsVdR+DUgfvdxj/qn75j3sLie8H6e0ZN4sHcqpW
 bNbkB
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
probe after a boot from SD past the SPI. Patch 2 lowers the clock to
40 MHz, where reads stop returning corrupted data.

U-Boot takes this device tree from dts/upstream and gets the fixes with
the next sync.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Igor Velkov (2):
      arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz

 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)
---
base-commit: 065957517880dc7053e0723cc9532b6e78c8855c
change-id: 20260930-hc4-spi-nor-a80152e30ea1

Best regards,
-- 
Igor Velkov <iav@iav.lv>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

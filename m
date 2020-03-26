Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29A8C43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A532073E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B7gkJdo6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ItYxyQOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A532073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ui2h/LdpazbxLgSoQCn4MqzmqIrUUatjNRL8O0LyRZY=; b=B7gkJdo62xZm86
	onBJ/dfndxq46mFK39LnlJrwcjyfN3MPrrd4faX0oDji9//7pVMgGL6RJZ84ywxR8tsBnK+zywUoX
	lNOIiHw8TYHJT0IlOoemmsAh1M8dIjKS+mO/tusAcon7kFpHDxSRY9OeShbbHzXmWi/W0rZyow6Ot
	oJFYqHlxc28cUyiKjEYvpR7M2fJw2dKc8xSkMRV2F97dzaJryZqSAsHZImm9d7z6dztU56n2tl+n1
	7JK9aBwcuJcEvtddT9ehRWCvYiJH6+pfiJDigGT56JwnrVTDHaJNbagy51rAWXDsCqGZzK4WRihSE
	OYrxGuO65s74LTIUyjAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVtP-0006i2-EK; Thu, 26 Mar 2020 17:02:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVrS-0004Q3-9w
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 17:00:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 26so7901477wmk.1
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IPcQG3YcrnLLher/nefYLUs5pU6e5WyIQ5KkZW8zJhU=;
 b=ItYxyQOPWpfIwx5id98fE1SRSt1cmLdSSkB5lgTxde8+2UMNwtZm5//pKOziYaxWnz
 5+2cxSZCfOm/Co62Re/eJIdbYw4UfCISJQ2pMi7V7cRGerae+khQtC1Bo3N9/hZHeZp/
 N1YngF5NBPAEdGTHZqox/NF2I/0dggkG4WZryMZfzh4I5ajCh2CCnnIu6z+/AobO9p/G
 44CoqqYhll10X9SV/1enmd+rZawXZj5Mdu3oqD6lHfInBkUUA2kSWF7CpX4lEamLaNsR
 8IX3ET6Q1k7H6h0n7Oajtskuu64CrCp4+N5DCG78KzSUb3AHa0uJ7xIE/ngHqzhsoaaG
 q//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IPcQG3YcrnLLher/nefYLUs5pU6e5WyIQ5KkZW8zJhU=;
 b=UmX1pD0GfY5aP6PCfOHMX2TAs6Arf7DCIXjZq7EvqnDJWsaBRjePdY1miSNL548dP5
 M7EaGqOsDJK/qP18L6BPLODUdLTpC3ePtUX8I+CsTAhPv1hyzIysI/yW5M8FVm9BGVPT
 6zFHvd+kQRbF+P9KhFv73zdDQ9HTEYzT3mytWMQkwQdmPFLrvDcWCFGw9w8utTtf8HOK
 vcyV9QPs2Pw351S71BIpAxzGuLGAJqDqi0Wfaydda/hJ4T1jNqg3w4y3J4r9ymzB3mEV
 zMprHphLGSAEsBS63Oa9nPI2wWYfzA1eGN5wNAd9l6m1D7fVtaYWXr09A2qodfTHxjFY
 XMYQ==
X-Gm-Message-State: ANhLgQ3coMYhcwjh9wpq6qfLSZtZkyVwgdT7l4G+vRJ06Cb+TQR1UnWx
 irVQeduiCLYKf08tUqzYuxrOcA==
X-Google-Smtp-Source: ADFU+vtnT6Qi76wMfnjs4e0l9MJUiPRD/pUzToCuVWV2nVYKoGqgcAcvwfcWiAoDJIJIOj62HUDmQw==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr819774wma.182.1585242003353; 
 Thu, 26 Mar 2020 10:00:03 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:00:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: meson: dtbs_checks fixups
Date: Thu, 26 Mar 2020 17:59:53 +0100
Message-Id: <20200326165958.19274-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_100006_431151_B0F2630D 
X-CRM114-Status: UNSURE (   6.66  )
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

Another round of DT fixups of dtbs_checks on Amlogic DT files.

Neil Armstrong (5):
  dt-bindings: sram: Add Amlogic SCP SRAM compatibles
  arm64: dts: meson: fixup SCP sram nodes
  arm64: dts: meson-g12b-ugoos-am6: fix board compatible
  arm64: dts: meson-gxbb-kii-pro: fix board compatible
  arm64: dts: meson: fix leds subnodes name

 Documentation/devicetree/bindings/sram/sram.yaml       |  2 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi              | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi      |  2 +-
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts  |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts     |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi     |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts       |  2 +-
 16 files changed, 28 insertions(+), 26 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

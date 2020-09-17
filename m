Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C09C433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E676421974
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qwHRW2aC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wifFBUQy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E676421974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BXLb9IfmThfy+LciX/MAZrKIhoPjEUGfSxbk4IP/WHk=; b=qwHRW2aCOQWCvxYAque2I/i/jK
	3TKp5/1Vn2TDWUy/l8c1XCgzeGbuBixqhkBXftoroNXP82vwboo2Kp1ewPusDSr/Xox9k92QZSwN9
	1KyKcVs1yKiUpoHXOpuXvirnjCVBdXMCvGPe0w52Tf6U68nKcBsOJhwdAZYK9nUnOQtC3WSTopXZm
	UjU3DF4Ap76JhAszap5BgkqNAujAFPAa6DPYe4JUPVLbn0Kw5HoGhuB2PRq+eAi3OEu9ScgSZjHhJ
	mZtFdQeb527xGMDsvDIz8OkxLGzFFMXdFSzUR3eElI1ZS06PzaUA1rKb/M98akJPE2FVxaiUY9Tch
	gAzrTNcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInts-0000O0-Oi; Thu, 17 Sep 2020 07:00:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIntf-0000HU-Si
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 07:00:01 +0000
Received: by mail-wr1-x441.google.com with SMTP id j2so783524wrx.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 23:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYO9vI1jssWFcgU0C4Kub0Gl3FwLz/cFiMnc7N/ZW8M=;
 b=wifFBUQy+ttQ5Td1dl7VKNfBfS1AhjM4edEBr+Q8ZvPNeGybfd68skZoMlLwAwzCSX
 B+QDjxln57NaBDmolZ1oCx7SocjTeiAQtD1oB+9nEzpZZd0cOZXeNJZEthygcKm9EuvT
 nrB1dQzYuhUPHy6+TGWhs/vyWQ46B/pXi2M3OUT/7JAnIkmjvp/EIEkZlWJ0sN4ymo/n
 dXYbGHzg2ou8am6oaD6a5FwA3mkN6e0DPLXYtJnF73U2hIkwBPjk8YGSoJDVvRN+kxgo
 El7B8mMDQMuBn7+eD7ogF6WajlCFtRgnXpAzrDj4BenoFMA4FzNFvH5JLpjf6THsji6b
 U+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYO9vI1jssWFcgU0C4Kub0Gl3FwLz/cFiMnc7N/ZW8M=;
 b=RlR/Ar2nFudsgm8T7f4MS7n8eywn8z8OyaeiAmzVQye2qJXMZiAZE88b8EgkDkmlP2
 WkJCb8HiYByRUr2bVHWJAQrumyUQWXTNlGh0+qkhahFwd8Upeio2FczGkhb/Sst74XEW
 h5QNHS06hHyzrpUdcGq+OLbC5+Pg0n5ObrC9ktWMjJSvhqI004fa/i6Xq51zVRcAFYZn
 qLBKcih4CuB15sj1YBG6N5EshNUdx9C91xIofNX1aY0VplciZfwnZFnLapTpoEZsvOch
 YrRUj1jlvCoSw6UqjY7FbOrHvhf7t8FgTTrTe3qQLo5TJIqKI3bqEGgKjbyK/U9JmTJV
 Bkxw==
X-Gm-Message-State: AOAM530w1LGk8n9qOVlK/85Xrys1z5VIE6zu4ygGz0qNqVr4jW/tjske
 QqYaeOkAHBpsrij/IfbSwKat6A==
X-Google-Smtp-Source: ABdhPJz8bKW3OvFfUb/6QzuoM+0dCijwwS3cJjUsFtm6QbvCnlA4iVmILfLpLhYU5ZyBMa9zQTuP9w==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr30942832wrn.228.1600325998448; 
 Wed, 16 Sep 2020 23:59:58 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.16.23.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 23:59:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, kishon@ti.com, balbi@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 0/5] usb: dwc-meson-g12a: Add support for USB on S400 board
Date: Thu, 17 Sep 2020 08:59:44 +0200
Message-Id: <20200917065949.3476-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_025959_989156_10AA9BEC 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

The Glue driver reuses the already implemented GXL & GXM work.

The USB2 PHY driver needs a slight tweak to keep the OTG detection working.

Changes since v1 at [1]:
- s/close from/close to/g
- collected review tags
- added small comment about phy management in patch 3
- removed status = "okay" in patch 4
- removed invalid phy-supply of phy1 in patch 5

[1] http://lore.kernel.org/r/20200909160409.8678-1-narmstrong@baylibre.com

Neil Armstrong (5):
  phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
  dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG
    Families USB Glue Bindings
  usb: dwc-meson-g12a: Add support for USB on AXG SoCs
  arm64: dts: meson-axg: add USB nodes
  arm64: dts: meson-axg-s400: enable USB OTG

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 +++++++-
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  6 +++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 50 +++++++++++++++++++
 drivers/phy/amlogic/phy-meson-gxl-usb2.c      |  3 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 18 +++++++
 5 files changed, 97 insertions(+), 2 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

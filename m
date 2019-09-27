Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B868C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 13:25:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E555206B7
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 13:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fq3RrJKS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pCsQaGlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E555206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igjxl+b5P+QGoD0xVG8wXBRYciaCsSvhiQwkTNvrRvM=; b=fq3RrJKS4dBaxo
	a4SzRRn/rC02EgJVyNX+ZGBtUuau/mC+TXAhQWBZDkLok6D1ZHN258ggjeE3t9w//6SYFYvRn4MJ0
	TBimon72pB49BSprv2DDlKLCjgwFMV+cLmUMwGqF4JIW2Jx8sHPetxSEG/PfOeYWOLAKrYSw/IP2n
	oKFcM4Jp4+CEBLbdq0oQt0cnMhs7Gbg4qdXrWI+Ohrhod+GacMG3iZGP+H+b25Axfy+0sHdz5wbfa
	MQAV6q4dZl0UV7UM7PtAm57ZGmlsW+lk2H6DVfT+eUiipn1/E5oIKeoVROhot/zQfsjikTwQZZtQO
	phKU85+f5WJpESAi6y1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDqFt-0002yC-JJ; Fri, 27 Sep 2019 13:25:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDqFq-0002xc-53
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 13:25:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id r17so8989373wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pJQbJSiGo0/Gtak7pgpmwv4qZhIhDdOSIML4uirfLGE=;
 b=pCsQaGlR6GOXZ+kEVMEAXB2rWc5ezaNdV+uMAzXwmFxuMegKBQJj5NT7hRcZGsijr1
 sSJCYWvT9Ldeh+2AOrf0Xq4ECMdw6wWN9eiclpylfWO/hzhvumChoT1BH0QDajs5mTNZ
 v+qaVWd3X07NbzAsig4z5pzE0yOsKR2MHQrsh8SJWgDwo+BzkPzdvsfuSCDNebHwmQCr
 bgPE1k36IGCWyapa9hAj8Ep//Qb0YwwzOM1FPWSlW1wXQVv3kNZoZmU59sWyzNTnE8+N
 +xl9GxH3BmYkhqsDdN54ha/ELdjuT9o5frzjpwXvriEXzGfjGVm72Ki8mUPpq+pUCQJZ
 k67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pJQbJSiGo0/Gtak7pgpmwv4qZhIhDdOSIML4uirfLGE=;
 b=Y9A685DrmJf4x03+5nqQrl+oWNELW3iO+WO+B/7evQoKXc9G22+03YtPC3JcH7EnMW
 jhiuwnUQhvXMHdKrWtgoQd2VWmtOO48vv2ps1cfNv8owJqJHFC52CkGgLa1TzGURwA8U
 tDa+JbKVSLLbj6l94HwJlJiJc11j/P+pNRLvJpJpJ7e0rocLvcvnfj70RWxC/bmiAQpZ
 B5xmzjFlXzNRYL/oDmlo6ie0PkMdG4n80ntqMOkGGK23sH54WCJ60ZkduPp+Az7ff6Ip
 M0/gVJZB2ytUToYkEV5cRyf3E+JPpvZT1jixAtMWi7larauwjtnXz/gje3eoFcTuzk0x
 sqBQ==
X-Gm-Message-State: APjAAAWbss9RYkPdYxPItpcY7/b1jifwjfl55AhajB1BnxUaQ6FRr2AC
 Rs/CYKTG5SD+EvJRAUKuvv8TwQ==
X-Google-Smtp-Source: APXvYqxr61Y5M/zCDSRj0yQDcJ8oiWofajhI1iwL8eTCwLPxR7262C7vPkeSbNGvUsqaFF402B3Ntg==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr7512188wmc.125.1569590748044; 
 Fri, 27 Sep 2019 06:25:48 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id j1sm5602267wrg.24.2019.09.27.06.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:25:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: elatllat@gmail.com,
	tobetter@gmail.com
Subject: [PATCH] dwc3: add parkmode_disable_ss_quirk for G12A
Date: Fri, 27 Sep 2019 15:25:42 +0200
Message-Id: <20190927132542.1841-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <d6322351-6a84-e123-d84c-c61e1a1b1d1f@baylibre.com>
References: <d6322351-6a84-e123-d84c-c61e1a1b1d1f@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_062550_193184_AFA830C9 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: linux-amlogic@lists.infradead.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Could you validate this fixes the following issue ?
[  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
[  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
[  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[  221.165946] usb 2-1.1-port1: cannot reset (err = -22)

Cc: Tim <elatllat@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
CC: linux-amlogic@lists.infradead.org
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 drivers/usb/dwc3/core.c                           | 5 +++++
 drivers/usb/dwc3/core.h                           | 4 ++++
 4 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..c977a3ba2f35 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -75,6 +75,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
+			park mode are disabled.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 852cf9cf121b..139f24975c0e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2401,6 +2401,7 @@
 				dr_mode = "host";
 				snps,dis_u2_susphy_quirk;
 				snps,quirk-frame-length-adjustment;
+				snps,parkmode-disable-ss-quirk;
 			};
 		};
 
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c9bb93a2c81e..f64dba17a50d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -983,6 +983,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		if (dwc->dis_tx_ipgap_linecheck_quirk)
 			reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
 
+		if (dwc->parkmode_disable_ss_quirk)
+			reg |= DWC3_GUCTL1_PARKMODE_DISABLE_SS;
+
 		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
 	}
 
@@ -1294,6 +1297,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,dis-del-phy-power-chg-quirk");
 	dwc->dis_tx_ipgap_linecheck_quirk = device_property_read_bool(dev,
 				"snps,dis-tx-ipgap-linecheck-quirk");
+	dwc->parkmode_disable_ss_quirk = device_property_read_bool(dev,
+				"snps,parkmode-disable-ss-quirk");
 
 	dwc->tx_de_emphasis_quirk = device_property_read_bool(dev,
 				"snps,tx_de_emphasis_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 3dd783b889cb..ab071163b3b8 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -249,6 +249,7 @@
 #define DWC3_GUCTL_HSTINAUTORETRY	BIT(14)
 
 /* Global User Control 1 Register */
+#define DWC3_GUCTL1_PARKMODE_DISABLE_SS	BIT(17)
 #define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS	BIT(28)
 #define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW	BIT(24)
 
@@ -1022,6 +1023,8 @@ struct dwc3_scratchpad_array {
  *			change quirk.
  * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
  *			check during HS transmit.
+ * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
+ *			instances in park mode.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  * 	0	- -6dB de-emphasis
@@ -1211,6 +1214,7 @@ struct dwc3 {
 	unsigned		dis_u2_freeclk_exists_quirk:1;
 	unsigned		dis_del_phy_power_chg_quirk:1;
 	unsigned		dis_tx_ipgap_linecheck_quirk:1;
+	unsigned		parkmode_disable_ss_quirk:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E72C10F0C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A282064A
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tEwKwtA/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XhRewR9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A282064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5SNQLRn4RLQJw9nbVWNjsZQ3eW1xkiXv0UgKikkYuRs=; b=tEwKwtA/wAL/X4
	TrhSEZmWGlI68SoUB9YOSXmJfGvLGovwKEpt9nUGmIdhEPHq2/FiRoQn6oekfPo/O2pfzbXZBpnBY
	CL4WxUVxfDSFnN0qZRweGHC9GpTxnbmbJrgdSSD6C8j6YG4E783z/3XZQOYlXyOwloQX9SBqVRuMw
	W6SAXQFl1rB4/0o2Td5GVex0hPR7JC9m5KB/2oLUptaPkzlKgiq4vfVuSDjOLEof78BR4gMR9RtFh
	9EOjkLRnt5jocerBq+w1CIbvcE2/0tE0enw8VTqH05b4XgHXxG4eAEth872ncRZlvi9EWyljGARwd
	LRSBNYL2fWJYl9N+oNjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3vq-0000KM-Hb; Thu, 04 Apr 2019 15:05:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3vm-0000JM-Ho
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 15:05:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id y197so3843813wmd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TB5foxrt3C76LRQYopjHfbUjFV2YxQTZVMUiKN7tn0w=;
 b=XhRewR9qqAwgKIzPdfgAVxtR5fotF0TD4rTzKQTXn3fFXzVpAgxvNeGNjX8UPsIrLb
 ReHwSJr4wfgPz+Yxh0vU85ecIz1kuIzrkoIhhX0KK1ytV40mYmb5/ck2h/C2h4B4duLK
 IYV6Y/nzQ6CwgV7Anckm6ivDyNx2EFxcxHOeUUeIPaRwahpIcpwCQuIeEkbg63HUXwW0
 wGL3JFM3C8+fO9kEmdUc0dhcJTmPNq/5S5mcgjwv6K8o5jnM9T9N4pGbeHTuV8BD3iiN
 Hokgi6UeTWM4YcWNgEZq7UYN8DA+a2+Wtm4zbVLEeVf3Qhtlg9yKYnW3KJagBVcSGagu
 5I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TB5foxrt3C76LRQYopjHfbUjFV2YxQTZVMUiKN7tn0w=;
 b=X3M/6cFvCX0/MHbTF+IRIUcxuYRQPK4Gvyf1O+7THQ+dwqNJ9tNPpVyVLIs7nOKmTX
 z7049RGhZEcuksGlNNdqyY3XlMHq5e1C9Bn7K6K0RvrfY/VVplFf6ve3olEouCp2xdzY
 O2KaBNzphvnBkDKk6Hp98H9sdnKg3nU9DV4Xy57PvWJJ08mlSKH8C5o5CyKRiq8gRvyv
 ub0W/8naJV7+T8uwdvpyBAwCURsfkCnIhReaw+da4LQZ42SkTapOiSPVgS8+V2uc95VW
 RI7vDfSfQvkZcQxIeYUzocgEBs50dYl1ig6BGhVSgdnsSOQ2NM+qQ92gUQjdRNblv2yV
 nyWg==
X-Gm-Message-State: APjAAAU/CwPFC7PDH7qXuwx3vzyIU2uoRsNKtfeqPoCxYZeb5+mMjYuI
 pYnijgGwDDthFTL6uiu57+Kl3A==
X-Google-Smtp-Source: APXvYqxkongdDzndt0TvxTAkETNNujNLzgX7fj0iGbsuBm344J2kHUEY6yAiy345e3eBqGGKUkFHfA==
X-Received: by 2002:a7b:c76c:: with SMTP id x12mr4486473wmk.97.1554390328711; 
 Thu, 04 Apr 2019 08:05:28 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id z23sm9880981wma.0.2019.04.04.08.05.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Apr 2019 08:05:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH 0/6] arm64: Add initial support for Odroid-N2
Date: Thu,  4 Apr 2019 17:05:12 +0200
Message-Id: <20190404150518.30337-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_080530_592873_DA8253DC 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds basic support for :
- Amlogic G12B, which is very similar to G12A
- The HardKernel Odroid-N2 based on the S922X SoC

The Amlogic G12B SoC is very similar with the G12A SoC, sharing
most of the features and architecture, but with these differences :
- The first CPU cluster only has 2xCortex-A53 instead of 4
- G12B has a second cluster of 4xCortex-A73
- Both cluster can achieve 2GHz instead of 1,8GHz for G12A
- CPU Clock architecture is difference, thus needing a different
  compatible to handle this slight difference
- Supports a MIPI CSI input
- Embeds a Mali-G52 instead of a Mali-G31, but integration is the same

Actual support is done in the same way as for the GXM support, including
the G12A dtsi and redefining the CPU clusters.
Unlike GXM, the first cluster is different, thus needing to remove
the last 2 cpu nodes of the first cluster.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Dependencies :
- Patch 1, 3, 4, 5 : None
- Patch 2 : Depends on the v5.2 meson-clk PULL request
- Patch 6 depends on the G12A Display DT patchset at [2]

Changes since RFC at [1]:
- Added bindings review tags
- Moved the fclk_div3 CRITICAL flags to the gate
- Removed invalid CRITICAL flags on the cpu clocks

[1] https://lkml.kernel.org/r/20190327103308.25058-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20190325145914.32391-1-narmstrong@baylibre.com

Neil Armstrong (6):
  dt-bindings: clk: meson: add g12b periph clock controller bindings
  clk: meson: g12a: Add support for G12B CPUB clocks
  clk: meson: g12a: mark fclk_div3 as critical
  dt-bindings: arm: amlogic: add G12B bindings
  dt-bindings: arm: amlogic: add Odroid-N2 binding
  arm64: dts: meson: Add minimal support for Odroid-N2

 .../devicetree/bindings/arm/amlogic.txt       |   6 +
 .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 178 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  82 ++++
 drivers/clk/meson/g12a.c                      | 451 ++++++++++++++++++
 drivers/clk/meson/g12a.h                      |  20 +-
 7 files changed, 738 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

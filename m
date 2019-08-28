Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4D8C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FFCE22CED
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BRpwnVKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pc2FgNUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FFCE22CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pMtAcikQrpz24fm/UrzqfIbV8AE/9xyLanmjDvHIs+o=; b=BRpwnVKuYfLBDv
	h6lzA9eUSglQqqCEKMx5byikW8KYHAN9m8x80SE5hLBvtclTITxfRR+Z8oFqETo1ZBUbIumefI8GQ
	eMJwdEE97V0NPUun1k69TQVBvK/Ll+mM82t+CyHQdod6MWwQXtYPIMddsGARwI6jf0UQhrcoh+jjB
	bxxH8Z6PRVBWBiGlxj3td8XXVTHBsGSDv1XWA9GMSpFUcndHEt9L7CTBznuOem8gCgbUbI1nljPWJ
	FL+mrbRb14puZ/Kcxjv/x4/NFNz2s65ar1KjQ2fM4xu/P1V8doL42smYVf8KxaV9AYhiId7jPB7Vx
	0QfjSmU0YI5i9N/BCsyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2yg8-0007Qs-56; Wed, 28 Aug 2019 14:12:04 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2yg5-0007PI-6y
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 14:12:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id k1so237060wmi.1
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1KAv8pKi0AoAgvfh+n5R42Iglf6I+wQt55KJGFF0fM=;
 b=pc2FgNUQUjmKwzqDzFdyQRbg8Pz0IJ1f67uI8PAy3R+CZy+hUqM5zfcBwGGC0RoBeZ
 +R0k3wlkOb2mxbERi6LKxTZZzNQu4F02boiRkENQKTIvk9fBBLIYpfPbgaADkVqMgSCJ
 V1snUwxahhr3Mra0ax3jiesoRcDHZvl5OdK0wonGTm//SQCKQWwaX+n1REV0O+KdfyqD
 mn8DjWAWkOKYSfHlaRQ7tEDhtYXRekb7UhNMdiz86p8XFnanbwHRSK/wRzlX3zjD0yAi
 rSgrbYyRggylCIaxeMZ2SQxHL6BiJv3ReBDfNsga+HY/LeH7EXiW/l97aHRxzYH7MkP2
 j4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1KAv8pKi0AoAgvfh+n5R42Iglf6I+wQt55KJGFF0fM=;
 b=P8QbyH2UH9rXUyIjREKU1+EWDmE1kMwdRU+Pq0Ve2mNPXwN0/qIV00xaAyipDcQQCl
 p8n/XWoqbtK9wg5nmTV4KGAZB6WwhPw7k2rEujEMiEVcJdq0qljUvEHhniGsSFwgrljj
 LPUt1K7KKU98GX8ELfRponT17uuGS7G33JDY5rtc3IFVMt+B6oPhpgnFjURNaYbQLEH3
 T391H9s2s0mr5e9YRn9zdCj8RlH9csV09pSB1J87hfSowSCrd5X9vcr0CM3GKgpvSQJS
 unuVDpvHMBhOUd1t+X3yzFT14e7qBxHKsmNmzcqFE5ORvdwdGdyGN2XKkVT1zxRUb/Ih
 gixA==
X-Gm-Message-State: APjAAAXi7cDoZ4ghOixVjuPK65/PZ8gLmFPqj1TMO5lFA1jII7E7ghyg
 Qn3LY+sGYi33exWzWbiN5FtvIg==
X-Google-Smtp-Source: APXvYqz96TmPPVEmMTQIWd5o34VAawuoSnxOtUnJnMiSj9qw7YFhgfiDwSSFrKcnrJG3/uC29Gpqlg==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr4911436wme.37.1567001519544;
 Wed, 28 Aug 2019 07:11:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a11sm2774838wrx.59.2019.08.28.07.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:11:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/3] arm64: meson-sm1: add support for the SM1 based VIM3L
Date: Wed, 28 Aug 2019 16:11:54 +0200
Message-Id: <20190828141157.15503-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_071201_256819_CDC57977 
X-CRM114-Status: GOOD (  11.81  )
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

This patchset adds support for the Amlogic SM1 based Khadas VIM3L variant.

The S903D3 package variant of SM1 is pin-to-pin compatible with the
S922X and A311d, so only internal DT changes are needed :
- DVFS support is different
- Audio support not yet available for SM1

This patchset moved all the non-g12b nodes to meson-khadas-vim3.dtsi
and add the sm1 specific nodes into meson-sm1-khadas-vim3l.dts.

Display has a color conversion bug on SM1 by using a more recent vendor
bootloader on the SM1 based VIM3, this is out of scope of this patchset
and will be fixed in the drm/meson driver.

Dependencies:
- patch 1,2: None
- patch 3: Depends on the "arm64: meson-sm1: add support for DVFS" patchset at [1]

Changes since v1:
- renamed compatible to khadas,vim3l
- renamed DT file to meson-sm1-khadas-vim3l.dts

[1] https://patchwork.kernel.org/cover/11109411/

Neil Armstrong (3):
  arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi
  amlogic: arm: add Amlogic SM1 based Khadas VIM3L bindings
  arm64: dts: khadas-vim3: add support for the SM1 based VIM3L

 .../devicetree/bindings/arm/amlogic.yaml      |   3 +-
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |   1 +
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 355 -----------------
 .../amlogic/meson-g12b-s922x-khadas-vim3.dts  |   1 +
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 360 ++++++++++++++++++
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  70 ++++
 7 files changed, 435 insertions(+), 356 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

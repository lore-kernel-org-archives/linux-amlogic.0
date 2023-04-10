Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F6C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 18:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hht/BmsWUFiH3K6N5HiQi+tw3FRl2aBlREmewCOPLyY=; b=hhyRKCZnSm8fki
	3jUoi0cueKwTqJ3kSasYgg7Yx7p9PFINqvjbj3YPQmrpJoKQsLiuea5QfJZF5NI8OHjrjONhJoIFL
	YfNQAOGExVveFgLHgHq8JRXHxvPvttV/4VriQIiYKpxkbx4nkqq5E8yUdGLhV1uu4yzDy3JWgkITu
	AXx1BVO3hZh8SLQYQ4sjWcOC4aS/zTtxzC8DPm6mQHZ8YPvN8GDS4t9hkFAVXkShpzkKha9mDsW2Y
	c2yngrT3uBt+aVdk7iqZlgbUwAZzeRVPtr7Y0nRaIbZw2oRgDOCEGBvcgPXyZbj/kG6axKuAuXVB0
	7kOmkN4isuzjYWepauIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plvvi-00FgPD-3A;
	Mon, 10 Apr 2023 18:07:50 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plvvf-00FgNu-2G;
	Mon, 10 Apr 2023 18:07:49 +0000
Received: from shark1.inbox.lv (shark1 [10.0.1.81])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 8B2C3480813;
	Mon, 10 Apr 2023 21:07:38 +0300 (EEST)
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id 7AD4B11180E5;
	Mon, 10 Apr 2023 21:07:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681150058; x=1681151858;
	bh=y1ChjUCMzQii6EhLRKMmO6a7digcuovwd1kw7u2N5go=;
	h=From:To:Cc:Subject:Date:Message-Id:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=vb5mdnl4+jFXMtD2syWXhid9OerURW9+OTxEiG46GWdvu41h4BFJg/3wmxu52azlo
	 fAJE4FNri0TYa2bD8MaE1TT6fgTI5FU2ZFWuYl3tc6HZ3djX/NlyWCEc3Z24B8H1Kf
	 76ifSzUT4RgEL2pX961SJaJfYhSMEfkrnx9oPe5g=
Received: from localhost (localhost [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 736F211180B3;
	Mon, 10 Apr 2023 21:07:38 +0300 (EEST)
Received: from shark1.inbox.lv ([127.0.0.1])
	by localhost (shark1.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id PONECAxGTz8l; Mon, 10 Apr 2023 21:07:38 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 3517B111809A;
	Mon, 10 Apr 2023 21:07:38 +0300 (EEST)
From: Karl Chan <exkcmailist@inbox.lv>
To: linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Karl Chan" <exkcmailist@inbox.lv>
Subject: [PATCH v3 0/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3
Date: Tue, 11 Apr 2023 02:07:26 +0800
Message-Id: <20230410180728.30332-1-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: AJqEQ3gB6gpLwLuiSfBh5uXsxt+2VFkkvDuJsLBwtjJYqsqhvt90eXGXGIPxEAGnemLD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_110748_209358_EDFE99D7 
X-CRM114-Status: UNSURE (   6.15  )
X-CRM114-Notice: Please train this message.
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

From: "Karl Chan"  <exkcmailist@inbox.lv>

The Xiaomi Mibox 3 is a TV box based on the Amlogic S905X chipset.
There are two variants:
- 2 GiB/8GIB
- 1 GiB/4GIB

Both variants come with:
- 802.11a/b/g/n/ac wifi (BCM4345)
- HDMI , AV (CVBS) and S/PDIF optical output
- 1x USB (utilizing both USB ports provided by the SoC)

Karl Chan (2):
  dt-bindings: arm: amlogic: add Xiaomi Mibox 3 binding
  arm64: dts: meson-gxl: add support for Xiaomi Mibox 3

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905x-xiaomi-mibox3.dts | 142 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts

-- 
2.40.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

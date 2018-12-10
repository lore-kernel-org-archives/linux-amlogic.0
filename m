Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AB1C04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 20:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CAD020821
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 20:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1DIRIYj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZVzmuFNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CAD020821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=szuuMi3TxIBN/E5XUyEYmrN2n4TaaF4R7K5Aid7IYxQ=; b=B1DIRIYj47XnFY
	fftvqCZ3Fpr2xFEpq68xbHsC2q3LeR/mqXXko1WqD6YQaq1sfFtdxn9BF1rMr+1Ki6fy/ttj3xsvY
	CikfBcUMASdlWxa0LkVnUt0L7SA/BLHOXADHM4uQd5adtSGvc3/nfmDPk89TdI/m/8M/24wtSeZm+
	9s/OoVONj4hrmsrtsFCxWRUMry9QtULqVlJVBPWIOlJQpnRLasdDwe2RqFV3JkPKlbxPvCowXFskG
	asCNXRO9+6pbQvQGUG7J8kV0FCLnQwN15t2OH72hmLcAApU1T2E/oD44LA3mRQucPnP0pYEHt4m2w
	X49B3rMPlI1Zso9yTbhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSJI-0004qx-OY; Mon, 10 Dec 2018 20:37:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSJE-0004h3-Pa
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 20:37:47 +0000
Received: by mail-pf1-x441.google.com with SMTP id w73so5942913pfk.10
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 12:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=NQBOasqUrtZBY78xlBbpNxaOgWK4CYjJhjAgPLm+nfI=;
 b=ZVzmuFNkfFC287m0ABVjLnjnXk7k5sUjvTU0W+rcIjoZ0ux8RLMJM12/+LqKrl//wC
 zpzqlsoblhwKLHuV0Cq5QgeYyHqBU7pa1bJr2z0mnmPaWZ5K2CES6mqpgJAgZrNqpbxO
 z3zG2EUGwtv2oKSiTumAfxISTD+MT5xdC/wTtd67F3dwEY+v+WTbBcFqzNhoQPsVPVFy
 Q66soQgARVz3fSlUAjj1PcJGdjK1D38kecpCVg7QykkUDr0frqyZSAiKVigfRNC6t+B/
 57oxjt4RWshW40SDfNbkyKxS04/DgYWyUniJ1hmKueDJaeDpjX4G9QUksc4Nhkw3oY7q
 +CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=NQBOasqUrtZBY78xlBbpNxaOgWK4CYjJhjAgPLm+nfI=;
 b=LpTv/Vekl+nMucI5lwq33RpuUwX9PKBAVhb5wXEUX74FIjwFBYmSl4/tuDSYp9Ib2F
 uBovkt3QaVC9Az444WX0DBHsmqL4LP4S4mHM9AasQkMH+19To0eOUAh3YjncTtLPJ2lA
 2luz1sVT3AXJP/N/F8fHw/U3SjccJr5Tftist4fNcyPwaBNPs8gwVAD4LPDcTTlH2BJb
 YaavzXDne9GfCOxZ3qVY4D1tWReazzXKwxcjsNPBI1l13KBLgFuJbfrZFzFfmnGYtwA+
 trk2nTBW/6f26POw+TIaTcSJcRuljGKXMKKhWx1xXGxvRqZHP/aX4hNO21LwTTrBCfpq
 SKiw==
X-Gm-Message-State: AA+aEWYOtF5RymO7A4uHasTW5G1Bifxm5FchnBZHK4u394lX0QWIAH5a
 jpO0URLXoVyiHEO4IskRy9hgQtBTO4g=
X-Google-Smtp-Source: AFSGD/XC9HyERYFA29JIsz54h0nWy6yANGKvHzGgtSeUsm0vllwYS37eeO0UakXh8Aux0XwgX05Xjw==
X-Received: by 2002:a62:509b:: with SMTP id g27mr13858277pfj.48.1544474253732; 
 Mon, 10 Dec 2018 12:37:33 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 i72sm18373728pfe.181.2018.12.10.12.37.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 12:37:33 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v4.21, round 2
Date: Mon, 10 Dec 2018 12:37:32 -0800
Message-ID: <7hpnu9w22b.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_123744_938776_60E95476 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 5e339a1d7e438b2cc9f46ec9f2682efb58ee2dd3:

  arm64: dts: meson-gx: Add Internal Clock Measurer node (2018-11-29 12:30:09 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to b29e9eccaaa721c2a303db6540535ee77a515f61:

  arm64: dts: meson-gxm: Add Mali-T820 node (2018-12-10 12:11:32 -0800)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v4.21, round2

Highlights:
- GXM: add Mali T820
- fix IRQ trigger type
- AXG: enable GPIO IRQs, PHY IRQ, watchdog

----------------------------------------------------------------
Carlo Caione (4):
      arm64: dts: meson-axg: Enable watchdog on Meson AXG SoCs
      arm64: dts: meson-axg: s400: Enable PHY interrupt
      arm64: dts: meson-axg: Enable GPIO interrupt controller
      arm64: dts: meson: Fix IRQ trigger type for macirq

Christian Hewitt (1):
      arm64: dts: meson-gxm: Add Mali-T820 node

Jerome Brunet (4):
      arm64: dts: meson-axg: remove alternate xtal
      dt-bindings: clk: meson: add ao controller clock inputs
      dt-bindings: clk: meson: add main controller clock input
      arm64: dts: meson: add clock controller clock inputs

Neil Armstrong (1):
      dt-bindings: gpu: mali-midgard: Add resets property

 Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt | 10 +++++++++-
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt   |  5 +++++
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt      |  2 ++
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                  |  2 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 23 +++++++++++++----------
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts             |  1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi               |  1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                     |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                      |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                      | 27 +++++++++++++++++++++++++++
 11 files changed, 67 insertions(+), 14 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

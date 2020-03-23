Return-Path: <SRS0=Lisw=5I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CAFC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2020 22:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4081D2073E
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2020 22:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USc6Rf/D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SFOHqpwG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4081D2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lDTyFusdfxC5EV6CQtelFlWRFSl6VBn0FRMG6xkI+e0=; b=USc6Rf/DfkDTN4
	x8YGR6o3FbIPhMBLJ90XoulisUMGkDXrFwSBNBBwl7NIHjr5KPAn4wTnHfP+XpjDJsyORS/cowOQT
	ZEEvQa9do4cy5DcLcj/20MvspgxOIpzMaI1STluh4ftpUbHLLslskIrBj1c9Y5mt8KsvXRyHu/tnA
	HO2J25tpb/APQrRqxscovpi7KgwKY4hwOWwu/N+CFQ5AYOIulpQMeO2DyDns5oyJ1nGp2A/nkQ9pn
	VFd1iteLBdys82GCteOa3+77Z0G58zNT1B2qEmMRuorSEv2Me3iL+StkdSJQNwCcMJNIlK5RYV6LU
	VtlQQYW3IUIrbyvzTxYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGVUy-00084Z-PU; Mon, 23 Mar 2020 22:24:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGVUu-00083l-Ud
 for linux-amlogic@lists.infradead.org; Mon, 23 Mar 2020 22:24:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id 31so13133417wrs.3
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2020 15:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jENGzdOPvP/M6f2t5ohcAn6yjmjB16kOxfnwrqgSiJs=;
 b=SFOHqpwGHre4Qbf5P/oyPPJrrRSeQk6WM/EZkB6Rl3Jqx+9dH6aMUlMML9jPNGSA/p
 qalBZzlvMI0vNgXDjegMTCSRI2hdoXN8J5XwwVE6z0pLNNmzNCCchwM5D4dEv25g4PDJ
 aBLSTdRc0XqT+BjiAnYm+I/usDuqdz4FMY/QYFVrIfC6HJh3wDoPjcHf/LDkdG/uKuzD
 7jlqpM90ixll04rwNnIcRQNcuf3aiNi/y4TLdpNqZQAiJ0LvKMviqfxTsKdI7QUjoIIQ
 H1DqFgr9yXz/w+4LlFOO6lISMikqWfrZz6WEXTnnVp+Oxg8cpbl0aiEWvJwi0KRNXQZE
 pA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=jENGzdOPvP/M6f2t5ohcAn6yjmjB16kOxfnwrqgSiJs=;
 b=IEgB6mRw+dDz5ec7IyGxLxKOdVhcRn/W52ugehuPTPuujcIC4r0a36xlKXwLKCrx8R
 oJBvJinY0S4STrLUCqDNiDHsHYndN2L4nQLoanq4vwqHPyht5koCm0NR6YDS2vaFPV41
 eHjQxlOZIaEms1ZPGaEXGvmvMnllYmjyIpLKx7ANcu9zA6cPfxVTIcmulp29bXz0df+/
 INkiImHletScjh3JLRYGhmqsUKBO2N1BsDLqFpPvOMeE7E7T7/TR26LZi57u92e506WV
 9iv+FqPtXJ1b+/MBUkufrDcqY6UIGP7ItAhe0pcQ4a77NViKoQatFrKL940gcGX9pMN8
 v7+w==
X-Gm-Message-State: ANhLgQ0hklEK2bWlNCcApeLmcOLEoytj97tyxqH2W/IuDW3/HimM4UCk
 zhd+ds6Tnj/5t2ALQcRHFIMGOA==
X-Google-Smtp-Source: ADFU+vtwWseqjMiUk/waLc5ml8zvODonw/w/fI2eAn1Znx1bgx7b/CAZySVluQ3KExUO/iPSb1REuQ==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr31146308wrq.333.1585002278989; 
 Mon, 23 Mar 2020 15:24:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k185sm1419486wmb.7.2020.03.23.15.24.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 15:24:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.7 (round 2)
Date: Mon, 23 Mar 2020 15:24:35 -0700
Message-ID: <7hftdyhfq4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_152441_048979_623A3299 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Here's a small follow-up round of DT changes for Amlogic for v5.7.  Note
that this tag includes a merge of some DT bindings (queued in clk-next)
for the new SPI clock IDs used in these changes.

Please pull.

Thanks,

Kevin

The following changes since commit cd13d5f115f91065319c7604132d14db7048391e:

  arm64: dts: meson: add thermal zones to meson gx devices (2020-03-16 09:49:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to a084eaf3096c140deb4062fd09b6d20144d40ad7:

  arm64: dts: meson-g12b-odroid-n2: add SPIFC controller node (2020-03-17 15:15:09 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.7 (round 2)
- G12[ab]: add SPI support, enable on odroid-n2

----------------------------------------------------------------
Jerome Brunet (1):
      dt-bindings: clk: meson: add the gxl internal dac gate

Kevin Hilman (1):
      Merge tag 'clk-meson-dt-v5.7-1' of git://github.com/BayLibre/clk-meson into v5.7/dt64

Neil Armstrong (6):
      dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
      arm64: dts: meson-g12-common: add spicc controller nodes
      arm64: dts: meson-g12: split emmc pins to select 4 or 8 bus width
      arm64: dts: meson-g12: add the SPIFC nodes
      arm64: dts: khadas-vim3: add SPIFC controller node
      arm64: dts: meson-g12b-odroid-n2: add SPIFC controller node

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 135 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi           |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts    |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts      |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts |  23 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi   |  22 +++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts     |   2 +-
 include/dt-bindings/clock/g12a-clkc.h                |   2 ++
 include/dt-bindings/clock/gxbb-clkc.h                |   1 +
 11 files changed, 177 insertions(+), 17 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

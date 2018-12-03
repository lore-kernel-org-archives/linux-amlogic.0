Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C082FC04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B622087F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlYSXg4z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ksU7eEGj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B622087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F3jr6GVdOm8XlIW0AYk6TQlYRtAwmJorMOE/rMCZoWI=; b=AlYSXg4zOdv0NQ
	SBbdpINuSPtJE2U6zxMH2Hym6eFICby30w/MiinfJn/yTC84vs3wgqKzUL4r3hNrxRMG+1ZP7R40h
	tgm8iTvuVg7HtfIlJXixYiH3GE+6Mpl9IrjIGDKAe0264IkOPs5iqJ5rMxPCEnxmSbVjHngF7ypn8
	6ah5JzifNy2ae3bKufj/amipnLVwKFwbo3rZB9TdyETuSDrnJye4sF5gAQpF4ICMlftfPNLJKiGdj
	hxgDcPbPzInrQsu2gMjyZNErJoMHNo7BXLULfxdmnzpk7kLoT43Evj6uQRupkrE/MMTPhxwMih+bn
	eLIRtvUp6x7z3aeC8Oqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTrqL-000513-5Z; Mon, 03 Dec 2018 17:17:13 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTrqF-0004wi-JP
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 17:17:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id q26so6489925wmf.5
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZ+dFdmZ920KJ6td8EU0wjLOULXN2OwWoR7RRNraTBU=;
 b=ksU7eEGj9F54kVOlTPj5JfnrnrE8Cj0BFGftVr5u0YkZ4Vsldi/ja5RKJ5WEvgfR9f
 RJUfkgtXFsDig/MSH4ngs0UO7nUpF3yinkzDBK1pzYiQa0MM2t35U2h2hTXD1Wx3iK5y
 LBNe8HzYxn9JPExwCYbxH3aaQArwHbgi2tSD2nHHSsuDRV2tWeTduPx59e015kwbNVDg
 iYedwUOGg85tWPTDUhgUH9A2tUWm4cc8N3Th4fDW+jZ6uxhcIJe3Zgkz1z9yy72HVZvO
 /7GXNKzUm913DR+Y3pPRbm36IJf8PF/sMspB0R1rlMf7gsBnDARTJSivAVi+PBcZqvQ0
 iWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZ+dFdmZ920KJ6td8EU0wjLOULXN2OwWoR7RRNraTBU=;
 b=MLDx2HrHZa4MHdvuXJXfQfDqnKajJ7jwaJOM8+ODZoIslQAK7i02NN75Ueb3M2AYak
 FgqQIGReI5dBv7hECPI5rpuIkMw0sb2PkQLUaufmtBOUsn95VEz8AMMhMmL4xL3kqqH2
 9m9sx0ZYojVmwsCih8Wuvv8IuLBPC2whSyUEq3c4t8DkvUAKkv0fPZxCGH9Yu3BQYNaL
 Hhmd2ejkXQVeOT4ycZceYfnZ23wPCq+klgoKOWEGlBC44AtDp51NV3vp1D5j2q+vpySy
 XpXm+ANyaihUXTq7ch8tV13OGlkFzwR3UftKziKFkKIVnilBH1MZ8/s22p3v6HdKWqv0
 a6pA==
X-Gm-Message-State: AA+aEWZU05DyVMOuPB98RptqZ+nFF1hNEX105SYRCTPJFAy/Rl2ztzR/
 fRNwm17smMoHvNtISxXuZGlHfA==
X-Google-Smtp-Source: AFSGD/XmUwpnJmmwRVcRFLbLGUxdmI3PfK3cf9zrSLDk+MhUMKvxQ3kvhYGILCEGZX6k/UHziNN+/A==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr8599633wmi.57.1543857415551;
 Mon, 03 Dec 2018 09:16:55 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 h203sm22494889wma.19.2018.12.03.09.16.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 09:16:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 0/3] dts: meson: add clock controllers input clocks
Date: Mon,  3 Dec 2018 18:16:37 +0100
Message-Id: <20181203171640.12110-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_091707_670840_48CEC993 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is the first step that needs to be done so the
amlogic clock controllers properly claim their input clocks
through DT instead of relying on fixed names.

I'll be waiting for this hit mainline before sending the related
driver changes.

Changes since v1: [0]
- add clock-names for the main clock controller

Changes since v2: [1]
- add more inputs for the gx family external 32k references

[0]: https://lkml.kernel.org/r/20181129164524.18670-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20181203131850.31388-1-jbrunet@baylibre.com

Jerome Brunet (3):
  dt-bindings: clk: meson: add ao controller clock inputs
  dt-bindings: clk: meson: add main controller clock input
  arm64: dts: meson: add clock controller clock inputs

 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt  | 10 +++++++++-
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt    |  5 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi             |  4 ++++
 5 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

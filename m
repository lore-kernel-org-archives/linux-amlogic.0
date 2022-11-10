Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64977C43219
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Nov 2022 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pcorzlYKbjvr/1oNuwdR5p3Ec1mF+64RbVCPuYnUbhE=; b=MrUq9CbayQxI9R
	ykav/Fvn9FLzo08UQ+Weh82vzyLHilyalnIyrEX4lb1RmtCQa7jk//xIVnjdOadeBqTVDiYFhXJl/
	MiBl4h4gDi//n5ia5QBWorI70rkbDxCzsVGoU3DPr5MBD55djzZRezsKbE3xN6ey5XsVnMWfNJgyj
	gT3SkWjylcfkxr4WF+yE99TQdbmXpGw4oMtSIZfiloPa10gYXdAyzUbYcMk+sTw98WbVW2Es3bvqI
	C/sOrVtmag8U8FondtH2mDnNq0Hh1oxwximHPcsbj+tlHMxl5LhgRsVoxGmXCI+p9dmwPg3HfyNjY
	HBmD7FO1v/Xf7zLPUNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93a-006Z2h-Fg; Thu, 10 Nov 2022 15:01:30 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93O-006YvN-Uu; Thu, 10 Nov 2022 15:01:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 990931231BE;
	Thu, 10 Nov 2022 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1668092467; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=OTEcSrKbeEwGEfVJ7rDTBCJPtPYB3owKDL9ENQiVtws=;
	b=r/vrCUS6kd2GZejTmbFjVRuqxeY+xmENmIllYtzTlrrpwlYS+FSTKH4+ZDcETN4KgJdwg5
	pX47Cb4mQ4XvzAd8lmVJWw9xHd/sFGRZ/OBmS5aTUxPPpbIp3/JryjxXB5dEcKTLeyRseG
	rqL/FX0NUI6ZGxSoezA17RxFnHI5AoYMqtr+5s8/w/FpVdb9ECdFP63lwBn6VbhKFPQoX5
	iMBLrmPJLpr/L1S0ZnEHaLF/fcpHfHGpn3HlVf203H4rv8O/BEIQzDoIWjlcB3XWi30EgP
	34m027fzMNaEIyZVWDROYiUS9ZvfJZEEzwIZHCkke6EIB/MPxzOD9dhKabUmeA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: amlogic: mmc: meson-gx: Add core, tx, rx
Date: Thu, 10 Nov 2022 18:00:31 +0300
Message-Id: <20221110150035.2824580-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070119_170312_EDDBE4E0 
X-CRM114-Status: UNSURE (   7.23  )
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

The mmc driver use the same phase values (core - 180, tx/rx - 0) for all
meson64 platforms. However, some platforms (and even some boards) require
different values (axg for example use 270 degree for core clock). This patch
transfers the values from the code to the variables in the device-tree files.
If not set in dts, use old default values.

Vyacheslav Bocharov (4):
  arm64: amlogic: mmc: meson-gx: Add core, tx, rx eMMC/SD/SDIO phase
    clock settings from devicetree data
  arm64: amlogic: mmc: meson-gx: Add dts binding include for core, tx,
    rx eMMC/SD/SDIO phase clock settings from devicetree data
  arm64: amlogic: dts: meson: update meson-axg device-tree for new core,
    tx, rx phase clock settings.
  arm64: dts: docs: Update mmc meson-gx documentation for new config
    option amlogic,mmc-phase

 .../bindings/mmc/amlogic,meson-gx.txt         |  7 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  3 ++
 drivers/mmc/host/meson-gx-mmc.c               | 18 +++++++---
 include/dt-bindings/mmc/meson-gx-mmc.h        | 35 +++++++++++++++++++
 4 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/mmc/meson-gx-mmc.h

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

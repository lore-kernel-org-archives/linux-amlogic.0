Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFB5ECE564
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rZAavtPYcLud+5idEu6Yk0kAier5paa28/6MGGo4EJE=; b=uWJza+hNvDmHcm
	4Ga2DN8P6jWKLl7PbNWKxWEKClyUYtkKCMwRnbZOtHpbdmiRG8HeohfFBBzFNJoqi/Z3ferKQymCa
	D84LHe93OEeClkBKoDblKHi+ixNu3qLmyRHHoI3dhF54iQYLVYPVgzu0E4Yn0ecyhW6h8ISKLysRP
	BxL0Mt1uwjmtaT1pT68ScKCe+dZMDAcCqPQUnHxysTdSHzryjAYVlhL7tWyMpYYBru3Y0jty2TRg1
	yKHYekIXlOTu3rXY+b4Dg988CpELizaNChikzD6DzTG9MAQUoh57dW19VVg7UUkzD0YwfwHJzuD0t
	zLqQJFf8dITHjj+kk26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxtI-00000005CMk-1X7x;
	Tue, 10 Sep 2024 10:14:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxt7-00000005CIR-3eco
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 10:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29937A44552;
	Tue, 10 Sep 2024 10:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5501BC4CEC6;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=Sobyjbsg00DCrwSWH1kDJBeyO+Pp/IjZIWpKWS5D8QU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gNiEokPB1GfCvgsP+dtdrI9AXIAplYElUkaGPq2xyt3p9qhu9ieGAMXJNX+2lsCiz
	 E0Jrm66SzIGR2NkoRW4PBBsGDqcC4Xz1Kx/blfdwxV0hcrjakdsOM+IAmBHsmWMAdj
	 q7YVdcQhHvYwpIjPUPKPsofK/7KIo0cYkH7TvJ68siydasVs4VXhMZtTCPj0i1UYDh
	 YGRJ1CP2lfVQ+u5Pw0I7dK0i/51tUIgiS1GpfuF+CKAZKPifiHbr2EwUm+naYbvn0f
	 s0ZnpUITFdaWcWl6ZqaSyyBBK9V7a2hVF8ctQ0lsGi+0pigb8Ff8gL1RuaYdN9Fu2g
	 ziZ9AdPQesXYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EF1EB64DE;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] support for amlogic rtc
Date: Tue, 10 Sep 2024 18:14:17 +0800
Message-Id: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPkb4GYC/1WMwQrCMBAFf6Xs2UiyMTb15H+Ih5ik7YJtJClBK
 f130yJIj/N4MzMkH8knuFQzRJ8pURgLyEMFtjdj5xm5woAcT1yjZHGyTGBtnRYNGiGhPF/Rt/T
 eKrd74Z7SFOJni2axrns/C8bZua251MIZ1PJqhmfoyB5tGGAtZPxbDf9ZWCyunFG1Ug/tmr21L
 MsXGCJDoc4AAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=1443;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Sobyjbsg00DCrwSWH1kDJBeyO+Pp/IjZIWpKWS5D8QU=;
 b=ILLG7jZLh8LNWnmrhMqwMAvdN+HP2yahKKY/veJHkXQAAOKdiZJlBOS5SJMlyxBL9twv2+Ndj
 dqTItQ3WhvgBrs2gKuB/VQnMdNCVPBiNXVGkEJrqfJ3bd65biYS47hh
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_031422_056374_1DD41343 
X-CRM114-Status: GOOD (  10.09  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Perfect the binding description and rename binding.
- Using dev_err_probe function correctly, and modify commit message.
- Change placement about MAINTAINERS.
- Link to v2: https://lore.kernel.org/r/20240903-rtc-v2-0-05da5755b8d9@amlogic.com

Changes in v2:
- Modify bindings clock name and perfect the example.
- Fix some bug in driver, and use dev_err_probe instead of dev_err in probe process.
- Use RTC API to handle calibration.
- Remove unused func and rename driver file name.
- Link to v1: https://lore.kernel.org/r/20240823-rtc-v1-0-6f70381da283@amlogic.com

---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    |  63 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic-a4.c                       | 473 +++++++++++++++++++++
 5 files changed, 557 insertions(+)
---
base-commit: 658b3fec5fc0ef3c016c4a7eedac1a5f3b8c0151
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

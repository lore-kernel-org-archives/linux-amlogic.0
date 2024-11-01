Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3103FE6F062
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Nov 2024 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9szVE1AGBMVhL7Hp24MrYECuZMJwNNLyXY84SAYNdsM=; b=P1CcYXGPrng2BY
	uWRdcUJz+YMXjmvM5bHYJo/xUJX5SnognS7Mm8/V07t6OdaHr6Ch1xnz+YF5j39pCIr0cMBhMguKw
	nsImQ4iI5Yn7oTatV1fdnXuGZufcdDTgKHir1MBbci3U/kOBj+d3eDCTorD04bgXjr8pYk5wBySo8
	qyvTlITmG9GEES42rWxUewvGajsgg0Ii4OFLXRgdI7bLK2ZwFQVys/IE04DRXgnhItl3GO/FCmbKi
	WKveD4CywODUt40+LkFCmCGizm0D4AzIFdalraWYdRfiD9qAZnP2gAbky1bJdWfGKLzSDbNs8oXkB
	BkNlvun4OwOimE4FFMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sWY-00000007JDX-01Bw;
	Fri, 01 Nov 2024 14:21:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s8E-00000007Fc3-0t2M
	for linux-amlogic@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=7/4phvHVJK/PaWK5pEipfRkntEtqJpkJEk39nWK5kE4=; b=PFDgVAefzGJvYB/mUOnwS/VPdj
	doB/9/k/oHGPVD4cRiCrDZMl+szFIuSiifLzOp3UwLZ9UMy7zWNKzxvrl9PC/g+WgRJBtJRua3Zmn
	80j+BOp4zDZOXSba0yPrqKWNzlfk1QJB36InYoxJCorD3pT9r51Mt3UvgjJjy7ZaXkE9cSXVAj3cE
	5BEL7FIN5drlkBbXnXeCKil5fUg93hwtTgGVWFwgZefI+pFUUotvkrdbyvCxTKgHR/jYoclnuy+DA
	sSZzBL24a9qQ3QHMiRl4yjGAMNTC3IFpScrFxSGF3XVN3MIRqdfyYNTY0dqNzjLV/14VIGm+27GJK
	IZEO3jIQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s8A-0000000AidY-1Y5l
	for linux-amlogic@lists.infradead.org;
	Fri, 01 Nov 2024 13:56:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4C515CAFE2;
	Fri,  1 Nov 2024 02:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B9A7C4CEC3;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426819;
	bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uJsTUGGdvGAFC/ue1WVQ4iFaOP8LD/iC9zBiDnAebPj2s7DQngOzI+E1Lfj4CePUL
	 WI3AM3m7u5aL2liENGaCjlCDR0BmYoY8Is/mbSx09xf0PJU5TgVu+KLqYFbxtx0wsr
	 EGhsTEC31Hz6pldqSszc9IsmBO4+CJCxeSoCC9YJ4fip96vnWHw018w3X423mZrE9T
	 WME4NAtz+c5smY8xmknveYHW5E+oWJdbhxN4iRAfUKmtIeJeXPdv+x1WEGPYewkdtS
	 FUUjQvwqxUIaV0WT3GGQioK24lGmUv5OPUWTe+e1NxpuQa5XeFvVjGUwcDaWhI/MV+
	 DPDVeGr8OWkLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EC2E67496;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RESEND v4 0/3] support for amlogic rtc
Date: Fri, 01 Nov 2024 10:06:46 +0800
Message-Id: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
MIME-Version: 1.0
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730426817; l=1589;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
 b=L6jDG5I4ppkE3/ogU72kAKSdhg5iKkHL41Adh5bjA13FwGiJHkGApvFLyAI1c0QSHcSAC3jyG
 9nLMw4aoC9yA7LyDm5A4LO/vPzO/bt3+O4KOC8nDVwyRaPKvcPsoS2c
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135602_702946_F66EEBE0 
X-CRM114-Status: UNSURE (   9.12  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Keep the same order as as in properties.
- Link to v3: https://lore.kernel.org/r/20240910-rtc-v3-0-1fa077a69a20@amlogic.com

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

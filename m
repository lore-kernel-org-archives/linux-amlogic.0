Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5415D41D48
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xm9+4lJ2xTH8Pc6J+YoTKFyhd2aCuWF3HPdwuKYUPwE=; b=C7x/gSbO4xld7+
	DFgMXKh5LZo+9Iuoz4wZgw0DTmGLt4IiMrtlsV69KETCm11DyI0sBDMX1hvWMmET88RYHE2NSuvBs
	nCvVXc51niQcplpGhv/tcKFQaU+SmtS1XKSU7P1a1/Y28faNVaBGUplx2o943JxAp9AwD5IYeQUjG
	aSTpAdsmzHaFPyvhYcerwaLx8crDLJpEK2dCTDa3hiD2XigzzDJjmncpBoiT5E3jGTFGEMhJC5ALY
	EYvumEq68reTSVD2hNeDV64JJwCeFZ8DdUAQ99lqxkgokQAN6PWCOrRI6heYMDDWj1Vk3SfXwjjV/
	091Bd2jXuExwWeO6birQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhIN-000000022bo-4BeC;
	Tue, 12 Nov 2024 03:10:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhIJ-000000022Yd-3jBK
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 03:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19F05A402DF;
	Tue, 12 Nov 2024 03:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05DC6C4CED7;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731381018;
	bh=8+WX5Wakdt4EUxqtzq8N3biWqhl54KfXtJQv1VX3/4Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pwMYJLrd4Akzm1D9Ut5bVqBJD77ebtSaHLDxTZsRIdVkfIxm2VsZPZuA0udYIDCiE
	 ktSMWojSj7AHdJgHm6Buc+xHu+o6Dh3kFNxStRn9jXAfcGLTAMLHaOn+5as9+kIWLS
	 BBub7veW4AqBCGWyM5xVjVJDO7hITRZC9IVV8ZCeekAqn9HAZygHeSrXvJjw61GhNb
	 3CPhuxp/8Uu6E7uap6gH46pnu4gf0T2RyOdADV2EZXhleQ+gv9FtE72XLAsKveuSbb
	 YUF8dcAjXzSiyAY8b8VoSNiM6BtnQvA5WlnFmfZ1WRu4NK5bO6oxT8rONHeuTnIymb
	 yzkZbaHIgBfLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E723ED41D48;
	Tue, 12 Nov 2024 03:10:17 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] support for amlogic rtc
Date: Tue, 12 Nov 2024 11:10:13 +0800
Message-Id: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABbHMmcC/2XQTY7CMAwF4KugrCcj20mahBX3GLFwkxQiDRSlq
 BqEevdJAfGjLp/l78nyVQyp5DSI9eoqShrzkPtjDc3XSoQ9H3dJ5lizICANjpQs5yCRbIgOPTE
 qUTdPJXX579bys615n4dzXy630hHn6acfUYJsOgvKYWRyasOH336Xw3foD2JuGOmlPDwUVQUms
 rHGtC76pVJvCuGuVFXYMVjLjWeCpdJvih5KV+WRk+lanVQ0S2WeChHcXZn5QvTa1gdZ69pPNU3
 TP2F2bv9wAQAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731381015; l=1965;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8+WX5Wakdt4EUxqtzq8N3biWqhl54KfXtJQv1VX3/4Y=;
 b=TANdTkttCYRYPNirhoyhhJut9zf+qam2b1+ZjxF92JQSH8rIvnasgBpPHoyIZ/AF/oGS8QHw2
 i8JZX2q3orfCBqLQ8lP46a687tVDlH0RIl7c0nLfNOycuwips6tZZvm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_191020_108664_F088887E 
X-CRM114-Status: GOOD (  10.30  )
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
Changes in v6:
- Solve compilation problems and dropped disable rtc action in remove funcion.
- Link to v5: https://lore.kernel.org/r/20241108-rtc-v5-0-0194727c778b@amlogic.com

Changes in v5:
- Some formatting adjustments and minor fixes were made based on Christophe's suggestions.
- Link to v4: https://lore.kernel.org/r/20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com

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
 drivers/rtc/rtc-amlogic-a4.c                       | 474 +++++++++++++++++++++
 5 files changed, 558 insertions(+)
---
base-commit: 8a2c49e0fd92e6760636bcfbf11e11d9ddd61cf9
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3824CF58C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 03:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9szVE1AGBMVhL7Hp24MrYECuZMJwNNLyXY84SAYNdsM=; b=DtroSxYkSvqJ/K
	mfr8LILJiresFKk9aN5dN+PfLCCA2W3evSmimPslfD4iiTe8SXW5p3pGnqBzLaZbL7WaEJOMYcSZ9
	GKn61mOT/fTMRbFeT9pwMrUpfllcS4JfHWWOuq8h9r0t8HfSO/gDR/RZVbahFIJp/c0/FsBNZO8sR
	/WMPvcV1rkYjRcqx/n8vK0qbZZj7ssy+oUs+owrI4RyJ6tXpWd9pw0Oi79jcw6L0fMD9U4mIW09XV
	8D6Rsn1zoaFQtIq3yI0rkiV8UcnG/HBM2+twtd5xxiyfBhcZob6PxYaJnGF7xh8mlK+gQbU/RanOg
	Kek4jrWsYeJajYa0H/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srU2y-0000000BLTD-3Dp3;
	Fri, 20 Sep 2024 03:11:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srU2u-0000000BLRi-3Sv5
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 03:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 227E75C4904;
	Fri, 20 Sep 2024 03:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A4E3C4CEC7;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726801858;
	bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FfdGNfJs3xXrogoLROEuJoEXYY+YfKX+S+FpOH8f31+FsKqApheF+v8ga1Xm0iWOK
	 ScRiCJ5XFNoP1E01uvRBj7NnVRUkEEgAoqkAE17160V37FxUlqrHfqkVXzJz7VH9NG
	 ImMCkjPNxHDhrU7l3umu52l8Fc2BES8uIk2tTNLliKguFbBcjeLHBQ1e5WDl2ful+L
	 TuSq5zSXX6hiKH3PiBPqH4w+n0nUfrxctIPKBkRNNZt6foO6ZlC9WOLDeIJ5JrFG+0
	 XE0qG3YcCsF/cHWAHr3eIaei9VOrjv9xXhHVUOrUdrdOhJwj8odfMM4twRrUPxfwjU
	 3AoMiZpIhdz8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59307CE8D62;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/3] support for amlogic rtc
Date: Fri, 20 Sep 2024 11:10:55 +0800
Message-Id: <20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMDn7GYC/2XM0Q6CIBTG8VdpXEc7HESgq96jdUGAypbS0Lma8
 91DayvX5Xd2fv+J9D4F35PjbiLJj6EPscuj2O+IbUxXexpc3gQBC1DIaRosZSitU0yjYZzkz3v
 yVXislfMl7yb0Q0zPNTqy5br1I6NAy0oCV8wZVPxk2lusgz3Y2JKlMOJXafgozAqEM0IKcVVO/
 yv+oxi8Fc+KVQakNKU2CFs1z/MLl/npkwQBAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726801856; l=1589;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
 b=uJD6SDKCaARt2GvUkVjfOKpc3p7WmcpKrCtYamVgKYVkmUJ8p1FcbSC4CVK4F9Ux1yqBEhbFw
 6RjgR8C9736B16+Tc8Ez4mzGpMAqE8qnuEJpdWbEb+vCysWBazzrZTE
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_201101_038955_04CD02AF 
X-CRM114-Status: UNSURE (   9.28  )
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

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F17FC27C44
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 03:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0wP8/M/V0/uHJRy3S3Qn25mFTIuWIoqIHFE7yYig+0=; b=Mon5AFVPHFRQmt
	2OdPyB3q1W34yAZaB2MQcyW4qE2VvUUm6H8L2JNizYa/7UQXmxZ8mDp79s+16I6ASXbYzzjtPEGQM
	sFkmCAQyRVKttUPO0T5uwEkqdPoA+wbVThbgMFOYFhhONfBvnzn1O447lUml8pRuyT7RGbHxPNlEy
	Hg4OiHcjVx+PDcPr4EetZAF0U1mmFA6Mn98vcsYzUxSH20xEMu7y+2etqViy+D+qeL5rkGD2DBi0M
	6MZAkNlGGUlAQeTBSjppSlxTB2gcA7wgKFfJPChOxFtxwwWembWnoRlb1WPs3NQOxoRDpOWXjWWdm
	1FKaNlIbt70dpFzSsp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9i9-00000002fBE-2CvD;
	Wed, 29 May 2024 03:10:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9i6-00000002f9l-3WTI;
	Wed, 29 May 2024 03:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AAB03CE149F;
	Wed, 29 May 2024 03:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75CD8C2BD10;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716952236;
	bh=IgTEkVYd46Ru6As3hGpXvTy9hURuoQjJ4M75ryPeIBQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iEjtP2qpfamyS3nvDrUSSup1aUJp1DCxrxKAQnLjRU3bipLyP9uPtTgQ2BlSXOH7X
	 VhELVBibjy1+hdD6T2B6q502EG5X+U8nF6lUMHio2aGTnHvBLekQVyBmFKL4AMElKf
	 7bYsgkaTp8+qy1qVYBltii6CwZE2g3hwWhAmlSDMOPv2rrWTVTw4/o9jILPQqpDPCr
	 f2ILY7/ObIeJWeud+xb0LfEXuL1/USd6bKLfl9pTCwn7ymAwFSpFzcdTXB3pvIcTUM
	 cpR74z4XNBRn8fCwii+38+u5pQOV4/GXjssJznC2nexlxT+uy9/KhvlVKGKwFxXi+e
	 Tl9tO14kBAZYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6CBC25B78;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] Power: A4: add power domain driver
Date: Wed, 29 May 2024 11:10:32 +0800
Message-Id: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKicVmYC/32NQQ7CIBBFr9LMWgwg1bYr72EaQ2HaTiLQgKmah
 ruLPYDL95L//gYJI2GCrtog4kqJgi8gDxWYWfsJGdnCILlUvJYN0+qe0CzhhdEGp8mzGgfO67N
 q2hOHslsijvTem7e+8EzpGeJnv1jFz/6rrYJxJnVrL3ZsByGbq3aPMJE5muCgzzl/AZKJC2S0A
 AAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716952234; l=1048;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IgTEkVYd46Ru6As3hGpXvTy9hURuoQjJ4M75ryPeIBQ=;
 b=NG8/Fqi40DTnl0o5BZrocIxFVchLkBPLoaxBqkwU1c+QmRw1GofHLrZpide+starD0xgZ4tj8
 Zw/S3CC56lyAm7+MtKdIyrDDYx5Z2i6Gxtjne3EEM8NHZ1PdjdFaSsW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_201043_111280_D4C631CC 
X-CRM114-Status: UNSURE (   7.58  )
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

Add power controller driver support for Amlogic A4 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- dts: Move power-controller node to be a child of secure-monitor.
- dts: Include power head file.
- Link to v1: https://lore.kernel.org/r/20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: power: add Amlogic A4 power domains
      pmdomain: amlogic: Add support for A4 power domains controller
      arm64: dts: amlogic: a4: add power domain controller node

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 10 ++++++++
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 28 ++++++++++++++++++++++
 include/dt-bindings/power/amlogic,a4-pwrc.h        | 21 ++++++++++++++++
 4 files changed, 60 insertions(+)
---
base-commit: 456f4f5e6e6d3a2228501068a37ce13fe0b333d4
change-id: 20240528-a4_secpowerdomain-5eb005648930

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

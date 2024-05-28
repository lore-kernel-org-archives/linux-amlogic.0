Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91344C25B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Us2w55AmK3ib45K0w5MN1d5sY5arDr/6MePWI++49JU=; b=KTtkgQ08FYqcOq
	DwfXHV8xSklgGZld7jgh3kQZdGrMSAW8v1BexitSEhxlmJemxGVIVtXfip2fXdngfIghJzf8bC1bI
	wG895VJsBhGbkVpQ47xta51SF0GMLrworWhCV800j44LICgsyNx5YYcfK6ijwENDyqwJObfYh/Dwu
	pQSCPT6uyNy5Yp7GpXrPpgrKVbliLQoCDz+1Oy7/IpUnnmS2BOKGIvOT460ryON/6M9pbf73JnOav
	na5/0eUZ4pkHANMPNJAPIYz5fWd6WerUqdlSF+0jNTOIMPw5lLN7Rn7A1+ILDSMjCV1VKqILOdQDv
	dP2IL9/Zf4KHY6bw6zsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMt-0000000HVNE-1Xe6;
	Tue, 28 May 2024 08:39:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMp-0000000HVLN-1CVB;
	Tue, 28 May 2024 08:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 036E3CE118C;
	Tue, 28 May 2024 08:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37E53C32781;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716885572;
	bh=bfGDc5/xHmz//Yt7VOOfRU/PyB095+4Sl6kUXfSweuI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VEzPG9hm9TDJBx/sr/BqWeQaq8j0nJ6tfgTwk8q9BOFX42wZeunWRD5D/PyFTbzuR
	 5a9QCa7bJ0E2hX60hjdrFVKUFvKPtXOUtVFckIRGUQ6S2xgwH3rzjf6L9N4rWyAuU6
	 nBZ/iJ7E97lhhjJiov1RWbQy2PafWME3tfw/wL21cAspM6rWLLM2edcfrvSg1gp5/o
	 7/tVOyKikA0gSBwV94Ro3S0xoDgbo0gK9IPxIuCJdXoTmCdWMfmxOTWBgIqVM96ejd
	 1lWCLrHj5SUIdxl1x0PzTvUvIcb/W7lLqxR9EIZ5bN/xmMt0RYxPt4dg6k0ZmrjX6B
	 QETqQoMWxt+JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22624C25B78;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Power: A4: add power domain driver
Date: Tue, 28 May 2024 16:39:27 +0800
Message-Id: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAECYVWYC/x3MQQqAIBBA0avErBMm06iuEhFmU80iDYUKwrsnL
 d/i/xciBaYIffFCoIsje5dRlQXY3biNBC/ZIFEq1LIVRk2R7OlvCos/DDuhaUbUjWq7GiF3Z6C
 Vn/85jCl9vNEVQmMAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885570; l=885;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=bfGDc5/xHmz//Yt7VOOfRU/PyB095+4Sl6kUXfSweuI=;
 b=zXzrrh7KUaH5eZOcybvVChgnCMLz6xll9cNsTL81pYUzbiwrYghjd8a/+Z1vCUYKHlv6pZ50p
 kY6IenT6z00DVwq3DTG04hEuWYeuz6PWUcz8Sfdvaw16xH2bdz1h3SS
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_013935_530962_7245AA9F 
X-CRM114-Status: UNSURE (   6.56  )
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
Xianwei Zhao (3):
      dt-bindings: power: add Amlogic A4 power domains
      pmdomain: amlogic: Add support for A4 power domains controller
      arm64: dts: amlogic: a4: add power domain controller node

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  5 ++++
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 28 ++++++++++++++++++++++
 include/dt-bindings/power/amlogic,a4-pwrc.h        | 21 ++++++++++++++++
 5 files changed, 59 insertions(+)
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

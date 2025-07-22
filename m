Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2589C83F1A
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MM4uuP1tzGin6Sr76kmYrpxJKGVQP5ynGCEbJjCKLAY=; b=wls18S4GFBQsqD
	kgJl5aYMUSJ/VEoQl+bgu80PE0lTLYh/wDE4eVDUoGNvA4CTU6DmZhS9w+gWfQuGj44gwb4kYirUh
	tpFyBoRhIsDl/DZlNYQ26CDnbKdzDRKfteT6nWCKRVc544CbwCYzM7/7HixBe+PbnpX3t9B8WQJQ3
	vG5pHTTV63x0oXieK9QoNi1fUTLT7+OFJi25UmYlT2WtohXHiNjmZsND7I11ncWKkmsq+nMPTPIF5
	75NmkLTNNVUP3RVtJPz4LsnNaZC8lLK+7XvT5M7Wj7+IGW9oxvRFF0flqHKVmmkx/GMQjGBS+i67+
	nuj7Xh/qQlh4EfrJ7o4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBHK-00000002IZ2-0tl8;
	Tue, 22 Jul 2025 11:35:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB8h-00000002HNo-0PBq;
	Tue, 22 Jul 2025 11:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0D0AA54160;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 859AEC4CEEB;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753183589;
	bh=eHgEpwKuiJOxUGx+eQ4DDMrajmv56QJt7Ld7EdpIPc0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pKNu0Rz2SvD4CzdXB4Lx+U5hIYKdNbQ6wNSEUhLHHjjOUc1zU4eaHJRudU4601B4N
	 2UWnciWG8MSMDRFV3ETwbabc+K/H2ga10GZdCePww/dT35hLzV1JRnX8jzVIwBKJIQ
	 PvUdHMAYyMgWnles54Z+L1aDOTzRDJCdZ97O5W3F2spUhb1w81Ad6aVjX95bi6cRQL
	 if3ktV/ZYE1uLEs6KWagcdZxxCUH2pT90HsEhWk/952qtHy8VBdyaR/sRsVPM6uESf
	 oo5aTxlKb7wKRIjpcj0fHp13LS6lGP/eAhmcpexhikJNVVey1/c9nQG68DKpyhfFVu
	 dIqckNwPF3Mdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E17BC83F1A;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] thermal: Support Amlogic C3 thermal
Date: Tue, 22 Jul 2025 19:26:26 +0800
Message-Id: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGJ1f2gC/23MQQ7CIBCF4as0sxYDaFtx5T1MF5QOZZJSDDRE0
 3B3sWuX/0vet0PCSJjg3uwQMVOisNaQpwaM0+uMjKbaILlseS9uzFzY5jB6vTBjJ8u1HEfbSqi
 HV0RL7wN7DrUdpS3Ez2Fn8Vv/Mlkwzrr+apVWSnSKP7RfwkzmbIKHoZTyBQq+Fg6mAAAA
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183587; l=986;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=eHgEpwKuiJOxUGx+eQ4DDMrajmv56QJt7Ld7EdpIPc0=;
 b=LsAHDWE+cbFu9I6z5V+jNYNswC/DXYMymJ1Bs7O0kSRFhjliia+LLAEk1K/fy/MTeAsRAV8NO
 SbxVezFceXeDGYxfgV9HAbdUFhoftmYo1rrTRQ/XBqJ7ZZ5yYwIsKSW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042631_221606_B5D39B44 
X-CRM114-Status: UNSURE (   7.49  )
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

Add Amlogic C3 thermal compatible string, private_data
of driver and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Modify the binding file according to Rob's suggestion.
- Link to v1: https://lore.kernel.org/r/20250718-c3-thermal-v1-0-674f9a991690@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: thermal: amlogic: Add compatible string for C3
      thermal: amlogic: Support C3 thermal controller driver
      arm64: dts: amlogic: c3: Add tempsensor controller node

 .../devicetree/bindings/thermal/amlogic,thermal.yaml          |  4 +++-
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi                   | 11 +++++++++++
 drivers/thermal/amlogic_thermal.c                             | 10 ++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
---
base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
change-id: 20250718-c3-thermal-cfdf0a2bbf52

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

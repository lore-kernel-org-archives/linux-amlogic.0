Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52235C54E67
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2024 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rZOAqcy+Hv/osWOny75b1vJBDWSV1L5JWYrcN5lwufE=; b=gPGmNT4mNTHHb6
	8HRjF//8O+7buagWCcZ6NGKWghj/muQYdis6CwvJnwQBLzWnz0ZUXcmlEcrJvgoR/31QLObG9sd6z
	JsS3RLQLON30slfe+XOi7jXA5KAZJgcRUrOtTS/O9WpaMdR3s2ZleCBk3GBXv+eGWntc6Twjw6sFY
	MCVGra30tQu/qTTvI9/aMI90JjbQERk1YISOnWyAiZaKTekzllqqeAG4rAn5nut6nBRRRADeF/kEi
	aZm4x5yCPcHHMTokn98Rcg6/reNgSQ7peiFfg5btvjxz5ejOUXd/CGT3G5WjbviqgrOclO9CPxPpA
	MAvneTvJyHUqUMv4irfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUr-0000000GXyO-09ge;
	Wed, 20 Mar 2024 09:44:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUn-0000000GXwL-3X2g;
	Wed, 20 Mar 2024 09:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D978A60AF6;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F8BBC433F1;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710927868;
	bh=57GTWlJ10xHsfYL6870kURGURrNt5JlLAOfaQw5P9Mw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IiQ/KxHjF8Wd5+l6cmnn0tVi1X74aXKgNlUIjiSCypFX/Vo4d4HGRUFOzIhj6LhXi
	 KGMNXYfdkatHKKiklOBSpvpSlLYaev+Jtb2JOFstH3tEMS6jd2GCLBLeBA4Dqby1Pq
	 Ch0U46U7VrckcTloNs3lHlWNuYTvbXreBw9JfRitoWnOi7Nccx8S7KtBzEdNx62Tcy
	 XSNdihlGJ2xFIdfsHFN2/DSBu1Vl8rHODiINu8/iMEChOZVz+v+9pyfWYywp1LFDkO
	 Brm+GDyFENOxAQGtsR+ODQvfr/DP12LxZiNNXLxQnsNJU9G2ear/WQ6qNOXn8nv/t7
	 oD9MLlf5zONyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0B8CD11C2;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] Baisc devicetree support for Amlogic A4 and A5
Date: Wed, 20 Mar 2024 17:44:12 +0800
Message-Id: <20240320-basic_dt-v2-0-681ecfb23baf@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOyv+mUC/23MSwrCMBSF4a2UOzaSmyZWO3IfUiTm0V6wjSQlK
 CV7N3bs8D8cvg2Si+QS9M0G0WVKFJYa4tCAmfQyOka2NgguJG9RsIdOZO52Zaic7JRQWmIL9f6
 KztN7p25D7YnSGuJnlzP+1j9IRsZZ5xGtbzU/X05XPT/DSOZowgxDKeULHOVI+qIAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-serial@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710927866; l=2117;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=57GTWlJ10xHsfYL6870kURGURrNt5JlLAOfaQw5P9Mw=;
 b=jK6abUosSrr17IwEhUIrG13N7aYIqvBJbqHa/G/LMGiennQnD2whXlY0q+l/D6h/ZnyOdLZ5Y
 pNQOW88O1UfBKE2djyM09f5JDJ3fXPmBlJvlqA9saYln1HnkZzV7BBn
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_024429_999211_4D23874C 
X-CRM114-Status: GOOD (  11.44  )
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

Amlogic A4 and A5 are application processors designed for smart audio
and IoT applications.

Add the new A4 SoC/board device tree bindings.

Add the new A5 SoC/board device tree bindings.

Add A4 UART compatible line for documentation.

Add basic support for the A4 based Amlogic AV400 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Add basic support for the A5 based Amlogic AV400 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Delete bindings for uncommitted boards.
- Add A4 UART compatible line for documentation.
- Use common dtsi for a4 and a5.
- Fix psci version 1.0, and fix some formats.
- Modify secmon reserved memory size 10M(actual using).
- Link to v1: https://lore.kernel.org/r/20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com

---
Xianwei Zhao (5):
      dt-bindings: arm: amlogic: add A4 support
      dt-bindings: arm: amlogic: add A5 support
      dt-bindings: serial: amlogic,meson-uart: Add compatible string for A4
      arm64: dts: add support for A4 based Amlogic BA400
      arm64: dts: add support for A5 based Amlogic AV400

 Documentation/devicetree/bindings/arm/amlogic.yaml | 12 ++++
 .../bindings/serial/amlogic,meson-uart.yaml        |  4 +-
 arch/arm64/boot/dts/amlogic/Makefile               |  2 +
 .../boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts   | 42 ++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 66 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 40 +++++++++++++
 .../boot/dts/amlogic/amlogic-a5-a113x2-av400.dts   | 42 ++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 40 +++++++++++++
 8 files changed, 247 insertions(+), 1 deletion(-)
---
base-commit: 7092cfae086f0bc235baca413d0bd904f182670c
change-id: 20240312-basic_dt-15e47525a413

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

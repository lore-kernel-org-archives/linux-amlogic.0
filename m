Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B0DCA101F
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Sep 2025 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t73jz2Pm/o0yy3H3yZnO0bVUmjd3wHqpbQC7KuYdH8Y=; b=IQrKHep1Vh80Rz
	qfDNZDWXE1ony9TUScs2IkCUDYi/fyyhwnmlidh9xqfdCVyoFIXV7S9eEJPOsUm8rD82QqsvQ+hgK
	CgTfcewTnPKN993BAztLLtZsb+l0vvXjGzKgzuSlLrf+c21Fvu0MWKAP03fnY0tqdtawevnejb6c5
	aOmB0+vLKScIpsxifRATE/JcrgMnaOU6swxmZ+NJMgLh1cyBllIfA3djaeGpH0087aU1l9P3dCgeu
	3PeM9nKYJC3O7xQBU79RH33kL820MxM8i5GiswKuGz4w9e82sascDdjspvmvUq8xw3jGHr55s17fm
	xnNeqTlLsliYon6o+AHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHul-0000000DTUf-0Yib;
	Wed, 10 Sep 2025 10:18:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHuk-0000000DTUJ-1QL6
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Sep 2025 10:18:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD32A60247;
	Wed, 10 Sep 2025 10:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F339C4CEF8;
	Wed, 10 Sep 2025 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757499507;
	bh=BbK/5/N5DEttwRbyK9p+3UuFCTTMS4wF1GIjggC2Nlo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IVK4BzX9QJORREzevtaL/zp7np3zcM2kBPoWYxXuZBmihwBhvvMiN/kTSJmaj6WMp
	 Y+l08htLGFW0Vegr4mY6eYU0cqBxdlbInJNPCMtS/83iJc9dI6RxbKOpmTY93d/W8q
	 XAUlwuAGhrugVic0Ih7dDG0z83fe2A4CbGFlU8LAB8zyQzyrz6TVyvOt5VBBaPzVrL
	 gyUz99aJ+ypJeL+oQugqYWFzxiIvXkQl1j/jS7dwp7Ocuop7immNEHioGfOMYJNVnU
	 9+vq82TM3qrjvXaOtYBHm3ppIl1rSv8jMGVb/BpiJ62mb2q7ctJ8hgUJe72R5q+70M
	 FCrtHTn+bvRhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A841CAC587;
	Wed, 10 Sep 2025 10:18:27 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] support for Amlogic SPI Flash Controller IP
Date: Wed, 10 Sep 2025 18:18:24 +0800
Message-Id: <20250910-spifc-v6-0-1574aa9baebd@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHBQwWgC/2XMTW7CMBCG4asgr2vk8c84ZsU9UBexMwOWCkExi
 qhQ7l6DGpoqy280z/sQhYZMRew2DzHQmEvuL3Xgx0akU3s5ksxd3UIr7VSjrCzXzEk6j0DGcSR
 gUX+vA3G+vzqHz7pPudz64fuVHeF5nQvNb2EEqSSzJaNIY4tx356/+mNO29SfxbMx6oXTMDtdX
 QQIjDa6pMLamaXD2ZnqPAWNykLnGdfOLl2Yna0OyHnuTGDX2LVzfy6ot3PVBdQxgfUdeP7vpmn
 6AdSb/JR8AQAA
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757499505; l=2152;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=BbK/5/N5DEttwRbyK9p+3UuFCTTMS4wF1GIjggC2Nlo=;
 b=3z0r6eHSJGhKnflgUXglWaK8KQfYOk5kSmwKX6tRqdVICuN0wOphryrB0BIsoIMKMK5mhBoze
 Q5tA3dbEuWDAlrfePULm0R0q5pOYCFIbv5Rjw7yOKcn9OxSoMXPAHK4
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

This Flash Controller is derived by adding an SPI path to the original
raw NAND controller. This controller supports two modes: raw mode and
SPI mode. The raw mode has already been implemented in the community
(drivers/mtd/nand/raw/meson_nand.c).
This submission supports the SPI mode.

Add the drivers and bindings corresponding to the SPI Flash Controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v6:
- Fix compilation warning appeared in v4 version tested by kernel test robot.
- Link to v5: https://lore.kernel.org/r/20250909-spifc-v5-0-962bc147d17f@amlogic.com

Changes in v5:
- Initialize local variables and handle exceptions solve compilation error problems.
- Link to v4: https://lore.kernel.org/r/20250829-spifc-v4-0-1e57fd39f584@amlogic.com

Changes in v4:
- Reword desc of 'amlogic, rx-adj' in bingding file.
- Link to v3: https://lore.kernel.org/r/20250826-spifc-v3-0-7e926041d7f6@amlogic.com

Changes in v3:
- Restore message description and modify subject [1/3] that was omitted in v2. 
- Link to v2: https://lore.kernel.org/r/20250821-spifc-v2-0-b119f64b5c09@amlogic.com

Changes in v2:
- Remove clock reg descriptor and get clock from common clk.
- Remove ecc and ramdom descriptor in bindings.
- Modify the format and message description.
- Link to v1: https://lore.kernel.org/r/20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com

---
Feng Chen (2):
      spi: dt-bindings: add Amlogic A113L2 SFC
      spi: amlogic: add driver for Amlogic SPI Flash Controller

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spifc driver

 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  |   82 ++
 MAINTAINERS                                        |   10 +
 drivers/spi/Kconfig                                |   10 +
 drivers/spi/Makefile                               |    1 +
 drivers/spi/spi-amlogic-spifc-a4.c                 | 1222 ++++++++++++++++++++
 5 files changed, 1325 insertions(+)
---
base-commit: 475541d2f3dfe72e8cfe94bfb1b824030f8d9b68
change-id: 20250804-spifc-5761e35fbe1f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

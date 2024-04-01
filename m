Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB7ACD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 10:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EevT86aEouri7NJYIqY5v9tFrbvBH+P7Yz98s2W0tCw=; b=SUB6ZADwEROzqQ
	pJgqPFHqfpiJjQI17KfBPMI2Z4HMKxVpW4g52ojSLJXYCKDvFwahnG+4RnjGyCQBZQxRnrd1HpyBo
	26pJB1LMwG6PlMD9s3VJy1jjHbsAul6kl+uxZXdH50o7sMX1OZyzzEG2J7OgZQ7Om9HgLf69aJ9Sy
	veow/SO5OBxhqq2mwqAyl5ybepjCySafrXpN0ncPEFJPzwi0yy6MNGxk3O4MoHZfJf5gkvHVwZwFw
	VwztFXuv8LBPFhiiE8FXaebxiFE7SM9ylN7EpVdxN2Jnx7ZS2ZurM8luV3knzOaZ6lxFUlaBpt0Hw
	Fdp0NHHqSugnZrb4P8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEdE-00000007Qs0-38oJ;
	Mon, 01 Apr 2024 10:11:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEd1-00000007Qik-1puW;
	Mon, 01 Apr 2024 10:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 831B0CE0B27;
	Mon,  1 Apr 2024 10:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC495C433F1;
	Mon,  1 Apr 2024 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711966254;
	bh=N5wbw2MnTKS/5RK9ZX2lKvMkhhY+eswYx65v4Ex7yME=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JqZVze4Sf9kDR70QfYPtILbk+0ghgXLLKUbEFUyumrEKnQMxb8IQjvf36WqkxzZMD
	 6hzSb2twRKbs9P++P+nHyp33GUkgRyW3UizQmbT/MkObV4hpPIfEekNimvYXFvA6Is
	 IqcHUDHIHTbxS0p620y8UhWWAdTSdFDDqq6HqvTxfVDLsNOmaTRM0kVIhqPrLwq2Xl
	 ztXC6FhtrvjbB0KEMAvBYS52gumewKpLg4mUvVEf8yzciF5y0YBHGfMlIAt0zZ76YM
	 btxmzu0ch42KBc1nASTPzhJVQRsGbTQa3BZk+Rtv/zlKoCiGs6DAHib8crhnOpzqd9
	 6CTFAMQhYSemg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DF3CD1288;
	Mon,  1 Apr 2024 10:10:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/5] Baisc devicetree support for Amlogic A4 and A5
Date: Mon, 01 Apr 2024 18:10:48 +0800
Message-Id: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACmICmYC/22MywqDMBBFf0Wybkpm4quu+h+llBgTHaimJBJax
 H9vdGWhy3O55ywsGE8msCZbmDeRArkpgTxlTA9q6g2nLjFDgbmQgLxVgfSjmzkUJq8KLFQOkqX
 7yxtL7z11uyceKMzOf/ZyhG39E4nABa8sQGelEvWlvKrx6XrSZ+1GtmUiHlQUBxWTWtZgtG1Rt
 sr+quu6fgHmGofN3QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711966252; l=2281;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=N5wbw2MnTKS/5RK9ZX2lKvMkhhY+eswYx65v4Ex7yME=;
 b=HJ4Y6rVs3Ko4rtxCb2S3YncOGcj95WtddZ5a28tWO5DhOf4QZsNzBblo93y0AcDmkm0MIG44a
 oizL5JSYrk5ClFUJCFY8afUZbCqUms1epCd5QivqZcogc7AIatuK3iC
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_031059_949298_24906A73 
X-CRM114-Status: GOOD (  11.47  )
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
Changes in v3:
- Keep alphabetical order.
- Add the necessary spaces.
- Link to v2: https://lore.kernel.org/r/20240320-basic_dt-v2-0-681ecfb23baf@amlogic.com

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

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D405EC25B76
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6DdzueHs/D6xEAXNAyZ/y9kSASjPWUPVAGAV8Xs6sQ=; b=UR5p4mDtYPfqJ4
	KVd7CRiW61kA0n0wfI3mVasRcMzSYkmCjUZC/cYN0zwwjo6Pj4twvFmLqn1ecvDVTHyYgJX5exJJZ
	WCM7H8SY1NwWdLFsHcBC6wjyETexnVFztW7iZEz+bFSJ0Kx5JuEE3vh+MasBoPyv1JzF75Fjx9VJ7
	imEzejeBxxxOtBWCkdR+RrDqJK8ZzLBGgfft91bNYCCgu/pG1KeHS21FDcpwqJ4Akt5EgDuKlXQVH
	f9bWg5HnX++Z1d8rdWrGPJEOouPhpFJ1M31VTQa8rmBy2tgIBBRrpo74saMAu1dNQKhRFpac2rBcb
	GP76TFmSaDJ6w9DDPv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtmm-00000007PSY-1tDx;
	Tue, 11 Jun 2024 05:11:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtmh-00000007PQx-4BsT;
	Tue, 11 Jun 2024 05:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15895CE0929;
	Tue, 11 Jun 2024 05:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 281C7C2BD10;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718082660;
	bh=a1yCcNo00YVw+JbGiKiSn/QHOttjkTM0NAqfh9YXZrA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uggSy2wcxCeuMHpNhrkm0bzwOYCIcJcZECvpe65lQLkrX3cDvOFTQTaEXQ28shxFx
	 dT5C394l/6LKypiDoTgdjnfqdU7fha6dY29reltS4SRR3rVnT+EKmF+uuPj1yu+O3w
	 +8K+20GxdgbPPa2TqqWMQ+Ct6x7L1PfhnfNxLnNKO/r0cpylRzCv4zx1tZZBul7qZP
	 qHAyxIoMwzcKMnsuSndHgqzNy4ezLiTr/nrgSXSR4T7+YP0jaMsv/myQ77hPTZrGD7
	 dUnuC7gMMWSNofmtooux4pPqtYmPxW3ZPwxlN8zgBKhdb+MDQwHS8odUOiL/7QiDAb
	 OTm5WzwbXq8Pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F144C25B76;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Pinctrl: A4: Add pinctrl driver
Date: Tue, 11 Jun 2024 13:10:56 +0800
Message-Id: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGHcZ2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3UST+ILMvOSSohxdExNzEwNjA0NLQ9M0JaCGgqLUtMwKsGHRsbW
 1ABgVCJtcAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718082657; l=963;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=a1yCcNo00YVw+JbGiKiSn/QHOttjkTM0NAqfh9YXZrA=;
 b=CZCp68RkKk3QYBnZehamSHoVmqDw+Dzifk10pmgVUl0JpV1jociJdPiNpRjHkbrWa+WeSTn9m
 0+CraFm8i7UDbxmz6UALLINVPDDwMSzAmkl8uAHpkYTKEzmUfVrJhRX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_221104_254646_9CDA1CD4 
X-CRM114-Status: UNSURE (   6.98  )
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

Add pinctrl driver support for Amloigc A4 SoC

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1163 ++++++++++++++++++++
 .../dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h    |   21 +
 .../dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h  |   93 ++
 7 files changed, 1322 insertions(+)
---
base-commit: 87501b7ca0005c533d770d37e0047a60954d986a
change-id: 20240607-a4_pinctrl-44740301915f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

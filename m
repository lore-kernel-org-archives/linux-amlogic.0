Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71DBD2127B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2024 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lz/y6ij5Wr2V2dILFPtozQOlqiFPQyuAVvtLGxUhGG0=; b=WVxExKSpq5SA8w
	nT9pY36migKvhrSXfXeREv9ObeKDDrbbJmMRMBbYUSj0wc4ZAjjpJAihxZrIJm17GOW7TmxNohtu1
	V4l5XCDi4T6dCPumhJmPRoKs+Z/hdSKXgaLEvoU3eORNc5aqExt1M3raMEtjtJwjXFcIHqJV62r0r
	oonCuvyUZLLYxnuOnVde4BmXmuUBLNkq2N8zoM1TIT6YWovqz5xrUDiXJ8fQmXTV3izVvku2EVQrb
	IqoFZjT7qIMoHxzef2RXhbSlywjh/1de/QVKmvLFRdGr/hogkZ7YTSilAq+2G0hT5qDIYrA1O4E5K
	ad/z2wlDa9alG9Gh+tjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iBA-0000000HTjm-2SeY;
	Fri, 18 Oct 2024 08:17:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i4V-0000000HS9d-0rVZ;
	Fri, 18 Oct 2024 08:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD812A418F1;
	Fri, 18 Oct 2024 08:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 852F4C4CEC3;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729239053;
	bh=qam845+M054/HCuxE2Dub4pqx0T6LNs2036Ba2LFmY8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CzTB57SbnE7u8H5SDZ/GNUvfPjN+H+Y/TAZeCNvH9Y8Dy/fjEueBtFDxjY+1RK3Zz
	 +FxIrlgpoc5pePyfVeb/4yGm+YWqaeggvOlieLs6+3SOsCp5tii3ndWg0R5SqAij3A
	 VSDi9B8Myyif8qUjhqFNogyZdzRsMkRdTnmGqQ+VoFZiQL684Ph4a9UPJvlwYss+O+
	 05+kckJ6drNkAJ0D4nAWsEF65AEN0jvhkE84QXF1nX98G0VaOkoKy6RkLiTeyIVbY3
	 8qEhM8ofu2pB/yktIZouRcpbu13kcIvfWBC0h1A1kC4bFs5MDreLGTb8QeKwgfoyoU
	 RlO7d9xdjMRjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FC2D3C544;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] Pinctrl: A4: Add pinctrl driver
Date: Fri, 18 Oct 2024 16:10:49 +0800
Message-Id: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAkYEmcC/03M0QqCMBTG8VeRc91iO85WXvUeIbHmSQ+ok01GI
 b57Swi6/H/w/VaIFJgi1MUKgRJH9lOO8lCA6+3UkeA2N6BEraRCYfV95sktYRDy0qoHWmVIG8i
 HOdCTXzt2a3L3HBcf3rud8Lv+GP3PJBRSlGS0PVUOzxVd7Tj4jt3R+RGabds+UeMFT6YAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729239051; l=1206;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qam845+M054/HCuxE2Dub4pqx0T6LNs2036Ba2LFmY8=;
 b=iq5sxMdSUIEb/ykt5CpcF6wTUW7k5vVqa1/aARrx4VQWbC7RVa4rVQEkZ2/RvI+s4XmHmW66h
 ZH7b6a8vJc+C4s/evg5ba7t8c9UZRdHkZw1MOWQX+Fz8dW58kTSduDI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011055_397884_AAF2838C 
X-CRM114-Status: UNSURE (   8.17  )
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
Changes in v3:
- Remove head file from binding.
- Move GPIO define to file *.c.
- Link to v2: https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com

Changes in v2:
- Use one marco instead of all pin define.
- Add unit name for dts node.
- Link to v1: https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/

---
Xianwei Zhao (3):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   35 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1253 ++++++++++++++++++++
 5 files changed, 1297 insertions(+)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

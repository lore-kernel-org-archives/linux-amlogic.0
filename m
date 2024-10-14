Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55784CFC527
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2024 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gpFfmr7IanXRHhZJ+FDy7t+oUSIvx85B+aqV9F/KDyM=; b=WjWXvpYEZN/PAe
	5j9hVd8nbS/BPgBVnF543CLe3lAQQucZdOv97JTcDNJtZg8sP2Bcq6qSzh+xR0eVKuGON44y1RutF
	2ux8uOVLYIxt3peOjheZra7RflGptqjhksXBJ6/beCM9ciWH/VgCd+oUDx1Lx2VntfuztV55zsXQk
	7sCwBQ/iE6LoL4hj4dbyENp+NCXQULodwNWVY1eny0YH0B7joDBt6n8Z+5PvyvnGcq5sK6pY5RZ77
	0r5iy4okiTJjWF5Rlga9LZMT/lNOfSN8IvVp3aUS4J+HpivombEuWgDzDfeh6LfkLFE1mL44lPXZv
	CN81SUNtrAVOC8l0tgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0HHo-00000004V1C-3z4S;
	Mon, 14 Oct 2024 09:22:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0H1h-00000004Qpa-3ZVe;
	Mon, 14 Oct 2024 09:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B99FBA41384;
	Mon, 14 Oct 2024 09:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44284C4CEC3;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728896764;
	bh=rXMah+J87oYT3vd/VshwC8Oh5TzIdt2Y9rGblinQcgc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=k8uQ0OXB7Kv8+1JDjTKonGSl/O73Q7rvYr3unxfB7J96UmedyS1blqe1UNzCjtMJn
	 2MN13XSh30iY6q42vEZWynwbA8dqub53NO6ILCDlG4p0fcVFyw5ohvob54xZItvc1q
	 xVjslnxZIg8Mfp6TecsEhYGpGQY+oT+L0yw6I9dEsH+LfoqtLWseec06YNO1woYb+C
	 XvKLBiqj0dyf6hDW6FztRUCUZZxvY63mDIsTK0cOpaadX4RwMo0hIL9EyyUApOYzIN
	 Em1i8Dfw58afco+EK6YxCBmtg3NKReCHveOil2IkBwmPT0oUo6ng0Z7arSRHa2h0LY
	 Y8zPHNCSJlZQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B05ECFC51B;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] Pinctrl: A4: Add pinctrl driver
Date: Mon, 14 Oct 2024 17:05:50 +0800
Message-Id: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO7eDGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Mj3UST+ILMvOSSohxdA8sUwySjREPzVBNzJaCGgqLUtMwKsGHRsbW
 1ANHff0ZcAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896762; l=1092;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=rXMah+J87oYT3vd/VshwC8Oh5TzIdt2Y9rGblinQcgc=;
 b=zE3a0ATHwkt0UPDkqLiAfcZlwI7i+KGHXLiqYxVGuW8pgGCunXwkYetcGBd+Uwi7VDAZiZr7K
 8jbTkxDvx04AbcAAIUD1Yb07ySmA03pn6T4ZJs0hKuvniT23uDLnTJd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_020606_022001_4C41FCA2 
X-CRM114-Status: UNSURE (   7.32  )
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
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1176 ++++++++++++++++++++
 include/dt-bindings/gpio/amlogic-a4-gpio.h         |   38 +
 6 files changed, 1259 insertions(+)
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

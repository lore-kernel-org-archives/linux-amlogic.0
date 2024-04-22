Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B8EC07C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j1sP3ZQPs1HHzlpN3GCWZ7LUUUi1fiBRwHrictqe6p4=; b=R8XBS1+bub+m4I
	MSBR1DBkG876d0YPWP+KAef5ZdYLr8as5BaWGf0aALIxl9KYhRdImYqS9hlSINopn0K0GVs2xXABB
	Lvk/+CCf3Lzl+EltkT96hfdnuQ05x4a9hg1r2LhKiwPDpqmmYtiNouj1LoIUhyNMJzDwgw9xZ6i2T
	nOXihkDTm+HTm/Hs612NK1LANmYr3d98kI7ZneErQb1wD0/8w4jt6RV0wygy6n3+BdGtSAAb+1Cwv
	fcTWhdWzUYR0CaF8ewuQVQYXStqa5EZNNX+7C1H0f8ZdqKr0ivAazPD+SfzDJ6syXd28IorQloxri
	DKp5rtg1ZY8O3AvG5vJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrau-0000000DIpY-3z65;
	Mon, 22 Apr 2024 11:12:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrar-0000000DIlV-0Ell;
	Mon, 22 Apr 2024 11:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FF07CE0B03;
	Mon, 22 Apr 2024 11:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 378ACC113CC;
	Mon, 22 Apr 2024 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713784333;
	bh=60Nj6Eui0n3N0tnpm8vqfyc7ou3dQzK95LfY94ljJ2Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=r0gpY5K9/azlRnLLLeyXFSWAylhXDnQWwb5khECKFRQFAJ0aEFEx36KIv302Zt6lk
	 925R7ZgDUiSvfFoThBPGCD134S0n8YbNtvJqr54XrqigpGTlYGn2hWLtbbpTKliG/+
	 op1CljMdeNTSkQDrucsU91bbH8xCuT802DYH0oAJO86ivAB3PdqPwL3fLbKdt1i2eV
	 J1rEmp+DW3SWUW1+TrI/isB4+NQ/d3IbcsfrJvhj3idgzoIskZNvE0FXLFBa9tJMna
	 BcdD5WbYHgXYC37Drhjb7zyRsji4+2ZLYJdU5WkV0oAkBW2XK+3T189aHoxToqbmbW
	 SPULFniiaQVOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E20C4345F;
	Mon, 22 Apr 2024 11:12:13 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] Add support for Amlogic T7 reset controller
Date: Mon, 22 Apr 2024 19:11:42 +0800
Message-Id: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO5FJmYC/23MQQ7CIBCF4as0sxZDASl15T1MF0iHdhJbDDRE0
 3B3sWuX/8vLt0PCSJjg2uwQMVOisNYQpwbcbNcJGY21QXChuBQ92zoWMeHGvOnQSKW9HR9Q76+
 Int4HdR9qz5S2ED+HnNvf+gfJLeNMOY0CtZGXHm92eYaJ3NmFBYZSyhdgXGSeogAAAA==
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713784331; l=1114;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=60Nj6Eui0n3N0tnpm8vqfyc7ou3dQzK95LfY94ljJ2Q=;
 b=/gYjYSk1vpwpkjfjMUbBti+TUQEAmVkAzsRF+ybxSZczfGfjPre9hMD1+0lbyMdq48VlAUv76
 e1nzmYjH+6PBDZqJxUF9CDf4k45OZe3hoGe/2cujuahY92nBy7spKPX
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_041217_332303_B8A563C3 
X-CRM114-Status: UNSURE (   7.77  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a new compatible and device node for Amlogic T7 reset controller.
And modify the driver accordingly.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Changes in v2:
- Drop the compatible comment in dt-binding.
- Move t7-reset.h to arch/arm64/boot/dts/amlogic.
- Link to v1: https://lore.kernel.org/r/20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com

---
Zelong Dong (3):
      dt-bindings: reset: Add Amlogic T7 reset controller
      reset: reset-meson: Add support for Amlogic T7 SoC reset controller
      arm64: dts: amlogic: Add Amlogic T7 reset controller

 .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h     | 197 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   7 +
 drivers/reset/reset-meson.c                        |   6 +
 4 files changed, 211 insertions(+)
---
base-commit: f529a6d274b3b8c75899e949649d231298f30a32
change-id: 20240329-t7-reset-f87e8346fadb

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

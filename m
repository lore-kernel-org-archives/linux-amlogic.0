Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E58C3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Apr 2025 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKt7GTNP2nGXZwOjIoEtuXSm4hB58oyj8n0rRZktU4k=; b=Et9nK+fRLjeT3V
	w/1HnYu7FZAzR6MgL+0CoIXZxgETnZ6Unn8hAnhQRdTxQomzcUABxM5y/jFOjqdPI8BkprbjkGeN4
	eaJztGXDH5EU1de87nVCbZWuqI1NKG/B15dySVfLaWcgN0KlFPtUODHW7PyUn/7RQvgXNFZmGoeWO
	efKH/Hi46W0xhJGa8FcwscL6XHAXgswXH2mHlx9z1SX010hpGV+xur/poS4OR+o3zWEPj25xBE/0o
	5/40vnuZ6FoB3Z3uIODvq1Eclyhtk/0tTZBKxbNTOtCFFiRddayiDOztL5WFdPa+jAG9l2ohlT+2A
	FSYN6PDhG0MhXS3YJJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzR1G-00000001lEn-19BO;
	Tue, 01 Apr 2025 02:06:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzR1E-00000001lE4-1Wdc;
	Tue, 01 Apr 2025 02:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B23C961145;
	Tue,  1 Apr 2025 02:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E948DC4CEE3;
	Tue,  1 Apr 2025 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743473183;
	bh=N7COEdohT/p/ERmnPBTo3f+/HD3+Lg9hkfh8iPLCO6s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fMIHModYqcEylVKxLJ6SmmPyvchKUR3hqtbEWgvctIhyHENySUPfe0qFRFHT+Z8n6
	 oVCp5pUIpuwWlRzt9Yvp/bN4QaMOah3SZ+4BUV9QgNCHn3CKkZgmpSolzm5Qiu7ASZ
	 f+8suDjEk67RyO6k0GZF1YIDE9p7zpBtIVQ2IcgVTdbHTngIffp+hRn8plgpl/55Fr
	 Yj2ScPhyb+F2lV+dujfvsELIYC5U6dD8c5xW7s5dTUfsRVU6WwIiVAEH6w9bKy8c72
	 b/0OC2psWgGqQ0c4YcM42vQ9j7rmbqZaCiderJH4zsHpRqc1MVdQalFwth5iciHmpo
	 Cwv3Q3QnNyrbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A7AC3600C;
	Tue,  1 Apr 2025 02:06:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] Pinctrl: add amlogic a5 pinctrl node
Date: Tue, 01 Apr 2025 10:06:20 +0800
Message-Id: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABxK62cC/03MQQqDMBCF4avIrDslJhqrq96juAjTqANqJJHQI
 rl7U+miy//B+w4I1rMN0BUHeBs5sFtzyEsBNJl1tMjP3CCFrIUqb2hq3Hil3c84KNKkjRG2GSA
 fNm8Hfp3Yo889cdidf592LL/rj5HNPxNLFFi1SgpVtVRpdTfL7EamK7kF+pTSB97BAKWmAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743473181; l=788;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=N7COEdohT/p/ERmnPBTo3f+/HD3+Lg9hkfh8iPLCO6s=;
 b=/Y71x73Ay7L8h/1pL9RFzAr9jHHiKfMAvm5TBYQ+ExyBsiJw/DB6NQztZwR2sv6rXORs5CGwt
 OubXuc7SDE5CuePXh35gvVlaSnQmYqT1UZVqhwBFS5QKKzPURSETDhr
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

Add A5 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Modify bindings according to Conor's suggestion.
- Link to v1: https://lore.kernel.org/r/20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5
      dts: arm64: amlogic: add a5 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  8 +-
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 2 deletions(-)
---
base-commit: 79e0ecfc780aaf8c0b6658607f75a661a5f00736
change-id: 20250318-a5-pinctrl-f3c6c6aa0e7f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

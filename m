Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B6C41513
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DZNOixmwaTntF6Gmwtk5YQEvwhqKxUrVVbtx7kPBLwI=; b=GMzKD5JIPa8DJx
	N53l41hGMoNiHKUH84XZCmtlkrrRGtD7ckZLCwhUPEI7+2YxEiCV+2ssxeHm6vL4wIs+4jX9Ciqne
	TY1U0RxIAKH5ThR57szG7HmkhuAUfinCPv9ymRasvc3Zq6j3xm1atmQQo4owMBRojLfVhx1smqTDW
	GWuiyhjY9TL0HYrClnYX3VvDlBDV4pMA0pDEPT9BaoTUsJpu0Gp7FsM1QIl7R5R3yfe+Rfu5e4ruh
	Cm1aRmLgHBRlgm0z2FFmbj5eHLgT2rftNxyOERdEjuu3oXtSPVXSrr6Nk+hVMFLxClLIihzS/Grgu
	BwWp0Nh+QD0MCtT+54Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHivI-0000000GMQH-0TEM;
	Thu, 13 Jun 2024 11:47:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHivD-0000000GMOU-3iLQ;
	Thu, 13 Jun 2024 11:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CD956185F;
	Thu, 13 Jun 2024 11:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C44EBC32786;
	Thu, 13 Jun 2024 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718279233;
	bh=T7TWzD+8vHETS7BWE/0HH/nm2zj59fwupPU7gNji60w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=obikWvyDmDzPeg19DdKwLgtvwzb/Co3u6f5GnVyyMsccUsobCezJVNmXIfZK1MVYm
	 +qiHPiS1gm0Yf7BGvg/S+lHYfkQHAADiJ76KWGlMvCJoJj37Bz1wQ2c9DSOx4bBzUj
	 2yb3O7ybOTnoWr/hZcXk2bFihYXQ9TszQWGUvfP9AbKQSzfIO7ydfCdEsFbEQV/+L7
	 pn9lqSoz0k741WSkkCj/Cm5kof05x+i9OqahYELxVCX8UM4oPi83qySnxuyBV7NKSH
	 3LAM1PR1wH1yqcnlRgTZDyqXHQOcV2bGxoyzPlglUnD+aRn3EYLXDqTJgydSjIF/yt
	 +iPBCt8FVB9IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD88C27C75;
	Thu, 13 Jun 2024 11:47:13 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v8 0/2] Add support for Amlogic S4 PWM
Date: Thu, 13 Jun 2024 19:46:34 +0800
Message-Id: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABrcamYC/23OTQ6CMBAF4KuYrq0Zxv5QV97DuIB2Kk0EDDWoI
 dzdwgKMunyT+d7MwCJ1gSI7bAbWUR9iaJsU8u2G2apoLsSDS5khoACBgkfBb4+ao9NgTK5sQcT
 S8q0jH55z0emcchXive1ec28vpulPRS84cCJE8t4JcHAs6mt7CXZn25pNJb1cocRsgTJBsCbz0
 hd7tO4Xqk9oFqgSRA1e7UEYj38u6hUqkAvU06s5Yok6c7r8guM4vgEt6maCSQEAAA==
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>, 
 George Stark <gnstark@salutedevices.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718279231; l=1661;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=T7TWzD+8vHETS7BWE/0HH/nm2zj59fwupPU7gNji60w=;
 b=6BkebCfy1cxhNBjMU7JUMIjFTx2FvQuZKQkcIZQSSMDT80mg963Ob1A//ow23qj58oSLHsmf4
 4axa/XhAwEwAR6gyhqR5rrIc3duQr8O38mflObgm8Gn/ViG+Gsj4h1M
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_044716_338265_9FA751C0 
X-CRM114-Status: UNSURE (   8.38  )
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

Add support for Amlogic S4 PWM, including the driver and DTS.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Changes in v8:
- Return dev_err_probe() in meson_pwm_init_channels_s4().
- Check the result of devm_add_action_or_reset().
- Link to v7: https://lore.kernel.org/r/20240605-s4-pwm-v7-0-e822b271d7b0@amlogic.com

Changes in v7:
- Put devm_add_action_or_reset() into the for loop.
- Remove the error handling of meson_pwm_init_channels_s4().
- Remove the repeated device node 'pwm-a-pins'.
- Some minor fixes and improvements.
- Link to v6: https://lore.kernel.org/r/20240529-s4-pwm-v6-0-270f63049f20@amlogic.com

Changes in v6:
- Rename 'pwm_meson_s4_data' to 'pwm_s4_data'.
- Rename 'meson_pwm_init_channels_meson_s4' to 'meson_pwm_init_channels_s4'.
- Adjust the order of the device nodes according to their unit addresses.
- Some minor improvements.
- Link to v5: https://lore.kernel.org/r/20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com

Changes in v5:
- Add devm_add_action_or_reset for free clk when unloading.
- Replace the underscores of node name with dashes.
- Link to v4: https://lore.kernel.org/r/20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com

---
Junyi Zhao (2):
      pwm: meson: Add support for Amlogic S4 PWM
      arm64: dts: amlogic: Add Amlogic S4 PWM

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 199 ++++++++++++++++++++++++++++++
 drivers/pwm/pwm-meson.c                   |  39 ++++++
 2 files changed, 238 insertions(+)
---
base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
change-id: 20240424-s4-pwm-2d709986caee

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

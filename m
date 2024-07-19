Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E8EC3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qE5KaBHP9QgpXPyareRuMavtKqG0IHSc6jx3bTN/GMA=; b=a5cyXTLz/ryyr5
	J43P0abSrhozLCkldp4lOtFu0oXkgWTQhMT9ggktVFEGX/1+dP+OgiFNy+kVBHjVvctsPUc6UkiXF
	aQsSYYVUX1NNawoAmQEONtBcxpUeOGug/rymyuMayBLSwhNNr48VVJxBNQ3frA7AF6KqAnbTfbZ1u
	SuxsetbqQEdjrZtP3ig/TvFKOPt9Zk5Cd+x1LbryvV7MmW1WM5f0c31Ux4joWk8dndxsCLFyTL2B7
	Cd2DVYsF4BOEdi0AcnRld7RCEceO4e3n8Km2k4OIBlihRxNFy6xeQcSCChSBLGCkuc8ug+bhB42Ah
	q7RAXMk9lRvIKULPJ9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUigm-000000020yY-0gZf;
	Fri, 19 Jul 2024 08:10:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif0-0000000209X-39HY;
	Fri, 19 Jul 2024 08:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D51A3CE1AF2;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17C2CC32782;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721376492;
	bh=7LKVRVwmEVDYk3bjN/+0LigjRWWH8ffXzL4TdtBLFVA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XBirLaI7c31+5jV0NjJ0Prrd8onZrRMdkVy+LnWcv+Up3IOUq2qnISSPM1wjejxRs
	 L57tecpbWZKUcI32elU2Ic7Ff1mzG+Kz7LLv6en8tC0eRjAdrp3C97CPqwi+NGM+2x
	 7k9EkGeDqZnKgX+4BhbdUKh9gsDYPj8+e5WQoF48aSsYMzKdk+69OzlgP8xnI1Yeuz
	 KQ4Wb3ZSl6sTiywuQ3+hZMkjZaKPrlZ52YmGCE6pvIiw0HQVMUe5U9aYZSifpQeTTo
	 WSUFvwg3KhAeiSypKCIn/XC6yA300CAmNNbIkw/ZBK8TmfCDTcLAm86G3KwRHfiYUW
	 /F+SvfDQOOjiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A0EC3DA59;
	Fri, 19 Jul 2024 08:08:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/6] Add new Amlogic SoCs info defines.
Date: Fri, 19 Jul 2024 16:08:08 +0800
Message-Id: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOgemmYC/1WM0QqCMBhGX0V23WL719R51XtExNym/pAuthiF+
 O5NIbLL8/GdM5PoArpImmImwSWM6KcM4lAQM+ipdxRtZgIMTqzinEZvbjh1nlrGVV22wjqmSL4
 /guvwtaUu18wDxqcP762c+Lp+I/CLJE4ZZbLVSipQVuqzHu++R3M0fiRrJsFelTsVsipqUZraG
 Ki0/FeXZfkAoB1TKt0AAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721376490; l=1524;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=7LKVRVwmEVDYk3bjN/+0LigjRWWH8ffXzL4TdtBLFVA=;
 b=03k0kiFTbLlRWeqcsAMnewiqN5jSFCs+tiUCSgsdoOTbPtJmGTZXV0El9DLJOgqfbKM9MGQQp
 ULKorzEzZCuBze6G3TP98JjvNnVIe+9qKBT4r2qchDHIZfOkPpVE2Km
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_010815_184397_6D70F38A 
X-CRM114-Status: UNSURE (   6.40  )
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

Add more Amlogic SoCs info defines, include S4, C3
T7, A4, A5.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- dt-binding: Delete full stop for subject and modify description.
- Link to v2: https://lore.kernel.org/r/20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com

Changes in v2:
- Add S4,C3,T7,A4 ao-secure bindings.
- Modify ao_secure node using fallback to meson-gx.
- Link to v1: https://lore.kernel.org/r/20240712-soc_info-v1-0-05ba95929d5a@amlogic.com

---
Xianwei Zhao (6):
      dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      soc: amlogic: meson-gx-socinfo: add new SoCs id
      arm64: dts: amlogic: s4: add ao secure node
      arm64: dts: amlogic: c3: add ao secure node
      arm64: dts: amlogic: t7: add ao secure node
      arm64: dts: amlogic: a4: add ao secure node

 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++++----
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi       |  8 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi              |  7 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi              |  8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                |  8 ++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c                   | 10 ++++++++++
 6 files changed, 53 insertions(+), 4 deletions(-)
---
base-commit: db067bd17c0124228c31c5fdfa29ec65239e692a
change-id: 20240711-soc_info-d01986b3de09

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

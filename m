Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35678C2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 06:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ca61o6Z+RjP+74bvPrGigaN1vy0N/WORnVIzf89Hg/4=; b=oeUBgJu3XHrlji
	2dkznvJQEx1TLCAmP3hA6hluRhwhRSVUHR4Lz1zggNjkJxGGwh4jOLR7Ppl3iF55qRDRHgPfaGJ5+
	aVisg2kFBMH7vW5iav2+8UTTkKJYGhHkecyfJsrA3rgl0QeXKJuJHwE8zhVoXnS0660jHs51LbafT
	hGw96tSH6ISAE7P63W4QOoAAEngbrUE/h0IO4zCYXE5hE6Ly1u6q6CXwpKpCuDmhCnz/KxSQlA6Ln
	kNei1nyv4RdUQ4spgYYtu0244l74xsYjaAOR8xrmtFHANcQvjFLvoDFx5uJ+8dwYdTt0sgMNvsG74
	fugO6eGad/HaDN8uyiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABC-0000000GgFu-0Gce;
	Fri, 12 Jul 2024 06:54:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSAB9-0000000GgDm-2pJH;
	Fri, 12 Jul 2024 06:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69CC961E41;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C2D6C3277B;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720767290;
	bh=PvK+uz7Ai6tJ90bdUtIav76E5cwMtKsTobObKEyJQhk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rHg69xaxLM/J32jgGt5q1pbpOF9juJ3jKFGqtxYVz4hKsMqntneRvGAZZTh4yogT2
	 nIhApYhFig289BkkZYoNKfJWbdazj2SApzCAOJbT3/+wDMddV47vmJ/ESdo9CLT3gv
	 ElWELYsB+Arx3FekQrJ6fe/WOaoFeOB9IcgWoNv0qAvKiOEJLz/xc+G7VMYtzieY5g
	 x8owpl4VE0C6d8+MAF7gdRIg+yMjqAQJtGF33hZlRPn9whBuZSLxUchzuKIMjuJL09
	 4vSM8jdPAAJuJDDYGis9ldzIMyNm0aQyI49+QD9ay3/Q8QMYs8+/aKGDaaVjE5z0CB
	 2O27zyYazFzNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97B9C2BD09;
	Fri, 12 Jul 2024 06:54:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/5] Add new Amlogic SoCs info defines.
Date: Fri, 12 Jul 2024 14:54:45 +0800
Message-Id: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADbTkGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0ND3eL85PjMvLR83RQDQ0sLsyTjlFQDSyWg8oKi1LTMCrBR0bG1tQD
 Ub+yRWgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720767287; l=938;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=PvK+uz7Ai6tJ90bdUtIav76E5cwMtKsTobObKEyJQhk=;
 b=NmECD3n5GJMLXnwBCHt6/k7L51BVXiv4OchwVFfnVoJoGiaEYCLk71XPDxK+/TIduxCOZMyeR
 8+FcVI9DInaAGOcpSUys66zVV0HlDCWD/is96VDFnU1DWoP029LI/hd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_235451_797807_7D0BFCB5 
X-CRM114-Status: UNSURE (   4.83  )
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
Xianwei Zhao (5):
      soc: amlogic: meson-gx-socinfo: add new SoCs id
      arm64: dts: amlogic: s4: add ao secure node
      arm64: dts: amlogic: c3: add ao secure node
      arm64: dts: amlogic: t7: add ao secure node
      arm64: dts: amlogic: a4: add ao secure node

 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |  5 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  6 ++++++
 drivers/soc/amlogic/meson-gx-socinfo.c             | 10 ++++++++++
 5 files changed, 33 insertions(+)
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

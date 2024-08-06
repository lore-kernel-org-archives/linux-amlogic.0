Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F2BC3DA64
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VcdUMWlHUPQa43PiIpbCRsiecH3Bgjd1vlhUdU9wMfg=; b=KCfgTquNthWdr7
	EpjIpSLL06rWN6uWfabRTN5ognM7qCV18GUNzIJAcM70ZRBg2WXvz05dcJT5tRr5OVG8Q9RcCukH4
	cCWsaNqFgnPCIFUizfTt5QZY8F5WSG/F1l+FU47dPn6vWyKap1Ww3I/U28rh+d+5W9aAz5pgMdGO0
	alutv2hQ+Z5NtnyMCwA8q+TcwLWmYzIiVDYpW3bt7IHTr3vcz6VC0Voi7uuo461WRInow6JWMoNbM
	jwCJfqx1bDfU0ylaya8OB9kTsEnEWzyFs8V+u1b+l4nIItc59hC0uuIfEZ51bjeDOmFiPy4xfgvNE
	5zmMJ2ZtK5CzOgOe3SRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbHQ0-00000001DIN-1Ydg;
	Tue, 06 Aug 2024 10:27:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbHPT-00000001D61-1YTN;
	Tue, 06 Aug 2024 10:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6027FCE0D6B;
	Tue,  6 Aug 2024 10:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 881A0C32786;
	Tue,  6 Aug 2024 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722940036;
	bh=tnBvT/w43thSvlJ/YUxyz/XqxFCcr1JN1U9GgK3fKE8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=G3z0xJFVivc041Sy8qMwej55oHUgXATmB8NHBvCXdmPRGqHOH5wqPJo50R6N18HVY
	 6Sk0oOMpRCGnAYltBAOKxFvgV1xD939Y8nSSvjblsqEXv7A6uO+aKh0l8HWzPIoFSl
	 taHQfDIvdCN3ttNq+WyeD0vRp+hZkHWTQ/YG9XqsgarlSFe95y8qSMNROUBSsvnr/Q
	 uA+ZhldVuG+f3G5Ot1I9xdHeWsTkNggObIbsU9cpf/FoQShPqtJUCZ50S9bvKOloXl
	 Berwnpa9epVQRZRH3DWemooLvZ/OuvA4AxwtKVwsrgqXJufUG3himI5U1SR7Jx5d4s
	 Hs21MfDoV7J7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBEAC3DA64;
	Tue,  6 Aug 2024 10:27:16 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] add some node for amlogic c3
Date: Tue, 06 Aug 2024 18:27:13 +0800
Message-Id: <20240806-c3_add_node-v1-0-c0de41341632@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIH6sWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwMz3WTj+MSUlPi8/JRUXRMjg0Rjc0tDizRDCyWgjoKi1LTMCrBp0bG
 1tQDCFNWhXQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722940034; l=874;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=tnBvT/w43thSvlJ/YUxyz/XqxFCcr1JN1U9GgK3fKE8=;
 b=kq/KGDII0tJHN+mDp2Tjv86DYLPfsOhBkzOjXGiwUXsyK5Xpb5CCfO6uXDYJJbwKFRfm4Npuf
 PSQhgYpsd1wB2RaH68n0SqrnFVsFrUbwFMxNah4ftdxMnXtjTNmEgHT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_032719_629444_230D60BC 
X-CRM114-Status: UNSURE (   8.03  )
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

Add some node for board AW409 and support board C308l AW419.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: clock: fix C3 PLL input parameter
      arm64: dts: amlogic: add some device nodes for C3
      arm64: dts: amlogic: add C3 AW419 board

 .../bindings/clock/amlogic,c3-pll-clkc.yaml        |   7 +-
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-c3-c302x-aw409.dts    | 249 +++++++++++
 .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 278 ++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 487 ++++++++++++++++++++-
 5 files changed, 1019 insertions(+), 3 deletions(-)
---
base-commit: 89933feccececf778cab56b1ec3d0916e9bbef3b
change-id: 20240806-c3_add_node-420a37918f18

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

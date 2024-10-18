Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE41D2A53A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2024 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Phn+HiVdWvV0rPYzI5UDYH/HECkGzpPm9ldGLLQGZyI=; b=VVz8pdhnYZti52
	QOpxMGrG0aI6fRur0XLvWBfytPywEjg945AfXFP/nBzAKWwuyJ2CQ/bpsRpfdmQDdzmazjYVi715y
	EUlBFhn+lEDX2Hbbi4nr4Y2kqBS8lVq58cgct5FatqrACovE0EJBVxDk1kC44zis/K34PepLsoOTq
	CQbrCSuLKrQlbzRzasMX2LI9Efp03ReyoZ5s6tFvw9Gr7x84BXmSWz2DZAfJtGtgfpyab6QxDv98X
	yBOLEV2n1y5tPrP1X3JRYBe7VRZ3DRaEIfYszu+PXFx6HZOSanjpUu8gaXvO149xPAs1dj+gtUYCL
	w6/luVD/pOg1dblAD5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iCZ-0000000HTuL-32S5;
	Fri, 18 Oct 2024 08:19:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i4V-0000000HS9j-1x7R;
	Fri, 18 Oct 2024 08:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CD93A41B24;
	Fri, 18 Oct 2024 08:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDE35C4CED2;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729239053;
	bh=4lRaP8QuPRYBMLT0wKMG6lQBbklppLHQ8jODgVosIp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QVvzFII37hOt8aY1vYXY4ArE261Cksq9TrwnZw/db8OOGGaMWvuZlZX+UTU93GsLB
	 N5O4WWA3LbxWoJBxDhiiee/L16EVvyOzBr3jYFVxkuDxcntex8tDDG2MtmNhs45XgW
	 QBsqgw37sW4xkoI3VeSosviA/QCfM4ReKgxTYNMstyIZWsHz0Hi8fS8IDAV3V+MH4A
	 HGXQGRqGP8VUgilE74xebue7/Dlb9YgQj2sE//We5gln86PYJ6IiFhSWefKmZ8dtOO
	 FADllkph6AVKyjQmFmvYtcJ+bx/pZrobO9hoKOLBxZW0FBsYi364YFCsxwVQ8FYfvR
	 qd8av6hFK9WSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2D3D2127B;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Oct 2024 16:10:52 +0800
Subject: [PATCH v3 3/3] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Message-Id: <20241018-a4_pinctrl-v3-3-e76fd1cf01d7@amlogic.com>
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
In-Reply-To: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729239051; l=1373;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=0TyPdSWayWVTMUykbXRDetRSywdwa5DK/B9vqJRVr4w=;
 b=ZqOVlZk372JHtgitbR4ca7CgNHxcIlTajIDPZZVvZ1OnC72L63RTbCmyO277r60OSaQuGKyX1
 BBXGLi5vlfXCqaUcB3Nzj8lMNXg8uWObiBtREPa2nlYKaL45AfBH+FQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011055_795887_E7F8C531 
X-CRM114-Status: UNSURE (   8.15  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..599635eb86d0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -48,3 +48,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&aobus_pinctrl 0 0 8>;
+		};
+	};
+
+};

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

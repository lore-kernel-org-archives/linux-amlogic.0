Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96011C41513
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgb7S8LqyDmdUHdBLH1gIthqEl/ekUqXWxyJxVaU9cM=; b=hIHN4JMcqLTnPi
	k5MZTUvUpz/NvU2VH0ESTliHWVoEwRJX2NAS7KGb8iDcon1GFDG9VG3MrolmLfQ9kj5Zxtnf2VHkH
	GpRIrekCs4a6xdgVdV/5rxTe2s0sw1l4HUZztjTyKcH53rf4s4GyXWxXZFo0HzfRxqtXp2QQmu4jN
	xKZipXef13VPxWTfd9lI9wWuORhi9aRgbAAOxUREeYabBVUaBdoWM77WvT76kj0J0iEAXgVjI0Ifl
	WdFC94Pd0TwHsNq4CSiWRD6JDQBNE+UKvw2Yjc2cy4L00zJlIfJcFHiVePG32yM0Tst2Sj4J5Mgvu
	Xd8uQaTdQ3OtjAl+qDqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtml-00000007PSN-01ty;
	Tue, 11 Jun 2024 05:11:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtmh-00000007PQw-290L;
	Tue, 11 Jun 2024 05:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD17560C96;
	Tue, 11 Jun 2024 05:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 781D1C4AF51;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718082660;
	bh=fNglPpq1OR578DdMVdAmSf59MmLIadxgL7Jtj0YqXm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=szioNOFzEU16gF2REnhbCPQsvmebHMEDMhgN7l7rcDdPIi3BWJnTZc46OdZoUOMgz
	 uxCw/oYU3bLzKNaBoo0JkUBO+qMr9Ma64tLaP+UXQhxNUtK3ESBd4xgIquAREdF7eF
	 sJrM+by1SsnF+xLRSvPb9Bd5uofiF0xeyQ5ub2+EBoZnSl1XoygdpKnZunDpACL58V
	 cjMgC+TvO/yxTHYNv/8qVCsxKJPlwoMSckc21vJlwHneXMJWpBzVtf4/T5xT1dxfzM
	 pdpiI6waVMe3ANqi1rCpsy/aqE0eY9S+y8+AczpVm4wbZ5ca+5l8K8aZ7D1LhM+QTP
	 Y80tJnWgau/0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63950C25B76;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 11 Jun 2024 13:10:59 +0800
Subject: [PATCH 3/3] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Message-Id: <20240611-a4_pinctrl-v1-3-dc487b1977b3@amlogic.com>
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
In-Reply-To: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718082658; l=1392;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dK1sBro4y44HxdZ7xq97Zu8WXKXsyY0hjnlhV/Rfko0=;
 b=fPWr6+NYpqH9T8KWCXZZwBxdMkk0QoKEll2gzJAqwC8lX8rYr4earPV3u9ulD3JKWLmCCM0Er
 J/t1A1E3N49DhS0Sn5+Kwlpv/+j4TTt7DWisWrT3bHqlHN9cgK+8iQa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_221103_725391_1577ED4C 
X-CRM114-Status: UNSURE (   8.54  )
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
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..5d858bb93eb7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -47,4 +47,40 @@ pwrc: power-controller {
 			#power-domain-cells = <1>;
 		};
 	};
+
+	soc {
+		aobus_pinctrl: pinctrl@fe08e700 {
+			compatible = "amlogic,a4-aobus-pinctrl";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			ao_gpio: bank@fe08e700 {
+				reg = <0x0 0xfe08e700 0x0 0x04>,
+				      <0x0 0xfe08e704 0x0 0x60>;
+				reg-names = "mux", "gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&aobus_pinctrl 0 0 8>;
+			};
+		};
+	};
+};
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio: bank@4000 {
+			reg = <0x0 0x4000 0x0 0x0050>,
+			      <0x0 0x40c0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
 };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

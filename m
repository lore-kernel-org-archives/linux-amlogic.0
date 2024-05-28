Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500D2C25B7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKpsD0+d8q5QRamfD4wxyYlwvX753QNtF16zxyvDhjU=; b=SJa0mt2RzN00IJ
	2xrhmVCm4YCjPkxB59T+ki6MeVzywkpqay6vvedWqE2YkEVRVeHo7H2miul5ofGwnPeBGd5QE8JaK
	ITroqLSS330jBCLj5XwKM036HqCsFc8LuTvOmUFiOl+J0Xm5MpdMTJ++1L1KtYIhfQIArCGR1K17N
	oZx+2751xSBE6h/2mFJ76SOrwxG3g3BjOeDtbeRsziG0/K1Z1IQt+7mxHne0lbbD+EWQrjL/x5DLm
	K3tb2tqXNILRPDmvRJm/LSVlIZBGqyeN+aVz3CBLG5S7i3eRBeaQ90a/veH30RGlyR8Zq0B2Py57b
	0hPRTgt+SD2mU1RZ7l2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMs-0000000HVNA-1blO;
	Tue, 28 May 2024 08:39:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMp-0000000HVLP-1CnM;
	Tue, 28 May 2024 08:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6ACF161E63;
	Tue, 28 May 2024 08:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66975C4AF10;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716885572;
	bh=Kj+dnbcQsJtNSINo7zvlXmb60tMjgfrr8JYjVExuHhA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G45asAmvuYIvV+L9qlMaBrBFgK+DPE1Gnu8rqWsbm3fQ/H34Cv1F0u8/T2JF06INz
	 NEIjvqzzD0VxCVXGueD962xY3sOT06ohLyVY/Q2FmecMW0lxj9akbWt4OFbsYG5+B/
	 BQaYIh1B0ANWhF2IJV+bqjt5fe9ntwYaAWloJGcSqYp1D0A7dOZjD+qJ3J0wctXOXV
	 tQd9dLHERurEsDqcSqFL3EyN+pRFIr/C5i+VP8uIWFoV9nFEOX0eq1qHLmzsR9dM4m
	 DaLzfKlLbjd9Rvki6RT4+utUJ7NepJAF0YpR9kFsKFkNswy6LoTp8gpmrhnUQn2otX
	 9j9Y4DKsZnjvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0D6C25B78;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 28 May 2024 16:39:30 +0800
Subject: [PATCH 3/3] arm64: dts: amlogic: a4: add power domain controller
 node
MIME-Version: 1.0
Message-Id: <20240528-a4_secpowerdomain-v1-3-2a9d7df9b128@amlogic.com>
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
In-Reply-To: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885570; l=1210;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nbykAnIJ2GCD2WnAPtjMU24T/l4oTV2riXHYjP6paJ4=;
 b=FdbPTyKbc+thp9uswV6KRGymTZOcdUZfBsO4rleZ34pKhtz7H21eiq5madq8Vko4zKXFmJmT7
 LDb0D2hwFMVC1K2zczPowHbHIIkPqRNAI1G/s0o4LEHtMW0ptT2gc5N
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_013935_406994_3DDFC4AD 
X-CRM114-Status: UNSURE (   8.64  )
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

Add power domain controller node for Amlogic A4 SoC

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
index b6106ad4a072..eebde77ae5b4 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
@@ -27,6 +27,10 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index 73ca1d7eed81..917c05219b9c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -37,4 +37,9 @@ cpu3: cpu@3 {
 			enable-method = "psci";
 		};
 	};
+
+	pwrc: power-controller {
+		compatible = "amlogic,a4-pwrc";
+		#power-domain-cells = <1>;
+	};
 };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

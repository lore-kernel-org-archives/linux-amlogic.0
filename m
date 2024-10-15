Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C73DD21690
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MJNpIu89gKRCzxNpBw2KHSDcmMgA/NxeNRFAAp7Yyd8=; b=lxlDruAEvA+bDB
	KA5hTyOjN5oStuV8mLEwAqBrrIqIOrMi0RrHuF1INwGoyW58RkGXb/F6+U9MR70tMp2R/pLVomLkv
	5p3IBabrJgtXCIMxI5SUYd/YMexQyw9gaZRvY0sLvVNV0KAR8F2k5ef9VsMEEge6pS8Z6BdFk6fHW
	TpIt0evi8YQ6AgY6FcRS/qAxTe68cOcLlQkgFlAuLf60BpsO3g12tl7rLB9Fpn2/gVWHrIMEvTvMC
	rOGm56MXsGs+Jvarp+h4cEA7d3misVY6uy9e+9r8pDdCzCKY6P/2jwRgXSGsbNjQlTXEiwgiAkZHE
	0NzAOyyMVh8RreQ3jgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gmo-00000008Bev-0Qwi;
	Tue, 15 Oct 2024 12:36:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gc7-000000089fx-1YNy
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Oct 2024 12:25:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43123368ea9so27923165e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2024 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728995121; x=1729599921; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+gp4l/50SduzN/lmdO32dTYxyMF1YPRRneVVHTLVqg=;
        b=vSNvcifdjGzjF/1eutoWKlW8QVytokBOIdvce09O0aCSzun21zbim/G8q25SP9FYDN
         iXzaH+87hkNYzFKci6B4LfbkCxEgaHGY3EtAvrqvmuGeYHSb5ubJQ+ABkYsOoZTBHBoZ
         akPxXkw8hWfjZjzvd0pzET2vMzQXKJYDlVstnoahEnrG31RAm38hmdGoLB/4Dt/zsVVl
         zNUrGEVQQaIuwwsP1AtxivRkjZbKC888VTn3zJi3DSgIW47s6XdM5VS7Gl4fF6vaIVf0
         umVBaqExOOfLzKxd7evVDCsbit1VG0mR4pPR4WjWuewz3f17w2HI00nOVTad2vCwFdqy
         pW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995121; x=1729599921;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+gp4l/50SduzN/lmdO32dTYxyMF1YPRRneVVHTLVqg=;
        b=orZgeEtLPN+GHIRqi7FZFi0QAhHVuWzOOZldxKZMStFPRWNwxwRZVSn9e4lZpRVRwL
         fvfoHtmScxtX6aO1mfO8LOZwTDBY1v5FcjMfFrXc2Ovnj6Ss1XgHub5SIuLhfLvscBXj
         t5AeUBpzTYlKWM7bc22mCW+OUt99AvmX/RZEALyVKiP9AoFvmfQMw/ExFIER1iaFwKar
         PM7QBqfKn/BTUHouRknrL+8VtP8OLM/a5HT0snMY8YFIioxGtudsQxm7lQ5+sTArhXH9
         UUXdPxPYmXfe4yo94AaWAfplwvFk3yFESP2qhORdmY/+Lwkbu/ajIeavihbEwf+KOJo7
         qRrg==
X-Forwarded-Encrypted: i=1; AJvYcCVCnWlHJkVL16Tbi62t5Zqkk9iAPhbGbId9Vtc1yUOMCvz8KySEjhemp3c5g0X3QyL5PoD+gWG9xFUOMER1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhp3XYsWXGUIJs9NCCV5SJKTfes+i+ItTifjtwW4xZOcgT+eiX
	oZc7nB/0UbKUmjfusR2kLF2jKZidjWthXHDrox0OiiGxqcGENLc0k5SahTolTXk=
X-Google-Smtp-Source: AGHT+IFlId/8agayFjLT3bFk0RAGaoAIUIY+X5SSXMtLCClm1D3EKBtuUnv1vBbE5WOeMrhSlBEt5Q==
X-Received: by 2002:a05:600c:1c9c:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-431255dc851mr98091695e9.11.1728995121341;
        Tue, 15 Oct 2024 05:25:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa90818sm1458517f8f.53.2024.10.15.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:25:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Oct 2024 14:25:19 +0200
Subject: [PATCH] ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg
MIME-Version: 1.0
Message-Id: <20241015-topic-amlogic-arm32-upstream-bindings-fixes-pinctrl-dtbs-v1-1-c7291f17063e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC5fDmcC/x2MywrCMBAAf6Xs2YWm1kr9FfGQJtu40DzYjSKU/
 rvR0zAwzA5KwqRw63YQerNyTk3MqQP3tCkQsm8OQz+MpjcXrLmwQxu3HH6UeB7wVbQK2YgLJ88
 pKK78IcXCyVXZ0NdF0V/dPE+rH42ZoO2L0L9q9/vjOL40peVKigAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3733;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8/dJqUKHoHiWpotdIPtckagmH6omzFbOZy15zNq6Fbo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnDl8vgS5uSivFjIPnmceCyX/RG5XjB6Tqcmj1njr/
 HWof4xOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZw5fLwAKCRB33NvayMhJ0fIpEA
 CVZ4yqkZXYGGsOigVICNaTxWO54gBjqQaqa5C2fgKZpzNUQck2JSO+52stZxjGDUWOqAzGlEuf6PLW
 n4WMlZlvlnSHubd02tG5Bg8rdY0RPQeQCb8kip7x9MXTqGUwWrPeVMzihGjVp9RY41REs93QWdWjes
 BbqloJefnvEWvWikaFEL/nZ50DXARjDlG+OFxpWk9263zqZrXur76r2nOd0L/ouMc6RLQvlzjwahVW
 fLcS4IAAYG+QsXgaOHshvc4Kedc777jmpWSfZgPeL7diWB+dRZOaHHr9ziwsZo1ChPCaC2SPBY2nhk
 AdJPrdDNmJmcLV+uSMiP/uQOcdj+EC7ScTCqoA/QopyI1qt7tvXrlnuypQo/sZ6YKqD2JQ7uqn96Kf
 Ki+kp4JXZlNZBtHw+40bS7G7Es2UEnMTNM6Zb9fk+9EGVmSTNBUXFucqY9U20N/yU29rkUi/KWE0ns
 l0v4IW07sY6OqrYUXycole6vHmx0GTe9BJoF2ax1ngJT+W7sFclma5hZBZ6VB0u2ars1H2amu+ZoEL
 smOeAqwNhUdqnVge13EzJuGVb1+uf/NJd85uCj1M+ujNRmOem4eY0sLWRq6TSYxOrz7DmwSK/JLa69
 /greYJbS7PlEnCnOpL5r7si00kJyP+M2RZuAXaXrBkZoooLvzfBBCoC04Row==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_052523_464102_0D2AA503 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The pinctrl aobus/cbus was originally here to configure the
GPIO interrupt, but it was a bad design and was moved to a
separate gpio_intc node because the GPIO interrupt is actually
separate from the pinctrl/gpio registers.

Drop this reg entry, and fix all the register offsets with a
proper range property.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 28 +++++++++++++---------------
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 28 +++++++++++++---------------
 2 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 6c7596c8b96b..9ff142d9fe3f 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -346,17 +346,16 @@ pmu: pmu@e0 {
 		reg = <0xe0 0x18>;
 	};
 
-	pinctrl_aobus: pinctrl@84 {
+	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson8-aobus-pinctrl";
-		reg = <0x84 0xc>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0x0 0x14 0x1c>;
 
-		gpio_ao: bank@14 {
-			reg = <0x14 0x4>,
-			      <0x2c 0x4>,
-			      <0x24 0x8>;
+		gpio_ao: bank@0 {
+			reg = <0x0 0x4>,
+			      <0x18 0x4>,
+			      <0x10 0x8>;
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -461,18 +460,17 @@ clock-measure@8758 {
 		reg = <0x8758 0x1c>;
 	};
 
-	pinctrl_cbus: pinctrl@9880 {
+	pinctrl_cbus: pinctrl@8030 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
-		reg = <0x9880 0x10>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0x0 0x8030 0x108>;
 
-		gpio: bank@80b0 {
-			reg = <0x80b0 0x28>,
-			      <0x80e8 0x18>,
-			      <0x8120 0x18>,
-			      <0x8030 0x30>;
+		gpio: bank@80 {
+			reg = <0x80 0x28>,
+			      <0xb8 0x18>,
+			      <0xf0 0x18>,
+			      <0x00 0x30>;
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index c8fbeede7e38..9e02a97f86a0 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -308,17 +308,16 @@ pmu: pmu@e0 {
 		reg = <0xe0 0x18>;
 	};
 
-	pinctrl_aobus: pinctrl@84 {
+	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson8b-aobus-pinctrl";
-		reg = <0x84 0xc>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0x0 0x14 0x1c>;
 
-		gpio_ao: bank@14 {
-			reg = <0x14 0x4>,
-				<0x2c 0x4>,
-				<0x24 0x8>;
+		gpio_ao: bank@0 {
+			reg = <0x0 0x4>,
+			      <0x18 0x4>,
+			      <0x10 0x8>;
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -415,18 +414,17 @@ clock-measure@8758 {
 		reg = <0x8758 0x1c>;
 	};
 
-	pinctrl_cbus: pinctrl@9880 {
+	pinctrl_cbus: pinctrl@8030 {
 		compatible = "amlogic,meson8b-cbus-pinctrl";
-		reg = <0x9880 0x10>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0x0 0x8030 0x108>;
 
-		gpio: bank@80b0 {
-			reg = <0x80b0 0x28>,
-				<0x80e8 0x18>,
-				<0x8120 0x18>,
-				<0x8030 0x38>;
+		gpio: bank@80 {
+			reg = <0x80 0x28>,
+			      <0xb8 0x18>,
+			      <0xf0 0x18>,
+			      <0x00 0x38>;
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;

---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241015-topic-amlogic-arm32-upstream-bindings-fixes-pinctrl-dtbs-d7c996fd4116

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

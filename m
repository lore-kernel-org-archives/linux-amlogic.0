Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FADCD11C2
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4IvfLOvcq79FKEf9RvpPH/auJUkC8VuIxY6uvvTFep4=; b=aYgbdQsDZvtRs7
	NjSp6d4Veb0XOcw5nR2C20Wld+XuJbr0KmVwktIAmOviQSsGhalYV8Cp2sSTmQ0tUydDzp2OChmza
	nK9pkL1k3oAwRCnuCO1NhoHrG6PkmnQxbwBwAnUQk77HCmbBdm68a9NR/JDYshvUyu/xbHtm0vxNS
	LAhex4ZyycbvojG/9QcuaYBV46Z2WA0GCxPqxXRlMWgOzelE5GTuisv4ohTZ6c+c5ccNTTvb8GMcM
	BI8w90sXGepn+soeQcXQuj5tome8XrNHWEt3JZQ9uynLDyxqd4TUikN92aGvJE9/Dwn9WsYOYUIOw
	b52qLWIrYgbTWN8ALIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtfeV-0000000EBTR-1gTZ;
	Mon, 08 Apr 2024 03:26:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtfeS-0000000EBSL-19ME;
	Mon, 08 Apr 2024 03:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34B2C60C69;
	Mon,  8 Apr 2024 03:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8DC3C433F1;
	Mon,  8 Apr 2024 03:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712546788;
	bh=y93CELgU798zozilMe740Pyai90Z6Y623ic13iToKHw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=E/9DD+rNt/YgweHp6RiEO1cKky7kz5Kimv/ixIryQhNM8f3eB5cJn8nrMiv65jWPv
	 5nwbni9yOdgsadbpryIA2Y/MfxF//SgUD3yfxHcjC7/FT1JKhVMsTxMpdu5Zgx4DBx
	 iV8XCHdB8PkSqBDJBneI35jPDEDlrj3W8X1UQYS4NwMiWKwOPOAu+GLkApJOf8bu7C
	 2pRIJfSXf9qpy8xkPB52QkUOporfvBDOZBjOQTzmsE32hsen6NQjufIAZ1iRWHZ04d
	 mAtZmNgesL6BYAbGiY+GwuuE4wIL0slwt8kPjc1Yn91i4d024u4sYK4svlEZgKXlsi
	 CSLmbe6Sl6J9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2C6CD11C2;
	Mon,  8 Apr 2024 03:26:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 08 Apr 2024 11:26:25 +0800
Subject: [PATCH] arm64: dts: meson: fix S4 power-controller node
MIME-Version: 1.0
Message-Id: <20240408-fix-secpwr-s4-v1-1-01aa7ee72c52@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAOBjE2YC/x2MQQqAIBAAvyJ7bmELiewr0UFyrb2UuFCB+Pek4
 8DMFFDOwgqzKZD5FpXrbNB3BrbDnzujhMYw0GDJ0oRRXlTe0pNRLXrnYnQjBfIMrUmZm/D/lrX
 WDxnMTcFfAAAA
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712546787; l=1062;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=aYGam5atTvFCi6MANFq1gTnEWCmMJGBzGpQ68DNxd4s=;
 b=QOZasB9XfpjbYCM2NkQXMlQePi2brRVq25BtW9pZQ/O/LAgdf/E30jblrbUc47W0QCYLKqMCn
 Sd+AOKQpyePAuPOG9BkArADHL7TsnkikXqRDb0KtLIx1RUfQSqwjBEd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_202632_482913_7C4CFA7B 
X-CRM114-Status: UNSURE (   8.40  )
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

The power-controller module works well by adding its parent
node secure-monitor.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ce90b35686a2..24d00dce4969 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -65,10 +65,13 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
-	pwrc: power-controller {
-		compatible = "amlogic,meson-s4-pwrc";
-		#power-domain-cells = <1>;
-		status = "okay";
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,meson-s4-pwrc";
+			#power-domain-cells = <1>;
+		};
 	};
 
 	soc {

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240408-fix-secpwr-s4-a99ff960d0ae

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

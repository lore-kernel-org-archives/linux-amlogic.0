Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79FFF588D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdyzCsHY4kcaE5EZgTeuB5AFdS4B1ykJ2kMc61wOyDA=; b=1PjKXZOFBClL74
	On2SxmA6cfDVTe1z03l6ZOfks61k6jBrmafSZlvfC2CoT77C7sWTPAkKqy7TDvIwbha5Wpc/VUnWu
	B2LBFmqXe3GoElWXRaToBrerYeCge+9OB0ljwRYe4n/C1gSV9jN1dtI9d6sJHhXn7+G1o/deKxYoU
	W4j9xHsQosX1m77LSZSj7EBv06MObIibdAtuAlqqmB2hn+U75UbAshpBSSLMJR0wXSlD8J4Y6ukck
	i5ocoDhCU2hk73QC7nORWzXU/GBZvFcIPHp18tb30wwCKFnyHqsMIy6dpV9cxZyWihkrMIrblQo1I
	++hsKejH5JDwlAAWLTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp55-000000076mZ-3Qsq;
	Mon, 20 Apr 2026 13:54:31 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp52-000000076hF-3jkA;
	Mon, 20 Apr 2026 13:54:30 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776693262;
	bh=2xif9DrmN7soyQpQm21uxoFmAmF5UmT4xjhU2FxZ+xY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RdEfQYMBc7KxHZnntKxysggUJPzqbo6H3R8CcMZNDTZlPe7kNc/dJduE9hslXAn5a
	 8hbDTwgsZaB30j0yDi+HWzhZTetHpGJFE3gMcXDKptQwriAk0mo4gYZJaZQebwMhoj
	 uldq2vu69zlgOHL/A876rClMTrG7vYsjJFfM94os=
Date: Mon, 20 Apr 2026 15:54:02 +0200
Subject: [PATCH v4 1/4] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
MIME-Version: 1.0
Message-Id: <20260420-add-bluetooth-t7-vim4-v4-1-9505df0e7016@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776693260; l=1042;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=2xif9DrmN7soyQpQm21uxoFmAmF5UmT4xjhU2FxZ+xY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPuqg4yh4nEMBxiZjZbHTCP4zI0FzWHil9LvEk0WtPvvtgxdEAbhBgxzFhUfMQp1jBZ4gCOJr4M
 CzPuIgQe5HgE=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_065429_199751_64522D07 
X-CRM114-Status: UNSURE (   6.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
in the T7 SoC pinctrl node, required to route the UART C signals
through the correct pads before enabling the controller.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..4a55d9641bc9b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -553,6 +553,18 @@ mux {
 						bias-pull-up;
 					};
 				};
+
+				uart_c_pins: uart-c {
+					mux {
+						groups = "uart_c_tx",
+							 "uart_c_rx",
+							 "uart_c_cts",
+							 "uart_c_rts";
+						bias-pull-up;
+						output-high;
+						function = "uart_c";
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {

-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

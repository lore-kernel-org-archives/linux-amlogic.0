Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BEBC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 04:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NK0iM4vFxVPAFRCbt4W1Nlw7R5Cr9RhzQs2mz34uLoY=; b=aOtsQdMyuzJ6V0
	PITn/B0Zr+kgyXX7Q9XU1hc0zrjsdgyb8UJ6rOl7x/4bJwFC6oZ2/U/005MzyUS+7Gpx3zbh589W9
	lO070e5cGo2TTOTtFhBcHv3RUG56cawIIrfriKT5drnGEaYCMShK89O1ZB9WbdSw5lB9556xXDsjO
	fQh9JoN8z+cOC8jldGSjo+jbhUO20GQsLmMq52yK6YsvbSgUng10yYH3WYkdZyo9Up8FwK/4TwwyD
	0ILMq+TvQ+eWW+0lY6dq7MFnbJJh4ZGgacVSZCxsQTpRYSbMdeHC6fxrK3JEBQkfI1mF8ujwkEIk1
	cw+sLt0wA49Myazk7Whw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7rzv-004dou-GG; Thu, 13 Jan 2022 04:46:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7rzj-004dnj-Nw; Thu, 13 Jan 2022 04:45:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id u25so18507472edf.1;
 Wed, 12 Jan 2022 20:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=ZBLBMo0FMbEtIJpoOidyGwsdZCYDTmf8Kl5LcIDvQzg=;
 b=RduABD0/Iy2DuiYfR/f2rVzAtFGwY2XDX1UtIZZtkk1JVeYMdN2Ah0IGWPGGZNKoyy
 C8GaXxboP0MiQh/9HO6f+oZKxczLfOPKhKPK1wzLqCZKDn0Cpro6KskIGHn3zb3IR+PS
 kFnEEtUEAqYfULdUcLXRXV1Q0Ra5UyFpH3LASCntUep/sA+2/P+H9rQ8wyV/VI3DAqpc
 StuKKfY9pmYuIV0jOZPKdw6qg8J3F/xYIbVZROj7HSO9VbSomz3G9+E9yDj8aDvJLlmq
 iqXsK9U+xMdhRy6KjO95gZn9Pf/vOK2pkTUQNjzz52Z7+AWIjX6lo+f1ajtCqZUmDwsg
 uKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZBLBMo0FMbEtIJpoOidyGwsdZCYDTmf8Kl5LcIDvQzg=;
 b=zG6b+HI82Prt5stel+kQ1vUrXH/+rHDpGsZzk+HU89uifhtOOpYUO2jmG9gO4x+ggU
 gw2WlY2ncm+ixvqiM6WOSqJYdw1Try9ur/axECO1RP0Ctd5eZCHs9z6TzuIZUbTcZ15B
 jBnlSEu4A9kGQJlTuR3HLVvRZ1kgvXJgFEmPnVdblfFu3p/Vdtim2LXscxR+5GA/+zfw
 CAoYwxsgxKhfBMCMt2zSzKWqpPlVG6gbSsU+rAl+1nhNZ5bWVwnhty8MOa57LzVXWrsB
 y8xiwSIfuGjcFC6li/nhX5YIhSZ2XHI0R1XNasvs6wqpES0JkNUpDQH7FmOj/zlFlmXI
 hPyw==
X-Gm-Message-State: AOAM5310DecxN4M5M6+h4CL+PbzoGES/ER/txBbyp3x9dhcut/mjdB0J
 uafgsJXsPx1DMzqLU7b1LB0=
X-Google-Smtp-Source: ABdhPJyOzQGKHC2fdVcOPLUDg94J6QU/Pp0BHs60Q5SYgrungCHape3obDdCrxo88bKM2W5MCfkzQA==
X-Received: by 2002:a17:906:2f97:: with SMTP id
 w23mr2132611eji.739.1642049150538; 
 Wed, 12 Jan 2022 20:45:50 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e16sm667983edu.15.2022.01.12.20.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 20:45:50 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: add audio playback to P212
Date: Thu, 13 Jan 2022 04:45:46 +0000
Message-Id: <20220113044546.16856-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_204551_836936_7BF34AD1 
X-CRM114-Status: GOOD (  10.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The P212 dts is widely used with Android box devices that follow the
reference design. The real P212 development board probably has many
more audio capabilities, but as a minimum we can enable HDMI output
and help box users too.

 .../boot/dts/amlogic/meson-gxl-s905x-p212.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
index 2602940c2077..a39830379c74 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "meson-gxl-s905x-p212.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p212", "amlogic,s905x", "amlogic,meson-gxl";
@@ -32,6 +33,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "S905X-P212";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE872606A31F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0sOP63mc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CydGhKbC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UnEo0pMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=usaUt6zMZFpbMpjZVSw3i2IuJEW8H1deIF+cWNNp1L4=; b=0sOP63mcktVy/W2lUQi3hTKqRr
	6pjPMcHoop2i8FSkUOzln3dGXn3JRWzpHjL3Z0PwSMM4CSASrFDUDt3+kkfgDElvFnnRMI/9hUjAV
	MFaeKyeqS/lSO+35C0SzBQkRhWBHh45Y1HOpkpE+qZabIHpcFfmpzpJYzrTLZtq6kk2RIQc9XNDmW
	akEpjeusvEWZeBflgs8ZkwKWp3QvdU83DO+rjtC5U61pRIlcUxK+6Jj2AMsxRgXJVZ4U/aTdtlR9j
	rNdh0mxIsvSizdYMx3B8nz9OaxjllYGetzfdDJgwRTcrTrMrGqVmHVpxwpIvXcnMlxspl9WdwXddM
	DcQxASQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEV-00000002gs6-2PTO;
	Mon, 23 Nov 2026 09:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEL-00000002gn9-3o5r
	for linux-amlogic@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=; b=CydGhKbC7ixqktdN6VNdGRg1iq
	F4KdgDS9j4I9TorvamAdtzWrX+sZZEuG7T2QfoDEknthCcLaFRoM36xSHBMQbCv5KKIKvID/j9SJH
	TmaknbW29iz0/yI5p4OcJ3nDC4KDNdRMvxrS+pjX6b29Zq3DJscKr7QBeQ6Uez5+fyVB71QnzFfam
	T4U/ZVe/S1LL1jtJ7/OWwaC2ozfow2V1s7exbX+AuvOfnP/71avEbetusFc8z0JPa0SrACo3FKn0c
	mD0amaRXDueMy5tJFdBJYO43LpXN1TDUuq7D7mwpoF9JmmHzVWrP4VpOvVBLmBzB2doH0ui68jk42
	G6C5gDHA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEI-00000002uea-47LK
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 09:20:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28530925e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2026 01:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425652; x=1796030452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=UnEo0pMPRSt1CiIrV4h0bzFJbiQl4VpKwQ1miEt2Ax0ZxgWzrbtkBBK+brZu2gceFc
         kTbK+Dew8/nF+IxPO8C34xZIy6lSxqWX8mtevaF968d9iAESahmr8Scrmg+VYvZ2mMqq
         ime6OVOA9nVZEEEN92kYfko3AIwTCay486J3wNnxifwPMPKwgOXHsmay0aiEAa4/5is7
         J7vHRdflUtugTItQvoRH0WdHpGaCg+md6X6e0Jgm80KwuOw69/5Idfn4KuLluKWOyjdU
         AHyu1b1SfiSdl7pX/EyBOXfGJ1FVG6Z3zvys/sVT6MH5XIq5ovN4jTyE9xNRlEaK8mic
         GlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425652; x=1796030452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=loof0y8mT265enOhf7uZzqbEc7qWFa5mlztxYeW2UpC40ZPS+/ph9PqHfaCaNUdWDa
         VQbeHC9rtZfs725n0qPIYEhpVnySKxZu8wIifxftIK5JxHVo+stQSXd8kYZwHgyF53N7
         gwRSok2Z68lThwVa3MbXyBOkYwxfrDNSITCkXxY624L8LJAe9/8gwjPdLyzelkvRsdYp
         ttHBa9YRDotZn1F8NGEZdmcDZ4mIe4FdGZAdhSTQ0h7vhCoJkIhGR+WAlMCAmNjCnOup
         TZryvDbfDKLRuSRnNmVZNjQIuqajLZGVGATSmFCtrZqrsjE4aiXCMX0Wa+X4quko+tVs
         Qb2A==
X-Forwarded-Encrypted: i=1; AL+hErHEc8mAvBmHNEAL7kj8B5YbtC3wTThvZ2kIOrXKrbpklD+PZmzYax20AjmGmdUbsavaJqJcP2jISvQ9lctr@lists.infradead.org
X-Gm-Message-State: APuU4Z9r/OskqTlEmZ+50nP49JBBHXONabSVHepnKnBIGQlA0bohmqT9
	XI0fwbDznl29Xb8DhfodReHqS/Kg7rPlr4qvT7WI7DNFqPcRQ3YK1TM14y5m/+VKym4=
X-Gm-Gg: AZFdTZfZ+30NMcAG4O16HzR9KSichEGPGmVFV9z0BVkS/AWJl1F8ECh5dCa3qa5iXqa
	eJhXdX7xki8/B48WRfvW8yfngDGY4+DAAuLYiLCoa0OQFmTN5KSlfaUYGMj98bBTkKxsRH0Aq6M
	kFZZrSpRLoNEl7MpM+7dMNN+SZgBFKgldr5bcXIKvBG4vgxB0XadMvPGePs2/l5vSpYkFw2PyC9
	OxoRmERABh0/046tCiGxFkoFmupqRMyg9CGZe7DI/LRaJ4nx4jFMTtg9ur9lFWYK0/Fvz0s7Ybp
	o2qTJ0/2U8Wzrob4ZLL1AqyKNDq4zSP20/w+kq6vziA6KZp/wAtA/ldbvSnEIhceN8N2x3injLA
	4FQduhhg8fhyJn2FeqRG8LrOs5SBbjDsWDw9imMOYdNgUe63dsdVT9NLU2Fl+7jX5fK9mujl7o5
	E91ha0dUXoSFZl4w90LQfbbRETMZpnrKamrgVKAvAFjaQPVzzpblpOhNfQ65HTRIb7QQ6lhnJmT
	vQY3Fl3WXfFivsgyzmNI7oPfYGNSt4qeOdadvgbMquEZLB8RgZF/UV0+kme57aPgJvyHUqQj2uA
	DsSJmtYZR7IqTpEAL3uKw1dglKnI1MyiXYNDMJe/VWAwsaxY0ixBi89CPZqUjZr+ZAquajTuyEr
	v/2c4/DnLXwbr3qzV1xFDzWZKV8ol8rCKcYQWArblM2IXMw==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr216221585e9.30.1795425651936;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:46 +0100
Subject: [PATCH 2/3] arm64: dts: amlogic: s7: add the PLL clock controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-upstream-s7-clk-dt-v1-2-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092054_936706_0F367F89 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the PLL clock controller of the Amlogic S7 SoC family. The fixed,
GP0, HIFI0 and HIFI1 PLLs share one SCMI reference clock; the HDMI PLL
has its own.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 69dec312e7d6..eb123d022bce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
 #include "amlogic-s7-scmi-clk.h"
 
@@ -161,6 +162,22 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_pll: clock-controller@8000 {
+				compatible = "amlogic,s7-pll-clkc";
+				reg = <0x0 0x8000 0x0 0x1e8>;
+				#clock-cells = <1>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_HDMI_PLL_OSC>;
+				clock-names = "fix",
+					      "gp0",
+					      "hifi0",
+					      "hifi1",
+					      "hdmi";
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,s7-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

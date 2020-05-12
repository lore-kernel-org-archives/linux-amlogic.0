Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09B4C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A9320769
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHD9PQwf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LMZNpxE3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A9320769
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFx86drkjo7vb3M7ITyKPY/vhuZ/fO2s22X3Ymo/sVk=; b=GHD9PQwfKjtohf
	qQxRuGK3hUD6JiK/A8B/mj+UQdN3SR0xAxV7Kf7HhR9BefIlQrZR2UjJb8ItJaBoVws9ngJTWffM6
	udsXHBXekFP41bzSuJkzB+m83J3+WEudcD6bKa/n0YKARzPg/1f5uti0nwJ7F+LZJTRTud4bRyK22
	w60qgSNz5WUiGnxqIDWHu5bOITLELZUzaPepyhrfqlLPx0buw5gZx1qduIF4E14tq4bxPjaEHUkJ2
	A5fW2JavzrQdTEVX3qieXK56nY12iFR+brsskZf7iTcKJiE+R/NBqMXRuxnP3hfR7RxESX1Ar1zPu
	xiILSoBXjw3bo1xXQ58Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcBz-0005P2-Ri; Tue, 12 May 2020 21:11:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcBM-0004q4-36; Tue, 12 May 2020 21:11:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id s8so17715091wrt.9;
 Tue, 12 May 2020 14:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/KGQVBeKYkVYbXvdSBspLFigDe6VZAF+Wx8YN9GDcNc=;
 b=LMZNpxE32rk8g0yplUvy4mvxgaadGMPFKXvoJds2A1GV8eft9FrgFGhZRXfQkivZ4l
 7LmM5yOK/Y6PoacpmcdrJCmxmueQlKLUzqEtvpAWg9ASeZEtUi9JPpk+Ni+1+PKYrpxP
 nCa+xG3RCo+xdPw/05n6gX18g70QhUgBDwqt6zNgQlhRbMpf0esPPJai3Tl4PSvzmMWD
 oVbfa+r3D5ysABf0T/td0xVDus7aC2gEujsc6/l/Vihcr9B2C9qwdsKm4Du5ilvPKc3X
 0/+3HTGlA59ZolkeWdQMc//4lDo/phW7a1lvnjQaXrMg5yaL1dvPhQZ61Xb1XuOKo20z
 yLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KGQVBeKYkVYbXvdSBspLFigDe6VZAF+Wx8YN9GDcNc=;
 b=k204FKfX0hcx8Oz1lx2lCcJ+EIZhDXdlJKdLxP5c3z0XbwZjc7Fjz7zLuO4nVSNGHO
 iq4vKl2QDIcY4TRnmtui2gYcYkuxpfrikVhG/wJp/nESeA3qSsJ1Fjpsc5qiNSWxBLFq
 axW0PjMDpVYcwdcYoTZ8zsWx+zW+AImjx8b6OPvxKqR+BvUIn+s39XNgDhwfiojI+peo
 nsclY3XqNeJ4ozWOFMC/nF/XK1vcxKsb1IbQ0wJ8f05U5m0aySYZ1AMuEurr/mDTDlN0
 OD/qz4Qtlofvbu3BWGfHG+N2Z/b3FSUbLK/W/FfAGU8iFfVhl2ljgflZxF8svoS8JmZg
 zbUA==
X-Gm-Message-State: AGi0PubwwD3r22zixY1ZtcpnmPS0sHkkm7NbHhD46pzpM9UiIL6EjfWz
 9KsV7mkY3BTUhpMgA8cltnA=
X-Google-Smtp-Source: APiQypK7cfT9u0K0wRgKSWfrFo5+g3J3L9kW9wLiJwLr06ncTXRn0nQoT+QRUji8KiEu1VYA8lF92g==
X-Received: by 2002:adf:fac5:: with SMTP id a5mr28720107wrs.210.1589317878732; 
 Tue, 12 May 2020 14:11:18 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r3sm9724228wmh.48.2020.05.12.14.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:11:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/8] dt-bindings: net: dwmac-meson: Document the
 "timing-adjustment" clock
Date: Tue, 12 May 2020 23:10:57 +0200
Message-Id: <20200512211103.530674-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_141120_128498_A76A43AA 
X-CRM114-Status: GOOD (  11.25  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PRG_ETHERNET registers can add an RX delay in RGMII mode. This
requires an internal re-timing circuit whose input clock is called
"timing adjustment clock". Document this clock input so the clock can be
enabled as needed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Rob, there is a soft dependency for this patch on commit f22531438ff42c
"dt-bindings: net: dwmac: increase 'maxItems' for 'clocks',
'clock-names' properties" which is currently in your dt-next branch.
That commit is needed to make the dt-bindings schema validation pass,
because it increases the maximum number allowed clocks for anything
that extends "snps,dwmac" from three to five (here I need four clocks).


 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 66074314e57a..64c20c92c07d 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -40,18 +40,22 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
+          maxItems: 4
           items:
             - description: GMAC main clock
             - description: First parent clock of the internal mux
             - description: Second parent clock of the internal mux
+            - description: The clock which drives the timing adjustment logic
 
         clock-names:
           minItems: 3
-          maxItems: 3
+          maxItems: 4
           items:
             - const: stmmaceth
             - const: clkin0
             - const: clkin1
+            - const: timing-adjustment
 
         amlogic,tx-delay-ns:
           $ref: /schemas/types.yaml#definitions/uint32
@@ -120,7 +124,7 @@ examples:
          reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
          interrupts = <8>;
          interrupt-names = "macirq";
-         clocks = <&clk_eth>, <&clkc_fclk_div2>, <&clk_mpll2>;
-         clock-names = "stmmaceth", "clkin0", "clkin1";
+         clocks = <&clk_eth>, <&clk_fclk_div2>, <&clk_mpll2>, <&clk_fclk_div2>;
+         clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
          phy-mode = "rgmii";
     };
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

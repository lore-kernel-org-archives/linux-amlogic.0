Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE80C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eelVCEge1xWaNDvnxbpM+tINjnjcMEeMOOnZXyhgYnU=; b=RcEDCvEY8HgiiA
	O+A0o0ZYIJ9MIW+JyVZcRyHF4DQ+etnFEJ7XHXPbNRCFtNynn3n7XDgkq/AkWBha2YtTXt0AXGz8O
	Sl/kCRgg+XqBRiQ0Oe4u99mwAtsMUrrc0ocDBKbTze7yf8L3bdrBhbZYvE2jCNvwGcaos0zJ2Dr8A
	Wb1fvkSYhxAr8762uOYasD0LAHgwi3GRFaotB8U8KG087Gt6zkVekMYYbrASKZdHcb+rtHvbwmIF0
	vrbj5vQd4pxGQiEkai/pvmBahwKIEe6CxLhwGozC9OEU6Ne9Fa6ieysCW6yaewM/ALrVINRQNCFfd
	ImrPQqLABD7JMjG7tnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHl1-003WLL-Tl; Tue, 24 Jan 2023 11:46:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdM-0039BC-6S
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h12so9407153wrv.10
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifzjlY99+yJztqe7FARfMu6jlp+GfQJvBGzzQqxPZBs=;
        b=kxWYxI2FutjBslqyG+lI10Qg4rhf4tUQt3JHpMJJWwfz4koO2rIOm+ynasq88387Z4
         kUwqSz7A5mHvVNXV++U/VXQAKv0joDyCW0ceLE8FySgkUUSTz36B6G8xnAMnt3MDaPUD
         2PvZZPzHf4JL+Nmvl6KZWFedklhlUPBA/zJ22FC25vTDf3Wn4pY5IA34VgKsgjAhydUc
         G8rFsd2dSJCt16FLpk33voTzZnnacB90ugckjbQ1NSqmJO9CQt9yvmeOl16t6jR0EjwR
         6Hlj8drZR/p+2ThYCrNM4OZYFqvCidrUyA0Wb+nKRWBesvN0gq86pgJDkUwOuj/yHmXc
         MvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifzjlY99+yJztqe7FARfMu6jlp+GfQJvBGzzQqxPZBs=;
        b=Ai7ATfvkpt8jT8jOH/kFL31mfweSttCiFU/d0I/Hh5Yp+CxcVOn1K4PaCBsIo+ksu1
         fQZRXzGZSk8DLZ9aSlDj9l7weUT3S6AcMSzYDjMJ0LbnO+kzNwxQy9M54sNqnM+jLokO
         t0iSXbMa7cvpdmuGmatMTCPyaw9DRrLykoCUAeZAeuRymv0txkvMgWEFkDUQEmadrC08
         zIX5pJMaK+txmR0jJEkRFEtk/XpeBMSScqrGGzPA1KCon2bKdfVZE08OhAI+LzlLG6JD
         H/KIWXhcme0LXHN5cLPBgfY3sXoQrUKc8sfSEOfq3XsCxDom6csMTRyhs63uzKcpuTTq
         6iLQ==
X-Gm-Message-State: AFqh2krKvJzDz85rCIs3X8Aw+SS/s5wYS1WxNL0uPb+drx728AzbiBF/
	cHndU6+A/DgPTPr5ht5aeCfOPg==
X-Google-Smtp-Source: AMrXdXvnRcBiwv9p96+TSCf4nh3ZFbnS+Q3RT5HiQV9H2MVRSLIYvXTjdAhVfme5LdIwlx1KSHL33A==
X-Received: by 2002:a05:6000:1816:b0:2bd:fe5a:b579 with SMTP id m22-20020a056000181600b002bdfe5ab579mr22265168wrh.70.1674556470825;
        Tue, 24 Jan 2023 02:34:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:28 +0100
Subject: [PATCH 07/14] arm64: dts: amlogic:
 meson-gxl-s905w-jethome-jethub-j80: fix invalid rtc node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-7-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023432_300703_8A9FE00A 
X-CRM114-Status: GOOD (  10.08  )
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

Fixes:
pcf8563@51: $nodename:0: 'pcf8563@51' does not match '^rtc(@.*|-[0-9a-f])*$'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index bb7412070cb2..a18d6d241a5a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -239,7 +239,7 @@ &i2c_B {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c_b_pins>;
 
-	pcf8563: pcf8563@51 {
+	pcf8563: rtc@51 {
 		compatible = "nxp,pcf8563";
 		reg = <0x51>;
 		status = "okay";

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

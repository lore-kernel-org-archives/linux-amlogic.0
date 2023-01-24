Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553FFC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/P7ZdRFUSmZT7SYM0ruwzsb2V38wY04EKFuSyd43Rc=; b=1yTJQpVkFUo+/U
	msnuuaktH4L+wy95eddTs5OW0KrlyPSPrzoiVRthz/p5r4ZwJuvnciKwBZjn2nLmVdfpATYvG+wOp
	GWSmvlOhKhFen0Zi8RnFjydEYxMz+feKLjwLRgh0g4WvcPZQFEHkMez1N2XKXzhAsd4QJQJpvXrm2
	6fElkyP5M65RyN4ehlABH5n2998/5V54npqdlzHzQ3CZbJ6si5+EneKCCfRlAlPQ7yEr4g/CllrG1
	Mx7MN97c/ECLFw58T5OZyAIRHBh0PNoQWLjBZqQT/782afA31Ugw0Od2alYGfun6sKmpkHs+YLG59
	psDPlDi1kRxAlTB55gXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIzo-003qiv-Lv; Tue, 24 Jan 2023 13:05:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIwv-003pQG-Lw
	for linux-amlogic@bombadil.infradead.org; Tue, 24 Jan 2023 13:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LLmolkcXwsNYtpVGeeRXsVm3lLPGm7voeNMYUoB/fn0=; b=qYeeJoyCMrYEeHSUHFll7Hvm9B
	MMSMMBN7oBwE9O0wsvpqHvxJu07rFSAM1eKl0q/rA/Y9eZ8R7JEjmcDxREhEnKQhd0BuFa9XiN4Pn
	HsFoY+ijw3eZKf544sqWAiB8erFMfanU8b8tMfw99i2hD8M/huNX0e8gTAeVlVELpdT5UWbxqLI9t
	09o063S7F5OXQF4MBpr2e7a9peBLSfdvajl5Gf7pef/KmPjgG3kNRL+iJFWF1j645N90hCUil0Hub
	Ccwwi08C3H3BsZb3cDjrSwfqCZkcJHtk0FcSMmJGlQfYFmNVMKCCOFeoIqvNpUft65S3F9iXPKqoO
	gTGHjAMg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKGcx-001mrv-16
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jan 2023 10:34:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id q5so8747326wrv.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLmolkcXwsNYtpVGeeRXsVm3lLPGm7voeNMYUoB/fn0=;
        b=NZcYj4ufA+8bENflErXhpiYEvPluE9RpszFLOt6UuNxKzVb4T+3DkDFZTolSpSGVs3
         F48hdocgt2ELvuKov/Dhoz3P4SdYHkS4B2CObrmgMQh1S+Hjd6j/gzl7Xl0edAntG4l6
         ss+hteLlREfkR9hbf323dciHPE+eIBmbOgpZtnsoBuJ7QmqLWKBTqKJ1JWp/v+qHHAQh
         cV503Tioy2O6iLqY7Nh3j9cG4Yz6enuLEL7uIWDeKH8ImegXDasZAYO28jn/42X8BkHa
         RLgoNHCYJoAgXMpJ8QyuutIyvjh+CHUowATC+wX950j9re2J0zmSSBE4oYYFTxyaNFVl
         8icQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLmolkcXwsNYtpVGeeRXsVm3lLPGm7voeNMYUoB/fn0=;
        b=bsUeiva1hIZJyRhbz/bgiVGAKH/cT4HSWoHZQ6iFZ3AFoMCTyniDWE0yV1fXfQ4I9j
         YdozIN7VyxZ77BnVpy6lYNlu6cPkoqtuA3T6FwQNMm+62XHRI/dBV0Esz+AKpIgrP28u
         PXddcspFtoQOsolflLiJ8XVzJcsgWVl3noccCPzIJ5XPQopTLh7bfaM8eCdB/GpB5kXr
         ZbKTQBwWoXam/DT48yITaiwM9Sv0ARrO7UBTUXvyqbAUilpWSh6qv655bw3rwic5V/Ld
         Hi01Ghenzfg0unBroz/ywxTWzQeVJJg9KCzSBnsX33rrK6YOg/8RdkCgrLlIRLq0IBjV
         sLwQ==
X-Gm-Message-State: AFqh2kobZol4qIW5vIYZLBIcTJTCZUD2/e8AmmePh7hX8YG5rrzn6IkZ
	yH1FN7emZZpCNXnEfVZH7xEsLw==
X-Google-Smtp-Source: AMrXdXuspB8nkmiRDkUQo6gYiN/B7cXU/ORyyqjX7dYr3Zd8CROiQh/iiwJJRk8xJV2b+qhkGw3xUw==
X-Received: by 2002:a5d:4103:0:b0:2be:5408:5d6d with SMTP id l3-20020a5d4103000000b002be54085d6dmr14228835wrp.21.1674556471601;
        Tue, 24 Jan 2023 02:34:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:29 +0100
Subject: [PATCH 08/14] arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx:
 fix invalid rtc node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-8-44351528957e@linaro.org>
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
X-CRM114-CacheID: sfid-20230124_103408_179230_A3CAAFA1 
X-CRM114-Status: GOOD (  10.52  )
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
 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
index 1916c007cba5..e1605a9b0a13 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
@@ -217,7 +217,7 @@ &i2c1 {
 	pinctrl-names = "default";
 
 	/* RTC */
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

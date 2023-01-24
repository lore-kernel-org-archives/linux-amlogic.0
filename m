Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DB4C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWfL6T5xZe5pHMdW+tEc/zwrf693zvW7+npYIweZCSQ=; b=uU5uSi+0JqLIt6
	RCaTQ82uM5e72mj6KFkWXb2RV2OUU0/PCkc9HVBN0s6euFjPXLLH0yCaKlhnKfB+pvtXaTen+qR5r
	Evdv0Pw9yxJTaRdIGVr96wPgvv8G5YyiL34OjBiyN9qgcEvfQTVuBy4vuaTjwOSsAYBDcCF0KhsWZ
	ejudFJ+muhQC7rS+PWQYwMY1kBEqoDCNbqsxpFuPAIby3iLaNCDpi9WAJjwOd/6eoXIIQcxFfYILs
	wHLUY/cRLl+nizhXAm42DsynwJ9Twn9jtXh0jaKQJY5o7czXVjY+FXraiv6GRSCbD3YJr3GYDY7KW
	ovGqF/GhtAXar5uks6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIyI-003q2H-Bv; Tue, 24 Jan 2023 13:04:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIwo-003pOU-N3
	for linux-amlogic@bombadil.infradead.org; Tue, 24 Jan 2023 13:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/NL6LDV95iKUZ88QALB+Ce5cz9NNofOXuE/jp4Jy9qw=; b=UbVC7ymcs1D+aD3/FH/6VUsdwM
	CLlKwYWfLIdmmO0XNIuwBTGHEBAf0/6SnXOo0GTM8Eaqx0D0ijUdT6x8ktjPe3VYOzEOX5qiCDej8
	Lu39fDCdQRRK9+Y04cfskLq1O2IvUEDHx1pj9D89hbb3wRSsCaM86BEKCGgCzEoPds+QhRZaa/0Q5
	XCauC3swowPKlo0s3tzUdvvCcjfGmQfhBIpyr2/MTWAI/Op91kMHsWNE9aDu2Br6VmGxZN3E0pJ8T
	xZb5ia/qZPQPYztM6Dnj5E6/GqNuuLxJc42Dz8XvAJtF6jJ9rz3rXrtzx3ziE9+o79/k/ILavror5
	MivSprGw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKGcx-001msZ-0E
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jan 2023 10:34:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id h16so13384790wrz.12
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NL6LDV95iKUZ88QALB+Ce5cz9NNofOXuE/jp4Jy9qw=;
        b=xWCpo//8yl7WQy6B4hKsdIkck3nEgqtIZjdp8sjH8WD4jjGVX98v0nBtUNbi5QhZ0m
         +hX1wkilEisWngPsc/sDDIpWwqLnL2KzzvCo2y+JlR4mKfQE/koHINDa+H9MFlF2I8Xf
         DY0tRSLHx/SSm13nKDB21XitbYhuF8kdQS0anj0VYqHyjnJiiCvC0k4ZCt1zQVoRldwC
         1r+mNQjD9JpejtwqTubrPk3IDMstJ/PQGGQNaNLxn51KYeB1jk17UxS22gDDdqncTE3D
         uk0Yb+MIuUNYTgEwRH/679IW3eQyVIPtyUwcQp3K7wNbIJkWAq30/F+egXZ4BpKsN7+M
         WSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NL6LDV95iKUZ88QALB+Ce5cz9NNofOXuE/jp4Jy9qw=;
        b=iOOXT+JQu4N21NkHEgjajigir73SfXrJ8fVxK6NzzhZbg7cIpQ98+S4/1IkVJ/f5gH
         ioUgTHj7Nrlhu7Sr+hncHOv+KEhf+0/f6tZK4mJj/1UjAsgfOK+2+4N5ADzp7fUp7Zz4
         mxcNzRSPa7Nu/0lNLqroZgDdIavJhmKrn1mCAznyIODr0oo8sYG9FQKsMbppFwfLiR/I
         rd9i/G6dxkk2YT5qx6GaQQKVOv8Mer3kN/sVDbGmYI4zMyasrTUOQ6xZHpHFp3fCu36B
         VNAZiYxGeyByYyH/Q/eLqiV0aYtYP3mTN/7PofKy54j+iE0cAWnv89g5tZWvkfNPnjt9
         Lffg==
X-Gm-Message-State: AFqh2kq4QMs7Ozuda/Y3a5WOirIL5NIrLQ7kyCW9XQJGf040fedAY0fo
	sGSdKfMH2V8zDRyI6vcuxQ2KxA==
X-Google-Smtp-Source: AMrXdXvlr09valTA39LZgwlGfqTP2jevf0EhtZ35RPqMyoekiYwexPBukO4Bade+FoUIUDDAHDi6IQ==
X-Received: by 2002:a5d:660b:0:b0:25d:4dfb:790c with SMTP id n11-20020a5d660b000000b0025d4dfb790cmr23823487wru.13.1674556474226;
        Tue, 24 Jan 2023 02:34:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:32 +0100
Subject: [PATCH 11/14] arm64: dts: amlogic: meson-sm1-bananapi-m5: fix adc
 keys node names
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-11-44351528957e@linaro.org>
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
X-CRM114-CacheID: sfid-20230124_103407_460627_EB85D646 
X-CRM114-Status: GOOD (  10.21  )
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
adc_keys: 'key' does not match any of the regexes: '^button-', 'pinctrl-[0-9]+'

Also fix the invalid "adc_keys" node name.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 028220ed45ad..bfc500df9dcb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -17,13 +17,13 @@ / {
 	compatible = "bananapi,bpi-m5", "amlogic,sm1";
 	model = "Banana Pi BPI-M5";
 
-	adc_keys {
+	adc-keys {
 		compatible = "adc-keys";
 		io-channels = <&saradc 2>;
 		io-channel-names = "buttons";
 		keyup-threshold-microvolt = <1800000>;
 
-		key {
+		button-sw3 {
 			label = "SW3";
 			linux,code = <BTN_3>;
 			press-threshold-microvolt = <1700000>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A05C636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gNgjYLNfyJ3i8uNYR3pjOO0FspRcWb4FjjyC2wiGtc=; b=clvACrDMCUieGm
	el5RCjWP0/YIZbfAPKOltQjw/qusI4NVq1cm1ZcrJzGJxfScdR5XmjshaiBHMrjQcEeIgWcvNJ2uI
	2eh/zYbnlfmbA1bvcBnT8vQDT0eLZPMe1coMD4iGIq5ir/BNgtvii0d0neOcYWiIjy0iiF8NFpxma
	dQrMALdk8DYPDsX8hHATo7Zq0yNOY6EPZiL0HBXYxdL348RGsKH+HYYDN5LdN+6TZbBEBfNvAzX/7
	JPf+w+lRJ9PvIvKrNszR+JuxpEmFmoq9EnFQZZb06tr6Kk3QIpBRh3O1YepU2R5FBuUQXNeFG/Db2
	DczBfxRxno+CcKIReKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPb0-00CdFo-03; Tue, 07 Feb 2023 15:09:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPa0-00Cceh-Qt
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so3061650wmb.5
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRydJH6k8VGu02JCc4SOJUqtsnIm9WmAs4kNKB8KP2g=;
        b=RrEwkUkiNXikVfBbsp0CnHs7rGIG0WsMmGjtVUOt9CJTEFUldICuNcKWptjxBmDPsR
         ExM/i6sMWEFPM27IEzR/Px4k1k7qMmIXk6EbZT7j4iwkUH0zRnhr7MiWP4jbFEMgHR7g
         qpU2CF0oYyvdvq+znj9ybFlzqQOGE7rfL5bYdD3TxknjNTJ20SmIqfbLfCXFkMCryEsz
         4BfQmG/W3bltPbCZnf7g0COhPjKZk8yB3C0kMZGiPuMqYe5aDQ6sgiYmFYCSawquiVIy
         VQD9M/TZzFE/5ffD0sMFR3NqQpDCrPZVIVPHD9iJf0gUvhCLSApV9DlJeXk/NvpQxp8d
         +mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRydJH6k8VGu02JCc4SOJUqtsnIm9WmAs4kNKB8KP2g=;
        b=HwziaqE6CZ3XcokJdL99e0r7hgefiucEKxPOLOvoWovUsiEcDWg/cBQHR3VE4zIyXs
         RHTON8Vxyb31NWVABi2ahb3k9X0ByZ6veLz9VksW2G4mr+fqbXXlbpwXKtwlENnO+d5l
         ZZRrtHhZZ6JkwOq8epuiKRMCWr7dRB8qtm5APTaGBpgMh5uffIc8ippN/ma7kYNz9cqb
         ZEEy9v7JOTOlf+9szTbYqLGVz1J0xaaqsVDty1Mm4f8GFCQJCfvxUnoypfoCXmJMFUYH
         tb6o22elJgXSclIBj3nhVXRef7d6BUg6khV3lvGIhayXbo0Gbfr2IuxabHdQuAW/awr0
         h1mw==
X-Gm-Message-State: AO0yUKXhJKfTyUeDzDdMhbMMecYFEoZz6in/I2dApUCT1vtOK+qk08Me
	2XxEMoPiKMqUnOEa/PVouzfF5A==
X-Google-Smtp-Source: AK7set/fPrVC6hzYUTUxefBmh0Szf/PnEdAC9bPokUbCArbe94doBh5aYwHLoVy8VC8BsRtAcZ3eTA==
X-Received: by 2002:a05:600c:4d26:b0:3dc:4633:9844 with SMTP id u38-20020a05600c4d2600b003dc46339844mr4197035wmp.17.1675782498704;
        Tue, 07 Feb 2023 07:08:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:07:57 +0100
Subject: [PATCH 4/8] arm64: dts: amlogic: meson-g12b-radxa-zero2: fix pwm
 clock names
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-4-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070820_920360_C85B0360 
X-CRM114-Status: UNSURE (   9.85  )
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

Fixes the following bindings check error:
 - pwm@2000: clock-names: 'oneOf' conditional failed, one must be fixed:
	['clkin4'] is too short
	'clkin4' is not one of ['clkin0', 'clkin1']
	'clkin0' was expected
 - pwm@7000: clock-names: 'oneOf' conditional failed, one must be fixed:
	['clkin3'] is too short
	'clkin3' is not one of ['clkin0', 'clkin1']
	'clkin0' was expected
 - pwm@19000: clock-names: 'oneOf' conditional failed, one must be fixed:
	['clkin2'] is too short
	'clkin2' is not one of ['clkin0', 'clkin1']
	'clkin0' was expected

Fixes: d747e7f76a5f ("arm64: dts: meson: add support for Radxa Zero2")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 9a60c5ec2072..890f5bfebb03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -360,7 +360,7 @@ &pwm_ef {
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
-	clock-names = "clkin2";
+	clock-names = "clkin0";
 	status = "okay";
 };
 
@@ -368,7 +368,7 @@ &pwm_AO_ab {
 	pinctrl-0 = <&pwm_ao_a_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
-	clock-names = "clkin3";
+	clock-names = "clkin0";
 	status = "okay";
 };
 
@@ -376,7 +376,7 @@ &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
-	clock-names = "clkin4";
+	clock-names = "clkin1";
 	status = "okay";
 };
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

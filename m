Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7770FC25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sYsvW9tSESluF38dG7jAEsaMuH15u0ewo62g2QySis=; b=yeEg78CGQ+adIh
	9vSdoDDt8RfQCfykbMCy2sq75pAJ1ILGFlfx4NIQayUMj9OQnoTLLB3egyowgKTiSw6xICziU6jFi
	Qq98HaoC6iAXdwDI7+vjinjkEwooeRFMIOqDN0P4CCrXpJwMeY1EPpOsSzmo9GXYX7gGxETdFi6Bu
	qeFO/fhD5mHLhp+2/4WbO6HR4zI1uHVG/nm5eW80mPM1rwXIAELRAFDBC4Es0SazyL/VcKUZMW8Xp
	VPIy7r7+fwjnwJtgSNhh9hoVa5koytxCallQTCLW0x0jiZBXU6/RlJIFXMwBY/l6dB7jmcFfoxSZ5
	Gsf9EsTn9KzDhT/Ua5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHlJ-003WYE-RZ; Tue, 24 Jan 2023 11:46:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdP-0039DY-GX
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id e3so13380132wru.13
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHfZHwPiU+/Ex/faMbLuK8u2HgXYi5so81nvC+syeg4=;
        b=bLJXZNYZ6YNcuYD1aX8WONfVyjqBC4bB2+DBepOAIlRkxvbiQDQ+QtZfG7efOZWwKq
         Rl7WbcPBFhq9ASqF5oGicFzTlUPSQQXLL8c7/pcKIMNJOvJZZBmmlPVImfMthIhHYzJR
         NXFVsDH1oQTODDytSuxet4pyjfWAxuG5FR+E7ykgbSjt3ZdL6mr4Qxv84Wc9jK99pJH9
         pnOJ3wqNjEbabGSwU4NI+w6JcxRzG45UM0vFbOpMnoafjYxBNPEFvJrkFZTTKb4xwaFu
         m7oL7zuOjfxhNnhmaTv5HWQB615N7ydYNh/IPBivKyqTJH/BFTAtzXAmN/0wsusv3P32
         L4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHfZHwPiU+/Ex/faMbLuK8u2HgXYi5so81nvC+syeg4=;
        b=u/yKL/DN0wakA59p8OugiAHjMMAnYaHtXzBaEBA+U8nPujkmXCxNnTl132+Dugzo3Y
         ZyWdE9gvkZOhJyCtpeSgkA+myExgmOnlkg9MoRCryeGh7pOs6ve9K9yYzC3iIIPB2w5o
         wmmbwVTKro7QuZsSOoS71rrxLtT1aCdXFQrmHZpi5tSTk/pYJfq1VygWVWCOWA6no50x
         Pb7WbV9D5n30grEsbPcxUNt8aVHL2QlH8kS5WQjsUadZJUKWE3cAo4bnosVUGAL7VIlS
         q6R8hHmgVF6nhek3/NJ6HmZ9u2H9HAr5NIUO3leT3q2kZLpe0WJ6cH9Z5sza8F7SghZz
         AgSA==
X-Gm-Message-State: AFqh2koyG61DXC/ShlUkxc3sJZ3GYrxK7ESvy2VHesMIRmTfKj9ZnoB1
	7biLkigDiLtDzPtnevvZ8KJxaA==
X-Google-Smtp-Source: AMrXdXsdaVFA1PXLjA6oIqDQH2aKQxcloRcd8o7Qz3aApI0teF+QhkqLIgW789snhkpEiFSA3Igjcg==
X-Received: by 2002:adf:f6c5:0:b0:2bb:dacb:638e with SMTP id y5-20020adff6c5000000b002bbdacb638emr18860368wrp.33.1674556473327;
        Tue, 24 Jan 2023 02:34:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:31 +0100
Subject: [PATCH 10/14] arm64: dts: amlogic: meson-gx-libretech-pc: fix
 update button name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-10-44351528957e@linaro.org>
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
X-CRM114-CacheID: sfid-20230124_023435_555604_4EF70411 
X-CRM114-Status: GOOD (  10.55  )
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
 adc-keys: 'update-button' does not match any of the regexes: '^button-', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index bcdf55f48a83..4e84ab87cc7d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -17,7 +17,7 @@ adc-keys {
 		io-channel-names = "buttons";
 		keyup-threshold-microvolt = <1800000>;
 
-		update-button {
+		button-update {
 			label = "update";
 			linux,code = <KEY_VENDOR>;
 			press-threshold-microvolt = <1300000>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

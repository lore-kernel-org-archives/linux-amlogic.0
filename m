Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B3C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APiHLPPGQkkqJXV3Mph2xwko4InmVa4sMx/GqbPN+j0=; b=YTzhgniLmc+JEK
	tGUBECLuE9CvZlFxYbQS2usmQ/0oJZI+yE94Kp6gMZDem8M9HwVQnE6mz8uigim6oSSUw4hTlqzM+
	/kU00MQ0br9mTOJnmRBwfx3vcDrZyWy8Q1ziR5BWksKwdCrJwLBu7MOQEKQMwy9PvYtPYkJDjNUf6
	ipphDgZo1RKZPw46iAqV61hrFZtwgzG2gBD92HCEAZgS6SxDwMaXSWu/2+AxrWUnOflgm1KpLuMSg
	fCAWOnoIag6YZZ/pyf9iBBKTqogdDPlr7xlsCZZy5JA17IS5kwCZRW5IeZ2cZdBsxeNrQyV61z2nO
	2WO1ymRcJaxWb3zU435Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHkZ-003W1k-0C; Tue, 24 Jan 2023 11:46:03 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdK-00399k-Lt
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q5so8747211wrv.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDkw5uUSHahK6uimGKGD6b5XhPSy/LFSBRYACRQcStY=;
        b=kt/au7mwf0gCHZKYy+JaOKZpWYolFimMoXam6j0giar2upY3miaBvXo4a4eUjzBXDB
         pUtrlyM0iGpwERlpLlGoL5RIHFIoZUNwk/S/98o7SDJsv9Ak7hxScuVzX7xQIQQOPh2P
         G4DZg8YkboQcDgTnSzBuXA/PGhRmCqWb1s4Z95cPEejONOvnOp2slR43vWHLjkwSibFM
         IJJFaSPFIntyxJK8YbphfeBnv3VEcpiaSROODZ6Hp5HFX8RadIimxJlYrI5a0br8GRIq
         Rr9MQQeiCLmTTCIN4AYKbjNA6XCBo7URIL1pnz8PPrm8x6/7+hkLuU/l9DOvKk9XgXI4
         N91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDkw5uUSHahK6uimGKGD6b5XhPSy/LFSBRYACRQcStY=;
        b=ofJ18G7FHtP39IDoEtbZAvN/cnGOOLIbaKvpnUo+xEwMZyF3Acx3Ok3dCT3vqoiMSn
         j+5K/hzrisMb/Myt9LL2YhkR7jFZPztWM6NDPol+4mtOSNlH7EZMd9VcK1rU/8Kcgl/X
         +RnrLwFSDT3+W8z6z5yPcKGak8LpfNNE2gptREJY9AmyFGrCoISXASHsbkQLgUgEujWk
         LEf5Sx6e7wRVfmgpsa98+ihx2Im4UNk2iOuNop83pXRhGugudVXLQ0FFChnv70zRMPSJ
         N6YzwxQdEeAsilLz+nFzh2Rp34a0Ss6+tFpy06WLvG6w6alP6iHpZ3f7qnQVKhiL6Me9
         Z0iQ==
X-Gm-Message-State: AFqh2kp7TDkAV0d5wg1/lQEPvJ+IPlHSk+II4zkQd1QOZltZYYlzK3CJ
	SAAnz35iDJsFDnoLh7TIVkyn/A==
X-Google-Smtp-Source: AMrXdXtAp92ghy5/k/AzItdKvXr7s9bAcSnSJRYodLxhm2vU7SRRWwkJdontVZaqS+WSag/snj4FCw==
X-Received: by 2002:a5d:6b50:0:b0:2bd:f17b:bfd3 with SMTP id x16-20020a5d6b50000000b002bdf17bbfd3mr24830132wrw.4.1674556469040;
        Tue, 24 Jan 2023 02:34:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:26 +0100
Subject: [PATCH 05/14] arm64: dts: amlogic: meson-gxl-s905d-sml5442tw: drop
 invalid clock-names property
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-5-44351528957e@linaro.org>
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
X-CRM114-CacheID: sfid-20230124_023430_767186_3FF004DA 
X-CRM114-Status: UNSURE (   9.18  )
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

Fixes:
bluetooth: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
index b331a013572f..c490dbbf063b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -79,6 +79,5 @@ bluetooth {
 		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		max-speed = <2000000>;
 		clocks = <&wifi32k>;
-		clock-names = "lpo";
 	};
 };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

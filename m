Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B025EE498E
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpbdLQUY0r1jOYI2H/pPsEZkZqTUwa3EfEN4XV0yPmo=; b=PztyOqfj7CJv2M
	Svvgbmh6mko3mRx89lZgWT9IoPB76GMq97EHNH7C+a8WoerYz3i0IqhLqxwSzcVrY0Zk4UVJdPt90
	tpKYB/QqJMe54FbsbzO/shdojCJBoTR4b0yj8Wy4vNu6Xt5KwBUxsLvqedSla/pFwNZ/yndi4WnX+
	gb8yGlE1AFd0EgU/z8eizp7IwuMsEzuX3Y7kdZMNAuVkCZu6XHsdBBY327UfM4ZOTuB5s+EOjqlTs
	7LkrbnbRNAak/iWitxnd/AtxC+dQktCLaA5nWGlJhIQ3tJDVnOyjfhCAwCm+VEcEt2HRCaXDzzZYH
	n1adEAjDml8uJidRiuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKVB-000000094Mw-36bC;
	Wed, 11 Sep 2024 10:23:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS2-000000093Jb-2IDd
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso4586005e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049993; x=1726654793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r96gtSeyw8hgkasAvqFOFnv2ushN5suY6xplKdH+xFs=;
        b=JLxXYjodp6vZ4aoKOqSBixtk4oKcueaNUZVZt/Q+iqOLL5/yozSX8ZEb0rukSokpnA
         zramJOwdGqfVuiXrZ2cQTKveoQl+N6jVWLoyQ6b3i9iEH2bzD9xgm2t+d+0dS4WCV1Bi
         pNSQXxy0XtmWSBrdehtLXhX62PqWawIRtoBwINv7E9fDyDIVCEvQ558KkGoIkST7TLHP
         FA0/7D6+MTV4KPOioEeMEWYOHu+NmapBoTCppun47K60VbfbqOjxbwEaXR+2NV3TKFO4
         H0KoBC8JcZqdy7BwgEu10SF8vksIDaDrSSasloY56LPpVcgn5LlqPHhOm2pW/OxutZHC
         ew5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049993; x=1726654793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r96gtSeyw8hgkasAvqFOFnv2ushN5suY6xplKdH+xFs=;
        b=AJwM+mXvnZ44EjNLzekCww1Ww7QvsykxZQzhyYevZplCGWJn0wWzw0GcHcVWesB37Y
         ewFmkk5P3CgLFc3jXRAAPWRtkDmsYmFDuMtLR8M+mNoa/MypVWN33F9wd+CSrrlcU7MV
         Mopzf2jI68u86sqhGCSB6s0hjEkvE9dAnRbGiJAMW1cRgNdN4S2V6ZP0FqKxWDdj/fAv
         pAnZkvEoMgFarnW8l+ths0qcMhEyz1TI6AmJ+/U7rwGWfEcZa35jtdIkM8/9+7Yhvbe9
         6x06v1eE1rEN6bWycSHYpRF/bPzE/dSzP/aUJIMVyoGMqB/GmYL7wYPpwBwK0sjlHfdF
         WnfA==
X-Forwarded-Encrypted: i=1; AJvYcCVOmnEknjke5cTXN0yjChUfRPaebSMz7y03zJo2Z09vizhtEZy7r9Rz/x8eTIp8U88opMgEftIKc2LivHy1@lists.infradead.org
X-Gm-Message-State: AOJu0YwgxHScOKDycCCnZn/7lXECVxR2KAKEFEHUcTyQfhQClBEIieJo
	tWL67PeGdIVYW07J7gnrZjrTvMOZHkZJjxije5TyRWXrf9CXglKpGHlSGMJZ98M=
X-Google-Smtp-Source: AGHT+IHvTvCBeGTxd8AjI2Dpw7LegdyVfXJm7IbEkorFtXOOEPpp+W+ARvYtiFYskxEgIK4YgMynnA==
X-Received: by 2002:a05:600c:1d18:b0:42c:b98d:b993 with SMTP id 5b1f17b1804b1-42cbddbd807mr36188205e9.2.1726049992750;
        Wed, 11 Sep 2024 03:19:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:42 +0200
Subject: [PATCH 3/7] ARM: dts: amlogic: meson8: fix ao_arc_sram node name
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-3-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3rqB+QfGX7ZNjnSd/wuOaHFj5dZkI907fn9bX+xLKhw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7CvnflnGeOULFzAjmTVYGP2qlu7ntsCVKLVvpH
 rsmwVHCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuwgAKCRB33NvayMhJ0fHtD/
 9WS5zVJp37hJTZ1PEf4TMC9YFrVJb0rBBF8D/0Fe0+9XuanYQcaSJsdd3ocA3kY0VC7iJG4VHVjm79
 IXn21Xa9VFEI14XuDUr8oqiviR3gMJCgEJEso9X7JY5xfvEqKrjp/RTjCngIwLtoZHwQr0p1ILMzXL
 xe3ryaBok7CfI8CyRwRQUdbNvtOx+gFt6GOsGDy/nN1YzBhg1ZCSBwgTn4/ZMz9bTFyYyeyZK/oZyE
 ghQs3V1Tk/Pma8J+rozQkxOepsMWibpVt0etYHb9eSFKQ73TvJ15/63fPOXp7J3Hw9OEElGHPOhKTk
 CSnkqxmYtNT0ZRW9KkNED98kYN92TFXnVncxY9WSagMiS70Nr2XE5TuysnWd849bDM8Sia1zh7L9F0
 h267dnAIVdfnvUAHVafRIc/e5olKXHhuCSywrSi/3TVRWGylvJJislrcJ8tIdqlbckvIW023xTcu4O
 HvCONVgjeapLs13FvOJR/aaaKbU3RYm3sWCTymTvI0p+eOziKR66qk2y5k/VTzF78gwRQn5elt7SFg
 oqm0CmNK1QbaOfyiK5FN3KBjsqu/i8YFbYUi/tbq/T4P3awwcrsXk8TAqBo5v57rid76wdV6BusIag
 7+xpS0XL4h9m+dvgRr1yBJTZRkU06CQDTLB2ATwQELjJ/Q9tS/CQ+9Lx8QEQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031954_699029_37D61497 
X-CRM114-Status: GOOD (  10.95  )
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

Use the proper node name for the sram, fixing:
sram@d9000000: 'ao-arc-sram@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 06174d8df789..1023ff0a4f9f 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -589,7 +589,7 @@ mux {
 };
 
 &ahb_sram {
-	ao_arc_sram: ao-arc-sram@0 {
+	ao_arc_sram: aoarc-sram@0 {
 		compatible = "amlogic,meson8-ao-arc-sram";
 		reg = <0x0 0x8000>;
 		pool;
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index a3669025d8da..641cd60781a3 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -535,7 +535,7 @@ mux {
 };
 
 &ahb_sram {
-	ao_arc_sram: ao-arc-sram@0 {
+	ao_arc_sram: aoarc-sram@0 {
 		compatible = "amlogic,meson8b-ao-arc-sram";
 		reg = <0x0 0x8000>;
 		pool;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

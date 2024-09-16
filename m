Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258B4C3ABCE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KBwzMRS70kwNCghX6yOdxh8XrSKObwuz6kJ4A7auTE=; b=Q5AtfHJ7d9q/lq
	pO1Bn9rMWzFRNm64GKUVLacF60Zls/uzZd9Xx4twm7B2Q69dHdHa+rcVf0NVf05La2NUxW26hFNWO
	RUNAXKNKJ52kPU7xr4nPpy0vZF0LZMDXhRHfka2265/hD27dB0jDnFaYpSaCUWSJCP7wbfmpDNcae
	vwAHONsfXBC9IXcD8/EbhFMGEraLf8WTUug+UC0Ij/9sWBx7qv95WJWo/5hITyCgh4tBEAIZx81nK
	KHCnu9V0Dn56QJ8hprmx0ZAM/lCxDWRLlDus7J2BzaruQCPZukmwj02jM86VOjGFKcKy+TkCRvGpv
	Ib4w92HeYOMlaG/kioOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6qC-00000003OLW-0fUV;
	Mon, 16 Sep 2024 08:12:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6ms-00000003NBf-2ycw
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so39320385e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474125; x=1727078925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4wUhm0cu3hBHUEYa0x86SgYN8H81Zj2MCjJCMMAWRI=;
        b=WVo/ulDWnHqtfr2FcDbcmL3k0FbST0qX+o654EtXHbj55Zzl8Md6jYEsx1x0GRPPkW
         cP1MgUf+lwNbPyVeByd5rmEguW0+FCFcePCxBhSrJzGsVUpB8mRI4se2jd3HU2yChY3y
         U77pfl47UIUadbXrbsbb6oyqKzUkvlNM+CDrbDM8XgpDqhnEsoEU3Xr0dTj50WYcdggq
         BEtCyg9G9Ku518alcQmVztM5bbdrN0ll7A9cuTD+lpWWeilt5KPCHQ2l65t87/mUaYaz
         vCY05UQp/4A5Ojs+QtvLl1UChCiPTQwEMhIW8iXotKSS/F6n+OtxoXem+VRLC9+y4qnO
         cShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474125; x=1727078925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4wUhm0cu3hBHUEYa0x86SgYN8H81Zj2MCjJCMMAWRI=;
        b=rTv2vtIO632g+S4Y9uzfzJWDTz/y8M7UvFxB8h6WgdoksmRLatLVTj/8V/ly0BcAsA
         1guNVAtVmUPIRqPaQhBbOgsfG6rx0rqsq0mmUnhkgh9iLYHQE9HVs/0cd1IFr3hQ31rf
         PhbgAIadzu2XDE5CjLlEo31+WMM+4yPeeI7A8EYqcivMFNpVwPbjCLsHOJH4uRoheEUi
         0RFy+2SCAcLYLlDm2O8evEDH57U7WVPKjKYwtxDywbqawmuh/7+iG/sgM/Aw/NkizjW+
         P6hZpnBmHw6wzYX6/LiyeXEF7xYL7PlbQIyv5GB9vk8uq9l0HTcicFdBAQCylP4zEYIG
         frbA==
X-Forwarded-Encrypted: i=1; AJvYcCXWIO8D3oGLpnTjhFKD/x7qgaUR4qxiYXiPlIpTEsQbpiZ4deqVnVM7Ec+/gV7+9nF4rsA9n4eC+ABXFpu3@lists.infradead.org
X-Gm-Message-State: AOJu0YyplFwCndmR0lFPKKqugDmvRgovtN+wgJBNI7kxocTc5yPInSaV
	swi0A5oc2hW0nGe906SYUYQrp5F5nlcu261Ldj9xOOT9eeZ7XxHVyKrlaVDsSHw=
X-Google-Smtp-Source: AGHT+IEEtFhy5pnqwLbguE0Let2Vs6QT/MwMgpvWC7qAp530UpnXgzMO17yRHJNo51o4e9eEDEE4Fw==
X-Received: by 2002:a05:600c:3588:b0:42c:bcc8:5882 with SMTP id 5b1f17b1804b1-42d9070a259mr119157665e9.7.1726474124954;
        Mon, 16 Sep 2024 01:08:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:32 +0200
Subject: [PATCH v2 03/11] ARM: dts: amlogic: meson8: fix ao_arc_sram node
 name
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-3-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9pkmPMaCzuJsZQBTyX4KDWTlCReuscQlzRru6w4vja0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eFEOLQNLSwLkI0iQ0DaKiD+pZC4olkBikY4QDM
 KiPaNseJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhQAKCRB33NvayMhJ0bSmEA
 C7/HRuENo3HLTdS3Lbuxn2YpbvD0Q9p0LI+brsjmm5m/UXGmJZg7a8AlD4JKtmoR7QyFMRkCXfEoWz
 VrY3s2HPNj2f+cFVRfGVOeOSqqEWEe4Guv/OIjccXwmbEVhnj+WREPrjjgqeVM3V7pVDxwpKUWHLrv
 xvstbuTO/rigmCnmkEGcaOSMzQJcXNDBuVt0oz0XOShNrcfkY3VmStXOuacT//CvQcmUgcf2M3KkRG
 NaXjSU8JCKIb+QQeHlo1aDNGIw+cAYex1lPgKQbjllEAaZtW0f3bWfAnks+Uq10PFl09Bvlnl/PSBW
 j/QSS1RIlN8UAgyqQMbtG2MUNAXy7hAEK/gCK9iERdTfq5tjl3j+AN+3PwGdRl3PwepyXl3cl2Nxe2
 oguXtaRIiVMhv1s9EVn/+275CHw/bO3KbOPaQ1nzkyj/sSbc8vWzobPNNHDy7dCGeilH+0JkUYGA8f
 qZ4P9yfBMpA0x4dM4bgiViwovaN7ZSq7S+pRwiUriz0yX1n5BiyZCEaG7x9lgRK29MR6qfL3eu12SN
 uubzT/8Iwm9VPgOU3e8cHZ0NMiqUMzxhDkutmPdiAuRi2ztyq1aC2Mfv+DOZEDaNh6LXaLUHrudCo4
 tIey1HjUJ2ZHTY2/cSnJsqfsKwlhqM7DfPoUchsCdLMmVIEo4DGRzwmYZi8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010846_848417_FB56E8A1 
X-CRM114-Status: GOOD (  10.91  )
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

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

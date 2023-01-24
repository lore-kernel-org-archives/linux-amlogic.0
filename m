Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2806C25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nURZ28zTRfJBD/UeP7gdOdcG1pEgcnlLnrajsvrDpJo=; b=G4kNCWwDJKbm5z
	zLFKVdtT6vK5XC+Y9cNz/HDvdxPj526cXgEukUQsAK9FAusZWED0Ri9Hn0wB+MpePdQc03sGsLoEp
	0GVtyO6a6RSuADO9LL6hGkeaOiwiA12zPY0Shm+aDNiEbYFJ8y23nVuAm2CjJbCGJcFtf9cVtUfS6
	9yOdMfpICaaxoun6u/MAXbEfkGCUOJxKU1mFerhUVOSKUV0jvJHVR2xVROsi8Ro1ekvFbBdMAaoE6
	NMWxv7mz+r8GucDOGBCEuf3hM7A7k77eaWDv+wVqHuZc/0ArmFQdC0OvpXae/UZu+A77IHYNoC7yY
	cSTpM+ud+3MHIlcHyCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHkP-003Vuy-1D; Tue, 24 Jan 2023 11:45:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdI-00397k-LF
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk16so13385622wrb.11
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5KCrVUjHQ7CYQCved0mtIgwVFkff6FVL28Qru4rupM=;
        b=rCHaNlocN7UnOx+q/fVQ5SEbuhKfeF9jie2UTKZPysV7MvyMx8qdsfYucf+FzLeGW+
         XQow12ijzfN8tOGmmQCu9VK2DwoaT++sLWlnYM/taPHrMIrkHFHNPL/lB6BkLXHvpDpE
         kwie4sPqo08mZV7x0zsnagzTmxsVD9nk6ul9IX24QZ374UeAada8VOTmjMV3AzopNYaw
         bxndBkTMYMnJg5DlH8SXJ1am2cSbj5CSAW2DyLaIxNQ/Lrr19lDszsaonoOFmh3L5XtE
         9YG/J5vCMoHu4JOLzIMc0PSi+P3MTvKmoQ8qc3kcbquqJRPNtkHWetgTLf4YUo6Ptj5q
         Pf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5KCrVUjHQ7CYQCved0mtIgwVFkff6FVL28Qru4rupM=;
        b=mnZYHY0glTmr2rKt+5x3v5GLuzgKqQrORj9VouMEU1igvx8D1ZeHEVCIrbmXCrZgPi
         7tOrtonxo3ZUbIVSnRzQ4PwH7PmiuwSzYoB13DEe39pBnU8ix4IfmYs+J7Mfq8wcOTpz
         M8B4aCVJ+yrIt5XPLL47aU4XhpBFGjt/SEyvnwbwB7buCD85ONQJIwj8W0pl+XkjSwlC
         YR8gITYyFjePRZ/6qzu8Hy3CIUMy01jng4LP8Xgxv2W7CoJoag/khpB9W7xxq8dnUS3h
         +1mmsum2IJRLvrmyX0gQr8B5jTfvQOqu6F4XlqNYb2GroQbbifXMMiYnHANInHOW5mER
         Vv0A==
X-Gm-Message-State: AFqh2kr9su6w6QxTOLI0385U5FvMNLBBumVV6boNeHVHV5LyE7KkxVXC
	BI0kAVQJIDQ7L2v6fD6GId0ZSA==
X-Google-Smtp-Source: AMrXdXu0RDV0SkAYheTBT/4bnxJuE8twYoMFEyzsJF7QeXPO+ys2zWHaXTXjFDK+IBzalzIZSdWVww==
X-Received: by 2002:a5d:5383:0:b0:2bd:ca3c:344e with SMTP id d3-20020a5d5383000000b002bdca3c344emr22956013wrv.7.1674556466425;
        Tue, 24 Jan 2023 02:34:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:23 +0100
Subject: [PATCH 02/14] arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs
 node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-2-44351528957e@linaro.org>
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
X-CRM114-CacheID: sfid-20230124_023428_759006_F4A0966F 
X-CRM114-Status: GOOD (  10.69  )
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
scpi: clocks: 'clock-controller' does not match any of the regexes: '^clocks-[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 1648e67afbb6..13f8d483c61a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -153,7 +153,7 @@ scpi {
 		scpi_clocks: clocks {
 			compatible = "arm,scpi-clocks";
 
-			scpi_dvfs: clock-controller {
+			scpi_dvfs: clocks-0 {
 				compatible = "arm,scpi-dvfs-clocks";
 				#clock-cells = <1>;
 				clock-indices = <0>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

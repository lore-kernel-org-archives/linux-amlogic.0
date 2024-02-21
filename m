Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D18C48BF6
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOFUYk2WALlIDMQhvEbkVH29+uI3Tnsjq04D3cfeA7M=; b=rt2lO72YmZFhWD
	QrqnOJcgb3iTDWoi0kMT541ZUxJSQcOaOrnjk2CspXhvWotdpLdLUhkUBBVsabCtNQpeMUG2BweP8
	IZZp/JR1jib71CfqZubYEhbNFZ6Jqnr8keomvxnlRzOcs9i0L6y+vkzFAnlmm6TB/3s8GVURGHYm5
	QHqXF0z6Nnhz9lQRlpzsXymtP0ZrU49ALet1q5FUoNBMsiKWig3qsmnXVuBtMuEzpD5jDVXJyFjRl
	o8EanjK/LIi3+nH1dLDePvVLhNH+Xao76dJ2W47QjyR2MpxGT+MkbUuWus+hRqSP4vvUCrhFxC2TI
	MemLxUCXeRkGZXbDpC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcn4y-000000019uY-2sXQ;
	Wed, 21 Feb 2024 13:56:08 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcn4s-000000019tv-3JyT
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 13:56:07 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-511976c126dso903216e87.1
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708523761; x=1709128561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Le192e9NnBtNARlv8O7J8W0J9GLYd0M0VbDbOwWdLN8=;
        b=cYjS5+fV0Mfd+igjqNnU4cSMATsD03rn7VBnGAVeTbVCzT8uQzemwsEWdMAmlQnGnv
         QRszJoAtlA5trgn19b/ixsWYS1P3PnwcQzRYU/XRlsLC4gtCvB+J9cTk0EO8pNrbgaKv
         E/ZHqlZ8Ck7eZHXZhH1x8157R82ktrtCXo2WapjUspMY0JyjYwdzYLgxiSfBTthyr9R4
         88LfGJYC9X+uZzGb1e8H+4fzQwFtCIrIYE+IhmUrJeV7Rnun7gjjp76UOgvTz6wvosep
         /wdQGKTk13BUH30TRJEyA8WSaa2UmmypP/d3rrfzETjlwOLCAovWUlRT3CHWt5ccgNil
         9wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708523761; x=1709128561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Le192e9NnBtNARlv8O7J8W0J9GLYd0M0VbDbOwWdLN8=;
        b=UiQwUANijUMzcT/pjQvP+YtGLry7qZW0KvWHhJrvOxhspO+6iRya53T9ozffIA9FoL
         shazSikGx+hM0QtWetrmXvRGF1NGU9W1hsGxAR1GOYt2ILJ29/IoZl5pHL5vvZefFwWi
         DWRiod0wV64jMcIGMNL8FJK17S9HPxM7NPOgip7LZOpibA7Y1S9/99zmu5ZARR+xv2Kc
         2XJxc3s9yAGp7XlWNg+0djCgQzkTT7lIiWeHtcc+P1dy29Bo/lkOL9NnlxB6r3kstVqb
         zMgHSxR8qOYaeXpaCCKu4zs6y4kNib+9RkA5G6LBuNnobEw+vpGbFO939oQlXeoo8s5w
         eB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZSSFeNZWcrLC9l0uK/ErvA6Xu4ebqTnqLUAyVkYQLej8wu3BTcoQQvHTd+LZQ875wSuMJbRzGpQoeXdl+MJXePrnwz9d2ZkSYKsC03On+agA=
X-Gm-Message-State: AOJu0Yy5rk1O1KomMthvHk8xUBsiLYAm28xPcHIj+D+f0vjaYUAJt8Mc
	4E3JUw0ycjFQ0zal9eWHpS8FlQlVkuQbwbV2c6OHZ7gqP/XfD9meSqEmI8kES+w=
X-Google-Smtp-Source: AGHT+IFzBms37jkcoNd2VL4j8syw+iw5NIeLtWdtw9mHf2B+BUGMNW6TYNBSevd/h8IcaV1ffhdpjQ==
X-Received: by 2002:a05:6512:2107:b0:512:d6ca:71ae with SMTP id q7-20020a056512210700b00512d6ca71aemr613204lfr.31.1708523761219;
        Wed, 21 Feb 2024 05:56:01 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:c6d1:d0be:89b3:294e? ([2a02:8428:2a4:1a01:c6d1:d0be:89b3:294e])
        by smtp.gmail.com with ESMTPSA id ck4-20020a5d5e84000000b0033d3f0eee9dsm11831527wrb.27.2024.02.21.05.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:56:00 -0800 (PST)
Message-ID: <814c9035-1fda-4cd3-ab3c-95b58e2ecb22@freebox.fr>
Date: Wed, 21 Feb 2024 14:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] fixup! arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Pierre-Hugues Husson <phhusson@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
 <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
 <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
 <15fcafb2-4b4a-40a1-8ef5-ee3aef9b3b9d@freebox.fr>
 <95cafd69-de6d-497f-b3d6-b6d7a8a3b795@linaro.org>
 <e3e47a72-8a6c-475b-a248-95da5dae24ff@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <e3e47a72-8a6c-475b-a248-95da5dae24ff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_055603_011273_4D1272CF 
X-CRM114-Status: UNSURE (   7.46  )
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

Drop compatible properties as requested.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 4 ----
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
index ed79809b15859..9591fdc31ee0e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
@@ -7,10 +7,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 
-/ {
-	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
-};
-
 &uart_A {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
index 5da88fb94fb98..55fff35b09ae7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
@@ -7,10 +7,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 
-/ {
-	compatible = "freebox,fbx8am-realtek", "freebox,fbx8am", "amlogic,g12a";
-};
-
 &uart_A {
 	bluetooth {
 		compatible = "realtek,rtl8822cs-bt";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

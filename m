Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C00C05027
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUuJ+Ix2WhyRvIgv5prIVZzLm1NX7O710fJbB2HgfUQ=; b=Oq+chNT6tY0jl7
	7LvYm++6x5ifVkn7v6MSjCdak+NUtJjShYVDXCuNJfP9JT95hBR7cUr1I2T4VZ7zap47Z1pfv77Zr
	MhfTXs9ElayzEuF90yiGkg7DItcUMWN/HPAr8C8FIz4CzkrLMw8027SWzyzY9wJcLRUQnasMYBuh/
	irqS4an/8htKes2kBVxzM4D4kTZDUnIX5EYU3HY6tVi2skPlWgtxyli6RpZyjlTvQA6ft21hMvybe
	gC+9CBm+ObqPChgWgeKwRwVidRVITNOcAcH0htj6ujhZKWPdqPsCE66LjCgMnLAsmpnSij2uDehVB
	SdpChhr8UziFLX86EWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS38E-003fFV-7M; Tue, 14 Feb 2023 21:46:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS362-003eOZ-RA; Tue, 14 Feb 2023 21:44:20 +0000
Received: by mail-ej1-x632.google.com with SMTP id lf10so11612087ejc.5;
        Tue, 14 Feb 2023 13:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbHCaVpympgD+rZ3HviBrecm2Nox2/uMHYu24H65DxI=;
        b=UWDRUL4uC/fLxhAO2XHD/9ZST4q+AwrnyiErvFgyKNTV2alU7YC82XKLePKM1LG565
         aznqOd355jQ0Z4/3Ho9S3fdo2Pz78sNR9HZRQWUPgS3yXfezP+BEvzONzJ8WJ8E88El6
         n+oZFBE8wDcoqoKEiJlGmiOwkH6wGscgcFnQj7cssLX313YweR5qBWUfr7omY5IwGVMp
         iS3o+gYGZgd7+x083fHdgl/PkzSd+FxWMeWNN5ZJbs/8bYQjDTNd3g12mO/pXJFmgseV
         /qnoT0LPbVX3tyPwaWWEwv03yILFXd7eWjTxE6PbDDHbX9B2N6uZn5ahax59gdB11u8M
         Ydcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbHCaVpympgD+rZ3HviBrecm2Nox2/uMHYu24H65DxI=;
        b=1uPGG+GUMuIWGB+SddXIXExiuMdN8YS3clY5VpLB2d5BOPfe/OVGGAPhtHiJnDqaJS
         DKPvbYa59u9YNgEq3bjw+3lmKGnoLOmn/uoukoIWga3wHcxxqw4vmHq1cw2btQcw0z7f
         yyYc2wQae2tkYYHH0wQh08xVZyvxsMJZecdf6U7FcQlzHDNM/54LOi8gLlAR/u5qJJoG
         BTFiuC46S/4hZoO2VXWAdSmtGKD/z9X+meTHCnCvDtdz6uHxqf/VbjAkT27RBcv1f0rO
         Xd9T/aInhroZceDmUXKCo2UZ346BWasesKtvlUNEG4KZT7zcwqFuc7z6Y77lTy57f8da
         Pi3g==
X-Gm-Message-State: AO0yUKWBeNvXq1wPvL00O4DAfem4pbo3PZQbCYZp8clx9rdIvkE7LeeB
	Dp0ElcqOTgb7/iEu81qHXMU=
X-Google-Smtp-Source: AK7set/r5p4+TIUHGxGEziaM2ujswam5/RjYE31PKNOauB2KjuV5YXikWQOIKF15RK44rueEFZGcRw==
X-Received: by 2002:a17:907:10d4:b0:844:79b1:ab36 with SMTP id rv20-20020a17090710d400b0084479b1ab36mr410828ejb.25.1676411055609;
        Tue, 14 Feb 2023 13:44:15 -0800 (PST)
Received: from ?IPV6:2a01:c22:7234:f800:b56b:f43d:948c:eede? (dynamic-2a01-0c22-7234-f800-b56b-f43d-948c-eede.c22.pool.telefonica.de. [2a01:c22:7234:f800:b56b:f43d:948c:eede])
        by smtp.googlemail.com with ESMTPSA id bl4-20020a170906c24400b00880dbd4b6d4sm8749475ejb.136.2023.02.14.13.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 13:44:15 -0800 (PST)
Message-ID: <1c5996a5-491f-39d6-b120-bbef86473729@gmail.com>
Date: Tue, 14 Feb 2023 22:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd
 interrupt
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
In-Reply-To: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_134418_927140_D12B1C3F 
X-CRM114-Status: UNSURE (   8.70  )
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

Support passing a second interrupt as card detect interrupt.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 46e235bf2..c8c30300d 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -28,7 +28,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    maxItems: 2
 
   clocks:
     maxItems: 3
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCCCC4829E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxymb+rQBKxCEYaJqyETUKp8vi0a39R//aTprgQLtmg=; b=Lr7I8mSL80191d
	T2bPcjhKQhVQd7PaEvawiSwmsppejtwTL3lcLdOXP9Sg5K7xZPivySW5/7yELROS7oEBAzwKd060S
	ONpsSsHodfQkhLVIM9/a3/gpaS95WGNLv0cB5mr6obWkZh8bZWbQW6DH+Yld4YWAToJo5E7gQ5nLH
	Lv0F8bN8ffGCrUud4Ite6PO21m2LAzieDmd8GlOXQKFRyYr5C3pV3KUhRyNsv483NEXt6xUd1JnMk
	lBLX/59NfOmPOWqNhlbfnh+Ke/LgxuXW20zV3HeQyUXQ5+J0kCv+PHSdiCz8fX/3D6ErODHBW9RCd
	D9vsPJr3GJaFSl//gU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWK-00000006XS9-0A6K;
	Mon, 12 Feb 2024 17:55:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWH-00000006XPp-0VSC
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:55:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33b4e6972f6so1868648f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707760502; x=1708365302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNHOgnZEL6wWzdnstM5LQW1NQeYMdiO9IQDuy9q7XM8=;
        b=NqXs1A7e19vKn+ed2r9BRI5ISbwYu65169Wei9R5jPHMVprPSBxRJNtTvfVHIpSTwr
         PgSAEAakS6JPBlfYPkSvefoeOueLzS/P0k9SsV46tFR8q0RC45bFThWnasShOEwRS2bV
         Jx79c5l0ml84MxTRGmRPxvEUm8R/ZKcYubULAia9TBkEqTMErHG7MB0zUheWPt7jBnV2
         e/+IhOtW4opV8rPIHmOAX3gGaACdDSPFVEPF6T77y314tonUPf0nkDZPiQnCmoE5bIUl
         vWKxyujxDaNC+2sIR+51Kpc/HDLecHWXS8K+2MK8N15Wv3VKHuvh74D6zVdOg8f583tO
         +Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707760502; x=1708365302;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNHOgnZEL6wWzdnstM5LQW1NQeYMdiO9IQDuy9q7XM8=;
        b=JpAOm/7fjx11EKS3TDMb3hXr8QiDOtS0GW/d4kELUiVamr8EJlvgMVAGEHESSlAak7
         N7w1HilQrp/iVMmqL8BQBI5Y1STLm6c/76G6ZHAikFPFGvIgtHiVWpPEGL06oVPgprnA
         sbccKauabyChH0SGHzaSRkRWm56p9DrNcoWS6dnp4EMJJ7E7u3AUuDQpk/RSkdyLXcMl
         4ke0I1p7wI+gJ2HHthrLGnfUQ2BnmNB7/wR8XvP7r8SOTB4AdCZCstY79VvJ6jTdc13w
         Ej1tvCnyhGyocAr2u1WJhkKZq96SLlw9DtTXIVgUAkcGR5/ibUyGNZknWobAzyT/Mi+q
         BdtQ==
X-Gm-Message-State: AOJu0YxZEfnSPCIzU5LCErVlY52vzAFte4aC4vnCei3+apN+k6AC618X
	NWHy17rCzdq7q9IdkhC7+Q3qwt0jAIubezRFAvc97X7y2VhqYGDhTaT+VEh6IuCWwddqTB4qzi4
	4xik=
X-Google-Smtp-Source: AGHT+IGxfb2lEkbB2a6/Bc/7eB8ypmoBKjmF1ENAg2uPkX0pGHMIfU9KoO5w6GsHFBkW8UZAF3Yu0w==
X-Received: by 2002:adf:f1d2:0:b0:33b:18c2:df9e with SMTP id z18-20020adff1d2000000b0033b18c2df9emr4056510wro.48.1707760502712;
        Mon, 12 Feb 2024 09:55:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNrYXfPXibdSnK/0nIIf8ldWktM5mAkvEELeUA7wp3A1tr9n8rt5t6hC2uBtGqdjaUfA2e7FeOH8QyZZVKfMDr/ZkiTEjYqIVZyYvNdPD4+AI0nRgDDmU/349bECmym3uN1In1eagVDz5x8HGrxv4H210vYr0BQ9T2F9FkiRi1QacckcMmcrTap7S+9AjRwrf4S4w6297h1CG/KQbNKmDRJpbg3JPJAiukmDptvOgcc0rOjxsMxFneK3WYTOrISFCClqHFruFuuwQZJfCw5a6RTaoMCSHAvc0T0gpbN3Cd7+z4dTttCEX/qyt8RwuIA6AGJ2fPU4nMhpub60+PuSWII6e8W5mqvFsScoroQBAQC+Q=
Received: from ?IPV6:2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9? ([2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9])
        by smtp.gmail.com with ESMTPSA id z7-20020adfe547000000b0033b55186901sm7380912wrm.94.2024.02.12.09.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:55:02 -0800 (PST)
Message-ID: <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
Date: Mon, 12 Feb 2024 18:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] dt-bindings: arm: amlogic: add fbx8am binding
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
In-Reply-To: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_095505_195404_F78C4641 
X-CRM114-Status: UNSURE (   6.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add binding for the Amlogic Meson G12A-based Freebox Pop (fbx8am).

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
  1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45a..fce12e44c00af 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -148,6 +148,7 @@ properties:
                - amlogic,u200
                - radxa,zero
                - seirobotics,sei510
+              - freebox,fbx8am
            - const: amlogic,g12a
  
        - description: Boards with the Amlogic Meson G12B A311D SoC
-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

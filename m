Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A9FC48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olLyjTta04sLGAXtddiJv636rDUsAIpqh2oe0wR/1co=; b=Z4HawTlLT0ltiA
	LETR9ZXDOi/qtTqat8xw0lXqf9R47TA1g6ALhmwc7y53jr9AQSGe7j8+bJts50HPacacOWVSG+4Iq
	gBL3WMeQ3s/PXK8Cf4qT3Wuf5TTNTkeyy3BjZ+bnVYEzk/LIkC4t/2CFCwTM5xGrCQLDbsvdtgA6e
	XUVoN02GUgceRl1g4d6Zf24KnqGKs9NHBrVtbEulvVYtPfY9wYudLslL4gtDRByKrKCtH+QT2laB5
	rMCJmTRo+SsNUS63s8fxCHx7XnGjRPShyCoxUyzYPGm1b/ByVgJm6RrveJ/moOfbDBgg9q078IB00
	Msv5lGvFV482r5NqgC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZs0h-00000009CK7-3dPg;
	Tue, 13 Feb 2024 12:35:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZs0e-00000009CJd-2JTP
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 12:35:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4108cbd92b9so22502135e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707827734; x=1708432534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ylYg8jpgray0kLn3qJlHrPhKR7pfQNba/j1IDxwbCk=;
        b=GiCxU7xSxXxFr7CuBksX8AN6pqtWZYaftZJ2cLgDIpwjOmmEz/cN6Qkg5P2UoMdm+N
         aQHFOZZD6WsSG3IFWqX4WTSDgloqkTRCWPOPm1KU4TlfRRt2Hxo9RjV9zQtBF9JcQgop
         3Rx2YouEkUNh54OXlnMWrWSrody4fQOBKMdi9EkeXgVz4U85uRBUGB/gDdVbalu+LcmY
         8xIPGi49DSdRUAyZ4vC8ceDVaD6XPpRvWPsgcy3Ukob/9nEcOd6ovJl5zosyjz74sC63
         FouasCwbD9tHfEgOnUd0PzL7oZLn+X1LZdo7KbX2OcjcqNjdesGd4AYYPkO2VCmjB4fR
         +JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707827734; x=1708432534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ylYg8jpgray0kLn3qJlHrPhKR7pfQNba/j1IDxwbCk=;
        b=s95ndYxy93vj5IcQWeRbOy3+QUn/B8ZgRKtjLy9Jlk2bzQwdkM6nPx8MMxGNtC7j50
         7ZeRZsQtaZhR9DSTA6XLG59yySr+TVTbu2NiGQiXywkvMrCiBIZXpwdVd+4EigvJGGss
         3fsBFzrswzEyDaKRdYGUYMFKufg0tzFVk2d7Kfq1edgB+Uy5jlVQ81cfX8Te/SuNW3s2
         Oug2awht3xLzS4twM+Dz9ETH+PO3ZS5LttKrWrZS653dYT33TZRhf0IErOLGRqrmZk0n
         7gaKr4JdXR7hMan0jQzVUXFMCYhNDxDrcC1CMAT9XwNrCGNcyb4cDvqEPdeL6QhNlDMk
         OIsA==
X-Forwarded-Encrypted: i=1; AJvYcCXvIcB6u+C7uguoJuskY5YjhG+QkzuDa1csLXbCQ8G9cJn2LUrPpINOgPhZueJ6UGI8yipVTu4Zbsec89lrbWr+7+mLEVHNtwZF8NgEnDTKYyQ=
X-Gm-Message-State: AOJu0YzpSnUf4rAQSOvD0Bm9/N3ECAULYPwk3im3/zKlNFjXkaeGJKBR
	4q7nmjqHKtZPc0diaTYQeHGLeZ9H4nZvV0l27a7EILkbvGsgIwBpw7QWF9ZAtd4=
X-Google-Smtp-Source: AGHT+IFKSw8A/od4MdNrL+6wJDy7UsTiUXnDoSUALZxq9VMlKlnYodvBWf4xHy9YuTFTZ5JKXzVgbQ==
X-Received: by 2002:adf:f582:0:b0:33b:237b:22c2 with SMTP id f2-20020adff582000000b0033b237b22c2mr6751357wro.21.1707827733799;
        Tue, 13 Feb 2024 04:35:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi8bYSxZZJImq1PNwCD/zbXDLxkCIO8LfIOHRNejh+N5NC56GDyLM1Nm8bovLUkXnPpMOI+26eDVPQheNe0iR1G4CrS0U9X1AUAUNtXzgxbooK2piAnVcNGvWsdH3msLdWOPUAuen2jmIIsTuUoSn/UUXBfPBfoAIsVv1aiC8dSyimEMqYlLn7/ezST09rwST2hkGVGIdQoFemLjnBTKDfv0sLYXFKQpWkA/9429i/ui46CKYaMilKSHxD5JTylD5U963lsWK0OYUHDLdBpBhpuJkRuztVnYBetosqDU0rSXU3K895mJjAH8j7tm/9TZelN5XlMDCfmgb0j9koLrqGSu+/MVM/HZ6pBrSbKa1TGuE=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033cdf118599sm978718wrb.72.2024.02.13.04.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 04:35:33 -0800 (PST)
Message-ID: <cda7afdb-f75f-4376-87b8-882297f2657e@freebox.fr>
Date: Tue, 13 Feb 2024 13:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: amlogic: add fbx8am binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
 <959b8135-a687-4781-993c-5fa5ba3b9c8e@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <959b8135-a687-4781-993c-5fa5ba3b9c8e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_043536_849773_A4190BD0 
X-CRM114-Status: GOOD (  12.14  )
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

On 13/02/2024 09:41, Krzysztof Kozlowski wrote:

> On 12/02/2024 18:50, Marc Gonzalez wrote:
>
>> Add binding for the Amlogic Meson G12A-based Freebox Pop (fbx8am).
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> index caab7ceeda45a..fce12e44c00af 100644
>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> @@ -148,6 +148,7 @@ properties:
>>                 - amlogic,u200
>>                 - radxa,zero
>>                 - seirobotics,sei510
>> +              - freebox,fbx8am
> 
> It does not look like you tested the bindings, at least after quick look.
> Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

I ran 'make dtbs' and 'make dtbs_check', and booted a board with the generated DTB.

I'm using yamllint 1.33.0 and dt-validate 2023.11

$ make clean && make -j16 dt_binding_check DT_SCHEMA_FILES=arm/amlogic.yaml
  CLEAN   Documentation/devicetree/bindings
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/fdtoverlay
  HOSTLD  scripts/dtc/dtc
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/arm/amlogic.example.dts
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/mgonzalez/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
  DTC_CHK Documentation/devicetree/bindings/arm/amlogic.example.dtb


Looks like my MUA mangled the patch.
Sorry about that, will resubmit.

Regards



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

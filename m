Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F27C4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeJd2OhHZGVYNPXQ/iOTBx9vWcIf6aQ9MGJnFAWc1JY=; b=p6HZOf3hRz2wZU
	02lY1yv1m1qv5ODmFxVclWyrgQ/fnE1SCBngyDQMkzMJYBOk2SfrGLeg4mxxoKNN+G91ZyGsxSxLH
	M8mdD8QzolgVxcpCCSxIntGg56lQe/7Un//RXmt+M+hwbOAojynbSIWFZT4WYs8cVvx8lesDL12Cr
	OPssBxSg9L9e9hX1ItAjdXFfetr5poXVF9QLTwFFgWDBDbsaWBv7SpIo/afCpUrEXzziMitS+Pyn+
	VeCkJPIHWA6WXPYBDdnTSCNr4INN7IaBSwekSAx4OveYiMEwi/bfwjN8GYLbSxmi1cRYfvm+kvw9/
	4frpK51jx+R44XpKQLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLv7-00000007mhO-1hss;
	Tue, 06 Feb 2024 13:55:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLv4-00000007mg4-19sR
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:55:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40fe2d3d5a9so5265695e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707227724; x=1707832524; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXXm4a3L1qeCqs7hKY2UKoD7COlkjD9nKpIhELY2ah8=;
        b=izWT8WMgPPxylbXGAea2Ncl6lU+J81kBxjPq1Jzu6YbLsnSYCFRxaDUK8vjznkW07q
         roiI2gITPags7WQc/3utj2O0ARFnX9JD6+brFyQl0p1b0GsoGy37RMCHCULKtzGV4HOV
         rAdNvquce3LMfbcRRAvXzaxRf6CNB0BoBvOuOGIoFJipW0e5eW4uP7ElG2zN2Ol13XCF
         HL5/exeH7IYWwR1+1Q3nb6bvgTSAlb7zXohX1Tr/aHekoUlHYmDUE9PwhjNrekDuLLJN
         Id1CTH/eQzpC/UI9otg8/wgEvUc5c+Kojt2fDr2XB4SVQWOAoFKkZsyPcY/lFPktgA6g
         D6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707227724; x=1707832524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXXm4a3L1qeCqs7hKY2UKoD7COlkjD9nKpIhELY2ah8=;
        b=Fe3udPQqVarAITVQlQq1gu86BRnAviv1Rrz3BpkS7Wp2yMEUE1crjw+IkttxAIOCzr
         vc3B8xPcnTUj3i46kaUtFxPW8qCc+PW3c8E12udMpQ9pS+Zpadna1r6MsDk9WI8YKPeg
         U+MYU0FGTnLa/l1xEY+UGHUxeMONnDLpDm/vj+PVyNS25a/kwUB33B//ggZkYWT05asm
         8Oz5VBdBPDnT5hQNELqV4TvHBCqmZFLJrxM1DrhJRwINlH77EjdDpv+EPt54pYVmrrVN
         Dy6MoAskGvJ2A4EcjsIHNIL4wB22ilpd75VRvuvRmyAbxh9QtcOW5W9y1DzkWrR8Homw
         EYjg==
X-Gm-Message-State: AOJu0YyOqt50V4N81FpYDOL3hUKwuzJMBX3Mt9ZvwOoK57kKDCufomqZ
	K88i4xIb+zvUq2kWKmItjS7sNfXaLF+CNxRtpwg0kBXtt+7+LkeMTdLe9H/kOsw=
X-Google-Smtp-Source: AGHT+IFzUmOEzFFJDutsSDDgNuefiOuM4tOOCdMDQA0KH6u9YXnuSVJTB+fJyI7YwTZy2rqWMhWEOA==
X-Received: by 2002:a05:600c:3c97:b0:40f:cb0d:a44e with SMTP id bg23-20020a05600c3c9700b0040fcb0da44emr1821175wmb.9.1707227723621;
        Tue, 06 Feb 2024 05:55:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWSiKw0OU8gktCMMX8VC155KdNWS90FrO6qrCyaZ0NWIt2XI0hwB2BtjPRn/cvrsUBIAWeIyh9ITUhTTwFxwopHZvRvHmKsELs/TZNuV9aWKSDCUoK6D1mE9hcFFLIOe9w8HLBAVdbqVLBJGgJZZKGZq5mVWbLX39N7ByQ34ItJai4gT7x1KWqT1anZ2udKM/hbf4DlfGqMHX10ZR0MGejDucdue72l7ule64WuOvEDJA2BE5JnD2hnyt6Y8cyezspo+5UFkSwn/mU8YnO87Qg+WZL1Wx6gug5yUE8wSZY0ZnKqAsNqnglVR1uYexTR9toxHkoPzAzfugakKe6JEzMW2nKSy0tpoghNaCzRKljJt8eWrgFgpVuRPuCI9POv0/aQEg3xoBVGceKE2O9shc1KxiY3dcKxEeAcp3JDoYA=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id s13-20020a05600c45cd00b0040e4733aecbsm2101060wmo.15.2024.02.06.05.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:55:23 -0800 (PST)
Message-ID: <ef146687-688a-4cf9-a11e-4034a50fb6b4@freebox.fr>
Date: Tue, 6 Feb 2024 14:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
 <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
 <59ef3824-13d3-40af-9a3a-9b1ec8add9d3@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <59ef3824-13d3-40af-9a3a-9b1ec8add9d3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_055526_352633_041FEDC0 
X-CRM114-Status: UNSURE (   6.10  )
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

On 06/02/2024 14:30, Neil Armstrong wrote:

> I do have some dtbs_check errors, but those are expected since they are not specific to this patchset.

Wanted to mention those warnings as a follow-up.
Are they easy to fix?

$ make dtbs_check
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/mgonzalez/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
  DTC_CHK arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
/home/mgonzalez/linux/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
/home/mgonzalez/linux/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
/home/mgonzalez/linux/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#


Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8E8C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 10:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QqcF6ZX1wWA41QSMuvPZVGlX7chJefldwd1OGoR3C8=; b=DAEcm/TKtq8BQk
	ITS4K3rETVvh9uN9fJfnCYGH+OBXCnnxbZYYawObxLfBtEbRLfMfk5k01/8LOfzPRocZosl0B7FSg
	EGEiaUhS590YqfpOVJAKOHIAAe07QBgLnxC54Xchgzfux7xZQt21Qos0GD8pEXESNESjFsJRX6jbd
	Q2IdwX1W0J6k8nxj/I2PFfhEz4gCP1BSYvHBK4h4oidVS3u1wUWg55QCqatf8NZpSgJ1JmG2fhKyz
	Orqdtp1H6qfnipezjqJTB9B2kUnxPFpzBv0quZZgAiZ5uX4vXaoeIxszXddYaZH1wPyUc6DAEHVI4
	ikBAAkdnbTncmy7+vgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbFu-009UrK-1j; Thu, 16 Feb 2023 10:12:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbFq-009Upx-M3
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 10:12:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id he33so3842197ejc.11
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtoS5Fc6kievsx7bkF2ANsfXMDRCk+9jlUcWB2a1kVs=;
        b=MUX74fM+IUHv+p/En8Yx6YhlFnIv6hh8V9CUrNCxRSYE7l4PjbApUlcA6ub94vtGVf
         QvphSRTONfgz3x2IbC6Zfjt4xEhMN24MNXBQp+Q2rHiQWIM+mslW0QOehyLiqeSOr7ug
         skGENiBlQm+XFiJXDuHvtNfLxW7kHUOLh62ITu+SCn2eZ2WjtphbfHiuYFhA+9jSFqFU
         kAxmI8DirqgfGDul2Cd1zPdLhuYNX44/Fp4XhQW7ZoPSnfKehDxs1AX9HIiZfddoeeHJ
         yUuvEau0BAoLfQN4YeKCX6lBSg4heK4AGah1njTUCw/S5fFfBI0+2RrZds6SzvgB/B+A
         sxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtoS5Fc6kievsx7bkF2ANsfXMDRCk+9jlUcWB2a1kVs=;
        b=G3Fev5yBRmDC0uUGBEv+6NXv0zEZYOJpbayutEuhimA1PaYidRqpOQ8KNEHjgUBqOl
         J/DA03kSBgLs1MbBs9qUM6n0NfN7zIJypxtvSqZmz53QkKVVNWoCQEEhO+PqXup9rbI6
         4Wm2lNCyXP+/jU3CFSRF26UrzfzWQhaDPdr7cQGAynnbVY0zDlnBTzBAwurwdrJkCiQg
         8BwgWiod5m8dGVlt8jmKRc8d9gc3qPMmCTBce3nk/uZ4RmQ5mf8CZd3tlTT/cT8OL0i5
         OVXc3MWjE+EHjvCrTsqpowXsdgg5lw3uu7MO74P2owu1DxBEs//TqPEwL3cOCJnacYgp
         syZw==
X-Gm-Message-State: AO0yUKXNgE62ME/xXDpPaHp6kHwbhmqytLotxpf91lmk/KkQ9dM5fl/8
	JPKMTr3P5wz4qjEQL+ZbdG1P6Q==
X-Google-Smtp-Source: AK7set9kEv33IzlcpbMW6jNn8Fo9bLHGXIfOLqekrMZyoJvtmhsq1EtAcSC3UaXikWeXB/MULq0fkQ==
X-Received: by 2002:a17:907:96a0:b0:8af:4418:8700 with SMTP id hd32-20020a17090796a000b008af44188700mr7029881ejc.47.1676542359481;
        Thu, 16 Feb 2023 02:12:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090653c900b008b13039003csm609343ejo.166.2023.02.16.02.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:12:38 -0800 (PST)
Message-ID: <35ce2119-f33d-31cb-7c93-e68642828dfe@linaro.org>
Date: Thu, 16 Feb 2023 11:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: media: meson-ir: Convert Amlogic Meson IR
 controller binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 neil.armstrong@linaro.org
References: <a91e3a8e-7ef1-70bb-f6be-01a9a90c0e05@gmail.com>
 <a0e11df2-576c-da61-a583-81528cb77d20@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a0e11df2-576c-da61-a583-81528cb77d20@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_021242_761178_97E7C741 
X-CRM114-Status: GOOD (  11.47  )
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

On 13/02/2023 10:02, Neil Armstrong wrote:
> Hi Heiner,
> 
> On 12/02/2023 17:51, Heiner Kallweit wrote:
>> Convert Amlogic Meson IR controller binding to yaml.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   .../devicetree/bindings/media/meson-ir.txt    | 20 ---------
>>   .../devicetree/bindings/media/meson-ir.yaml   | 45 +++++++++++++++++++
>>   2 files changed, 45 insertions(+), 20 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
>>   create mode 100644 Documentation/devicetree/bindings/media/meson-ir.yaml
> 
> I've already posted a patch for ir which is reviewed and ready to be merged :
> https://lore.kernel.org/all/20221117-b4-amlogic-bindings-convert-v3-4-e28dd31e3bed@linaro.org/

lore has useful keyword "dfn". Just put there "dfn:meson-ir.txt" before
converting bindings and it can spare you some effort.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

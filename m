Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC27C00528
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYdGeqy/XP4pvv50P7CXrYl5Mq9xyQdOK+jY5pFDPAU=; b=2cU9FWjyhZ/LHQqltHAfm61Is8
	dLRN37bdQn8EVTiKoKSpum5kpK9VOBqM8P3SSnHmXvnMMuoSqg/7B7TugVzid89zVj9aMSOOD6U2Z
	kyk5P3OnPkfkoljqv7D5HfwgZCwJg1uPw1E+9sHdU21ISHMxIOzJ4FNOwwldpuDoXULcPpcQit4Gy
	HlfxPIoh6sc+f6STgzjXSa/wVdX9eyUXs4/dbjFurZQmRTOXvneFaoWQmrOjqAS7OuF5dxJMju64N
	SeqmExrtC4QpjBqaTwdt7rgaXUMS1Dk/ChKUUxc0oLnn4BGKTtfxxgrdH8tIB6CH6Rpw9W1/es22Z
	Bj4z+6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRuxd-00CVlt-0A;
	Fri, 04 Aug 2023 13:35:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRuxZ-00CVh3-0C
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 13:35:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-316feb137a7so1822396f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Aug 2023 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691156113; x=1691760913;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IL2AJxGdbMBYZwQaiXV29t4KoXB7Jg7IkcgZUQkDNUI=;
        b=epRCAO2yPXPwYvAi1GgZHCKhfv84DCIM9+99WK1/2c9TlslGxxkNgeDjIrUAeN/Fe6
         1k06bF5r89HcVt/6oaA44RPf6X/u7qpIgb/kQenNO+5p+wssn84D6xNPjnCC1QI6U30O
         IpocouGfOvOJh/0FAA95TDyT3iEgB34Oj97lzXX/OoaUKZCWHb1zhUy0dJzm72hKKhHX
         wynRKMo9C5H6+b4tY9tvLYnkdHFvNi9F0trQdtVfIEfPwYL9PBD7J3EecIpPME3Dhwof
         sFfIoKxCFXLT5AIYD10vSb5BPpNbBlgT83Mr6Hxu8tou3htUcQMLIeu7ALw+4VVYKC4j
         Deww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156113; x=1691760913;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL2AJxGdbMBYZwQaiXV29t4KoXB7Jg7IkcgZUQkDNUI=;
        b=RvnPSjtEarbahQUlvAuAY2miZFd45cEgEuo3vP+HyOkC40b0uPHpzHtxuyMKwiLExF
         RP0P5o6+b0JLtk1ucPD+X/vX+1ajiO0YRDw0XYeszHICMJi2U6lQycJ3sCdsbEXR9Eti
         zX8GL1AWrktCn9qaxKB9aAkaCYFgfbuO/0aN61IMZosvfJ1uj96pcTxa1Khd3S8UCK/S
         hjzBdd8yp0YDRNRflFBuJPgercPfKuV8sWLD0EFR00i7zDOlHrIu3oC179H/amPCMWQN
         1M7cq1n2Grqe/j+G1VgxmplnyhQVnKr7SGmjnJu2a3lE8s81p9XBLsUxd8ed0NJCd/Kd
         NxFA==
X-Gm-Message-State: AOJu0YyzqWq7tBA1ZZu9nkxuanjdJB46H447RoaRmerWoIumKu9ZNiAH
	ARtJtFd8yI2rnKyDdUqPYbavcUXCQt91o0G0PESEUw==
X-Google-Smtp-Source: AGHT+IGFj2WJkLOCSreoMV4op68jFbpcQyR5ma8/Hp/gr6iIaCluzNOhufEIeNmZI5BQspwIpnn97Q==
X-Received: by 2002:adf:fd03:0:b0:314:36c5:e4c0 with SMTP id e3-20020adffd03000000b0031436c5e4c0mr1472761wrr.11.1691156113348;
        Fri, 04 Aug 2023 06:35:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc? ([2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc])
        by smtp.gmail.com with ESMTPSA id y15-20020adff14f000000b0031766e99429sm2534654wro.115.2023.08.04.06.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:35:12 -0700 (PDT)
Message-ID: <9adbbde6-a12c-2857-3103-1c012eed6f27@linaro.org>
Date: Fri, 4 Aug 2023 15:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/3] dt-bindings: second batch of dt-schema conversions
 for Amlogic Meson bindings
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_063517_098196_AA765455 
X-CRM114-Status: GOOD (  11.35  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On 06/07/2023 16:52, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - amlogic,gxbb-clkc.txt
> - amlogic,gxbb-aoclkc.txt
> 

<snip>

> 
> ---
> Neil Armstrong (3):
>        dt-bindings: clock: amlogic: convert amlogic,gxbb-clkc.txt to dt-schema
>        dt-bindings: clock: amlogic: convert amlogic,gxbb-aoclkc.txt to dt-schema

Do you plan to take patches 1 & 2 ?

If you can, it would be simpler if you could take patch 3 in the same batch.

Thanks,
Neil

>        dt-bindings: soc: amlogic: document System Control registers
> 
>   .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  64 ---------
>   .../bindings/clock/amlogic,gxbb-aoclkc.yaml        |  85 +++++++++++
>   .../bindings/clock/amlogic,gxbb-clkc.txt           |  53 -------
>   .../bindings/clock/amlogic,gxbb-clkc.yaml          |  37 +++++
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 160 +++++++++++++++++++++
>   5 files changed, 282 insertions(+), 117 deletions(-)
> ---
> base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
> change-id: 20230209-b4-amlogic-bindings-convert-take2-e2caf8e1c13f
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

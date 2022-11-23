Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C05C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/K5u1Z0P9C29MgB27tnSkqTeNOWr9OASL46l/53EwTg=; b=1ALTcXn1pjgTMn
	Gsjnb3U7OC9sv/pJWcHAZqtjvMH8YXwy5uxPRQkUgdgQ7wRx/yqq0xATiGrVK9I04jqlMlcq3Bv5Q
	IRIWQwTHIrRcAa4X4Q/EDS1XSqJc+5Y3PgHdXm8jkPQ/oWugpLT98U/pxPyaUbIuYFM/HhyRrpBBL
	OEq5pOZ/oCWJwbiWRhE3riVZb0IVyq20JboDbdy0rHedgVbh1amUWL/GrRpn8whRe9tuXtMkMCbms
	2wpdVBVdAPokUN+S8aDlpgDu0yGpfCCrLEZgjvayARtk4VJaaW3VfEUgEE3fcSnHGHmkOaisoedCp
	RHJ9yMYNADquiX0FjN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqUf-00HWxb-48; Wed, 23 Nov 2022 14:12:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqUN-00HWp2-TO
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 14:12:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id be13so28340013lfb.4
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 06:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpScT/PLZhW9m/mc8mS4KdOL1HgAD8oZWMFJX7jIr5M=;
        b=dVw7XBd3kFmPkaiQVhTxkTxRTXfXPM2I5cBO1BHdipcu1xZUATDW3nqvCXHSJHNjkG
         Saq4PQcGqWeTRcsEBw+SoTuEWDyarGTLZS7tyefqZMUT4tfAG9qNjBQPdJBzFFJY4zde
         cq8lLYQqft+3Pp6JhU7YBgBAml7uUKP+8lhWRS2CHTvlFdzTn9QKPaEYPncuHSTY+0Ac
         caMiN5HuJTr7cdk2bBZ+dfO+1kewrN6lfF/PGFTWzkY4N0mMTvZVvDnotGyjVaZ+DeUz
         7jVx5CyB8Iq+8PCQgVa0WFVeihPaEtKsmTU7HmeJ02eGcdn3/yvIDo5oy20WEkfdX0LD
         lVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpScT/PLZhW9m/mc8mS4KdOL1HgAD8oZWMFJX7jIr5M=;
        b=3anfCfxPl7gZwYlkvg37+zldpmjxHC5lpjJ5UW2VxlbF9gdbwxL+SK5Fv9cHT48qTf
         546iKHahWlvOlMf81jM8FlFx6RF3Ee7+Rz+sQ4BaUojFJbEUAeJc82OW6lLWgxqjDELo
         ll/FLhwEV/Lictrk2gcgA+BmqBbAnGF3nJ0o/Q9iIQoJj3h1PNfGXQrGZfhoQEe9gE9Q
         icYmMDNM1c+wiiX+GJqz0WrBtzgWE2ainiTZTKv7lkZBZ4f9J5lv2Z12g+qMW6CA0jHd
         gVD1joVQoGuk2z1wcAfhTargVzjceqhvI0aENICrvl5Eafi/7DuQA44FGN9QrDHT/GyA
         SnsQ==
X-Gm-Message-State: ANoB5pnL6dcHhtP4ncKC/PjMSAjK6DgYnztV/sjySLWVFozV6JVNq54D
	/rdKxbA8f0nd+qLI9jeEveGOeQ==
X-Google-Smtp-Source: AA0mqf65irOcr+aB/hyQQfJeHM7Hq1+nPrF12N6FMB1oep9oKnjE/+MQX7mNMHiHEpGS4c3FQkZxMg==
X-Received: by 2002:ac2:4209:0:b0:499:f8e4:6dd0 with SMTP id y9-20020ac24209000000b00499f8e46dd0mr9925093lfh.162.1669212746994;
        Wed, 23 Nov 2022 06:12:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s29-20020a19771d000000b004afeacffb84sm2899160lfc.98.2022.11.23.06.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:12:26 -0800 (PST)
Message-ID: <663d8e29-b47f-8135-8b4e-c95b68559367@linaro.org>
Date: Wed, 23 Nov 2022 15:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9858039f-e635-2749-80a2-75072d6e9cea@amlogic.com>
 <8dbb3ce2-c8d9-70be-d1de-ed875de0ea1b@linaro.org>
 <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_061235_958732_9453B24E 
X-CRM114-Status: UNSURE (   8.03  )
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

On 23/11/2022 14:23, Yu Tu wrote:
>>> ../patch_clk_v5_1122/0004-arm64-dts-meson-add-S4-Soc-Peripheral-clock-controll.patch
>>> has no obvious style problems and is ready for submission.
>>>
>>
>> This is a checkpatch output. I am talking about DTS broken. dtc should
>> warn you.
> 
> Do you mean I will have wraning in compiling?
> I actually compiled without warning.
> ccf$ make ARCH=arm64 dtbs -j12
>    DTC     arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb
> 

Nope:

../arch/arm64/boot/dts/amlogic/meson-s4.dtsi:105.35-127.6: Warning
(unit_address_vs_reg): /soc/apb4@fe000000/clock-controller: node has a
reg or ranges property, but no unit name

Test your patches better before using reviewers time for trivial
compile-time fixes. The same rules for C code apply for DTS.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

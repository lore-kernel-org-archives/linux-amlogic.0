Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AAEC25B7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m17uwjY9aSmHel1StAmoY9iz3fVMdOwdskzfDOEOk8M=; b=hIburRpKWM6sZY
	qmOBslTviXaLF1d5gAWaPD3Itht7q3kbQjesjkVKjGPvOcqP3g5g3YPVWtu+QacAbUt8w9wrvdhDr
	dkKMZ4pYdyFPrMnEsdc9p0GxPSQUX56pCS6/P0l+r5655foZn3tZFfLWAFGo/H5t1uQxBbr3Obrc9
	ZqIeE0AFuPWr+FbaYrWkeXh8IEW/3OKARK+9urA4uSRXcf+a5wqduqlHYZm5kQmlg/Ly57ayEKsol
	cD5k0pVydLA03mZ6D1nsBE16VCgFYps1Mf/KxPa/4zIYPeXhmm8diD1jftomeLZtzWAxhnc0pUD76
	uVIco/mN6yzl3vXeGmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6UQ6-0000000Ckks-0omi;
	Mon, 13 May 2024 12:04:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6UQ2-0000000Ckh2-1YDP
	for linux-amlogic@lists.infradead.org;
	Mon, 13 May 2024 12:04:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41fe54cb0e3so26417115e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2024 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715601872; x=1716206672; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=evr7Nj7xKQ7Cd3Ztm3Cf+ORmYJrKhwgikDv0J0g06qQ=;
        b=Pjw11dQFYvfrUUhQ2vt9V8jMrxZ9AZZmFidx2cdGS5o7bSu0VNU8ClEG2KI3fsxYFf
         GO+9JmPffI2UNTY4fqIfn/buLtKf9WB2HPY3HZrqLkHU65PAlbNmAk5BfP7ojx4ozur0
         QjMzJ8X8DE39uKaeCrFcZAkxwjTPgUGjETNMB4KExMlcZqfokYv9UsfEiRIMc4OpcVvw
         PMiFbfgFOEapfbJEZAcyVRVu380Bz5c2l8xnPoqHXY/S5dqR3HfTUJrna38fRVcJD+BI
         QFG7PjbTdoQdrlyH2GAXLji/JbNt10bK7nouvg+8SGVWLF0EXXFw8rwsq53xDZ5k87oa
         Ngjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601872; x=1716206672;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evr7Nj7xKQ7Cd3Ztm3Cf+ORmYJrKhwgikDv0J0g06qQ=;
        b=BR4pkNkojUrdG1/GT/NAMzxyb6tvBNflMcnCq6D/s58RnBZJQUJC3nNxmIjN1rrQzU
         vmsFeEKqDvrMaHwUyqkwos/9psYo9Ba01DXowDtbIfprptoy/xa8/t9NX12Gyv97qjfd
         Ush/2JLI7RKyI3u7Vjw1lhjsCaKPH5Wya+BPeaulApBCsKYZjf+k6rxNHgLjw240n1/Z
         c2skQwr9l7cYc+yTUZRUm0FuKmhTS1gbK+hQI5ndFzJVi72szmFAWxyKEnM34DDPXSmd
         28CNStt/7NZ8+R+S8J6zVsfwruMy2XZD3gvkgvEoQspOMoYwak0vRfLmmUl1SPxewgst
         XH1g==
X-Forwarded-Encrypted: i=1; AJvYcCWkhy0jfagedGjh8pObv0AgLRQqMb766pYIxlZ6Ns4Ac7MQO0V1WOfdaSb96VhvRaWhoBuOdKg5WCLATnc2SmCLttTVJ52nw0JtQyLGDehSnUc=
X-Gm-Message-State: AOJu0YznI5SdmlgOLbJoSqZALb+gXhzILt0/qv80ihTQYnCOq+wGG7Yy
	7XwqYAXrh+DiqC9coiONHXEQzwlCshQBXx5UeOBD8sEaIrBhkuao9Zc+xSa/3s4=
X-Google-Smtp-Source: AGHT+IGnkiii1p31wpEBxYvlhM/aMqmsmiEtQ3NQ+1Qn6f87Nt4y/G9/2KcL8KQaX8/8bf+QvAuVbg==
X-Received: by 2002:a05:600c:4fcf:b0:420:1585:7a99 with SMTP id 5b1f17b1804b1-42015857b80mr27774355e9.38.1715601871464;
        Mon, 13 May 2024 05:04:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42013c5fa61sm49472435e9.40.2024.05.13.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:04:31 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-5-ddrokosov@salutedevices.com>
 <20240511-courier-afflicted-e351af5cded2@spud>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: meson: a1: peripherals:
 support sys_pll_div16 input
Date: Mon, 13 May 2024 14:02:21 +0200
In-reply-to: <20240511-courier-afflicted-e351af5cded2@spud>
Message-ID: <1jo799zzn5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_050438_618899_FCAFBCCC 
X-CRM114-Status: GOOD (  15.05  )
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


On Sat 11 May 2024 at 14:03, Conor Dooley <conor@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Fri, May 10, 2024 at 12:08:56PM +0300, Dmitry Rokosov wrote:
>> The 'sys_pll_div16' input clock is used as one of the sources for the
>> GEN clock.
>> 
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>
> Provided that this new clock is optional in the driver,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

The way CCF works, it is not going to crash if DT does not have this.
It will be viewed as non-connected input, in a way

>
> Cheers,
> Conor.
>
>> ---
>>  .../bindings/clock/amlogic,a1-peripherals-clkc.yaml        | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>> index 6d84cee1bd75..11862746ba44 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - description: input fixed pll div7
>>        - description: input hifi pll
>>        - description: input oscillator (usually at 24MHz)
>> +      - description: input sys pll div16
>>  
>>    clock-names:
>>      items:
>> @@ -39,6 +40,7 @@ properties:
>>        - const: fclk_div7
>>        - const: hifi_pll
>>        - const: xtal
>> +      - const: sys_pll_div16
>>  
>>  required:
>>    - compatible
>> @@ -65,9 +67,10 @@ examples:
>>                       <&clkc_pll CLKID_FCLK_DIV5>,
>>                       <&clkc_pll CLKID_FCLK_DIV7>,
>>                       <&clkc_pll CLKID_HIFI_PLL>,
>> -                     <&xtal>;
>> +                     <&xtal>,
>> +                     <&clkc_pll CLKID_SYS_PLL_DIV16>;
>>              clock-names = "fclk_div2", "fclk_div3",
>>                            "fclk_div5", "fclk_div7",
>> -                          "hifi_pll", "xtal";
>> +                          "hifi_pll", "xtal", "sys_pll_div16";
>>          };
>>      };
>> -- 
>> 2.43.0
>> 
>> 
>
> [[End of PGP Signed Part]]


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

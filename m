Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3582C25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxIkaINDXXxlbB173uJtjW856g/5lFvVj1t6V8J26yc=; b=SXUuvD5TGOIn1H
	1TL/8LXlojf6vKaU+n4psnhZY4HMETVNCDNugchmlINLVZyKXZ/NG/gF1xDUzWSAyGAsZqTMNX4Gs
	wkU1uhnyW1VXM7SSwaQMIt+NmACx/w/8WOTsOQuu/yLLHogNslNCScANeVO0LSawuzxqAzDsJjdyt
	QFk7HQJBQWoBWX17VHHFWhtpGz3vqxa1hcz3GMP6iSeSA7j80NwXPV2J0BNUn/u0uHIXXpbYyyN92
	VIze/zVhjP7DEQvFMEEA6in0Z199K3gvA/D+dfgX+duRkhU+qKpFgShg3zJOwGFz+qGF2fCnIaFIE
	2JBMVa16q5zYNRT5YU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Uvp-0000000CqGM-0QBX;
	Mon, 13 May 2024 12:37:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Uvl-0000000CqFB-1tCj
	for linux-amlogic@lists.infradead.org;
	Mon, 13 May 2024 12:37:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so43208015e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2024 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715603844; x=1716208644; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=q8zF+CwTJwmT8VWgpfibQL6tO7taDX8lcb6Oh133Ym0=;
        b=hS+lviLjguFHIEKigY0BNtevUGTOhXIO6bNqedLY2djzQPu/nZGhwjkZmxDNVul0BN
         RtIHmetOQf4DUVpQ4R1kGM3N9MlNIWPNi8LXmll0Uyj2XakCghosvHtQN+tlOypSNM/y
         O+X58PerG0E85mJnF++sV2nz8bZdn6fmHe+uveHCSA+IDkNXYnjZ63Dm5Mpk4IHeEYSt
         ZsUUER+/ANB/TESEYXv5alZsJ26ESezQXx0Qb26r5OWy6B3zAN9o4g1XFtZzYRhLDlci
         HUsAzBgzoVxBcwfOlYXhJUkhX8SS4ayo4+4UCzg/tfUkbUZKOV7TPBzsP5aYKuaCLZMJ
         6Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715603844; x=1716208644;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8zF+CwTJwmT8VWgpfibQL6tO7taDX8lcb6Oh133Ym0=;
        b=h3RFLAgldmVIgYueqKKlZgAZ9vLzJrDiL21CZRyRZkJpjxDdkk0G6av61KKMajpX7L
         YtgvFZaZ0C6BMr2ZYW8z/jVuw9PW3ZmcNWMxQT8dR/GrEJoB7W3zaUKGCTqioSnAUBDg
         C7oCyWedYNhzu5/W4cd5H9BC1BiDXzYHNefmEmvt+uHVsGPHmOG67gQpvBbJ/5MwIzi9
         ZVY4VCMzZL4usuvowiSfRKaFv/7is6bCkSLuPoDw5mjovXKopqK4yDJxpMn/7ojSvRjZ
         8/gx9VniNjoowNOL3yDJHZ2L5w84H56mZpDdTpwniR7z+CLMhbJT3/PfJvhPnz+hKuTK
         QN3g==
X-Forwarded-Encrypted: i=1; AJvYcCWE7qu6xinXVjeVwt1pRPZ3nOzfhHY2cx7GrKCPQ1iIKgzOG9VWBEqoMk+EOPKHkxCGS9/mZweswhmSXwgqn40ky0Xfyxx45fBBA6zZALs2+jU=
X-Gm-Message-State: AOJu0YwXxVjIH/QDHn+QFh/9+eL0tGogEGt0sb4mgFhYt0QJPXni7dA+
	pt9qebrVU4wGd0XeJIrtC1TqmUAnMksra8W2W4QZ9xuPmsvBJXSx+kyLflz1CV4=
X-Google-Smtp-Source: AGHT+IFsHz1EpicfNBa8SK5EZAZ1T5+dy4IspYfwOFlNMLVrJU9DmGujRx+HhvdOUVgWsVRH7gZz6w==
X-Received: by 2002:a05:600c:6a14:b0:41b:f577:373 with SMTP id 5b1f17b1804b1-41feaa38e45mr94830085e9.15.1715603843566;
        Mon, 13 May 2024 05:37:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42015deac1asm37075625e9.17.2024.05.13.05.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:37:23 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
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
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce
 new syspll bindings
Date: Mon, 13 May 2024 14:04:41 +0200
In-reply-to: <20240511-secret-barcode-e25c722ddf1d@spud>
Message-ID: <1jjzjxzy4d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_053725_559061_A5A9D9A3 
X-CRM114-Status: GOOD (  26.20  )
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


On Sat 11 May 2024 at 14:08, Conor Dooley <conor@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
>> The 'syspll' PLL is a general-purpose PLL designed specifically for the
>> CPU clock. It is capable of producing output frequencies within the
>> range of 768MHz to 1536MHz.
>> 
>> The clock source sys_pll_div16, being one of the GEN clock parents,
>> plays a crucial role and cannot be tagged as "optional". Unfortunately,
>> it was not implemented earlier due to the cpu clock ctrl driver's
>> pending status on the TODO list.
>
> It's fine to not mark it optional in the binding, but it should be
> optional in the driver as otherwise backwards compatibility will be
> broken. Given this is an integral clock driver, sounds like it would
> quite likely break booting on these devices if the driver doesn't treat
> syspll_in as optional.
> A lesson perhaps in describing the hardware entirely, even if the
> drivers don't make use of all the information yet?

That is nice but it is only possible if/when we have perfect knowledge
of the HW being implemented. I don't know about you, but I rarely get
perfect documentation for HW, let alone a public one.

Those things are bound to happen as we implement support for the HW and
discover how it works, not to mention the mistakes humans will
inevitably do. If Linux was only supporting perfectly documented HW, it
would not be supporting much of them I suspect.

Stable API is already hard with ioctl but there, both sides are
perfectly known. That is a fundamental difference with the 'DT ABI'

Getting it right on day 1, every time - because things are set in stone
afterwards - is unrealistic. As a maintainer, I do spend a
disproportionate amount of time checking the bindings submission because
I know how painful it gets to fix things up down the line.

Unless I missed the simple solution to this problem, we can expect the
problem keep happening again and again, no matter the number of lessons
learned.

>
> Cheers,
> Conor.
>
>> 
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> ---
>>  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
>>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
>>  2 files changed, 7 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>> index a59b188a8bf5..fbba57031278 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>> @@ -26,11 +26,13 @@ properties:
>>      items:
>>        - description: input fixpll_in
>>        - description: input hifipll_in
>> +      - description: input syspll_in
>>  
>>    clock-names:
>>      items:
>>        - const: fixpll_in
>>        - const: hifipll_in
>> +      - const: syspll_in
>>  
>>  required:
>>    - compatible
>> @@ -53,7 +55,8 @@ examples:
>>              reg = <0 0x7c80 0 0x18c>;
>>              #clock-cells = <1>;
>>              clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
>> -                     <&clkc_periphs CLKID_HIFIPLL_IN>;
>> -            clock-names = "fixpll_in", "hifipll_in";
>> +                     <&clkc_periphs CLKID_HIFIPLL_IN>,
>> +                     <&clkc_periphs CLKID_SYSPLL_IN>;
>> +            clock-names = "fixpll_in", "hifipll_in", "syspll_in";
>>          };
>>      };
>> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>> index 2b660c0f2c9f..a702d610589c 100644
>> --- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>> @@ -21,5 +21,7 @@
>>  #define CLKID_FCLK_DIV5		8
>>  #define CLKID_FCLK_DIV7		9
>>  #define CLKID_HIFI_PLL		10
>> +#define CLKID_SYS_PLL		11
>> +#define CLKID_SYS_PLL_DIV16	12
>>  
>>  #endif /* __A1_PLL_CLKC_H */
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

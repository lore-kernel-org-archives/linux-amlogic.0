Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628AC00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 06:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLUGZ2iwbUPFwLdBPCQ3sYBBpFAAiZQP7TmaxH/pFJA=; b=yoYjwtQZmwC4wg
	qWSRk5688ymSXuQeOQd+LOcW6S3CwFpu2X4ItFp6RwS4KnKrh+IKtMqZ/zhFhBDYbK70pOii+dzIX
	O4j822W2tem7/G1uO2OvJZeyuogJuVfpXc+p2y83D6yo3V/DaMc/YnuM59YbcwahAYpFJwvQyEKGZ
	DEV2vRkLnlJjzIDi+DZxWNMVfXB5X859t5Z/eXeohNbsFVcFPkdx3LgXM1KHhwZMLLJq6eEiteTmh
	HIDHubyslO50oq2M13LgyRNkEkxJ0jC9oWDM9qZ/HYJjXWBxquwAeiZ2QA6Up1dkdSycUBQkeWlzR
	cwiirrJSXFfZFaztQelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKw4P-00Bda3-Jv; Mon, 08 Aug 2022 06:16:57 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKw4B-00BdMW-CL
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 06:16:45 +0000
Received: by mail-lj1-x236.google.com with SMTP id l10so4168114lje.7
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Aug 2022 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=fciYAWSZMoQdWO6XEfsJh4SM4ZwutMpTVspkx/ExHXE=;
        b=bk4Hper+0UryWZ+lPbB2cSDixGFoOcgSbcXAFwqlIywgvpLQ98GuypeYJ3VBpj2xfy
         j7nEM0054ptCZ+KFUBB3GtBXRPKadXLk9wfpboDt1ZqwxcSUqKEdjK4zjGIiP8tZZZjE
         U1uhlDjUnqiYX7ei/0WFkfaSTDzlmz6mFjnTUFZsUJLn0x4eCwuH9iogaQTgBL5hqpIn
         lSQZZSch7OFAXDKMoobdNkGJqFgFiUAhE1VVW0amRv09HDQOHzDEcNCG1izdtY76rjJk
         Ieet4gIcOBL9cEhVL2uMzMl9YEjpA5O4JLAJkqc42qV12FrdGle2xXQquZHu4Y8CevGi
         Qv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fciYAWSZMoQdWO6XEfsJh4SM4ZwutMpTVspkx/ExHXE=;
        b=sQWjCojOgrO4k+7N5+OCvpQXQnWCLlYkNVQTpAGfH088SzMZGP3oVIqSQO/w5+ECO1
         wDf+7djy5zE7LA5Op9jE4sZnuRNyy9qWBDm8wyzTXB2H51s92TWIY1IhRDFxHS275/D6
         zS5Lnl5fmVBkByN3paBpwQrcMya0JhJdyHXzUCvIrz7ZFHoFqcKePvj967rbDhSokzpx
         WOB3OK4nQVZxZjw0O8XmF3snDw4ZV1FR9/cNxwEOgCz+SH29PK3UfIYAzHogjgqNUGBt
         J7PTYF68RJuZ2zfd+RAr98L/4wOtiWm/VNrTpSGIKrng9z06qPNE3h2x8chrBcwG8w9m
         PKng==
X-Gm-Message-State: ACgBeo3G2WOXRJnR0iJTjVdMzz1CE5mKYDDR6gClLavFKyVZaullECzu
	3+6EU8LJnKj1DE37835p9LxB6A==
X-Google-Smtp-Source: AA6agR5vMHc+EuCiaOqe/h+2rKNhnqSu9yo7e+ImS+1K4uYlMyJij6BbOz3rr/MMTTXBK9Isto4CpQ==
X-Received: by 2002:a2e:beaa:0:b0:25e:34d0:4d57 with SMTP id a42-20020a2ebeaa000000b0025e34d04d57mr5361387ljr.329.1659939399654;
        Sun, 07 Aug 2022 23:16:39 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id x9-20020a056512078900b0048a891e4d88sm1310468lfr.193.2022.08.07.23.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 23:16:39 -0700 (PDT)
Message-ID: <e78f108d-ab29-1d92-d96e-07393aaf2a65@linaro.org>
Date: Mon, 8 Aug 2022 09:16:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-5-yu.tu@amlogic.com>
 <562043e1-83d4-d4ab-2c18-20b770b02955@linaro.org>
 <4d923b9e-61d4-b4cc-906f-cb186a16e1f4@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4d923b9e-61d4-b4cc-906f-cb186a16e1f4@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_231643_490801_F6DA7751 
X-CRM114-Status: GOOD (  13.05  )
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

On 05/08/2022 11:33, Yu Tu wrote:
> Hi Krzysztof,
> 	Thank you for your reply.
> 
> On 2022/8/5 17:15, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 05/08/2022 10:57, Yu Tu wrote:
>>> Add peripheral clock controller compatible and dt-bindings header for
>>> the of the S4 SoC.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../bindings/clock/amlogic,s4-clkc.yaml       |  92 ++++++++++++
>>>   include/dt-bindings/clock/amlogic,s4-clkc.h   | 131 ++++++++++++++++++
>>>   2 files changed, 223 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-clkc.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..2471276afda9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>
>> Filename should be based on compatible, so amlogic,s4-periphs-clkc.yaml
> I will correct as you suggest in the next version.
>>
>>> @@ -0,0 +1,92 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Meson S serials Peripheral Clock Controller Device Tree Bindings
>>
>> s/Device Tree Bindings//
> what's mean?

It's a expression (simplified not accurate) from many Linux tools, e.g.
sed, vim etc
s/SEARCH/REPLACE/
so just drop that piece I wrote above.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

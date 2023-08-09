Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5D8EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSXK2pU8azUGZXlCm60NSTb4E3Whz6iOsS42Z+720n8=; b=cUPHt1TCcrNCuI
	+YKtGFjm96Iy8uJZlfsXNzl0dNcnP3rjqUne6bHo3i35il40562joCeiu6fRMhVByp7M/fvVmw7Kw
	n5SKUstiVPNv3PwKtluk++uf1i28k4c8TK2/lrm306ojwzhiVTYjcd76TnrT/Rbq5mVxPIM8Fpaih
	L3yofN6j22rD16ZQDySyz6kQQFvbujLEszAxqOxH8r0Cn2qPynoP2hPI7l0hDFVnBKZPF2l0Da6Ic
	uE8R0gtTBkB3ni6fHW9ikwGfq4cdigaTAPC3WKh3eYLq+eTukx51V1CNnjdP6aL0Oaj8Wh8AHuCG3
	7bM5BP8iiOHyk6+CcVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTipa-004xO2-1y;
	Wed, 09 Aug 2023 13:02:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTipY-004xN4-1Q
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 13:02:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so9501928a12.1
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691586146; x=1692190946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2UTPDU0KQX0RK3PFL4VZ/siqN/71SBG93gUP3ty/AHI=;
        b=EKV2vY9KxdA/16++Yq3IXCAwhFYNW/5vtkUpWcl5whiTseN/z5MKtc8AmdpfPuzjJn
         do15Q+6YXXVpJ2l9jYsLvF4Gbo2jVJKXW04eOFUNr44WEK8QpdqT3SNb38JUeEjjkwon
         XJiqolrtWOpu9oe7+P1ckdTrZnB49bf59/ahl+IgSCF1JXEQ8psJ8907a6WgNz6DZuqR
         a5KWy2AulAyKrCMMZVaRCh2bpvzk/DyUXL6xxtB0d2bJVK2lmDGO6VCj1By649Pamc1v
         bdCQDd/h+UpxdO5Hq1cWCgWl/auPMFCcXyIbUV1Zwmk3dTr3S6Feo+eaOZ+4Lq3f1vGy
         iQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691586146; x=1692190946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UTPDU0KQX0RK3PFL4VZ/siqN/71SBG93gUP3ty/AHI=;
        b=WUPUAETrnwf51uyBW3/9XcH7ko99gvuhs0sQA8eICTioYKihJs32q8tQrZM52JZet9
         BIMU+EIWiKXY92lW69PZ+DFneqSjZZcx03bbF34RM2zoeyh/6ec9KatxSTMwQKbxcZGO
         MEUC1z9BYce33KwIQMNtDBFGwk4goYscFEkm85q1Xh7dFCF4F+LZeLqGkELK2hO9MnLo
         mqEC8I9Jdl6wfadcAMTG/KINZWsx1+dbgEd1Hzf1lpx1fQHNvMipa4Ca/W57Gtl3UILT
         8i/nR0yzsL7ekWgj/0wBy1kVJ771rOX08UIq0SHhMtvXOtvJJW057Cp3wBFx2PXNfdJM
         XjHg==
X-Gm-Message-State: AOJu0YzDyImGis0N/ky5AjQ2GvtQzWV6FdPJgmRdCJPZsfeGFU8RrlZe
	0BUailLutCs3Ns7xZyq/2S8Ajg==
X-Google-Smtp-Source: AGHT+IEidig6boVf6/NGmLXgeMbZejHvX6edJdvVWmAIRdrMFKINsNWdRvhNOytepsdCsN40c9Hz4A==
X-Received: by 2002:a17:907:a041:b0:991:bf04:2047 with SMTP id gz1-20020a170907a04100b00991bf042047mr1986339ejc.14.1691586145679;
        Wed, 09 Aug 2023 06:02:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id gl23-20020a170906e0d700b009894b476310sm7966706ejb.163.2023.08.09.06.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 06:02:25 -0700 (PDT)
Message-ID: <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
Date: Wed, 9 Aug 2023 15:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_060228_483789_48DA3264 
X-CRM114-Status: UNSURE (   9.82  )
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

On 09/08/2023 08:58, Jerome Brunet wrote:
>>> +      required:
>>> +        - '#reset-cells'
>>
>> else:
>>   properties:
>>     '#reset-cells': false
>> ???
>>
>>
>> You need to constrain the clocks per variant. Probably names are also
>> specific to each one, so the list of names can be moved here and you
>> keep just min/maxItems in the top level property.
>>
> 
> input clock names and constraints are the same for all 3 variants.

Then why do you have this huge, apparently unnecessary, oneOf? If it's
the same, then drop the oneOf and make number of clocks fixed.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

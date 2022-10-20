Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CC9C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Oct 2022 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2IMTffaMkjCpAKZYPvNh+KBqZFCwHB8sgRKtDnwNXY=; b=s6IDTebz40ZA00gMx7bQNTUbIp
	KxZD6ASNa7ooe7pIxHfc5XUbRefhVICNR7OhpdOpAPOIzRIxMB4VCntEdSqS/jHZnAYtGITlBLOdD
	RzPcjOqTSyc7buDDc7OaYc3E/kg3c9wK4NKUN7hG8NmzQREUaCUleGe6PRIcqSRjZ8JNxlChCTqiI
	GtNOwu+o4Op2sjiN2wVp5eizaijrEYh7HgvcVxsEpHXDzMiC4Wj1/m+qZeTen0Hq9raw8xw4vaYqj
	iDSc8nzSFHQ850pQq7NNDgqjdAGxnA0jiNdC+45puv8Z3TSngZfelItGCt1QAFlWQFz+3vRO5f+B9
	bF19378A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQi5-00C77S-AX; Thu, 20 Oct 2022 08:15:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQi2-00C76Q-Sj
	for linux-amlogic@lists.infradead.org; Thu, 20 Oct 2022 08:15:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 186-20020a1c02c3000000b003c6c154d528so1712349wmc.4
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Oct 2022 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mhEUUAx17h0AgHtxJMeCII0Aci1ZEeSL8jXNszOE9M4=;
        b=SGMXowYozhs41yaXnsLn+6I8DWByS05nCpogBo/gSwiquuK9eqEsbVsWuQKQ+Q9KbU
         Xvss5cdXVqIKC6wayAtZhK+eUKPYcyLjmj/OI2zfTMFSPCeIx+At6NyPkoCePWzDRv7R
         V6y1pr2HzjZfkl0uSjYyyuVTnxTuLHekFSLJiZlRBO6wOWKPtJBmSxVjKeoC1Q+K4Z5Y
         2DsaXTJQ6Fpp/TXwYnlXRmsgd57l07vJySEOZ4HahHdfHdqa5p/uC7p8dCBm1yH7KyQy
         VYUDRgOWFYZA2CtSK+m0gjZ9fUym8nA8Rz5givWgXosqDLZHBAycT7Wvc6Xh5dFvtvUl
         MeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhEUUAx17h0AgHtxJMeCII0Aci1ZEeSL8jXNszOE9M4=;
        b=NAJDa9/Uy4IEOwYsCcuoIE+o1oexA7lgzY380OkZCdqHsOjyMYwJvyXEAF9VMXuZ6s
         w6Omqe15gpazgYYnIxZOjVpM6RMGfFIIoOUbYfN8D5lEC4odXzccORSrA/EwDw7gmfX5
         h3+4ApMGb0f2cXeJ3KPdquB9xIAP5W7Tck2M5z8TD4dWVsc60GqcbiC6kzQCrmHbBHAO
         G+6+0tY0V/XReUJR8XS+ra9g4QRv1KWLfzN4p36il2E6yA6qBDE2L2+q1Bm44Qk8sNW5
         QA+vW5RD6kZJEJnQWGtDL6omePKTpjGE+xy/O99rnJ0VwxT7M8RFQ/OnIhGZprOabMNY
         xK7w==
X-Gm-Message-State: ACrzQf19Ag+o8Fha6rB4iK2LbC0LACCXaAI142j4BdIPypQsGxVSna8a
	HovM9leeWLCE4z2nAIhfr5MhWQ==
X-Google-Smtp-Source: AMsMyM6+QEGDiYr4HnFQpx2CtydwueOIIFGgcqt8YVmO8d/ISMyk+foSu6EsTOXeeBSJYJr/u3e+Mg==
X-Received: by 2002:a7b:c455:0:b0:3c6:bd0e:f9b0 with SMTP id l21-20020a7bc455000000b003c6bd0ef9b0mr29253450wmi.21.1666253719306;
        Thu, 20 Oct 2022 01:15:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef2:f28d:311f:c84b? ([2a01:e0a:982:cbb0:ef2:f28d:311f:c84b])
        by smtp.gmail.com with ESMTPSA id q6-20020a7bce86000000b003b3365b38f9sm2127648wmj.10.2022.10.20.01.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 01:15:18 -0700 (PDT)
Message-ID: <6696b644-bb9d-54e4-0b3b-e4897a881898@linaro.org>
Date: Thu, 20 Oct 2022 10:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221018195122.8877-1-linux.amoon@gmail.com>
 <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
 <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
 <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com>
 <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org>
 <CANAwSgQhWrzeRcpQSSAmfp+i3966dUQdtCLbcWwifQk=1ce=og@mail.gmail.com>
 <CAFBinCCyEVbc4N7TUEi=sbLFv7Rc-L=y-h8xBuZK446x1oLc2g@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCCyEVbc4N7TUEi=sbLFv7Rc-L=y-h8xBuZK446x1oLc2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_011522_976918_432D1FF8 
X-CRM114-Status: GOOD (  15.59  )
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

On 19/10/2022 22:40, Martin Blumenstingl wrote:
> Hi Anand,
> 
> On Wed, Oct 19, 2022 at 7:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
>>>> +&pwm_AO_ab {
>>>
>>> &pwm_AO_cd not _ab
>>>
>> No it has a conflict with CPU_B (vddcpu_b) PWM
> Uh, you're right. That's probably why the Hardkernel team uses a
> software based PWM implementation: [0]
> In hindsight they should have used a different pad either for VDDCPU_B
> or the fan.
> 
> I think the most pragmatic approach (since the "GPIO PWM" driver is
> not upstream and I don't know if something like that would be accepted
> upstream) is to use a GPIO based fan as you did in your initial patch.
> Not sure what others think though.
> 

Indeed I recall them using a SW pwm.

Yes it's perfectly ok to use a gpio-fan.

Anand, please fixup the ddr-active name and send a v2.

Thanks,
Neil

> 
> Best regards,
> Martin
> 
> 
> [0] https://github.com/hardkernel/linux/blob/c109dec94e7e819554830acfac4b6ed96e230179/arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi#L356-L359


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

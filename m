Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B692AC54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwuK1psK8hBqG9e42dYkSB6PNEQ54LyIep0RfdaVpfQ=; b=J7c8iai3mt17/u
	cTBtWoTTYemakGIcd+fCI4ec1rn7oD71e7zIVFXCk5n141nvZNh7GerD8lDlI/1CF2ZcjkiQGvelj
	SrmL6QlHHGvQwGUfsR2liBxzUOpMX66XlzvDXciKn/CjoKt5MlS5aCFB4G2CefB9gtKq6oFApPz1W
	hDywdNVG0c54RvHwmPLVNjFEeJCnfr6v8gKIokacz/GHfxMXFrFY022xKmxjqAD9G/efsgMKYn5SV
	xRbVHDsGvOgZw7+aYp8pOuKyHWT1nmrAlPfkypuw6JbKzzByFoZCqNUuX9uVZasireWK89vxOWb+2
	UVClyMxg4zFa3N6zLZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKccH-006naO-5d; Wed, 25 Jan 2023 10:02:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcWg-006lMo-6f
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 09:57:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id z5so16451895wrt.6
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 01:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C28GHq9eGnl5C7gie+JAKtI6Ivmm07fD3qZCGDhhJD0=;
        b=apCrKMlOFE35UeCLT/45jDefh+0DGAJSPjkmuPG50sSlGr5w+2ZAWeU9HH1Q+NyJ5w
         cKkygEQ7SV2ArCItkDAEfQBwtvyYuuuT2mlux5xzqqYHfrVARXbqGBn51HkC9Bu1MDnS
         3LEJ1gdTp5iM8+REO/3Zz7HSnFGOwCNV3klEMMQlyIb3fy9pzsOojlIcPEDaazFHXDfM
         ezgL8ynmxSWcJDoIiOSDhunqVqiijYkrFsDNft+2yamXM4/+42d/adaNFPFGUhS/ebNj
         xYruzqMiu9pZ6Zr1nnD6TQd94pAZIjkhT0v1bxjk0pqaO9o+96+DFwxuYxHEVgYXvqS4
         FmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C28GHq9eGnl5C7gie+JAKtI6Ivmm07fD3qZCGDhhJD0=;
        b=i3D0IKPUVZN+Cc6nV0xJpNGoIb15OZjguY5w6UurcCrbXoeBKKsmfSmymQyGf8lv1/
         iUI9K0PSnF+LfrfpOE44wM3OXa5PJVoqzem4oqmT5zpw0mKnsE6E/aGSCMIjfnk+2Dwg
         aFnTyEj07nKKiHWyVExxJfQvjdLdGXbGoL1rReomi/IIPtL3NkCKJckMft1OGDffmAVS
         0G+D0UlpvZO4irKL1HsbptkCx5omdNv4ou10TJ+4uwkgco2HwAAN1DJIZ8LRCCmrIH7f
         o9xUE5wpoQFrYbYBAvnFFB6n9ovLUnmkEjRmpTQF67YhXmc2Izsw+rDygFuia741dabX
         uxjA==
X-Gm-Message-State: AFqh2kqzGW86GYNjkvIqSXYkcU8u9DTY8cfKI5tFtXRvSdO02VdGMKm7
	GwmVd+pKIcOmUDSmBdEB/d0Y0Q==
X-Google-Smtp-Source: AMrXdXvsbvHnaMoEXFp66nyVdfTb24Mb5lvBtJ7BntzuF0Hy5p5VVX9YiWQI19QuXrcISd1TqN8J8w==
X-Received: by 2002:a5d:568f:0:b0:2be:b09:796c with SMTP id f15-20020a5d568f000000b002be0b09796cmr27610933wrv.64.1674640624592;
        Wed, 25 Jan 2023 01:57:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020adff78e000000b002be07cbefb2sm4759057wrp.18.2023.01.25.01.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:57:04 -0800 (PST)
Message-ID: <d2ce0dce-eaa0-12e9-e250-bf948d2ce9e1@linaro.org>
Date: Wed, 25 Jan 2023 10:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH RESEND linux-next v4 4/4] dt-bindings: usb: Fix properties
 for VL817 hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230125072605.1121-1-linux.amoon@gmail.com>
 <20230125072605.1121-5-linux.amoon@gmail.com>
 <bd29cba9-fb1c-051e-e10e-cb3e73ec5ff9@linaro.org>
 <CANAwSgRWVPghhEwvQgzQicJHcjgAv_d5nYfE0Ni90butc5ouSQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CANAwSgRWVPghhEwvQgzQicJHcjgAv_d5nYfE0Ni90butc5ouSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_015706_314141_5AABEEC5 
X-CRM114-Status: GOOD (  11.24  )
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

On 25/01/2023 10:43, Anand Moon wrote:
> Hi Krzysztof,
> 
> On Wed, 25 Jan 2023 at 13:10, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/01/2023 08:26, Anand Moon wrote:
>>> Cleanup by removing unneeded quotes from refs and
>>> add maxItems to reset-gpios and fix the required list.
>>>
>>> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> NAK.
>>
>> You ignored my feedback. Please help me understand how my tag appeared here.
>>
> I have followed your feedback and modified the below patch
> I thought you review these changes see below.
> 
> [0] https://lore.kernel.org/all/df1c8545-01d0-3821-0c19-07a369e40472@linaro.org/

This was entirely different patch. You cannot take reviews from
something else and apply to other patch.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

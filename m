Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9058C46467
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTDIGqGjJVIzXCgHlIdrxufd610dMaMiradWW5aCLdU=; b=Xg3Ydoj2yxKT8w
	jLGzEXM/GKJwstGutp5uW71jTrn5l1BW0hOGVt5KRcbbK1jlnOsppLfHwRWJLXmaFjXO+6tngu+ga
	XUkke2gmzPoqAWihwOtpf8cg0x1bO47gn1avYIKsxAvTKjVO2mmhNTC5hFvXqARvst5lhHCXo5h7R
	p02U7hdxPfv09EuaKnMV9l1dKys4/y3kZg5YYerEXWz1iCKJdem9i5v1QOAhyQZTX00x7XzmhOXaB
	4p7+CXeku3ab8ruMJerTq8LmsWWdsmQRvBhb7FO2mFCEE4+gVhgvHBJpi/rz/K+rBlbmzhtlG6STa
	DyYr7aQx/glwVhvdsYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHUjy-00Bo41-3Y; Mon, 16 Jan 2023 19:01:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHUjm-00BnzS-2r
	for linux-amlogic@lists.infradead.org; Mon, 16 Jan 2023 19:01:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s3so3773069edd.4
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jan 2023 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV8YKiyC4XQgkQ8HT5ZnhD72I1bcdeHNkkR8d7l2kAc=;
        b=wz590QBZ9n7SqAT6woa8JJ7aMqVrAi1iq7PTbO49b5ZEoG5TTC5TO+CM6KFQcBIz9R
         Jz2Lx5t/3kRWyvalT6zFMM41kM3ZNuIoyYFOK4HWFNhGG72+Eu0L7woT0PJ7SzsBGOBu
         1kaA02IcS9qNf/qWPDheFuy/wOQSc5R//+zuXI2dd9Vty5vc/9CgRuBNLVQ+AAnCt8RK
         8Vqx7V5PJJOy9Ay/qhJHNTkywSqF1theCFkxlMlB3eh8xRWRjaqajxEEYNbAbvDBRhkD
         zym5L9urPFU8uILfNUNPJwGkpqFMefnZGUNtdVc7EDPV0v3J8c5JWjP6JV0KBqrESkmj
         Y6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gV8YKiyC4XQgkQ8HT5ZnhD72I1bcdeHNkkR8d7l2kAc=;
        b=YVlcWNdiZUzXoV0HXe4RXC4xX6K4tHKnJ96+crY5ERjsbLxdEhSNKo5gIgBKMkw2j4
         jDUyX9443Ryxvirnzqo1MSinjCFDfHPnREuS8VevKLsvU9xeej4T6rigBbfqlIBB0rMy
         Q6qEk3GZqas/9sx1/5Rh1/msGbMWSSxsnB+JZuzOGvgu9Y9cOrug5C7RD+XNhvOlvAMA
         LNC9hw4qqz/qBvkAhKkiu2iYVaHU5LP1+fFfspspsb79/ubJ5na2lheLmwNA7cHFyxuI
         m2QsqrmqZPGXBJD+JvIAR7juW94uCj+n34bVPrEYmZHx93m2REdjhv1gL0z8I1TAbrCw
         7OqQ==
X-Gm-Message-State: AFqh2kp57lbPVxC9Yps2a0eY2cEqxxPnyIBEtNOw/TeDktBArMpdwf7x
	uDreHFmQjBipKKH2VQ5W4EfRfg==
X-Google-Smtp-Source: AMrXdXsmXfiFB/4Secti9mKyegCCIxsGpBAPMb+KlSGitXE5MGm6OdBqWGLVy1ca67ivp1/3f/1I8Q==
X-Received: by 2002:a05:6402:35c1:b0:46f:f36b:a471 with SMTP id z1-20020a05640235c100b0046ff36ba471mr469094edc.22.1673895698702;
        Mon, 16 Jan 2023 11:01:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l12-20020aa7cacc000000b0048a31c1743asm11686821edt.25.2023.01.16.11.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 11:01:38 -0800 (PST)
Message-ID: <ecb38da8-ce40-7b26-2fb3-088d859af814@linaro.org>
Date: Mon, 16 Jan 2023 20:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: phy: g12a-usb2-phy: fix compatible string
 documentation
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <fae86fd4-40f0-ce6f-f3ab-d5e0cff019c4@gmail.com>
 <ba8104e3-efb0-e092-573c-0e1ac57f1052@linaro.org>
In-Reply-To: <ba8104e3-efb0-e092-573c-0e1ac57f1052@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_110142_133557_870E2787 
X-CRM114-Status: UNSURE (   8.82  )
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

On 15/01/2023 15:53, Krzysztof Kozlowski wrote:
> On 15/01/2023 15:19, Heiner Kallweit wrote:
>> The compatible strings in the driver don't have the meson prefix.
>> Fix this in the documentation and rename the file accordingly.
>>
>> Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

and un-reviewed. As robot pointed - please test the bindings before
sending. :(

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

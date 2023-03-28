Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC31C76195
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gndaR39b6WP8qGKh7ZEeAdbUoefYjfXaEaF2TcXAFi4=; b=04DleQs9OGSqB/
	gV4NI8LIUbd0VSpf8xGHQndgDDybtwHA9TV/bRxZEz0VpOxMgMrHLfP93KlXui7Uu/xUG03L0QB1A
	j3g+u+nM/DsAUhG+EWeM97/Qh3FSSnvcGu0LhTX790rFyiS3vD44oMmisAPA86Qv9Se9VSUjCpngO
	rwE7PailM1tdY0Qq45cKiw5Td5zCf8gwtWIeWUejwBSnd0MgC5rpt6pNct9vsoeqNI0KRRxCU4j4x
	C8wttQW2ya3pXG8wtK/F5hmp4eydsYLdFfXqjhzjyIKUvB9m+wm+iEroQF7O443B7gRExK4SCjNnS
	ysCYMrbfFdQWzp7UkPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph325-00DLFg-2E;
	Tue, 28 Mar 2023 06:42:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph323-00DLDh-1Z
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 06:42:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ek18so45355715edb.6
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=451j44+6MRrjjocPev25db4ORq+gaZ4ABjFTXWHPHzM=;
        b=Qe8/nJ97su7uPLmdIjcVPCheqGdN7PQfAi4CTS73IRaZ0u66bA0GBLRqfvZky48jcR
         DqvGguKXS5TUPzEmjpceIrMqMgqalZ45c3gG0ji4aYvZghRtrkiTDKHmt6Qwyzi6vRVt
         BHVbWc3BARQZM2ciJBh5+7S5w2Yf4/efHb/5Z9qjP87Hh5kiH/5Qz28Pcy661mzeaL2H
         LnH01tuYR8Lp6tcdJiyD+4SSXQveH6YTiZpmhCErptaMJeXmTVTM0LHwpwqjL/alt11G
         d5n2HW5FSRp+0RPS1a2oxGNS4skGS2ObBRIww+Ho96KRn+GOgiViEFtQbmlvmqY6BVkL
         wW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=451j44+6MRrjjocPev25db4ORq+gaZ4ABjFTXWHPHzM=;
        b=GjHSXKmcLj7vkeKU+Gdcj6UuT4sHFcb7IuWJ6i2MwAqE6sAQCMtOFvbeMajqSRqXIs
         0/Fb1UnzNhKn89rVqHDG3SBg95+tnKb8t7fcpOJk35c/hHf+tK92ePqatFbj8x/qn38R
         oAiEkg804k6G0ryyDDIVbxiwLR0Xxk/QX4oJtztaFpRQ+9db8SoNH8dQ6EO0PAqfO1F0
         oVNPeS87I0iRAeSfTDLkf1GduIGzAp8KA/nvHd2ch1VK/iGi4MLINl5dqTcWTyALc4Dk
         t2lp1x7cwrCN1xVz5JYTVESxH23HUkwjAPBqHcrVhJ9qcuvZ5Pn5kE/DVT244k4acZ+n
         LiaQ==
X-Gm-Message-State: AAQBX9div7x/9T6SduVMXUYY2Ws2ktxTOvaMc/7/nX39FwmLE1LhkpZp
	r1iSdADlBTRMxn6oGwd3cxrKNA==
X-Google-Smtp-Source: AKy350bPobP7mxNYomM7mTnUP+KR0VKgYBLm04hWoARq4akmXfxUlUHc7yIwq5WmnLYkEcUIdmxlTg==
X-Received: by 2002:aa7:c90d:0:b0:4fd:1ff0:2291 with SMTP id b13-20020aa7c90d000000b004fd1ff02291mr13811380edt.18.1679985727914;
        Mon, 27 Mar 2023 23:42:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id s30-20020a50ab1e000000b004c5d1a15bd5sm15403339edc.69.2023.03.27.23.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:42:07 -0700 (PDT)
Message-ID: <acb67dc8-0186-695b-5986-6f1d91a0108c@linaro.org>
Date: Tue, 28 Mar 2023 08:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: rng: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230327170153.4105594-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170153.4105594-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234211_526457_B71ABA0F 
X-CRM114-Status: UNSURE (   8.08  )
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

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

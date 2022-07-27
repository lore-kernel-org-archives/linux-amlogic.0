Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DACC04A68
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlQAT883hkchFpDgwrm9MZxiS6JhLBpNUqMPi1Wp1Do=; b=g/NDOiOkFMpyGm
	7v2y9hsR3jTHertsy70l9yhgg8I/pQc79p00CLunmx8KHLgIVWZR6ax2kkctP3itJIEJMghwQJuUr
	4cL+1RA9mZQlNt+zqVD4rSCdHgUblb0z4uBOeKiMwiCdsLhNGW0UDTkH4Hg7f6FEYgXLnvwRaTHhV
	yel1dwMeIG8C39FcboVBKlHrTtf5PUTnzjy78w1OpWFkXGRb+on+5xcL9QJxLpGq4g3MbG/qK17No
	42BjpEPEi4uy0F8lopRSvy3uRilNj8/TAmAWvyS0ynQPbNL7ALvOSgJhQTus6KUYX3WBBffHz7dVn
	Ydxm1thev0mW1Is+glKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGiwg-00F2mf-FD; Wed, 27 Jul 2022 15:27:34 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGiwd-00F2k5-3g
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 15:27:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id t17so15374814lfk.0
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Jul 2022 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=cldYDRGoUxCLGjKsA9926W9qeodJZ5xTATUaMdBvw+8=;
        b=IFEiuYWNIzztkedjqQaYCsURRrAMCmcyR3MxjlWulOlcDLq5r0GkgLlc0flh9hU6nB
         PUEeD5hTOQ5edIdxUSpnBvBwx1jihISMolvW2Qme/F1ADtXpLvDaksgfVW7Bvz+L9Mjv
         w2nDuh3hjSX+/d8ng3YY0SBoyz15Zmhr2il5qj7IbVSpV1rU6G9SjglVUXDvvoMHbkVR
         lXZZw2AcoPA5qEaoLcbRZUKWhZx+pvNTiUyVmAIPeoo/gIns5ZN94nEvfYOP+5ORaqYR
         aIvq/8KuvBZ3g6jY9SqSZQ1eDDfdTFvaGwc9ymnMT9LTmPA488cyU/aS7HS/tk5YJPTG
         FHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cldYDRGoUxCLGjKsA9926W9qeodJZ5xTATUaMdBvw+8=;
        b=ugYtwECsJpmiNNGHbfk4snZQHoiyxiR/pgy6ZDvjNkrv3Yuru9vQXX/7ShDiY1spOg
         0Mo7XtTrau24o2fxktiw6QqwBrdLnxM8OlxFMbzgMEcfA8UvBFZLstJmFgUZud1EiyqF
         vvIE0jbMPq6zlZLL4QDenEEThzxb5SSdsTi+nHYeSk4PUUCt5ut6utZRCXCzDQclm4+z
         BZGMSqhpM3n34j1qNCh5A5BkQ/438/dsQ4q6cmFC6fY0fCa9PL7kcaY7+Xkvc/rbvmZm
         r6rdD1myp3lRFH+xUtewMVKsLK5XluPytCMAaZUmkpfwAsRXdL5xnJpaINrymNzAstBk
         O4EA==
X-Gm-Message-State: AJIora98CgMXP+t4PZ77ZdAqb6JWXUVGafKHCWZfkWsKMdT35qCPvbL7
	nevf8ddQ6tL31BPWIfqLbj4+3g==
X-Google-Smtp-Source: AGRyM1tOIzFvIUBsCCRkrLBJuFm7HZXYfpM6CS8zcYiZaGmW4hlA1AJt9pj6bSSxBcxrMTF8RdqO8w==
X-Received: by 2002:ac2:4c8a:0:b0:48a:bee2:37fb with SMTP id d10-20020ac24c8a000000b0048abee237fbmr757958lfl.235.1658935647224;
        Wed, 27 Jul 2022 08:27:27 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id z20-20020a056512309400b0048a93325906sm1497148lfd.171.2022.07.27.08.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 08:27:26 -0700 (PDT)
Message-ID: <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
Date: Wed, 27 Jul 2022 17:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, sean@mess.org,
 christianshewitt@gmail.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_082731_182394_BDB89C5B 
X-CRM114-Status: UNSURE (   7.26  )
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

On 26/07/2022 16:36, Zhang Ning wrote:
> Add manufactor bindings for Tmall
> Add the board bindings for Magicbox M16S Tv Box
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>

Please send patches with correct subject PATCH.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 3 insertions(+)

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

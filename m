Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4F2C7EE22
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 06:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fd1tArXWRFcOHjHHrLrz2SbnHXurxCW6CKoNuQs0v68=; b=s6enDiCj+Lpkpf
	wVFf1IGZFYs1ClE/b7ItW4wZkFu75EE8V2I5lIC3tt4BIKEOp1QU8GfaV37RQkA9StfT3Wy1QUUCS
	ieqZrZO0Mq/oD/HMMOXoF56tPVeGhRRgjIicpYn+7p/tz/Hh/GoPx7sGJ+N5aRRkgLXwzDSawlMYc
	XPjgk9VrXbnpdFRdp2dvpK+qyzWydwLq4KxpL6BLzgW5IyN7xEN8Fk240R+nERiS0+uHa2ctrYRQM
	r9T84PWUOrjR2CjzBxyjAivx0KrAd4RYy6nVw+5Di9J8+EWB7RFQXTbMSBQAOw0jUfbha5vi/eKXZ
	8q1l4FUbytx3Oj85j81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRl6-0019ZR-2W;
	Mon, 15 May 2023 06:32:36 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRl4-0019XI-0G
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 06:32:35 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so108155836a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 14 May 2023 23:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132349; x=1686724349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/hYvCcBf6b2cvUWeK/Zz7sqw40AaKUPJTT2dMrut/Q=;
        b=anAg46r3ItG7TxcWPmGuHeXhHGLKN+nwU5I/BaIYPU4UiOscHUTadRL+pNRbf/gYVb
         8MREHFIQAa9kjGLnQykkQe9c5bLgg85EQVXWPsJzjJuPq3DoMcwDL4Z/Yk6Y4MCBqbMt
         FiM0re6eTy6RayocX6uDWemmtmLxfNWKTItPkbHpmfnqULHK/EelaOr1KnkkS8J8zG4S
         gHSAu4G6iBMwAxFc1Zn+tfOkxaFSXUkn3fYvPljK4aMNzLROLTTAMniixl1XB3p6+fg3
         XrnDDUWkx4JnxaGcmA/1h3oC0bfflrFgXikACk6tTT6ReFWajycMuQaWkMi7r1A35Wui
         qrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132349; x=1686724349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/hYvCcBf6b2cvUWeK/Zz7sqw40AaKUPJTT2dMrut/Q=;
        b=bO2aj4NGpyQfMZ+cvvS4FQ/C/YXOsp72kQJAzJAIV8y9m+DuEbCWOiH6qpkWgwq4cK
         2Zcl80TZHFco5IBRJAYYhEXbxoeGGX0bwN+ns1ET0PV7fOBiqLJ5QM0gm+veDArIE0hA
         hjWB2FAkMnYCvcf8bfaNvVbIyHuGeTxcx0OGR++wbOLgBZISw7bT3m5D11c3ZCvBf/kN
         dvmnF46w3oLe5o2PxnlpU+1p710yY8/q7YO1IVpOlXRmslcJ+RZNDsWgcZ3Cbk+jtzjl
         6UY305QT/0m1HZjum1FE2cN40fn4AKZvBSdoJe7kwM30pNxno2F5UJdk+KZykhK9ivn4
         lXJw==
X-Gm-Message-State: AC+VfDzrrtr8CE104rMlf9Gvm4KvGgxdkgtvcThFqd1YnjMx1DQ1PCvx
	Ix6FqrSX/6JYR73k1UyXfwzRnw==
X-Google-Smtp-Source: ACHHUZ5G5Kk8YwVeXUzhpeXKMrTcjuQZ9G2Q+2fbGgBS0iUKQ7ma65pjl4f7B8m21PO/4Bg2keLvVg==
X-Received: by 2002:a17:907:3d89:b0:94e:4285:390c with SMTP id he9-20020a1709073d8900b0094e4285390cmr31602369ejc.10.1684132349638;
        Sun, 14 May 2023 23:32:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id bu2-20020a170906a14200b0096654fdbe34sm9129015ejb.142.2023.05.14.23.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:32:29 -0700 (PDT)
Message-ID: <0ff4b9fb-c56d-b896-e2de-c2f189a5e6d0@linaro.org>
Date: Mon, 15 May 2023 08:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230515031557.31143-1-yu.tu@amlogic.com>
 <20230515031557.31143-3-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515031557.31143-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_233234_120261_370FC345 
X-CRM114-Status: GOOD (  10.12  )
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

On 15/05/2023 05:15, Yu Tu wrote:
> Add the S4 peripherals clock controller dt-bindings in the s4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

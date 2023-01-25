Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558D6C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbQUr0UywHp/arlPDtmDsXP8zEW5u3v5K1+3/EFuSXk=; b=dhgFjyARwE+sBI
	NeB6LGLlg5h9bytLVQvtSSpYYPEDY9FZRKpfoJwqr/K2/YNyY3hDCg82WzfVqCOtNR8CZ4otCv1VV
	uf8J14uFAEjq5zTrXKBG+ccC3spCXBp362Zuh49jtQUcNggDEFv/8NGvVMTQusvDyN7At107zhS3e
	ajnTZQ8eQic39nh1kkr/J4sE9zc4aeJ+GlY1rm9A7RBb+Og8eMVP58+0+G4cQAfZnB2JmXbbUhTBi
	BrFlbJJrPisniLESo7zr8SvO+/6W5L50E2dXVJU6tRnwrYvzBkBH23VL6uov4FrG59EAHbUyZkeuD
	vxaaew0b3Qo3IcXKoAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaOk-006H6b-Fp; Wed, 25 Jan 2023 07:40:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaOi-006H5k-Gg
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 07:40:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id h16so16095926wrz.12
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wd7gzCX71rjuNYdlTHla5Ym+Gcp1RjzGYtvczmvc1+8=;
        b=btWMU7bEVv3UrLRfMmw8ezB26D0pC8Kwa/5Xpx3l9K1KTg0cd6Rs9HIStVu63EvDY0
         paTuzw5U6YQJC6lxV+m02dUneuSaZeJG2jyk56RcgIFzkbCrhPbpz4pOPQ3wAld7HEt8
         Y28QFuTJ/mKWB1jA5yExhvnc3cKY/hypZ7KlMRpRSb57S62ggYUfYc6iZ02dish6f23n
         ozq3mXD/bR9b01kGF8sTPGMtLg/85ZPk24HODBR9Or06DBc7xnaI2hiWHEcF0Cz8HB1Z
         8TQ8gs8g66pgkm4SuN5U/U5Rqs58vCXvo9800W7gfCSexXFru1oz98PJGyJVRgN6zQ8N
         daHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wd7gzCX71rjuNYdlTHla5Ym+Gcp1RjzGYtvczmvc1+8=;
        b=8SMAcJ3d8gBf5ZZdPW6qanxjl9Vn8yjbBlrPqxXIX2p82XnnTIHRZJlpfM9Ea/oTsS
         7/97yhCvsWA2tWu0i7a1Zk3UCbvSQnpnuqtoYf+YQ099pKpVO9RbViyEXcOPMoUFNsAe
         XNNR2vcAWHUNtl5OZdYKbDVt5dO1Aw8cO9ZEZFUevpDu8w9ig3zRauTkDpmFoJ5TaTNF
         0sl/PN0TvYTBGKc7UThkewKpry6uJU+NntR/DQ75UCPmn0SH4BBToOFH72XDotm281oW
         eh3aiDdCr2pjmZo0Oh3Ny+SY0nUCs8CsR9W2Iv53vN/lrHDkH9Qt9GGPXolKCnssZhiM
         1l8g==
X-Gm-Message-State: AO0yUKXj+lXu1sMnL8oi8xCmzqAWQn8vcvtOkdNsDv43/JRVChiEePCQ
	B6ZO3/8/3cGIBLIt8tkscx6Cyg==
X-Google-Smtp-Source: AK7set9MGJM5OP1q8wasTpuKj78pQJjsANObH5xYeJOBh8Cb1RjSwSB+qvvh3JFGzmLws8Rtz4kekw==
X-Received: by 2002:a5d:5229:0:b0:2bf:b54b:6ed9 with SMTP id i9-20020a5d5229000000b002bfb54b6ed9mr2708575wra.15.1674632442069;
        Tue, 24 Jan 2023 23:40:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s8-20020a5d69c8000000b002755e301eeasm3662273wrw.100.2023.01.24.23.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:40:41 -0800 (PST)
Message-ID: <bd29cba9-fb1c-051e-e10e-cb3e73ec5ff9@linaro.org>
Date: Wed, 25 Jan 2023 08:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH RESEND linux-next v4 4/4] dt-bindings: usb: Fix properties
 for VL817 hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230125072605.1121-1-linux.amoon@gmail.com>
 <20230125072605.1121-5-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125072605.1121-5-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_234044_585901_CE633991 
X-CRM114-Status: UNSURE (   7.48  )
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

On 25/01/2023 08:26, Anand Moon wrote:
> Cleanup by removing unneeded quotes from refs and
> add maxItems to reset-gpios and fix the required list.
> 
> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

NAK.

You ignored my feedback. Please help me understand how my tag appeared here.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

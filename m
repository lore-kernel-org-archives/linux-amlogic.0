Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20308C7EE45
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI09j/vamgE7vSXYDWW6pyoAdLejmW52xU2J+Xk8r+0=; b=uw+YO0qeq44Cuu
	qCuYbf30c+bPdcMeb0484icNenXbFU/F8e02bOrKjCTL/d+uXztFo4mpwGrzWv1H3pjrjROcOtA5U
	M4bYjjU4KP85MSPO4+9bYgGtFMoDPCmPIBJjUXIK3a2YCiXYpPI0dLmoQG9b1qToM/oDEBYn6Iofx
	Aau5tm4TV/9HIYM/EFMk4Oyh4wOd3hDRRR0Ffmfeyw1jHCuMCvDnoEwQqZWz8cnMK25a/t3SOFZSE
	YirZYUMlOPCzsLVArHunC3c0Onq5HHw5JVaSYOA6n6gTd3dmUVSauBWRxDjYj3uMBthxaMaTD5UDD
	JbKeOINx1D/QIZiezWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81cN-00GaNx-0Z;
	Sat, 10 Jun 2023 16:39:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81cJ-00GaKv-3A
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:39:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso4280130a12.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415145; x=1689007145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QiXYDHQLPum02ry8vW/Ny8uS/yxBKBPG03To311Ihhw=;
        b=NxSakPZ4DOZAcyWtlrET9GBA440gLPD9Lg5iidkj5a/7RImEi3zGKkKJnDG2Eugfpv
         lnbLTfVv370m++JC3nnkHPPmDhlCqRXMLco1zgVfuVFz8ciy1nMTkXoC7JYsx71Wwnxx
         l7KqsGWVNOsPBc3RK96XzrM605cxARowyjsXZwzkxPKeUegKmT8NNrnlOKh0zx0QcAr6
         aMyGHKqczHUbi2uZF2nBsnMUxLTT7qqXKGZY+5RLNGc7oZNB9lc/ZdOFlSm1SHeDzb5F
         gArkVf5s9icp+p6Js4q6t1Die/eZQvCG5DEC/a7MKvRa93aqCwBGmDgzI4CaUdgZp34U
         5ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415145; x=1689007145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiXYDHQLPum02ry8vW/Ny8uS/yxBKBPG03To311Ihhw=;
        b=CBvRu8H513mgbw4uq15svlTUhL76ogtPyXQNDf0ToUZT0+xn4c6INe3sYstweN3Co+
         VhtR5c78pJx+2Rhpzkj7Otch73ln9nk8ZRa9RY5OGi9A2AY8A5CZlIjINprttWl/Qe+S
         2ftDpQuEEOcUlSfPHiUgyZ5TClCiEPMQwi0YpflCzvdL+zx+R79um4+fPbLbwZd7zCnf
         oZUgsnBnf/tHmMTYOwigeK4wggPgAlAz//38hM/JhSRp35zkyFbgRq2e4pzofkwWHQda
         /L/X7Hhy0Yn0S3JCzcsM+akVCFzCx0t7aHQZD0k6uOWxGofa/9NNT3IW//7nRWyz8nmW
         TgKQ==
X-Gm-Message-State: AC+VfDx/SZyeFPJg3mofG1nDjEQJ3yl/efIfEi4/mtBFLtyVasrqo5L4
	dt1nyTtXJBgKkA+JDcmXysuFIg==
X-Google-Smtp-Source: ACHHUZ5Jb1+VnWqrBMQFrwFTVbVrskJi7tR7TK7otkENFqwYCziIMptTjdy7AotWU9Bq3PUpJWdcfA==
X-Received: by 2002:a05:6402:138f:b0:514:7f39:aa81 with SMTP id b15-20020a056402138f00b005147f39aa81mr1435661edv.20.1686415145043;
        Sat, 10 Jun 2023 09:39:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n22-20020aa7db56000000b005182edf2a52sm753791edt.30.2023.06.10.09.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:39:04 -0700 (PDT)
Message-ID: <59bfe97b-a403-1d61-2969-da0440506067@linaro.org>
Date: Sat, 10 Jun 2023 18:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 12/18] dt-bindings: clk: amlogic,a1-pll-clkc: expose all
 clock ids
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093908_020145_055E0769 
X-CRM114-Status: GOOD (  10.53  )
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

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every A1 pll ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

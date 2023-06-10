Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45BDC77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yldcGjxjGr7vJWcHPPzlRvfmj+tcRhPAPrear8Lk6M=; b=Dml2V6P+2BCRjX
	6lNv1vZkHcdy3lKQIi43YSz0ApVqn1nSGbTi541MEdrvzBMkN4pb2zidsmA929mXqg1iWX8hu3nvS
	YpGHMkOKhMf2/yVTaV5IpjrA3JxLnPOYcOSIGlVntqnnscsv6CIj6pZFChVwp/zoAvWB+hmF8o06j
	EsARrAPxTLxxhMhBnB3eX/8NFzYQ2QaRulZEffmKZO6SZ3x6rnFtt9tqwwfNXMheJxSt7WjCIZ9li
	uGWystnp512ym+4O4hg8+69UZiS5NoFuKL6WbXuWeaol2JkJQP3zuJPn2pITNqmD50VDU8F/T4Q8c
	YyRxs3ZH3xx1dwB29mvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bV-00GZx4-2K;
	Sat, 10 Jun 2023 16:38:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bS-00GZuv-2M
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:38:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so4939277a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415091; x=1689007091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hp33yA5HcmdHo6uDlO7P+JfSf1kHY2kxoEjyxwdelr4=;
        b=qpWBaIqFetal+BReZfUxUTyc6Jao3DQNWqNlxdw8JnRTnxNxho/XZvNQz6kE83BBO0
         9AESFhLOtsmkcdaO7cEDKhjp9Euc9dxTmfFl+TDXNt28M4cbF48nxbDmz1V1HRp+KoDZ
         HhU+EAzkqemptHxjze8XJi1TttEK+Gbrn2iRET14U+/o7BYIr/7ycjj4VhaPc63q52ZE
         NDxzsSxac9XDEoVRh9Rrbd4b+b32RV2vVlFsI0z0+nzoP8+w+cHXQ2vUdz/jK7MO6xmH
         2aP2X/06q+4APRPW1I4Ghzrjd9gMWPAwT/t410ZJIMRoflwn8M6B8+OQ4auePe3ImtRH
         +MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415091; x=1689007091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp33yA5HcmdHo6uDlO7P+JfSf1kHY2kxoEjyxwdelr4=;
        b=AGBYvt0CJeAuccMGx6OpqCBtOUlnPkupGhFpm3qij+lCih+hLWyORQTqHAvcBV2dCA
         aQvqGjjcHsln8dcTYP3KAx8og9WI4eoCnXsdtObs8Wn/8VhqPyS6SnHfKxRqIT1R0fGm
         1rFvnJnb0uFeUXybrPtvGZoIMxbGoltIDPuEjiKKEB2nHlDo+b2qq9YQjeG9nwBHsA/M
         0k4w7PwRyHcnRA9b3qoNkAAi34PgfUj7f9isjV7AASVtAmAnUF5qEGQ1uOpKwjYGLzXU
         BimSg48/StynPXd6czswrCniwuajY7APOIMc1aGwRCHLdeyiJgjozc8eDGUoALht9v7S
         p44A==
X-Gm-Message-State: AC+VfDwnyDZpyNSRmd8DmbLZc+o9c/61OGHCLYWkTtAeJqoKceiiLd7C
	N4UPZzZZ3HRvKqxEMk/4Io1P8g==
X-Google-Smtp-Source: ACHHUZ5WhgtdYTW5eL6c7P8syI3GQHp0HZckc2U6paAq8Szm4VAUQjVE2jDkIGK6LbHNiZyOsXRPdw==
X-Received: by 2002:a05:6402:690:b0:505:4f7:8a50 with SMTP id f16-20020a056402069000b0050504f78a50mr1600989edy.5.1686415090961;
        Sat, 10 Jun 2023 09:38:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i9-20020aa7dd09000000b005163054e330sm2968446edv.87.2023.06.10.09.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:10 -0700 (PDT)
Message-ID: <b18908cd-fe52-8f2d-2882-503460909936@linaro.org>
Date: Sat, 10 Jun 2023 18:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/18] dt-bindings: clk: gxbb-clkc: expose all clock ids
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
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-6-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-6-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093814_765461_E714078B 
X-CRM114-Status: GOOD (  10.89  )
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
> It was decided to move every gxbb-clkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 
> [1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> [2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

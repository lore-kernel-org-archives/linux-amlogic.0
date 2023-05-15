Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45874C77B7D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRofZnWjxBbkQ080iSjB7WO7OrlDlRINjSi/zWrUZKc=; b=Dh7/QtvnPDG5WP
	koW43riBqki02jC22YFl/vXhv34ZiAGwBh9Mk5Z4CgzojUr88ACqXSj3HjOzLgxv1DFLBzPgh5CnT
	3wSiZNgRt1fy8UXYBbaDYQ9TzxAq6Xw1Zlkbm0acaL2kDe1v4Xz/GdR2jWZDNuZcWE2UBay5/SI8y
	hJkG2X10m4kDdsuAN2c5lfdvWh5CSLLmmm5ZdaP9bM7dA71JAuHZPLt9xbcgIEoqYZIIIHMGg2EX+
	GW0/9C172f1skQl5sILZyhmgovGiHGYhxNxZHPvCuaXLmC/K+H8pZ9YjlLqZDovGo1Ake9G460dWU
	Ml7a1h2gGfMsQ9Ai9vmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRkw-0019Wf-1x;
	Mon, 15 May 2023 06:32:26 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRkt-0019UM-30
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 06:32:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso22304717a12.3
        for <linux-amlogic@lists.infradead.org>; Sun, 14 May 2023 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132334; x=1686724334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8a1pVM0DGaS6W157+gRqo4eM7NjJYx+JRCtEwK9RVc=;
        b=X95T5aNKRiJwuBsbVb8C0GoOMrInmKOp5JQPOcKq6pUuAIOUxsSvf7wS2Ve/SCuLYG
         FCFhplDCdm3cIshKUJ7Oc8xsJXrxT7zHF3wFKxAx8sQQSq1We2ikruwy0I6QTaN5a5Vx
         5MklXle+9kdlCHyDlpcjVkO4aWp7MrEzJgd8pd9a84Ie/DVbVPKGRzbee152l7CJKP4d
         c0aZ4lp4j2MKNBXXMqZTsCxXvgeY2IMIcQkcE9HqbHo6Wll4UX0dkkOlkzHiZENfUwU9
         Ilo/rXT4fnsKi9KGdurJqUXLZeNZF90LaFAcKfOQeS0026JDQrPdqF1A8P77SRaT6MpG
         KVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132334; x=1686724334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8a1pVM0DGaS6W157+gRqo4eM7NjJYx+JRCtEwK9RVc=;
        b=DYdQYdZhSVxYGi60LYkteWHEh92KzF5E/LHrV54lceXgqx4a0SQHbvF6Ha4LuyjtCd
         ehluCxtKrQEyHNJhzs++tp3RQ02Ly3rb12tRAcZHv+zvxdzb5sRGUeNn0TQzC+YB8Gla
         +PfUYgza2KL/95oD711ifFQ5W+cUi8PkjgHjrxpoi+FdSQBmanFs07F8x110gXYJb/gK
         yv7OAQX3ex321zH4jj4yAWpXuLZFhkC+Bf4NZXP54oksMmNOiQnyA9ytuUcLSuGppgnd
         UngsEAwwNrPFhtbkUNmJkDr6p+PJbOi6UEMpWIIg2XNFf52ysuL0rVig5QCXb8zOIGNI
         T39w==
X-Gm-Message-State: AC+VfDzXvG9rn+LdjtkZ8GqEns3so6NpZbjbkZohnYjs4pCzDYMWeVVx
	xKPUIdbnefn/KUOrNU/LJksEKQ==
X-Google-Smtp-Source: ACHHUZ6sKt1eBJkYlCxRQgz0lccW3BVyRVXju0DAlM9C3GIp+OCy5RuvfUTTAHCZJzcT/to3hYZalA==
X-Received: by 2002:aa7:d853:0:b0:4fc:725:e670 with SMTP id f19-20020aa7d853000000b004fc0725e670mr22863203eds.11.1684132334593;
        Sun, 14 May 2023 23:32:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id l1-20020a056402344100b0050504648fc4sm6870988edc.80.2023.05.14.23.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:32:14 -0700 (PDT)
Message-ID: <590560c9-4da6-bbd4-6aac-de57ab5403ba@linaro.org>
Date: Mon, 15 May 2023 08:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
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
 <20230515031557.31143-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515031557.31143-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_233223_973977_F8E08594 
X-CRM114-Status: UNSURE (   9.76  )
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

On 15/05/2023 05:15, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
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

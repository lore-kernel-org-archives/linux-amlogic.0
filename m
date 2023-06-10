Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5D7C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGAn8ESODwx7eSWXRo/lJkseue9B4GqEs1QsZ9zjnPg=; b=BkxxfIZ/6tL8Rz
	rMwrqSwDneqCsdGVY3+KXgTwIYEZRc8t8OIo9SWXHNdf35cDEjxdynDuU8x3vwz23/xpO6omywJGN
	izjMriDF0pRrpoODmCUT/EIvMhrKZqnHzr6WxGfZr5/TNkqs54KtHB+Kd4Uxp0bUrKf85HGdEwo33
	ODysQqmJgsw2cfndAtQGaydc8ZCo0vXP6msfnwqcy1ilAyaEFjUmWkjR4AWXGVS1QF97rbEzYBQYn
	gqcRB/zMtdFTd/7bwJI6GmYrxwmoVTktcXJWTmUQQq2Ocvy9qJJn7uj26/Dzf2Iz7ORdWZUSGPULN
	gkZdbxhRQp5dWVysUXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bs-00Ga6O-20;
	Sat, 10 Jun 2023 16:38:40 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bq-00Ga3c-0S
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:38:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso5031317a12.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415114; x=1689007114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rhc3iF+usUd5wOBnYjpPDlfxa1WSJJmnHm98HNU6RTY=;
        b=fHEs3sERTr6Xez1QnoOuzgrVvX4M9X6TQ5x4jAdXZnPOqKkXOa8HDgZn/cxR4yiMb5
         jwxQi+2NKeUNzuwg6P402naW1+a+5KDaGo6LzsZjYPbaB9a738WHZqA93pcj37eAKlnu
         i6Jip0Vi4tRZaeKlIQfyE3+wEhHoSZZ46tQlqKfAY3/VfUn6HZ9QqonvWxDlUf7dvmXr
         zl8+f1LkyrjU6BT1yVm8JlaSTScrq1p9lPg772tqcHzr5AePPKoRnNnZL+sC62WE12L5
         3CqTvRWUxNFqNWEXPL1Ez4GgpbN1+piZT5F++LQXQrMoTWkwDTMTjIlGynSZS5oJmKxP
         pDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415114; x=1689007114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhc3iF+usUd5wOBnYjpPDlfxa1WSJJmnHm98HNU6RTY=;
        b=BdOr3Mj8qHxBvUicPzMNIEHHho3q+IIZrI65kkDsbBo8NZBKbD9jYodVQWFFhyE2wX
         xGznfMw+yLcPfba1qC78ePT9h5yqRyE4AFC/Sc4KUVHo/XJyc5EE2e9IYhkoOKF27jgU
         WkrwTuYLUc0AOmGnC1YeBbwTkCxS91STHJYynk1B4BooCWtpNrz0DqnSmkLBBFPG5OGb
         EiFnf8eUkZnmX5XTbbSbLefhBzWl2QnkojRSrOOyhRSYhL72Irb6WtSXBdN3NK5Z98sc
         pK6LXlR3fsIONr4MwbVjQTOkGuQGGUluN9DKNPhBtCPL/ScsEc4PPMk2kKrJZ7tIc+tA
         76VQ==
X-Gm-Message-State: AC+VfDzuc/xwRoqF6bp7oLISFhBoaGRM3TlTm7ApO2nuoqavBKf/7mXn
	VoEv9q4qYAITk5BBzfGuKkOB3g==
X-Google-Smtp-Source: ACHHUZ5gTfEI7pySkAXDXusef/ipLbEnqL24VzPb5W+NDWa+tYVbBTmg/5fllxj+WpHy9SpuldmMhg==
X-Received: by 2002:a17:907:5c6:b0:96f:7af5:9e9e with SMTP id wg6-20020a17090705c600b0096f7af59e9emr6043603ejb.53.1686415113897;
        Sat, 10 Jun 2023 09:38:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w12-20020a17090633cc00b00965f31ff894sm2715788eja.137.2023.06.10.09.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:33 -0700 (PDT)
Message-ID: <f1bb396c-5317-99f6-9a9a-4f16b49996d8@linaro.org>
Date: Sat, 10 Jun 2023 18:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 09/18] dt-bindings: clk: g12a-aoclkc: expose all clock ids
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
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-9-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-9-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093838_178348_444B9EF2 
X-CRM114-Status: GOOD (  10.48  )
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
> It was decided to move every g12a-aoclkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

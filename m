Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6427EC636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9K6yj21zTBuu8SSYMK/qNizJxMw1Qd20Hc778dr3vKI=; b=dLfSvYd3GqaPHU
	956hoDtEUbzjgapGBXCCJEqHfG28ykcDKKouGN25l0gq4rAZ/urhVAGpmxzwDjftdok7ZtVHkiQea
	g1eUdkBH6fwJLq6jE+uFzwJ8L/MCbuChljNz9RBlaNF0q87jpPs6cpiLrLD16CeE++8QqtlQr9s1V
	8sLg59F7nEkU96CyqC4l2kvoh/BcjdbWe9YIXpPD2m327O3fJO9/8j+aXc2ddfLmA3ImxhGObB00o
	vElW5Y0dZjymDyppSxK1kdg0xlSM1iOlqhh6ujwx74l8E440EUNs2YKolQC38fqDQsQVy14Mlr4ag
	xKx4iNEsoZI06bMbziow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6y5-009h8u-TY; Mon, 06 Feb 2023 19:15:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6y2-009h8X-TG
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:15:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso9668067wms.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASOZTaYA0fPeH4V0w0/DNjsNUMl04wnF0KiVjBDE8js=;
        b=FkRZnbBXMV+2QXm2YTQ1vwr+2L5cJrDiMLarDO+RZG5x6kNysr4xYb5uZTTEyvxYBN
         Z/zIs7S0voagwKnVjSmFMJ3tmYdhsdFIJSwneonn7Sstj/FDhQOkmBzic7wMKIMJDDIx
         /WlMw01YiHvRrrfO9oSM3UAFyGphvfyDBSk8Z4sK94hz2psrYVJzEnHJGFdV+Cc9tPRz
         RSuZBBbqxCcMVyj10vrrnO43yK/xD+g6rqlyQ5FlQBRvtrfb8bIMcBkVxpM98CrFBNj2
         Aei7gpB+5s/jr8mUWpNluRjXpoeu4SUVkvLcVIga80lrSviPcHmNAEND+xjlJi4w+/pb
         TTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASOZTaYA0fPeH4V0w0/DNjsNUMl04wnF0KiVjBDE8js=;
        b=Ylxfmbn08YIge4J3YkiCt8+MCdP0zIzPPhI17ek2IUzkT/z5vB1hDFxd2IsoPKtJx6
         fDkR+9dMA+C+zeoUoqh0Aa1umy6hVoz7hKUxlqMch0wjsas5mY7iBS2yfb5+nRJL5J0W
         kiPdnKjjT92QvEyDnlpd5jSGU6Rf6ppIjumQ5th9qhRhW1Dz+0iWYwMBSJ50N1o/09FR
         crIZwE5FgCvHNBFkTepcyqiKeE9217w//3heF3CZr/3KOaWP0z5ESTjZseQNQcgvl0bY
         xyCGuePJ3TYNyfldqN6Q5d3L4rx9WTyjG3cEBAXowxDxUy8rD0t+rIUoBt6NR2ramdwD
         U1gQ==
X-Gm-Message-State: AO0yUKVCypY6QjPP4pzznOcq2CxXaoDJYBIJ9jNpm7zYEQsspqLXjstJ
	ZfqjicD0mYwBGI70y6Fg9Zbq2w==
X-Google-Smtp-Source: AK7set97CwxTF4+mcJ4gp9ZLuFRVhrwVBA51yp8Mc0iz4oDZXFiH93F59Or07hUeP2uEl5+p8AFg1Q==
X-Received: by 2002:a05:600c:13c8:b0:3df:50eb:7cd9 with SMTP id e8-20020a05600c13c800b003df50eb7cd9mr731884wmg.14.1675710952530;
        Mon, 06 Feb 2023 11:15:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4d8c000000b002c3e63c030bsm4224376wru.93.2023.02.06.11.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:15:52 -0800 (PST)
Message-ID: <364e2bd0-c411-7a71-4005-dd24e8d0f0a6@linaro.org>
Date: Mon, 6 Feb 2023 20:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/7] ASoC: dt-bindings: meson: convert axg spdif input
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-6-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-6-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_111554_968805_B0C44891 
X-CRM114-Status: UNSURE (   6.87  )
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

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg spdif input to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

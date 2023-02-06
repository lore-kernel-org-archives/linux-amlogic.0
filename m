Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9D6C05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wILWtdyfxZcwRvWOoFMeVgtH2lDsJJDKAmNX7YjsUw=; b=K3PdJk2VaG1dyy
	F5vzd1M1Zz2/fMcVOKS3uWgggjVq5qBlLGFCY6J4r5Hl42lvx3iKPJq66Cf6Oc4CR7jFCZ0hbWKZn
	sPWnQDVnp4QVvY+SogD7hfUNRErALDchjUf+RkxFlfb0VU1fydeXsRewrq/wQA6dhkgqKTFmMOIFB
	0kMZksARw5Wz8S/dbxinKzfywDOjVzGZXPyg3WhxmqSjpDix++ctMk6ZKP4+7zcQ7BlntPI/GN4R2
	FwAREFk1yvXjT61SWxmFCVie6VHbykQyYhTGwoBQx9ij7xguypK0UklCllVOLGcdD1QK9OpUZ6HS1
	K8Yk0YkoTp3M9Zzlx/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6yf-009hFG-G3; Mon, 06 Feb 2023 19:16:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6yd-009hEU-9z
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:16:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so11539474wmb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJRDeiWMU5LminQ5X0rSwq5LRRKb8iCPzPGu9WgeBvk=;
        b=VPj2N3jHazrLOiA7IMwXdxCeFN/lEBhO1oe783NaPoPoRMAJ6L05bPfNIY1WSBVPvg
         YgR8ZcE1UpgfiKiMwyZjQz3KKkOHc/09+dTTizVt8UI471hYotXy+eaPYtI0LjD2B9X8
         TM+OupEI9O4EaWaz9EAcCuhBecxbDP0XRUE9zBxqMorKfh8kc7fSlqb8WEfyD4Fzvnb/
         oqdWiVzVZiER7qK/GwKoHDG+LSwok8oGcu7mxMwe1vb+7QABcdb2nTyS6R3QhsQ+ZRXT
         Qbw+HQvs0Uij5IaDi5jCdEmXQqTq5Lgy6J67JTREXAUoj/bQYMr60UqRZkPohBhoMUwV
         cvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJRDeiWMU5LminQ5X0rSwq5LRRKb8iCPzPGu9WgeBvk=;
        b=kcB6PRadquvKQTWpuaygJZjL2lHQ5xWLNJI0QD7ibIZFRtnexBY9u27vfB6r6mGwHm
         3x+/oZ96giC6UfCNm6YoB63G+852LrzhNsOXlQXavuWTQvxaxEmd6yPsvDWJYu5ZuGe2
         W9QLhCdQ2+JKllB7A7bm7Ky8axPxQiuejYFC6jjnXrASMO445AjZ5Z0HkHgs+/28ER3B
         Hq6d1lXI+QIQer3RwgeByYNG6pdYYviCbg1aZTurqgZbz4NRJ2trRMdOVIwCR/LqCAVd
         Dmyf+ElyXael5i8dHvOPNcPyE20eIJaSyxMM6bR6a4GVxN3O8KhJ9yD27c6xKUU14DmC
         ll4A==
X-Gm-Message-State: AO0yUKWwl0D3mernh0NtZPN56YuYeDPOFGwf4HFRPozQXKYFsI3zPmCV
	DRNrhPQgnE7dKeYgUqNzEp98hw==
X-Google-Smtp-Source: AK7set9kdM2QNJOY0kxx1JjhOxRMvHbF5AvX3IsjMUfODox45NsBWNLdRL4wGOc0gLaOFODk/k+JVA==
X-Received: by 2002:a05:600c:331b:b0:3df:ead3:c6fc with SMTP id q27-20020a05600c331b00b003dfead3c6fcmr746809wmp.17.1675710988803;
        Mon, 06 Feb 2023 11:16:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c3b8900b003d9aa76dc6asm18047337wms.0.2023.02.06.11.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:16:28 -0800 (PST)
Message-ID: <ab80be6e-0dfe-a696-6d81-0969e5a21ddb@linaro.org>
Date: Mon, 6 Feb 2023 20:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: meson: convert axg spdif output
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-7-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-7-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_111631_377038_13DC2A63 
X-CRM114-Status: UNSURE (   9.22  )
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
> Convert the DT binding documentation for the Amlogic axg spdif output to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
>  .../bindings/sound/amlogic,axg-spdifout.yaml  | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 25 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

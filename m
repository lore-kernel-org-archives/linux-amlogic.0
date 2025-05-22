Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD0DC54E90
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 May 2025 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2qrSWKwnYEW1tvYj3y1hHzT52rzVGxf64i3IDvhNUk=; b=hrwbhWFGtbhq6Z
	77yxYRfxkjSjs/OBZsWbs2m0oUrdLgLPJqGd2s6ZQ3xXEYw+cPY2fGQv6gdEA82V8a4l9+G0E4mms
	PGTZfsd81jj7Cb/XUmUC43UbGUjXz5AEBQBnzz3uo/axIE32gHr5ojYXmZm8QETj+yukN4qsMdPhV
	Z7KMx7C7diT6QTVUnhSW6qq2zaThIUAd7ItMo8qkxgVUyu5DinmJr1bFNNfnzxf3pTuyYoKt7iSft
	6jfuQbamJ9oCuuakqiO2fwoS7HWeh+TmImpW5+ivUiVQcHWlZSTAzZKWcc58NUTlWLeCrmV0LVXXS
	GaepfWsyhSTC/TtEu+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAkK-00000001sPy-2SJ7;
	Thu, 22 May 2025 18:34:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAiH-00000001s1n-3Kap
	for linux-amlogic@lists.infradead.org;
	Thu, 22 May 2025 18:32:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a367b6ad08so679303f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 May 2025 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747938736; x=1748543536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rOYkb8ARNGoWzGK6NIRQbMqEIL4sIWgyEMwNFCwUiPs=;
        b=dWXuHU8NW7lq4Qjx/8p60NnPIer3KJD0ZNJQ9z504CT5hcoJxngM3J/twniLFSaX6z
         8TDMGdYtH3EvmDo7riWYmh5onRO5Gl9OG0h1kZ6C0lO9pO0W4UOdUHJi674uIX7+LTSH
         LMkekuELhbAmwik9GM23gxayIGEBISRlH33CYkGyCcsw75d+3+8/UA/t+k2RDwOeoId3
         x19Gy/2eKH/5sYy4d6G3yvbToiUUpRRnI/ginHSirfHUlfBPDU+RNsBsnYCIFdc0Hh9R
         jWJmw+9oangvWFIRjnJadTl5dbjmKcauBPrkZg6j/ZHRGS6U6oO9JmXsOAoK659MIWa7
         5Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938736; x=1748543536;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOYkb8ARNGoWzGK6NIRQbMqEIL4sIWgyEMwNFCwUiPs=;
        b=UB0PHhKlnguTthsOMrIunYzWoEv9UnH2oEiFFRWEFLJjWGsqxitf2s081ts1VPPDc0
         HZrfP5LBHYOJ59O+HMws/P6IIKl7KqmYa65OGkBiibyCx2lcwIxsDX0Bl6u0aL+ep5r6
         9SJ7nlght7EEHf/DiH1wN4DwkfPMLq/39VRo5GJksFAEY5HQUgzyE2iSygkiE6VED9u+
         E0qUYEfa4DOzy0D7IO3XwmSkcikz41H2UZoC+6CeSJEVbcZlOOgUWG3d2c+8HoaBOhqg
         xgQCH1tdYq29ME2iPp/IH6UHL1jfFjxC3/cUBYJ3jE6rxBM4goU6urlZU/tJ1ePojOMX
         B0QQ==
X-Gm-Message-State: AOJu0YxldB8yRki26P2zWnpPHtQHomGlRAcD92rS6b+OT49QDAgRLaO8
	WCV11obMqZnhp17Nbp8V0+Rd6wFYhDIy2xkKVdFEyK/jFOmlGGETApfdEBzH21MU7Dc=
X-Gm-Gg: ASbGnctaPxiZh8GvmDMuZDEI8d/4mu6m7m9XukvHXBRuZ/NTWWeNYjzs4UjaUiTKuFm
	l0teUKeVvB2k76GVR8miY5rh7PtT3VMf/zrmpChEm+PPkzFyQ+ZsYP+dPzrZANU9jYGLrNQQdBe
	TgZ4ulIUVQbrrKgW/N9PgK1EXMeE4+HWecJINPR/N+EEeUZmosoPEoyMlS1i3HJpX/NyQeaSoXp
	yfu7dyVnFS5lzS0NU5cny2sKNlb2436ycFoMQds0H0aEt8o0iBDmTXLTWUIJxQwWoawhVQNkHNQ
	QNmgKWrJE4ZQYz+7K+RVmwL8keXLU+wjQqIZymn9gq14VGp34BkDio8DTfUuyg84Xcb3On+v+oq
	KwlwIjA==
X-Google-Smtp-Source: AGHT+IElOSB5BApnFcPON4k3G6fN+T3e6tCMODFfwlTj5KlbfM3fgpMePZRiUwP9/6DJMNlIdFOSPQ==
X-Received: by 2002:a5d:404a:0:b0:3a3:62e1:a7dc with SMTP id ffacd0b85a97d-3a362e1ab39mr6921412f8f.1.1747938736169;
        Thu, 22 May 2025 11:32:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm5955103f8f.2.2025.05.22.11.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:32:15 -0700 (PDT)
Message-ID: <24905725-21ca-4408-9822-285f0a96b4da@linaro.org>
Date: Thu, 22 May 2025 20:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile
 testing
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
 <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_113217_841557_B3CA22B6 
X-CRM114-Status: UNSURE (   9.54  )
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

On 04/04/2025 13:56, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/nuvoton/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Ping. Any Nuvoton maintainers are going to pick this up?

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

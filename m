Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C27C48BC1
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpP7wvRfs5CYDAcoF4yZydg9xlvQVivlOR0uZM7MbzI=; b=CG9578oIDGyK5J
	DgWuCv2EmQfjpg5EdThROr0hYWDjZZkkBWmuXwlfyE3lT+UlcveOujOKDI+/MgXAiQHuNtRhLk/XI
	dQCkC6yFgb3sqGKY/5xI5oJ9P7fa2ZIfyNXIIokz1tqBxPEF1VTvHh0KHDgd45y2LSaVjQ4jh301l
	VvsY2P6pBq38zIKj5/0QNgQAWbBL1FUZPMJNGAJjFE7a37c6bB4Nx8m7eEzAg9Vl0jNcLPNXKQJHR
	kJpR8B6F02kKgN9+716UZT6WbfuPvEvTZLPErNmQVP3n7oDw/SY1JaZpsizloRauAvQYEgN9vrfkD
	ukEZ8WqpsNJip34qaIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtzj-00000009YeT-2nfc;
	Tue, 13 Feb 2024 14:42:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtzb-00000009YZ3-2HUi
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:42:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33ce2d1882fso128852f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707835357; x=1708440157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzKkZMKuUZaXgIvM9bgeHoXSuRfLlAyvXMoVVK/muX4=;
        b=cJKN8DV+GlWDt1WV7lPOrLSn2qVELM9FPBblyFYoNWsW9rp3fFnxHxGElmwPB3KE8c
         xFndCmL+Ml0t5WSsFcOh1CaAQgUO/3sdsHhgpFYGWvr/QUHREUHAWTakM7uDRtlMmUHO
         X9AqIgB9Iq7i1XUctDKiujcvsgZ4t/ucob8O0s4bXpN8kVlNKFSq5t19Ymkwrj16Li2L
         zs3WlnQu/VlKE7OgOFQPcnoABIb5XoY6/FoyNhF+flF0heST72P4kz3Orxrbj77bgrRC
         u60tCiV4pYiJgRv0V6e+9+2rbeiMJQwNkb0JgwX8u/oYUaavkL6vpD587SnAswWGOFvC
         Ol8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835357; x=1708440157;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzKkZMKuUZaXgIvM9bgeHoXSuRfLlAyvXMoVVK/muX4=;
        b=vjBYFyzJNQajqHdqRM9NQyUgTXBxrL3qHmEFnoZ5CWgG15wNN2l5iDDeJEFcKxRvsy
         Q2YgPxNVidxHhZL1hZJBPq3oBW5llLW8WkKk7rZOfKd6gjXprg+pHMydTbfmxtNFozLE
         wSsHaQnEPQxEqY5oBZ46YNfQED96GGN3fNQnMm78P4k3hhZRSMZMo6bHsg8YNBzBQJV/
         kEs4mN/0TCmSeK3YECNeohdnibOueSlDnvaJx12Iy1A0fuHw7RrMSlaCKiOlxjfIYeMl
         Vt3hWnvr1psuelrffZoUOnEFqMFqmNh6cNYvd8F8lJajyIJmoKi9nCIL79Mgf7QuUAhA
         40JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpi+ZtYzj8sV0K8warIg23BjNcHfabkGN/GwoVY5JOrytmtx3dJb8ZE40OoHnPkyil6AopzmlUKXgddjfXqugBdOchGfSvwO+2GqYXjF0hm1E=
X-Gm-Message-State: AOJu0YwrKn3csiup3pusxrbJljgiHMgNustaVo3xkiqoUOVwSLjLAtVl
	/vj0pB/XoO4HRayFiCMvBfo82d9hVjwkVLOJ6JacsgcjzfW5QwXrcKBgSMXcMBk=
X-Google-Smtp-Source: AGHT+IFYpuXKSOQO0p9VIY7/IrfiBhhk7wmbcHyFpJ7SlsdeNC1NckhmmVBBKuXJCFb4RtXUNo7EUQ==
X-Received: by 2002:a5d:4441:0:b0:33b:20f5:b90c with SMTP id x1-20020a5d4441000000b0033b20f5b90cmr7367745wrr.13.1707835357545;
        Tue, 13 Feb 2024 06:42:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBExV8hikP21cTbob30b5fDy5iq9u6kS+xIHoP6sUZGaf6pM8DZ+0iKWiEVSAfOmd2JmBVgZmTnsBxWKCAm6P8jSY+i9gSIATp3Bem9uPP9+bLz8HQS3L94ds13qXhSv+l2qVT/5PL
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d58d0000000b0033afe816977sm9669148wrf.66.2024.02.13.06.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:42:37 -0800 (PST)
Message-ID: <e889f65e-9ce4-4995-8279-9275147195dd@freebox.fr>
Date: Tue, 13 Feb 2024 15:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: amlogic: replace underscores in node names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240213143217.336341-1-krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240213143217.336341-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_064239_887979_31542592 
X-CRM114-Status: UNSURE (   8.94  )
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

[ Trimming recipients list because my comment is very tangential, almost irrelevant ]

On 13/02/2024 15:32, Krzysztof Kozlowski wrote:

> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.
> 
> Cc: Marc Gonzalez <mgonzalez@freebox.fr>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm64/boot/dts/amlogic/meson-a1-ad402.dts |  2 +-
>  .../meson-axg-jethome-jethub-j1xx.dtsi        | 14 ++++++-------

I use stat=120 so that format-patch doesn't truncate the path.

Without it, it's hard to tell if fixes only target arch/arm64/boot/dts/amlogic

BTW, I didn't mean to single out arch/arm64/boot/dts/amlogic,
it's just the tree I'm working on at the moment. The issues
are wider than that:

$ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts | wc -l
1636


Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

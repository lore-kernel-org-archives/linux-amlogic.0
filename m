Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE0C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpKNa1gDQchJSfxFWX5NbawhZEZWEUXPDI4vjdt7hLI=; b=sCO7HtTkbEt15y7NxEXwoHX79M
	Vg7XpaYhet7m6F+fVE8w9jc9uCm8ZdsR3M4sU1t9rG5MZeNf45iET1xT8dn3zziuVKhERUEU0wyrU
	sasMnUYO256yOGnTblPaM0zBmrhgdHJywl33KuyYD62zw9tbAyHp51fUObppXU9900yhguxkmJT1P
	A0Pq1r5LHCkdd2rkLGTSMv4FnCX0puPTPfcAROgPT5/o+Whubu1YoZBekpf9XvRUBQfTUoJejF12C
	e9vC9boSZW5tdC7GDVPShEX/IIqj6nH7RrK4P0nKa+60YGz4C5sFzVcj4Y88dHRxCgjzZYMfLwyqh
	z6vgSyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnv5-002sUE-C2; Fri, 25 Mar 2022 17:40:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnp7-002qAd-E5
 for linux-amlogic@lists.infradead.org; Fri, 25 Mar 2022 17:34:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 r204-20020a1c44d5000000b0038ccb70e239so14245wma.3
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Mar 2022 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4au4HQJoqTVH7QuLfTG0ctyg44Z9i1a4JMpNhX3HXmE=;
 b=fHaI5D6OllN0BflSbbgRLyRyoFi34rIUMZTPyE+6vre/pNCfg/y6/Hu/vsRiqRgDjo
 nLfNjlhpv5j+4EHsWTCq+g85rIB7CPeMArzmGXer2e0cXNVxVtgFdttB7JdGUZ1Gw+tz
 G/a9fEmSsa7MrfkHt5apOHfDkt4Rnu/OAhCqKw3UoXBuEEJpc0MniybM/pQ2h6vEhpln
 3Ys8iW6T+xfrKN9yBM1s7MTyv+GZkJ0E36sgSUcPenLbcL79FW5aiOL55DgDTCphx5ye
 GoNw2zFKY21asbuaxzIqfufo3XDO8NhSfRrWmRFqeQCOzL/aYIjUMYGRA4m8X3hIPcQM
 movg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4au4HQJoqTVH7QuLfTG0ctyg44Z9i1a4JMpNhX3HXmE=;
 b=BAjrAjyukWEgBy7gCbNJWUld4iXQnezODsv5xlxhR0SVWTJh0+rpWnKl9w4AtE+CRZ
 Hr9fH0NQEHzGelyoSrISckr1SkceGz1JleEiKnY9h8UzTTW4SMLPxPg6MshWTrIXzDfn
 jKhNW77sRJmRysaPLIdwUj4g+TulOeDlJ2wbjUyC1MwhC9Em7z5JJzrRyHCQkpNE0PeH
 bPkPnEnM9fmlKj+92mw8o189dpP80o9F4026ki8Q04JdATwLVo5oHgoIu/9i3ehEM+O2
 SJlNS+tsBX6gamDwDyaiyr3m0f496t9Skuc7YaHTwvxV9Zx1rWe4N70XfzNx9yC3Xppv
 ZL+A==
X-Gm-Message-State: AOAM53035ahi66w2YGzXheuJRvKvdjL1B6/g9RnBYHKcGx2bEpKgzycL
 vj1XWZkTkpKMwRVXFjnJW7nPGQ==
X-Google-Smtp-Source: ABdhPJz/V+jMzW2tGs/g4V4RP3QBLNrE9pk5MgdSkzns2BmU5yeIbnWkFVw5TIqLNLr7zmOsb7wWwQ==
X-Received: by 2002:a05:600c:19ca:b0:38c:a190:9a0f with SMTP id
 u10-20020a05600c19ca00b0038ca1909a0fmr20524715wmq.57.1648229643918; 
 Fri, 25 Mar 2022 10:34:03 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d3b0:47bd:8485:31cd?
 ([2001:861:44c0:66c0:d3b0:47bd:8485:31cd])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b0038cc9bfe6a4sm4734266wmk.37.2022.03.25.10.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:34:03 -0700 (PDT)
Message-ID: <394573e1-0786-75ef-65fa-4b75d57714f2@baylibre.com>
Date: Fri, 25 Mar 2022 18:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] arm64: meson: update dts for JetHub devices
Content-Language: en-US
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220325165501.81551-1-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220325165501.81551-1-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_103405_577653_4C5618AB 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 25/03/2022 17:54, Vyacheslav Bocharov wrote:
> Update dts for JetHub H1:
> - add bluetooth node for RTL8822CS uart port
> 
> Update dts for JetHub D1:
> - add ZigBee serial alias (ttyAML2) for backward compatibility
> - update voltage regulators and SDIO config to match board's reference design
> 
> Vyacheslav Bocharov (3):
>    arm64: meson: add to dts for JetHub H1 bluetooth node
>    arm64: meson: dts: update dts for JetHub D1
>    arm64: meson: fix sdio in dts for JetHub D1
> 
>   .../amlogic/meson-axg-jethome-jethub-j100.dts   | 17 +++++++++++++----
>   .../meson-gxl-s905w-jethome-jethub-j80.dts      |  5 +++++
>   2 files changed, 18 insertions(+), 4 deletions(-)
> 

Can you add Fixes: tag in all patches so they get backported ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6961C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EgqTmww9ziP7s7oIR287Q3hohji7qLKXViad99oaTM=; b=hiB8PxdC7O8SEKX6Pxq4ir26xK
	8ePJK4y0Afq+7PqqVH+zV0CtGncGsRlHCd1SDi+JSxJ0gW1Km3mb7aURMDZstPbKOz6+F22SqJq9F
	SuBw2JLa7vWUqM0QXKiuiN2xlZwPydnfapC2bKJJuKOEhvgRsnzenifnT0HlebSA+V5igsyh7uMwU
	W1b7PibYs6igNq9Vr019BOgtWIVnurxa8dSlA9Y1lidzuO04jh4PDxKGrVJJK1DUcukT7EvCZjQ9g
	dPyJKNn7AHLE1BLbhH5pWoBtZU4SV9J2jX+jQKjQ7L+S6oQELfhC4u0tWN+dUiad8iWwv2t5dlAvS
	nFLO+MRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyji-003PFe-Pt; Fri, 18 Nov 2022 10:36:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyjW-003PCS-QZ; Fri, 18 Nov 2022 10:36:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so3725941wmi.3;
        Fri, 18 Nov 2022 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o2gq3WkhxO5jelfwCv/WS0BWOBOHKufpRkH4v9U9Wao=;
        b=d4PKh8zw6k/K/IW7TceQGwknGbrYWtGWKCioj737b7AqjDamyVEgbP8oStwlBRCsgr
         2r+/vH1UGVJOQi3gaRMn2/XRtbLw90ezM4z5Ya2pPGHfUfTa3oyxFx9a+7DOoqP0b2IL
         Kf5PO5zgnl/Rxe8HXYNlDFTV1qDvsgryqooTi2Xg1eCd+lL7Vm+m3IFbeDrbmrvPFrR4
         1z2QirjNW8QjJ5uhQD1nVJ6F8m4i1ujFlklWkQRMdwxsyqoTzhnrwxCIgN9RanPK0Zy3
         eYOPIE73fiy1sLxHGUNDjbLWFPhV55RCsjfoJGT3y+8U0p71f425cbNfu5I1QBh41G/X
         sc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2gq3WkhxO5jelfwCv/WS0BWOBOHKufpRkH4v9U9Wao=;
        b=2HcP3TXr8DUr48+EWW6TMckigM8b7PnVvZQI3Ok7wfKHrdWOFNXryTzjn2cLtNKgq7
         AsgNL2D3tbt+ossd+uR7KJQN1aFr0kUpsB5gJ8T9KezN7ImBi/LMNlE2fC1vFLE63a04
         4vNpQwybC4p7KQ9u1tG3pWzHtBWNFjaM+a6YPtZhG35HBEO7dxfpkscQBYKaUm3p7jd3
         i6XEVW/6xyKyHH0rF1Jh6k/KD5j8R7unj3Wk2bPb0qe0DIzfllmr4xYCapkZW2KCLTy9
         bg/3Z1JfgmzY9xNJbWPsB4vzG/wnvja9lBlVPbJAE/u3wE+TViA+/Dfo6lDIarHMaGOH
         tJ1A==
X-Gm-Message-State: ANoB5pkrtV5GgYtPC7BW3U59B/XuZm3okWBPNrRnK0/WvNuPtdr4rb6h
	r7ekLRYoTcI+j/WsNxNNLjk=
X-Google-Smtp-Source: AA0mqf7o5IRd2H8nnmtyx5JfUpkr4cMqOd/06z+Ilwq8xBCC6RfYEnOjn0eWatL/t/qAOLXQQG9O4Q==
X-Received: by 2002:a05:600c:4d0a:b0:3c6:a7a1:eebd with SMTP id u10-20020a05600c4d0a00b003c6a7a1eebdmr4357430wmp.176.1668767788532;
        Fri, 18 Nov 2022 02:36:28 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:c794:607e:a911:a21e? ([2a0e:41a:894f:0:c794:607e:a911:a21e])
        by smtp.gmail.com with ESMTPSA id f28-20020a5d58fc000000b0022e36c1113fsm3230241wrd.13.2022.11.18.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 02:36:28 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
Date: Fri, 18 Nov 2022 11:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
 <Y3YWdeTLfmDh7UyB@sirena.org.uk>
 <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
 <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
In-Reply-To: <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_023630_926778_CE0BA333 
X-CRM114-Status: GOOD (  21.97  )
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

On 17/11/2022 15:59, Mark Brown wrote:

> So this is an issue in the MIPI DBI code where the interpretation of 
> the buffer passed in depends on both the a caller parameter and the 
> capabilities of the underlying SPI controller, meaning that a driver 
> can suddenly become buggy when used with a new controller?

The MIPI DBI code is fine, in fact it is doing the correct thing in the
mipi_dbi_typec3_command() function. The problem is that the ILI9486
driver is hijacking that function installing its own hook that is wrong.

> I can't really tell what the bits per word being passed in along
> with the buffer is supposed to mean, I'd have expected it to
> correspond to the format of the buffer but it seems like perhaps the
> buffer is always formatted for 16 bits and the callers are needing to
> pass in the capabilities of the controller which is then also checked
> by the underlying code? This all seems extremely confusing, I'm not 
> surprised there's bugs.

Correct, the buffer (pixel data) is always formatted for 16 bits and the
bpw is to indicate how this data should be put on the bus (according to
the controller capability).

If the controller is only capable of 8-bit transfers, the 16-bit data
needs to be swapped to account for the big endian bus, while this is not
needed if the controller already supports 16-bit transfers.

The decision to swap the data or not is taken in the MIPI DBI code by
probing the controller capabilities, so if the controller only supports
8-bit the data is swapped, otherwise it is not.

The problem arrives when your controller does support 16-bits, so your
data is not swapped, but you still put the data on the bus with 8-bit
transfers.

> At the very least your changelog needs to express clearly what is 
> going on, the description doesn't appear to correspond to what
> you're changing.

Gotcha, I'll try to clarify that in the next revision.

Thanks,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

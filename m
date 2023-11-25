Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6AC4167B
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Nov 2023 22:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHkvmpKKeOzjloSY553o3lejXsYo+FctSN6xXVH7CpY=; b=kQPtSLGCtjioNj
	1wksUUkDQYjL2nBBAvj4AnRLoNf3oqhFuhhelKveHl0W1HW+pUfWL44ctLsWM7vc6efA16fOWkE8i
	ZdPcGJKyTtHI32OWFR8FCDN4ZrgyYtYk41sDfCrqqb7NmFVX74B90hK01xeOhUwYpucYeOFYgLAbV
	ZWc8FZ+XGYNE54axGAsOczn06u2elACh6qqfWaWTVxCmgSA4PexcNoGZgKqdpMUQCDwwXXEG5X1aX
	PqpCA434Dw1V8xn+RPjcjmM2+tr/UM/jeiJ4ThtyRaghSOcRNMi6aw7P22akE9uU3i41JIN3iry+K
	tvc3Y6IIyZakSB8oeROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r715C-009tIo-25;
	Sat, 25 Nov 2023 22:25:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7157-009tGu-0Q
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Nov 2023 22:24:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54afdbdb7d2so2173255a12.3
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Nov 2023 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700951095; x=1701555895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKAE8m+7ShlD9mU1LCDDUsam3G8dOC6GVtW7kEar8Tc=;
        b=ahet+XCbs7c3Kp7uB12pY9gcQxIswQRIYvEfMt6AwWRdiWoNf5MWo0JBAc/1eo9lMk
         GKQV04iQ2o7qUHzzPs9l1vZ4emn5w5zH0QaBL15VHb3BlrsPPDI9tVfh231aRKrzH239
         M8Ap6EfRQvKuLd68S+zFa/3Ruej/9dDKPAZ96lCz1gjeMLugJ/axOrnePgfmrInDtese
         vLk8PZwwbRcWoqRdXqKQHtUcJmxEUvqyJMvdHLzzcXENKfk8TmaosrhcZjo7QkZjcTJO
         TARI2oHJxdR9CSyZ1zzsgIETRRrCIcO7kNG+tJcjPli8Ib+7obn4Bk0jhZWhWCgHTrHY
         4yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700951095; x=1701555895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKAE8m+7ShlD9mU1LCDDUsam3G8dOC6GVtW7kEar8Tc=;
        b=f/+9iudfBUvnjtwEuk3UcoGE+BKx2+AiFemIonfgnhaRr8NEy+8YsEQqWnZ6/390ir
         C1D59TMpMuijEIqww+HjRXYPrxO5HNC1PR4xoCfCdgMcehMVKlGGsQZVGXLMZPnJtxp7
         kV1JyA3nHIZ2l8CZGNJReYS8VA9cEQqaDyFSXZtrFGCff9N2KOkxdczh1sJaoABRBlFK
         E6GqRooqcYp2pO2Vx2Tu7s7JZk6YiP1VagRRU+yKAICUxwUrpejEmSbZUaBVyg0+onzg
         IEVj5z47WWVNQebh9vdeVctVD8fJsfOvkxwA8pkhKFYateLMy5v2xOieMgpPn7pu+F0K
         fGZQ==
X-Gm-Message-State: AOJu0Yz0SviRPuHtRDJg6rRsKj2uisoKOXQg5lh9bkZ6EmkBaWmqfhjj
	GffyRzW9LdWiSrS0NhkbGfacQg==
X-Google-Smtp-Source: AGHT+IHuUyOggoOV9rwZMx7Pl9mYiZWI2U1vdaXQZtSxtbz3U2UaIsaZz3GqcbY0MyoGYPyQbjFpNw==
X-Received: by 2002:a17:906:2246:b0:a0d:35d7:b14c with SMTP id 6-20020a170906224600b00a0d35d7b14cmr705313ejr.6.1700951094765;
        Sat, 25 Nov 2023 14:24:54 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906500700b00a0950451affsm2561765ejj.67.2023.11.25.14.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 14:24:54 -0800 (PST)
Message-ID: <99190f51-59b5-4326-8c02-35529c280c2e@linaro.org>
Date: Sat, 25 Nov 2023 23:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <20231125193737.GD7486@pendragon.ideasonboard.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231125193737.GD7486@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_142457_175289_854E7F03 
X-CRM114-Status: UNSURE (   9.33  )
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

[...]
>> +
>> +3. Unit addresses shall use lowercase hex, without leading zeros (padding).
> 
> I'm curious, what's the reason for this ? I think it makes the sources
> less readable. If the rule is "just" because that's how DT sources are
> written today and it would be too complicated to change that, that's
> fine with me.
One more thing not mentioned is "no 0x prefix" (the unit address is *always*
interpreted as hex).

Lowercase hex seems to be (in my experience?) the consensus for everything
except preprocessor defines across the spectrum

No leading zeroes.. I guess it was just eye-pleasing for people that have
been doing devicetree to date, myself included.

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

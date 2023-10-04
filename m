Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6883FE7B5E1
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT0EKoYBmgIqoPEA0WZdQqHS7SWYNX3hyzgOnM7KBPQ=; b=SaXkDCXPkPfhtZ
	MUEFj/I0XVftosBJgjk+vHg0ue8HP1THwZaQv1X5gL+IRakpPy7pGz3QBDArz9P22cTFETaoJWyi8
	H+HWISafBiyPfv6pBiXG7nbsNPlUJTVTTZ7/SzWmjMH+Z5vj9qerC59hLPzvq6NQ1+R+w33Gh6rjx
	czjgTULy/oY747YHeI6F90hSFeINocIGGSeq64bC3RfERagjabNarDlNhU8XcYMOpNxY8bXvENOD2
	6xSd6jwOPeNTUrsVVtf/+DBk8nDjsd4UiYSNz4kHOXFynf8/SnnqqKdYgmDeMsu1CzAWd71gtQ56I
	cd+/5NZbPirnq4EpaW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnynS-00HBO8-0B;
	Wed, 04 Oct 2023 10:08:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnynO-00HBMq-1d
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Oct 2023 10:08:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so18273305e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Oct 2023 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696414074; x=1697018874; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=MBKM8WudF4CqsEttpndJwRTdLPCz/dkPP0MH3GBVDlA=;
        b=dE9K6O/m2mAlhgbI6gGdEGwlPwKKm/TLcIWZMC6BmsEiTyQpTI0SGm1pUIffITcTkR
         FhpU5B/L1iyZIFYU3WInnptZnhgyrHoYZAQHCYFb0UlRvShLqXdfPQqmdmhvMGRDui4X
         5h04reLsOS17V7LLq7k4LVoKo1637j7dh8fLu9QNPumOtox1Vnpl3ixvHYcZAjcNNfsQ
         YBb+P/eZZLikoEMEvvvoSwo5/tWzRToiw74yU7JZ2+N1r34AxgH/AZTLW0A5RDJjp26W
         gRsX+ayUmoQRvE7eMx0P9BMog6TeqRhEYvNmzj9+Hk2J9lkc6Er3jg7Io1TpLbSI5wK6
         8xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696414074; x=1697018874;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBKM8WudF4CqsEttpndJwRTdLPCz/dkPP0MH3GBVDlA=;
        b=Ctivb42p3Em4qI4kGbdMNyuWXpj26dUMbv0tTugWZ1R7TCuWwCHebqq2JC65GqWVT6
         R34Td3NrEDxvBN0TsK4vE4iY7KVVRR87+YNq/509UD5qM6pgj2M1QhkZy79NguVlKsTq
         pNjCwUG8rYtG+amX7VuZXb/92QEsCBxnpUw+qaCsndHyFL0gItxTLlnKa05Gf8FXrlrN
         umet7kOgRq4Rm31767rZvlk0bV6lHuZyrhW5iIiDjPwkOVUBTrHSdSWorIYTG0jb+Ms1
         Bnp/6V0OeGPFU33kvrDO+Lzc3EMptNa5vRadqN9/3W/0NTsunFb7oE4Q2cYmxpgGyFL1
         nekw==
X-Gm-Message-State: AOJu0YziogD07qfE4zMA4cyo4ow+HubY5zd48Z1j9heJDA+YXqvFw+BA
	akcyEEgGO595hoZtn46V+2JsLQ==
X-Google-Smtp-Source: AGHT+IHQs2OVv7qxHlgfeXUsFovafyJV0iId+qZZAuGf2Y7OewcW4WvIpw4kR8j5aS/my81AXiNOdA==
X-Received: by 2002:a7b:c8c8:0:b0:401:906b:7e9d with SMTP id f8-20020a7bc8c8000000b00401906b7e9dmr1729419wml.18.1696414073831;
        Wed, 04 Oct 2023 03:07:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d9fc:647c:aca8:fc21])
        by smtp.gmail.com with ESMTPSA id k1-20020a05600c0b4100b00405442edc69sm1109745wmr.14.2023.10.04.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 03:07:53 -0700 (PDT)
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
 <b81a296d-0640-4b2e-aab6-c9de37d10206@linaro.org>
 <1j5y3ozvmk.fsf@starbuckisacylon.baylibre.com>
 <CACdvmAgzBxja-oJkS9c88=P0Wmc1ptkJExz6YjaJUyyv6yxh0Q@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@lessconfused.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Wed, 04 Oct 2023 12:03:40 +0200
In-reply-to: <CACdvmAgzBxja-oJkS9c88=P0Wmc1ptkJExz6YjaJUyyv6yxh0Q@mail.gmail.com>
Message-ID: <1jh6n6ya2v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_030758_551657_832B5339 
X-CRM114-Status: UNSURE (   8.47  )
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


On Tue 03 Oct 2023 at 05:15, Da Xue <da@lessconfused.com> wrote:

>> >> +
>> >> +    leds-gpio {
>> >> +            compatible = "gpio-leds";
>> >> +
>> >> +            led-orange {
>> >> +                    color = <LED_COLOR_ID_AMBER>;
>
> Should this be LED_COLOR_ID_ORANGE?

It should (and initally was)
It was coming funny '(null)-standby' in sysfs and I did really checked
why

I can change it back, no problem

>
>> >> +                    function = LED_FUNCTION_STANDBY;
>> >> +                    gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
>> >> +            };
>> >> +    };
>> >> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

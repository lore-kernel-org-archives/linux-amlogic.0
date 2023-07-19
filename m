Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581AFC0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4mNxQQP+IpRN/robGJEUpaOlKWtRG2zF722vKp5diQ=; b=dfqQtYa5icN1Cs
	tliANftHAEb04u9sDtSDgZramoM3RFdl+h31C3Q2SjT1BTCHSM6iBIvdgmJQms++gnBchz6DjeN6q
	u6Q3Pz4EpyTzwPywA5XYepGKjUgrq+pE3XjwqzV3MzA6xOeAYEROCLDraInPeWZLTaWhlHXWtKZ8r
	gnqolOXcIxI9hqTiBY01lC5s7V8zsAcdA8Ks7KDHeJF8yzrIBbPzlvgz7rw/qUzHP3ofsy5s0adn3
	qFUq4aLNQB/T/VzbKG+ZDwY2EUJnro6dEvjnPfHtVbmyXY1G/TaaRTswN+PEhP12Co0MnoH5lbAbq
	oFckqXdu95Z3/vDllwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6Mj-007Q9S-1a;
	Wed, 19 Jul 2023 12:33:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6Mg-007Q8N-1Z
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Jul 2023 12:33:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbdfda88f4so62654255e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Jul 2023 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689769986; x=1692361986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hd70zMEtOBX6AxgP8T71HipoKl6JHE3xjQG1BhWcDhA=;
        b=g0MwMZ8VDshuY7Z1LRHG1oIiAzcVhDCZJw40X0Qc2TMhOIzdakZYlcwAKQSAawSxEr
         L1/CVzaQ10H1DtCskYBUWAlPZkuxBkc1V7oTkPYBbL2PrNd3WESNFBCJRkU8Mxvtx4rk
         Ojj8hjQ2WZv2KxpckRT2tnoEXzvINUVhQbXVrU3Q8Jsn09pMDLMWlN4mB+tvbONzMYPL
         TO0SVRbcWKhBK3SmuXA3qTd43piILMuqc6Ucsp+wOIwo0WED7auY1el+EkIRsF7Z04eO
         IRAuRZdi2JABqW+xk/gstw7/ZAjb/DYaOnK0Sp7YiUbd2oDO5MTN0qLlr6f77hN4iFSP
         AE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689769986; x=1692361986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd70zMEtOBX6AxgP8T71HipoKl6JHE3xjQG1BhWcDhA=;
        b=E7sZJOc0xOKEVJ1j+y2f37i6JgrQN9j51QiNfLn6dnjkFNJAahOYKR/6pV+gsT3YSm
         0pJRu1Ji4DB+joFLszW9ZM7l1aAbEJW4NkafKpTuW+kWYKhOIEdXCTw4r4D1h6jG6MRu
         YKi411CCJP+3lJFqMpNEGWPxraH7v7caFeMp3La9++PAYGYy8+ulb1c6Mf0B+AjJ7Mxy
         pfj5MaB7sGiDFtdXSuRBimgASd0cc9tyy7rBqFDPf9Jc5leyOZQksykvuOdS11/IZ1RK
         +09DOuw+VDHrUZT+25uYqM9+J9LI4/2oxHBm1wZL0BkfYaZNkehRpK5nxBkdPaKhmCQ5
         XiOg==
X-Gm-Message-State: ABy/qLb2MU9Pik5rf2tQ0a2kRubBQymSG7IWmYE7ysxxZP1mrTEdaHEC
	khKMW8Rz/GwPKlN8BN2EJejo2g==
X-Google-Smtp-Source: APBJJlHhVb4rToSqFUE0Ogf7ZXp/2WyQ9R4R7VSZTA6j/ouHMAGUwGEwX9N974eKktKyxaL84la29g==
X-Received: by 2002:a1c:740d:0:b0:3fc:5d2:1f47 with SMTP id p13-20020a1c740d000000b003fc05d21f47mr4080643wmc.20.1689769986596;
        Wed, 19 Jul 2023 05:33:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm1643578wmi.6.2023.07.19.05.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 05:33:06 -0700 (PDT)
Message-ID: <c6fd4df2-97ab-a830-f466-2d09f5b38dfc@linaro.org>
Date: Wed, 19 Jul 2023 14:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 zelong dong <zelong.dong@amlogic.com>, conor+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <20230719115014.2har4sool7d5edcn@CAB-WSD-L081021>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719115014.2har4sool7d5edcn@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_053310_523005_B169F53C 
X-CRM114-Status: GOOD (  13.16  )
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

On 19/07/2023 13:50, Dmitry Rokosov wrote:
> On Wed, Jul 19, 2023 at 02:09:52PM +0800, zelong dong wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Add new compatible and DT bindings for Amlogic C3 Reset Controller
>>
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> ---
>>  .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
>>  include/dt-bindings/reset/amlogic,c3-reset.h  | 119 ++++++++++++++++++
>>  2 files changed, 120 insertions(+)
> 
> As I understand it, updates to DT bindings documentation, as well as any
> DT bindings includes, should be submitted in separate patches, per the
> guidelines outlined in the following link:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters.
> 
> Krzysztof, Rob, and Conor, please correct me if I am mistaken.

And they are. What's wrong here?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

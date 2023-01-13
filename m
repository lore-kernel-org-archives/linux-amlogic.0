Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CB9C61DB3
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjNOIR81luy6giDW9KnbXHTuy2F5iM4OsqajZu4KLcU=; b=EFdFwWnl41ZNCf
	zZp9N34pL0W8DdGtfnl+KeJAGyZb35yc+qiXXfzhgWqoSWwyKaAKpl1P3PaxNzg9fu27x41zhMcIF
	hvStz2fFwTGIy41xOhqe84yJhLSz5YHuJ8ys/ZgdVHlPknBzSXKi34qZ+TIPtDENT6bps6ioAm7S4
	jh2Hbw6qk0TcBihwTbmz8RqWJ1wJ/9BPtyQXvoQal6McvyPmlIdPmLTyUpX9ayCDVdkbojqkxJeuy
	sovS01l1VR4bZTgfbHe11vm8rN4zYSxzeI73ytbzPcO+8LT4anzKVrEiyUieNtyJdkWORAvIv2Ph/
	noN2WYVej4PwOBDC3laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFuf-001M7u-SQ; Fri, 13 Jan 2023 08:59:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFuV-001M3T-6J
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 08:59:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id u9so50809861ejo.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Jan 2023 00:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YM8Shx2IZukw9YcFp8FhnA2qd5i13IeliX120PH17I=;
        b=UswNafJ8Hcq8szwzEdclRDjcNXXT+kfG7zB9GvtX0hGjvzrZfoStfz9NgA0jc+sJR3
         Rixfzk4u9VFwLwgURno/IXUlVFigpNu39LT9NDc5Xw8YuyEjr0CWwYATZyCodqdH1c81
         LpzCJ5kKDL0FzvtYfXLmrJuwXjxK5Tz2XZbNW9Lrn/B/jTpyk8/A4/avobX/texpV4H0
         unOstmnettk1gSMvYCtzZWZiRcF5otG5OlQau/8UI/hZ82dJiVTh9sTwE37KjRaysgSw
         uquU+BTFsZXsw+9vVCkEjnOKOrgswmnORNmMR+V1qEAi7/K3ojaXMj/PYkoitAjerQsE
         B4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YM8Shx2IZukw9YcFp8FhnA2qd5i13IeliX120PH17I=;
        b=AhS6ypvd/h5GxFWSYuTabFzAikmTTyI2rGrrGHsPDa1xAt4WcKNkB6JY0R1DA7mqzk
         S9TpnpZAWlA6oUopWEE7fh9bVQ3+UQahtipKUt/pMCJ7WRuM+/sIVJbgJfAfaHUc2ycR
         q9eRRtj0neGYJ39pmwRamZFI9Dw9jKNOwqldoZ4NZ9h1kl/1K+TKuhDkPDy1jiaBFlsn
         jbG+TnxnBEmlVk+55J0Tw39Gt98ArKkaSR8N9+N9kVM5VGeIbZx7fI3S3T/E1SKBQuoD
         x8BBtG85xptfSOqMH4NVZFkoEL2CiIOoGkt1pbTE61oQHQXsHUUgqvqv6KPYbc0wIg5y
         udEQ==
X-Gm-Message-State: AFqh2krVDRsKQ0ecc//MXvmqQBtHkR1WPdZ2sd9j2oufeHa3UphEzWVw
	afeV+E9IF2ZB1DPA6+/8Fp+g4A==
X-Google-Smtp-Source: AMrXdXsPxc2oqEqJfGabmBqgzaWDsQkxV3GmdjQPkiDF+d6dv+FHlRbTN+U0t+9cYBoJoZb4U0H6gg==
X-Received: by 2002:a17:906:1e8a:b0:864:223:40b with SMTP id e10-20020a1709061e8a00b008640223040bmr6721662ejj.33.1673600374808;
        Fri, 13 Jan 2023 00:59:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id en6-20020a056402528600b00499b3d09bd2sm5792349edb.91.2023.01.13.00.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:59:33 -0800 (PST)
Message-ID: <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
Date: Fri, 13 Jan 2023 09:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/9] media: dt-bindings: common CEC properties
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, Joe Tessler <jrt@google.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 Jeff Chase <jnchase@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_005939_287392_0F654441 
X-CRM114-Status: UNSURE (   7.13  )
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

On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
> Hi,
>
> Changes since v3
> ================
> 1. cec-gpio: Add missing SPDX.
> 2. nvidia,tegra114-cec: Correct path in maintainers.
>


Mauro (and maybe Hans?), any comments here. Can you apply the patchset?

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

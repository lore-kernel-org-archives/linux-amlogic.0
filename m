Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED093C76195
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PRrsblwLTPgeijXCIjYcHq0SOGNiM40obrjLE82ZUI=; b=XEgxUWrMP1E7Lt
	IpWeoDRaJwz5UByQqoLFr913+nsl9FTfcYNRii4zzoLnf2MZ7yUG7UloN5+HTn0/qsDS4mHTGEiu3
	0ZkQ0C9ZD8R8xJX3wY8dASym8Z5AxTBuf2KKU/+UcM+zbO+UzJPE/1K2tuH0JSQ7N5jFnjgiMCFlt
	3rrDjoqyopTJzW4J0TJHlhx/Px1xWKw34OwiXmrlqaRoXEZtkzeP9B3Biw4MNK4xsKjBQ+aND9F6g
	mC7y4pDSx+m4nauAgkuC3t3VGNPrY3WwYM0ufdkUI6i2gur/XW6CUw8EPAXv0fDzVfzqKDZkp+QBk
	wA4NxwOP0qqZYayvkbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7su-00EEai-04;
	Tue, 28 Mar 2023 11:53:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7sq-00EEYp-30
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 11:53:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id t10so48380869edd.12
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Mar 2023 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680004377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tecTi4iB36so+NwD+znfDWnEir5uByUR6yq3Wl4ynCU=;
        b=i2X70BLI85AMiXA+bGNXIXGuB/CvgJIRw5tX1ee0WVJHYwKS+K/h1g/o/2rO9x3MD1
         D8yIw9MzzojLSz9p72w/IuZpiHO+gv/8KHcsjJDjVsk5T73HmDk9ryDiK0s/TEwp6rz4
         26cySS+tttcogWnxDsewcrvdmPKjzvCwdxGP9+tqlE6btlJErut6Sk+3pZey451J1ImZ
         yKDLCdHM0EECEluPpvbkJ4lQoYJsTKfo1nQ/c0gPe/Yy/EPk3SEskrVY1/Ey7EFcNeu6
         6anIHyjv1VA/mpgROafwgnRyIljAwsrPLvBIhh6f7OWWz18jsTnu07a0GvmFDyf3ysXM
         zwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680004377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tecTi4iB36so+NwD+znfDWnEir5uByUR6yq3Wl4ynCU=;
        b=KyhQtC8dO/YoaM3dtFe5mFKlWEXz6BCcyVueggkwHqFuajoWBg8UBVrkNCMZysXAQF
         chaKDkInY0izx6+MuRr11fi0KA3Ucv9VIkoIxc0ZwRxYUWSf5J2K0b8N9lFLnOhLG3Iz
         44CWz0LeWKLsISvGQfv+JBt9QojqeWSh3zyS2b+Zhd9Vu1NxjlXvJaO3SrnrrHssrtmD
         uL8MMCvrWbvTf07mMhWoDybSGPS0CJCn7ikCKka9a0UDP4Mx0L6+DlYHy0hiT+1tVz/c
         SK2YXGGuo5eXMwyr1frAQJzFfFEG89+z8ib3uh1AbwYUFLhH29/p9I7cZV9pj3pRely8
         Gc4g==
X-Gm-Message-State: AO0yUKWOYqh8JsHY7bAYjrSf6bV+iyPtAZOJWFmWGUY7QKwqTfEX/Tdb
	sz6YUsoZxz0Bzmoih2wrusvT6A==
X-Google-Smtp-Source: AK7set9vn8o61Ws1RoyyPqOxKld/IbsKS8craVotdUiSS7KOmXNEY21v+QtU4GXt7AxzOPqjvooNzA==
X-Received: by 2002:a17:906:3710:b0:923:812c:a5d3 with SMTP id d16-20020a170906371000b00923812ca5d3mr20751730ejc.25.1680004377051;
        Tue, 28 Mar 2023 04:52:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id cd11-20020a170906b34b00b0093009bc5825sm15231709ejb.2.2023.03.28.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:52:56 -0700 (PDT)
Message-ID: <25422211-a26a-889a-afcd-12b561669c14@linaro.org>
Date: Tue, 28 Mar 2023 13:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: add Amlogic Meson A1 SPI
 controller
Content-Language: en-US
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230327211351.686831-1-mmkurbanov@sberdevices.ru>
 <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_045300_980406_F73AC23E 
X-CRM114-Status: GOOD (  11.45  )
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

On 27/03/2023 23:13, Martin Kurbanov wrote:
> Add YAML devicetree Amlogic Meson A113L (A1 family) SPIFC Driver.

Don't add drivers to DT bindings.

> 
> This patch has dependencies on the A1 clock series which is still under
> review - https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/

This is not part of commit msg.

> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>  .../bindings/spi/amlogic,meson-a1-spifc.yaml  | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> 


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

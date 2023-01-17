Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A07C63797
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=innLTgGRHFu8IT5qikCk3neK+WwLbvMM98GuUKWo57o=; b=0zUEX7rt5i3cwK
	Xt2UaHPPBkrFxvdv1/oh/cn4a0SDN6BPLvI6goRVaIYYS8ljdYtC6P3/kFsQnfKa4zSxoKfhTPOa0
	ReHHOeS6lEK1gASWpHavng4kkJKgcMrDGs8dsjERHxPurd9rc2QHfubtjWVvUCDXm360TMofqC3T1
	bU07D1Zh5HMYLN6GIPlP4i/819XXJgbA1G8fN3B3Op9S7hYCw+aQ0OduJp172xi0YviP6U07E/dyZ
	mB05FbkHLcE//0irW3aEyOXmpczhA09ddh8M07n63OEZqIyi/KImeihaFWCJl3whxJ5tZLlNF/GCv
	t4Olr4nMOtMRCPFogUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHi72-00DXo4-Gx; Tue, 17 Jan 2023 09:18:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHi6y-00DXnJ-4Y
	for linux-amlogic@lists.infradead.org; Tue, 17 Jan 2023 09:18:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1856065wmq.5
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 01:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=tnJ5DdYrw54qQSx3lEI+x+lBLUOeQnMl1o76vv7Dgu4=;
        b=elVY3nR3vVxjUxSkeUPM277bE5WR5Yv1YPiiHAzuFxbrxRH4z7x+TVUV/kw01Q22TI
         5VOFKNEh9TJjkFGh5AZztVRZDDjgYelylcw8u6htm5ws62jgXKIMDsXWIGtGeblBEwD/
         q4Aq5nuZBKajSlU8Ww+nkrwR/ITwB6fxC6RwxjHWTwrPn+jMiM74jM8YE6xAh9TJ9qt6
         k0/1KI5RFcalaQH4gk61OVKV8XCMay2sqRchMpeZ4U/XGPwMXIet7EcE2cJAW6wIQSP+
         aO9c4z/BXvYaL49+HL5nEmlQNb/UPolssJCfPmQhRN+QsyZKMTtFLleIjZd+8jutWWS/
         S4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnJ5DdYrw54qQSx3lEI+x+lBLUOeQnMl1o76vv7Dgu4=;
        b=blTGcLVQJqpieYxEK8YUuJq0Y+T1FihqczyP3v2xDcO8ADC3HSlhXdREzfvKzFWcMO
         fMcnP6/rhDu2hvSZNohzdooAnp4swP4yFW86NLK5EYcw0PyFeZ46lHs1IFWROUIr+Kzv
         +s2sfWeZmPVZSfaa13XxMH8iKdCpTpXRVd6ZRRF+D8HJDxEcRPAM4OjraJ+GYIcuLQF8
         VNX8cwOCHRnVXKn0T5IXfTiIGmuWFEiDyYT2AtiCwQZQ2LJHBm38+0mgZ4F2QsxT4zFP
         AwX80qgoKzTXDqdyGKd1mhFWK3tQrrWZLaWF44ZThCYrxP+Z8hsIr14C8J/0CynYks3O
         zNRQ==
X-Gm-Message-State: AFqh2kp3SmVJMwPj1owfYSFWo8a0EHy4FXwK+Rq8Fi1KjugR0yypviHP
	PNiFFBaA7KkMj6GH5cjS631TaA==
X-Google-Smtp-Source: AMrXdXvDAOYefx+I2HK3Eib4cvfR8BUz4uU/fSfbsNpNlRCgv8K3V0M707BZH2a1DbPUP+dJK0l1WQ==
X-Received: by 2002:a05:600c:982:b0:3da:f5b5:13ec with SMTP id w2-20020a05600c098200b003daf5b513ecmr2230308wmp.34.1673947109790;
        Tue, 17 Jan 2023 01:18:29 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m23-20020a05600c3b1700b003db0cab0844sm276263wms.40.2023.01.17.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 01:18:29 -0800 (PST)
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-2-jbrunet@baylibre.com>
 <4be60ea2-cb67-7695-1144-bf39453e9e1f@kernel.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@lessconfused.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: add amlogic gxl mdio
 multiplexer
Date: Tue, 17 Jan 2023 10:05:56 +0100
In-reply-to: <4be60ea2-cb67-7695-1144-bf39453e9e1f@kernel.org>
Message-ID: <1jzgah1puj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_011832_200427_31609B69 
X-CRM114-Status: GOOD (  10.94  )
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


On Tue 17 Jan 2023 at 09:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 16/01/2023 10:16, Jerome Brunet wrote:
>> Add documentation for the MDIO bus multiplexer found on the Amlogic GXL
>> SoC family
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
>

Hi Krzysztof,

I do use get_maintainers.pl but I also filter based on past experience
to avoid spamming to much. It seems I stayed on the pre-2015
requirement to send only to devicetree list (I was actually making an
exception specifically for DT) ... and there was no complain so far ;)

I've read documentation again and it is explicit. This will be fixed for
v2.

Thanks for pointing this out.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

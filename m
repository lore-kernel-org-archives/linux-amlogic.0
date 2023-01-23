Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01B0C54E94
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPGMEnTNCB1fYW4vMmKpaZH0B0lHeyqeubTlAcBVB4Q=; b=MySlgI8mDX+6ny
	vpns5JsiZV4VER8g7dqodqpsCg+Hgv1g1USheNaAdnIeexpavZT9OWVjV6IhEgHT9yMIByF0oEKjU
	MZzurqrXcoYRQgBaWZEtj2uv0kSx6vrUi7ky+vhyk3iW9BDuEVpULyITs84kCtOs42wCg61QSXiVr
	NsLX8wXftYVcWzYNglmugdKTnRH8j7PwL0acMk6MgK++NmrKbHtOqCd2Z7i1x3CbJ3w2QTTWWMSP5
	tl7iRo4N/YKRrWVipDxB7UZT5sR8zxdqTP2UkPdhm/jR54dGZLNrC9LwioK4oBl9785rIx3QJpfGw
	/1KMzx/XOC/SQhfG5dTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzFJ-000NxF-SR; Mon, 23 Jan 2023 16:00:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJywR-000GZN-BC
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 15:41:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r2so11192586wrv.7
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXCK8+4pwBoN/PPZdEC5uZ0441SKSjWCGzz9sOXF4WA=;
        b=Gq7N/5f/dm907S2s95WddCgz2SPDJqx3jdQjw63tObNUotX8A1a2nwEQTIW8zLc0Bc
         32Ow2LueltQlPmFD27f3FiTg8+gy4lXPOTAEvCKMwLykk+YnCH9QOPqg6FhyXWijJtyZ
         59H0hdbLitzR0OuveGHOcXUhmgTDyZyFM/3dDMhwD/n/qKdf2a5hnTxCVGlDG9vTT5gs
         /b0iXquNdt1ZvKxoABL9FXeZCEIVBbk6AyNHp3Dg4Koa4FZ0febLMj6lvtWb1+cVQmtL
         9BjCADRSb0hhSHj1ZZzacokBiYCtFXPOe0KP/odN2uNCoOC5+H9t75lUAcHxQKzcSQgi
         4RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXCK8+4pwBoN/PPZdEC5uZ0441SKSjWCGzz9sOXF4WA=;
        b=bjAZVa45Zt1ZMBiBignTarwrShU6qnJEUXqnB0zZWj72yMdk9ufN+yK0rAkz4muAV9
         wBzMbWbHScMhY8Ds8pfZZopefKsP29fOq/N/mUxybddgouRt6iKyMwe1k1ESRoKqFjFH
         k4Zh9XPwmbpJ6OmvwsxzRe6MV67oJRjtoHgz+u0vrN8XVWRnd8RqFkAU9JY0nTiT6Q/H
         3qNPnMP3lH+OSh3I6OLGFTOY9SAse/RFYzGzXPENT+vj/8rxJueWFJvXNk5oKvIdAckk
         ZUmeKIqMbIEgPHjnMs8pvjSgF9mb5goDbvsxFDGIcScnOwX5tNpUlBKOD6JaBMEXGIOZ
         iAbA==
X-Gm-Message-State: AFqh2kpeqj2bgcDtriCHNM9HIJ70dsY4TUstaJHmJ2mq+h0wZceAKdWE
	K+7CDG/0iyuONthrV+W2h2t7fA==
X-Google-Smtp-Source: AMrXdXuBoUwMvAd/YfOcifByrJaMm2ho3lHEp8fql+PNjdwlzRsoBXxTm0E+49t+J2WwjGL6pXs8KQ==
X-Received: by 2002:a5d:63c4:0:b0:2a5:3a52:a034 with SMTP id c4-20020a5d63c4000000b002a53a52a034mr19494443wrw.35.1674488461847;
        Mon, 23 Jan 2023 07:41:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020adf8b09000000b00241d21d4652sm4602308wra.21.2023.01.23.07.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:41:01 -0800 (PST)
Message-ID: <9000e022-69be-3324-1e6c-a255d56a1dd8@linaro.org>
Date: Mon, 23 Jan 2023 16:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 05/13] dt-bindings: serial: cdsn,uart: add power-domains
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek
 <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray
 <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
 <20230123151302.368277-5-krzysztof.kozlowski@linaro.org>
 <26046a72-27e6-213f-6b69-5cb82367dcf9@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <26046a72-27e6-213f-6b69-5cb82367dcf9@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_074103_477868_DD3669FB 
X-CRM114-Status: UNSURE (   9.43  )
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

On 23/01/2023 16:39, Michal Simek wrote:
>>
>>   examples:
>> --
>> 2.34.1
>>
> 
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> 
> btw: I was running it and I have seen that properties are checked only on nodes 
> which have status property okay. On disabled nodes properties are not checked. 
> Is this standard behavior/setting?

Yes, because disabled nodes might be missing several properties (e.g.
clocks or supplies).

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

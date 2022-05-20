Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7057C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 May 2022 06:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5Y9nJSAtyYSeXsgL8IxcTrxobVFKwNZShIbCxc/Ea4=; b=yD1IvW4JTHR4MG
	JWw+IG1eohjO2/G8H9EvrkKhrebWS4JxzUgPYfq8GXbObBN1HVUJ6TfxBjKIqXviQNH4qLBHLB59F
	LHsGZWalcp7k0XreSw9gZGpKnjbhop0djxeAY/7Yqv3tmmSV7r08lfqI56Ffew0ddmWd1Ib2IJbnj
	YG29qbFfv0i7eNfRfvv806bKXdzD3Uzz+ARlgEkgxVROpcOCzFNFr1DJoFeHJVmUqiIhuEWoVbii3
	PcbRvcYuXXsWoltuGsOwX7AB2pslpos/2M2BD+4Oj0ClDGjuwkUrAWst4IYQ3RMGmN4mGlu/OzzKL
	rtHOLe4bZNHk3LJHQokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrwO3-00AqIi-KM; Fri, 20 May 2022 06:45:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrwNz-00AqEq-BG
 for linux-amlogic@lists.infradead.org; Fri, 20 May 2022 06:45:20 +0000
Received: by mail-lj1-x22d.google.com with SMTP id o22so8606969ljp.8
 for <linux-amlogic@lists.infradead.org>; Thu, 19 May 2022 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
 b=O6glMIfzZPcKFuiAIfpgKl4vPS6f/5kKRDEsCZ51jhpn2nvRMnbXG5g+EDHeE904nP
 t7HS+b/93itLD8AaEQHAOU/xrWjqGgTNAbPH9jakVpgMQTIhKd99kpg+p8rnNvdIqwdN
 6qoJ6hv6rNLvwFxEXHoFISEMQCRvxYIVNP2Tdx5gjSpfV8JASem8ZyxogIrKo+3noZeo
 On3nePrDC2RBv0fxVZnC2PEjR3MvP9xqKuaD0jO5YVuhsa36Q52R9it54/UTpAk0vFOu
 oN03MNBdr3Uh7nMtz9gRp/Uo5idHLu4wjadR99H/ArdkjYBw/HcmyNp38tQ7XXACXvAn
 7LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
 b=7ZR7dzsca/vGwCvwKNi/HB3C/qz1YV7NMEvrjUKqg699/5gxMZ9kl1VbGap17MQQgI
 UHC3M9OMzO2SGVBCn/9SaJdAGx86utNpPd/OLiEzQa+6BGNRDyjSvlfIQmd1HVShcLZt
 sIvzbAqxGcALu+wQEY4QW/8xJABe61Sl8vRQIQawbDkk0wEcbUIxzfqARTw76Tq8HafE
 kfU/6XwwAzUvTX+JIS2YZSpJysPWsrSk46TYYU4o7Z/M7CleIHDhFbKZmCRdXc/3GIgO
 1ZmPVcFX9e9DLri9RxOxeTOjUldu3H08piolxTCgbjXzhf09QanT3Ek97dtTbNE1GM3n
 +z8g==
X-Gm-Message-State: AOAM532NK9qcH6q5YjUMpUvOfPZZnuGAcVAB8YU/qUj5khm1z6iu3iWn
 7SnNYpBPehXJd/OKulE+M8tRZg==
X-Google-Smtp-Source: ABdhPJxU0QeXD6emlDZWLebUbtElcVEEa6zD5/lvXQQQBtACmvvZZjPEOav+NOjy2nN8XnxEigbRJQ==
X-Received: by 2002:a05:651c:158b:b0:250:a056:7e48 with SMTP id
 h11-20020a05651c158b00b00250a0567e48mr4800506ljq.64.1653029116920; 
 Thu, 19 May 2022 23:45:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 y22-20020a2e95d6000000b0024f3d1dae8esm197255ljh.22.2022.05.19.23.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:45:16 -0700 (PDT)
Message-ID: <cab52964-31d5-a545-9856-b298d3cd3c84@linaro.org>
Date: Fri, 20 May 2022 08:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 46/56] ASoC: samsung: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 nicolas.ferre@microchip.com, nsaenz@kernel.org, shawnguo@kernel.org,
 linux-imx@nxp.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 daniel@zonque.org, srinivas.kandagatla@linaro.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, peter.ujfalusi@gmail.com,
 jarkko.nikula@bitmer.com, heiko@sntech.de, jbrunet@baylibre.com,
 kernel@pengutronix.de, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_234519_448788_73A27CD5 
X-CRM114-Status: UNSURE (   6.98  )
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

On 19/05/2022 17:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F0C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRL4Os/XbZTTF35Kfci1pl6Wl+Y2UApYVtxfkqjpr8g=; b=0jo54lXQBvORS2
	T5PUxgEAwzxPnkb/o1MFKzlgg+kYLDJIho2nMLgU/7FpVHJBxFPZSn+HMtnIdjaOdi4852NTTvwUe
	iHVS0ozLfbxmaeyPHj7M2Z1bFTu/1b1Txp3yr9XEnrZDv+Nhm+6hcq3sJVvfbNVk8w/6b0eXGfjN3
	ZR1AnXmMoOeAZ5x5xJrYHOpw3kWggOR4OiFnQhOL6r1GM7t69UCsreKOqpKNn7ykPF7JAQf9hmuEO
	cvi9MkHeVLgIi/LPS7MDXYoBWg306Kd7dwEK9C9KsX7lqsadpL94RNE9dpARlACfdep2se8q9qH3F
	OKoYCIt51XOePlkc6/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols0h-007vPa-KW; Fri, 21 Oct 2022 13:24:27 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols0c-007vLj-AR; Fri, 21 Oct 2022 13:24:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id h8so3628302lja.11;
        Fri, 21 Oct 2022 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XVCt8zk03c9asrvK7r0rw8Bvfy8tRtb9InAD3Pc+wE=;
        b=I1uw4Swogq+wFwM4eZF4U7T0psUAUtaSiBLONbK7SmiRmwri2Fli7EFsCSAelhpI/E
         pKi+pRrn4XFdYMyRvAi+m+J81nErFKriRGZxtqEQVBFXDoEspocnP1KnqSQwzt3jYUm4
         xO+mMbAeugwp0EZBTbl26sFFg82143NQxMzILi2pRWuu8m7kkMQbYhQN8eLLcvxRWERw
         LGnlWFD6YQcQt6Pt5+DztsobpIts7k6ac5FIFQi3nwed8pbLI1Q2McNcAokKzK0DeDXB
         Al/YixJncrcx5IpuYgoqbgggSY5btOl8oeRJyLQJnKpaLmMxvfZ9ct7mTS8/84XXpsj3
         Qbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XVCt8zk03c9asrvK7r0rw8Bvfy8tRtb9InAD3Pc+wE=;
        b=dYVq5wgs2D+lAcy7srpjOtTlv/3C0+VuFKIOzPHozBsx1NahAkLTS5Mn0u7SmwfjEi
         J1m8JddprW9VBGhosoZcQNkPl1cZSqFDHhmHPEYL590sJ5BwQHAvk/rbZtiRiAvOPBq7
         tWZGjq1Kh9sm3sSImGXDpVlul8/UIBvQl57CH7Wuqi9cy9ng4ar7GSyIpJrbafNQW8Pq
         cu4f4DOpCwC4ctsT1doD2DimMH/LsN030HwjrySd3zQlWr6/Q4sno9ckFW/egqVUD6ss
         w9aCs1BXAwXRbzTk/q16pfYQVnhc8ieL2dSaGdnGT2rZFAMkuOPaA0NDTtiFXyUKYrTb
         XANw==
X-Gm-Message-State: ACrzQf0Wrj4p5nlaXig3jQNrvM29aezqO5okjfE0eYXst2BuhfYGWkHF
	9sGRxSkFUrBzbB/79ARDJ9M=
X-Google-Smtp-Source: AMsMyM5sFCxauhaoyvskm4EO/dQHCsltNX5NPBoPJjuzzzwYzLjYNbmiDc0KlKoPXWDpf5yJVFWRgA==
X-Received: by 2002:a2e:bd0e:0:b0:267:fad4:7f72 with SMTP id n14-20020a2ebd0e000000b00267fad47f72mr7117490ljq.130.1666358659630;
        Fri, 21 Oct 2022 06:24:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::2? (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id q8-20020a056512210800b0049d3614463dsm3158404lfr.77.2022.10.21.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:24:18 -0700 (PDT)
Message-ID: <d1ed9ab7-6d67-fd93-6a77-86ea029eedc5@gmail.com>
Date: Fri, 21 Oct 2022 16:24:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 2/4] gpu: drm: sii902x: Use
 devm_regulator_bulk_get_enable()
Content-Language: en-US
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_062422_422341_1DA9C6A2 
X-CRM114-Status: GOOD (  10.04  )
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

On 10/21/22 16:18, Matti Vaittinen wrote:
> Simplify using devm_regulator_bulk_get_enable()
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Robert, I did slightly modify the return from probe when using the 
dev_err_probe(). I still decided to keep your RBT - please let me know 
if you disagree.

Eg, this:
> -	if (ret < 0) {
> -		dev_err_probe(dev, ret, "Failed to enable supplies");
> -		return ret;
> -	}

was converted to:
 >   	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies");

Yours
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

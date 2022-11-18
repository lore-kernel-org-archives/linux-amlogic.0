Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17079C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 19:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFojel88Av3Q3mIhduPpTfpGRLxixnhPu2yvpybqzpE=; b=BUOreBMfp4gwKVlIMO1lj0SZ1z
	sqAdXVMgC6WL9qXPr70yoUN5IXCugm0RyJMt8WIIfk8LXIvxgYHrxfCwfzsWjUQUwsYDUstll5KmJ
	6XnFJc8U55njM1EEecYJxws4tlMVeUSDd/eFy6OuVWOpjRb6n2D9rf0cUFqrI4dYUznS2cb1NMzQE
	Mm0S7BBs1hfAtM3PmP0i7Q2Noxb0uvNGXmSMopV9B8hdBJhqx+ZkoTUhVC4Tor2jwnB2hiKjmCu8I
	GDGG0NGq8iHXYrWGjNTf51oPrMiYyGcL4gh3eOKYGrUO4zU2v1B2qYGCkcid+33NoGSuAtv4b/zzF
	pXdyMzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6uj-007XTV-V8; Fri, 18 Nov 2022 19:20:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6dP-007P7i-Hw; Fri, 18 Nov 2022 19:02:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id k8so10758571wrh.1;
        Fri, 18 Nov 2022 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=E5Ey+SWUGHe54inhYQO4Q9IAek2nNg4LJ02tyTCqBBc=;
        b=muB+SifbTgI90sosGYp1Rdn9323oxvY/zKHPXxKDBsUaWLb+RDwNiQr346MUdyu7lC
         Gucft/tc7JBy/sxc44JyFyG2pL7UhNO5tik1/CaLmaBOOQFGFjDrt0rB71jm5h/WW4VN
         QNg3RKWX0yEJPqu7dLKG9Oz+By3cLCmQAhF8eLI7rFfy2yycAgWBMaPK9DwHZxe3OMnd
         Ij6RcFnNjlBq625Wwun3KE3WP0OiqrZKmC86roZKUid0EjoAuLba4qAFT4oNMBoenwt7
         RAsO4KMWBw0qoEuZZ66LqXSWOJp+pEvUrWX9/krmnj7hktPOkvvrhpqfLLg8YTYrYNQX
         vy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5Ey+SWUGHe54inhYQO4Q9IAek2nNg4LJ02tyTCqBBc=;
        b=pNPGCYAvRTnirei7mqzODH9MkhO0GZfjyRuwdoezjq56ATXG14khOyIB2bhUuaC/XF
         e4FCP+K3Z5FIz7BtPPTDuLFqbf56piMbspHznnK3ETAjt2z2+fBskkX2pR6Sbbr6S6uC
         nRaqDAx8tVjU9hU1LC26OUgF4tsSmcps7rw1TuTRR9/qY0qImDfXesxPTSpOv3K9MBAI
         xBJXoaHkLTdir0a70X64QfezKw8bRZXwyR9F5oW72hcNckt9RPODYpMTUuuprz9Yt67L
         qkVIOIpva0JbOKXN6uPD9KLs1QoONaw9MEdIwy5wiQzOVvwKxCt9D8sjzXB6AqXEkxXm
         /hWw==
X-Gm-Message-State: ANoB5pmII0kwGoM2Mpl8z4WtuR2MF5Otj6RO1nNqaqBk6PlX2eoRUxC3
	J5ASC7EUi7t5yBq5IAveqss=
X-Google-Smtp-Source: AA0mqf6w/1xAUqgYy2FX3lJHlg67dGBf2UYoc+mhcExG80QMtV/cbLJw50V7xfWynisTt8PVUp27yg==
X-Received: by 2002:a05:6000:114f:b0:241:c80c:5f54 with SMTP id d15-20020a056000114f00b00241c80c5f54mr476592wrx.15.1668798154591;
        Fri, 18 Nov 2022 11:02:34 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:6f8e:6bf6:725c:d7d5? ([2a0e:41a:894f:0:6f8e:6bf6:725c:d7d5])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c19d000b003cf37c5ddc0sm5775361wmq.22.2022.11.18.11.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 11:02:33 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <8a3bdd84-2789-1b42-976f-2843320750b6@baylibre.com>
Date: Fri, 18 Nov 2022 20:02:32 +0100
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
 <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
 <Y3eoYTZRyRJnze1z@sirena.org.uk>
In-Reply-To: <Y3eoYTZRyRJnze1z@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_110243_749379_A4E3448D 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/11/2022 16:44, Mark Brown wrote:

>> The problem arrives when your controller does support 16-bits, so 
>> your data is not swapped, but you still put the data on the bus 
>> with 8-bit transfers.
> 
> Why would you need to use 8 bit transfers if the controller supports
>  16 bits?

No idea why this driver is forcing 8-bit transfers when the controller
supports 16-bits (this is what this patch is fixing).

My theory is that this driver was written with the Raspberry Pi HATs in
mind and (AFAICT) the RPi has an 8-bit only SPI controller so the driver
author didn't bother with anything different.

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

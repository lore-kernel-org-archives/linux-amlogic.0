Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1D9C25B0D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFLl+Rl0i3kjL9SSJY35wpdJ0LIjKmoa5gZYUxrVOsg=; b=tW7a4iecr2r9kI
	WMEgMkDaQPw0kE43tGS5bJhfef05FPHRRJuBUXKgrS/orNrPcoYZL3Q6XSglNZerrkVj5tl8xBNwQ
	9HG7fgN5eeKCeNGvJ4A8p66clc48aVCMHIQ0KzMSwK13vP4g/zn/tnbXnkUp1xphLFjpvr5F7o+tt
	79ey6qw1AQuvl996riMzZ/2hImgyprXTiGx32y06pQ9W1qvV3MoIB0QED3KLDLLKSBS4T6d+oOTIN
	/D0AoM1Eqc44/J+zocwv+a0ajN+JZfAsWbg2WIf26v5jlPLv2vnwLYSAOaFk97/1K4jrU9pgeWrCB
	/EqlxWdX/zKUHupEDokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLnzm-00CfaD-9o; Wed, 10 Aug 2022 15:51:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLnzh-00CfVF-7o
	for linux-amlogic@lists.infradead.org; Wed, 10 Aug 2022 15:51:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id n4so16464730wrp.10
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Aug 2022 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=de1bfIeCzht/PqANgMdEHr89VgLf+QFh5U3BT1EWLbA=;
        b=BTpT3e1IHvP3qZibGNSre2fvR3R4RZDlEChu2oxdCo8+w163kWUdzxwWt+S6XxwKl0
         fh5l/JAO4Zr3ojSmGQwE/RGhvehU4kerq0S8VN3szDU4JpTxhc5AxIy4OnUthI0WTb3C
         sOzSS5BDklAOGjIeHLdmqQokLG2gd4b7PB8Yv4Zs6yFPnJg0LzierVnzZZoTUNZXtr3F
         sdyswUaVZV9wUZjN/zjcuOeJ8fPO6TxXf5FvNib1kn2sUDKMBn3JEMBMY3GHs50arRXX
         rqImfwqZV+MaGStHCPAeBXcfVVqhK/3RzLlRWKN2iHDtUkugHz2Em2I62nhTArbGDo6d
         z0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=de1bfIeCzht/PqANgMdEHr89VgLf+QFh5U3BT1EWLbA=;
        b=64Ynn9vsBvbBm6zgUj5p1OB/19ePHZplz+6FHU7QIwPeF8DKPJ/+o7m5PUkjsYgLjq
         uWFSyvaNwmCjVdnN63pfsRwFBjUekoJA4GLN1xzNtSUJHQ9cbd4VstPi4H2R0pEH4ZHU
         tm9S4XIXF9m/Lc6260JaoMhGndw58kujkXTnBVnVKY+YXIDKJCeVudh3l+Xik6ELQK6D
         3ZyT6PzzOGGSdevpSmdBMHFxgHz8APrARZ+XkeDLIaRFw2pMQJ7DzuyawaB8j8LQVQ4V
         ptdINdjr0CYpAC0X3UCPxpeW+jZbWBVuVwPfmnimNkUwVxD37mjCaIAnHl0WPseP237V
         QaaQ==
X-Gm-Message-State: ACgBeo0xKGAJ4n4tMFz0r0adKpea26FFE4hHo4N3MKzWb+aAgK6iuY7C
	BFUdKt4C21//r20Bfix01OJhqQ==
X-Google-Smtp-Source: AA6agR7Q5Mp3w9f9/hxYT2JWYltgiLUYBmJ093avPRRW1qIQyFWlA5lbd3ieExjR2ZNFGI9kCBxmeQ==
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id m8-20020a5d6248000000b00222cd3b94c8mr9557443wrv.97.1660146695304;
        Wed, 10 Aug 2022 08:51:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006? ([2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003a325bd8517sm4164965wmq.5.2022.08.10.08.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 08:51:34 -0700 (PDT)
Message-ID: <c7bfda2e-8135-fd2e-5d2b-5f547215bb18@baylibre.com>
Date: Wed, 10 Aug 2022 17:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Da Xue <da@libre.computer>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
 <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
 <YvOmnDJA+ov49chC@sirena.org.uk>
 <518f22f4-1582-924c-9eaa-28ebbe53a632@baylibre.com>
 <YvPBX7zJ72RXnrpk@sirena.org.uk>
 <9dabe979-f6b5-329d-f017-a8f0c00adeca@baylibre.com>
 <YvPFZZ2HT2zK9XjQ@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YvPFZZ2HT2zK9XjQ@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_085141_506905_D556616E 
X-CRM114-Status: GOOD (  22.01  )
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

On 10/08/2022 16:49, Mark Brown wrote:
> On Wed, Aug 10, 2022 at 04:40:04PM +0200, Neil Armstrong wrote:
> 
>> I don't think it's worth adding so much code for this since we already
> 
> I don't recall the code for clock providers being that hard?  They're
> generally pretty small, some of the ASoC CODEC drivers did something
> similar.

Seems over-engineering to me, but I can explore this path if it's the best
route to follow.

> 
>> had an open-coded function which perfectly worked before.
> 
> Except in the cases it didn't...

It did but wasn't generic enough to take the new clock path introduced
in the new SoCs.

> 
>> I'm perfectly OK to remove the CCF driver for the legacy clock path
>> and return back to the old open coded calculation since it perfectly
>> worked and stop using the legacy clock path for new SoCs since it would
>> never be selected anyway...
> 
> It does seem better to go the clock provider route TBH.

I'm afraid this won't fix the problem since CCF won't set the clock again
if the rate is already ok in it's cache, we'd still need to save the divider
value and restore it after the reset as I did on this exact patch.

> 
>> ... but GX SoCs are broken so it would need an intermediate fix until
>> I push the refactoring to cleanup all this.
> 
> I'm trying to figure out if this is actually fixing the problem or just
> papering over one case where things happened to go badly.

It does, when clk_set_rate() is called, the datarate field would be the
same as after the previous call.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

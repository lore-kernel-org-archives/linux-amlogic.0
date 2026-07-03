Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A58C43602
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRdEFlQmjNRLiuX2WXarBVCRBh/EWl8Ikx1N2hiRq+I=; b=acW4Cqd47WtkiT
	BdP0sWroee5zFg04XvOqj1Ry9Uurfh1hIgd1eEhHKrc8G+pO0+sK5PT40e+Naq96BfsjiXOLOfaqu
	2M5HdGkrlvFD0B0JK249uAA280fOsVRnpaSiRrwoAjIpItsDXPx/M8yRLP9JQLd9xLGRcr+qXmlYs
	0Ca5U1ojsflM6/nEy9bcRDZScGOYkGkZ+Dg0bQqarVbVauYLIF0fkDKMKxFMAI8Lx+JnoaEj7LZvZ
	8MHilNn+3Q93HeVK85+RcDUQH/7MCNPfI6WESL2No0xvfm65mMf3+Hbbzqn2EE5ARzqa/hHGkdHTO
	Z/E8ZGh7kKUm+pUko9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYPe-00000006H7y-3Foy;
	Fri, 03 Jul 2026 07:34:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYPb-00000006H7P-1Tbl
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jul 2026 07:34:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47122683cf3so172980f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783064049; x=1783668849; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAsfvSrBGIqzpFkuFJjjn9IXNafmZWfPTPwqXB9KX7k=;
        b=UG85U8jRzzHGHebKU7XOLog4Ml+/kY7ccDfYsoPDIKDHSYQ8VhskTqCUvnD42ZgX4E
         egn5gIqZzX4reA5io8TNVG+Eud+jb8sNrNMErhA7mDczXGDPMImKBi+wsd3ewwDBobcf
         /ApJYuEZZM1WMEa2Vla5Mv+5xoPd1E+hwRhQQ3t0qJQ5PBhTxXHEedwb1XhUwhGYCPyQ
         3QS9FVyjiAI0tX9cJJlszAvzsEzLaEFmastHeFHJeKNCcLjQ8BnXaez63u+jq65ZZJ4Q
         4ri6US2Q3W6pFNHQW99uCwGTT3otJ30TC5aDLrFGtlB2xDW37foyVLUWNMk4wrWlS9Tf
         K5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064049; x=1783668849;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YAsfvSrBGIqzpFkuFJjjn9IXNafmZWfPTPwqXB9KX7k=;
        b=gPRPVpRr4/oEneJt362zgj5GPvL6YPK/qbaqAWE/NoLAyBYnDK1Fb4/FbgGSBlrLjR
         G5LN93ROfKKDGdidtdEue4YNiLe88Nqz4rFJB6Rvl91XW3bBOXWHdfz2fphrshade0Jo
         Uf+uSNIKuhbJqtasS1EeeJmLLZ4jxz7QKoONyLNYo1JEMr90VnjiHdn1Zbg6CFkmhigu
         F5getZ8c1YsL35HVRqmlaOgl05w/RUeEBazJYPaumjpZjbJmqwS1VnahgCOwn37g506f
         l208KKBZsQaM4oopKeq0516bcKKjuHFqtZIMeRKPk0wy142FA4ppYHDTonkvJrl7oDSj
         Tybw==
X-Forwarded-Encrypted: i=1; AHgh+RqECldxKV1l/JTbQUAlmB5TkL8iTG9neYmtisFkKbOJuWdyD7hcEU8XknaM22mMKCiUMPitHhqqM5l0TQ3E@lists.infradead.org
X-Gm-Message-State: AOJu0Ywap6CgS+8K/OZYwRONxinYIEkHetJey8lzAAkSarPmX3DCrN1A
	SxDxPp4TD4vBnQDCTUxoYChqfI047TBouMambwC/n5PTxc7bFMX6nT31/f4Vs9VyfSc=
X-Gm-Gg: AfdE7clsZ6vewwIV8mwANcldWsoeRbWXNf3K7ujV36O7CPEcg2fIJbizftEJHZGvF1h
	5GeMptPGs9/YxVTgcGX6L3pWn2L2seF7cT8Tp5tsmDdXtJ3IJPsKDNe5AQi7QePwelSsLwENh63
	fslx1lzUHFPTLTlW7qFe1/4QoPsM03W2wNJwWh+J6h8Eb2BmU3kuPT2U4a7lWQnCaOXIe2eIN5q
	IlhYp3ONcxnOUZ27f8S3ClTbv1Er6FoV3HQ0lM5oaRt6/Um4ZNwMknhXQMvaVirbd3meAvXlJ0S
	ZJ+dHBYRxttoopzmXIqgOgXTksiRKRQqRY33AObRt+Uy+s3hF+2CZQfUY4vH3qm2e0U9dzb22IM
	k9THvoAUkKGazX69/YSiDDSG9jUtNTIUVfQ8kgA441kIHSEgMFfe4Xg5f36PnIyXoYDNy8j1Iyy
	Kdq0pQPu+bDA71xk0zE4cSsQ==
X-Received: by 2002:a05:6000:2dc9:b0:475:f0f0:9eef with SMTP id ffacd0b85a97d-4775b176b60mr14465264f8f.52.1783064049008;
        Fri, 03 Jul 2026 00:34:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fb6a:cb8b:b7f7:bb42])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477ddf0fb15sm13999054f8f.29.2026.07.03.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev,  neil.armstrong@linaro.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
In-Reply-To: <b1a0a7de-c5b1-4325-8159-d5a0bad1668e@baylibre.com> (Valerio
	Setti's message of "Thu, 2 Jul 2026 22:34:52 +0200")
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
	<20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
	<20260702111021.2CCDC1F00A3A@smtp.kernel.org>
	<b1a0a7de-c5b1-4325-8159-d5a0bad1668e@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 03 Jul 2026 09:34:06 +0200
Message-ID: <1jo6goil1t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_003411_407693_E0FE5F71 
X-CRM114-Status: GOOD (  19.56  )
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

On jeu. 02 juil. 2026 at 22:34, Valerio Setti <vsetti@baylibre.com> wrote:

> On 7/2/26 1:10 PM, sashiko-bot@kernel.org wrote:
>>> diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
>>> index 311e63affb239..c7333f624b155 100644
>>> --- a/sound/soc/meson/gx-formatter.c
>>> +++ b/sound/soc/meson/gx-formatter.c
>> [ ... ]
>> 
>>> -static int gx_formatter_enable(struct gx_formatter *formatter)
>>> +static int gx_formatter_prepare(struct gx_formatter *formatter)
>>>   {
>>>   	int ret;
>>>   -	/* Do nothing if the formatter is already enabled */
>>> -	if (formatter->enabled)
>>> +	if (formatter->prepared)
>>>   		return 0;
>> [Severity: High]
>> Will this prevent hardware reconfiguration for back-to-back playbacks?
>> Because the ALSA core utilizes pmdown_time (delayed power down), the DAPM
>> widget remains in the powered-on state for a short time after playback
>> stops.
>> If a new stream with different parameters (e.g., changing from 16-bit to
>> 24-bit) starts rapidly before the power-down occurs, dapm_power_widgets()
>> will not detect a power state change and will not emit a new
>> SND_SOC_DAPM_PRE_PMU event.
>> Since the widget wasn't powered down, gx_formatter_detach() hasn't
>> cleared
>> formatter->prepared. This check will return early and skip updating the
>> hardware for the new sample format, causing the new stream to play through
>> incorrectly configured hardware.
>> 
>
> Uh, this seems right, but with a caveat. When I tested this series I
> launched 'speaker-test' with 16-bits and 24-bits in sequence and it worked
> perfectly.
> To generate the problem described here I had to create a custom binary that
> played the two sine tones, one at 16-bits and the one at 24-bits, without
> closing the PCM in the middle (as the 'speaker-test' case was doing
> instead). This way I was able to recreate the problem. I don't know how
> common it is for an application to switch sample width "on the fly", but
> it's worth fixing it.

You'd have to go through through .hw_params at least. I would expect it
go through .shutdown()/.startup() too but I'm not sure about this.

>
> For the records, I just tried removing this commit and both test scenarios
> work just fine so I'm inclined in sending a v2 with this commit
> dropped.

+1

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

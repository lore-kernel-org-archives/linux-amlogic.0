Return-Path: <SRS0=wai9=PN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853DEC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 16:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E5B60F0F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 16:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38E5B60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwkd8b+aechYx4wDOneXRJ4BGaq0HLsxbEZvZd35V9s=; b=unCjh8rWJBG3u7
	GgDw6NUz7c9qn7cUXSyX5VH1v4PvmQhjNk77CXvDFskH8n5dKFsPsPJFAUchygPXGyD0FUB9fYDUv
	9r1RLVvjJSlL3LGqQVejksRtmrS2QMVKxLUkNz861Krv9nqsw8pLrtPjDEiHWiqGcAIybsHDQtgdH
	fITdoTje0uLRhz+WkvR/X3kvpBmK1mSXfuT7v8KEcJ9YuRlJrbuYz6DpDcV1tL00ntk7iMSj1iOO9
	24Jc3i4XkETrU32tic3KgKPpD+33avv86949irb9KvaYxd9zzFTUVvWVg4bnavxj3yibNfvwZt1A+
	OvyqhlWEWorrgHXaVRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2sn-00H3Za-50; Mon, 25 Oct 2021 16:31:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2sa-00H3YY-Cm
 for linux-amlogic@lists.infradead.org; Mon, 25 Oct 2021 16:31:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id z14so12741432wrg.6
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Oct 2021 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=Nt0Z/OoxuAlfqincAk23d4XiLhHWvzP4USaTuY2uOYM=;
 b=Jv73JKOhyIuyHHoF8LvmW80lCuLptqy5ligk1M3eNPLZDXaW4dHjdiIaf6tWQq/IHe
 pcx2gNb9IKqtnQD6wHVl5nG/Gy+GTXmsUHkQGqr0tSeJJgBc2SuOmkfSaaL3BvfaYDcQ
 BOVpdG9KmKZ99tR7rSKI1dMmrvk2wmzJj/pKtcnUqLWjqSQUYaL1XzgCpnh1pD+8N/IE
 IImjs4qreeLTG9s/AQyJeDDC6GDjXW0V+7+oWcvd96vTYkTzLtTb/m+y3AAgw5WgLx7I
 X/i5ZMzPowCk7kasO+xhdQQK568c26ft9FIFNf47ymxamawLRllhD75E2z9pmtptn8dQ
 11dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=Nt0Z/OoxuAlfqincAk23d4XiLhHWvzP4USaTuY2uOYM=;
 b=fyomt4IOrjjc6jlld8F+tn02I3eTolGDYB5wrXltx0J5kw5xUQRA+2XNZmJwYb2qhU
 GBpy4SbD8QdCN5zp2dt/UJTkHTWAR7ENjlwXYcQxrP9VvYvNRKh1OM8qE2/7xk3mc63d
 dd9GHPEs3rquTLnG88vZCU0aV5odTwlf+z3btdGPYWsWYr3Mc6MPq9lIZFNxrkdoHJjF
 aTJ1+F/FeP0HgcJAiT3IesKPxNSxZkOBp/Nodxa431+1zhjQq4tBJXj+PFpMn8csLFyr
 k+UbmeAvNcevbPJL4JYhX3du6lmOr/bVHmbDopylpgWnCy1GnvSJevqGCrGQvfYd/5ml
 YrZg==
X-Gm-Message-State: AOAM532tkNS1vlDpLDqspwa5nmzi6pN0+2p3SV+jO7v0GD1g3/3a4BKa
 AQOjYMnBNsBU1C16qvp4O82zeQ==
X-Google-Smtp-Source: ABdhPJyayqQRTnZbHghBSUcVYQazO16mXqcW0LVetemvLajHk+9P0Dhpge5W/YH8w0/PidvdpNH8Pw==
X-Received: by 2002:adf:eece:: with SMTP id a14mr21532867wrp.79.1635179476260; 
 Mon, 25 Oct 2021 09:31:16 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id f17sm12257069wrr.56.2021.10.25.09.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 09:31:15 -0700 (PDT)
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
User-agent: mu4e 1.6.9; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: sound: amlogic: t9015: Add missing
 AVDD-supply property
Date: Mon, 25 Oct 2021 17:53:04 +0200
In-reply-to: <20211023214856.30097-1-alexander.stein@mailbox.org>
Message-ID: <1jilxl5ang.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_093120_463960_B4115C66 
X-CRM114-Status: GOOD (  16.74  )
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


On Sat 23 Oct 2021 at 23:48, Alexander Stein <alexander.stein@mailbox.org> wrote:

> Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
> do not match any of the regexes: 'pinctrl-[0-9]+'"
>
> Fixes: 5c36abcd2621 ("ASoC: meson: add t9015 internal codec binding documentation")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>

Hey Alexander,

First, thanks for picking this up.

I think Rob's automated reply is because you forgot to update the
example (if the property is required, it should be there)

Also, I believe this change could have been sent separately, to Marc
(instead of Cc) and with the "ASoC" prefix.

With this changed
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> I am aware that adding required properties to bindings is frowned upon. But in
> this case it seems acceptable for the following reasons:
> * AVDD-supply was used from the very first driver commit
> * All DT (g12 and gxl) using t9015 controller provide AVDD-supply
>   already
> But I'm ok to not add it to required properties as well. The driver uses
> it nevertheless though.
>
>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> index c7613ea728d4..5f4e25ab5af6 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> @@ -34,6 +34,10 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  AVDD-supply:
> +    description:
> +      Analogue power supply.
> +
>  required:
>    - "#sound-dai-cells"
>    - compatible
> @@ -41,6 +45,7 @@ required:
>    - clocks
>    - clock-names
>    - resets
> +  - AVDD-supply
>  
>  additionalProperties: false


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

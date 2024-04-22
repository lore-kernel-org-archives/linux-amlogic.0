Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C6BC4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwF8AHdbqsmkNIuthr1/kPzJA31ErXpgjIbGevtx4hk=; b=xQHbFiuxmE3Dnz
	mOCfXNHp0uq7M6fxy0Ib3EReDOhFp3enYvlBk8pI3ZaUSvmI3W/rdsIZfO/kwryKEbfwSnGxf/Fjv
	K9kNtq8Jj4YZz8KfuJp6SjEFiH53Kkd0w0eYo+J5Wrb/A4kQR5HyG6xwd0ly4pQqEVst+sASRro9E
	JUn/EDbtgzHSzWJbJ5cLxcTKh/YpFIIGoKaPLjYxbTSYhvEhW29zJcvQUQuxYZn788b3J9iLXkrry
	jAyjVTF+zR4cBjBeSef6APRAvm++YOfNvbrVQa+gf0zy3KbdHVxvqk4zLobyTSrp1+d64sTdAymTo
	saIozT2tHRyh9aIMspgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryojx-0000000CZfd-470C;
	Mon, 22 Apr 2024 08:09:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryojt-0000000CZcO-2SdQ
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 08:09:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41a70466b77so2556615e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 01:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713773363; x=1714378163; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=G8Z1W9cBwZwFr+xw5xhgBlfEeDfYZ9v69oNkjrxgbOY=;
        b=AWpubk4DhTU6E4t/39Bf712jetF+t9fDgk1g9Y9qn9NykPGmgTGjmLCyFKtRCO2e26
         WlMFZghfu4i1fOcLDoFXT4iNW73dR18lvF5Ar9SUgCzoea8PF8s2bAESg5bWA2/18UUP
         KqtewWe5oaSJPTL/RFMvB0edwQEVsDrEW66quwX+BZ5wFuNCu6vGrIS4/ueCFTK01HdJ
         MUpagAJROErSUIdh6JlGb5td/lzsnYQ2iqQSohRk79rzYHhPZGXhDUwOoPKzznkxLsuO
         I4jFQb53oQL6RaJHS3RtR/wyPrEu4/+5HcuoW18BN4bjKsIs+iJB0A0j1ykyGbSbBVO0
         t0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773363; x=1714378163;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8Z1W9cBwZwFr+xw5xhgBlfEeDfYZ9v69oNkjrxgbOY=;
        b=KBDTpEwDTnUh2268i1ZoewSPO+rtjNAcEo75zOIqE1FiDsuSie1JlBsZ+Yf0K5Hq1L
         Ul6UBnaLvu8B2f8bjJVyGHXKtkw6vThCptfbvsEurDoYtWZFmKI/LuxDUXVeqIi+klS9
         IfIOq3nriUBvlNH1l0Pw3TPWovJeCVbPZLov/QDTzAYPliDoZ5BjQMvjLl9N7It16hfF
         A9AACaVKwls8PwjsjvqaQgoMsg/eVh1HLZxeJYjGOltEDiIkTZ95fjyjQya1XPQeFmCC
         MQeYTW0SYGBmtUjmHqC+07+qKVGlZCIQmMNVmpMu6hxHYFaqomPohgx0P+MDV6DVitka
         mt4g==
X-Forwarded-Encrypted: i=1; AJvYcCUfJ8dUBFQt03xtCzCyH7GQTA8ELytYOLsosBv8z3CkCCJIocyggtK2I4TOtZUMLH7MCcqpfYJ12gh9P7hPt6gZytzHQLOxoVbNtgH8uCYjTBw=
X-Gm-Message-State: AOJu0Yxj/ZEFEgmVkhTRga7jul+8CRNgULLSiUXlN6Ukoj7i8XWVXyM7
	im+oLjaXGtc5FpE+GiWV6Uc0gCJkXovTVK2HIb+zUayEv8bYBLGg5vNEm5hyib4=
X-Google-Smtp-Source: AGHT+IFcBHuQrYYsaNLbUg30qmwUhwRzvle0l0p4jwsnHIaO8PpRDz4ckky8oOJr2gRpkpQzb3NY4A==
X-Received: by 2002:a05:600c:3587:b0:419:5c4:b430 with SMTP id p7-20020a05600c358700b0041905c4b430mr8846265wmq.14.1713773363290;
        Mon, 22 Apr 2024 01:09:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id d5-20020a5d6445000000b0034659d971a6sm11274074wrw.26.2024.04.22.01.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:09:22 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-4-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor  Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 3/6] clk: meson: axg: introduce AUD_MUX_TABLE()
 helper macro
Date: Mon, 22 Apr 2024 10:09:04 +0200
In-reply-to: <20240419125812.983409-4-jan.dakinevich@salutedevices.com>
Message-ID: <1jv849akel.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_010925_698820_5C2B3C1D 
X-CRM114-Status: GOOD (  12.81  )
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


On Fri 19 Apr 2024 at 15:58, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> This macro takes into account ->table property of
> 'struct clk_regmap_mux_data'.

Useless if the interface of controller is fixed.

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/meson-audio.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson-audio.h b/drivers/clk/meson/meson-audio.h
> index cbcdbd487d4a..1947c6cbf233 100644
> --- a/drivers/clk/meson/meson-audio.h
> +++ b/drivers/clk/meson/meson-audio.h
> @@ -17,9 +17,11 @@
>  	},								\
>  }
>  
> -#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags) {	\
> +#define AUD_MUX_TABLE(_name, _reg, _table, _mask, _shift, _dflags,	\
> +		      _pdata, _iflags) {				\
>  	.data = &(struct clk_regmap_mux_data){				\
>  		.offset = (_reg),					\
> +		.table = (_table),					\
>  		.mask = (_mask),					\
>  		.shift = (_shift),					\
>  		.flags = (_dflags),					\
> @@ -33,6 +35,10 @@
>  	},								\
>  }
>  
> +#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags)	\
> +	AUD_MUX_TABLE(_name, (_reg), NULL, (_mask), (_shift),		\
> +		      (_dflags), (_pdata), (_iflags))
> +
>  #define AUD_DIV(_name, _reg, _shift, _width, _dflags, _pname, _iflags) { \
>  	.data = &(struct clk_regmap_div_data){				\
>  		.offset = (_reg),					\


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

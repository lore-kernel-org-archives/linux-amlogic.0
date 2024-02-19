Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0D6C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 06:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/asc8E+xyO3vl8q7x7J/JvmJTHz9T+IrgCoaqkocvE=; b=yaAqy+Q2l6r0FJ
	+Pdpikt8x+fcqqjZXJDN6ff67yBE617qn3MrJjpri+YLS+OpGR5iTnH7Wcz1L8j+7UOo51QqlyIEG
	I+TD4h/xH7sZdAp5Tg5lY78llxucPKVqryHbUAFv18u9N4mY/HAU1TAChDin++0B0RTUxJQ55BgS+
	EQM7Ht15Q91/a7vClsiVNw2ZpCa5xD/Fhc3WSW5qLw9fSATWPMxEQj2LR95gXGvglmhWaRugoYrmf
	dp1MqElkpMjkbE/fG+Mb0/clkjqZH70pxNdKy+Ap3Jj5lNqBaCvYE4Ycem+x1SAlKTNQ9G9tVkAD9
	3GRvV9U7OHMkVw6oiCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbxao-00000009J7w-1QDs;
	Mon, 19 Feb 2024 06:57:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbxam-00000009J7T-09wR;
	Mon, 19 Feb 2024 06:57:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33d5ec64351so49034f8f.2;
        Sun, 18 Feb 2024 22:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708325850; x=1708930650; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rdfq3ZIhfI4G+FZTUQuj2JrPSLPOEMVHqCwSzXS6Rww=;
        b=hXfUFZkJL/t6GjaRqkGWpPufIaoTHgBDgJqoPQBqkdhVGz5Tq0rZCS1uP/4DakRgN9
         ZMkja4x6pAhtNRSVk1/kx8lo5Ar9Dg6HiZymQ4VEOGTTT7tBJqw1rlTUTlTzO+kZzjUP
         46AEG8BKJDmezJ/EOaQeS8HS1gqqRP/k/HXblmrwpH2ZNdMi237N4gargUrk9tcI5iXX
         YTQiAHKVeUIHrDkfPoJEU8IdFZPeS7JLzXDMxW4xxKns8loTxHZFwrm1j1jZY0PJTyyk
         knlgpYSSxWdnPgS8f2Ml5/O5fLa3abMabSFJmChOBRiIQuDX+IrEgfyizEAWCKb4zRVb
         v9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708325850; x=1708930650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdfq3ZIhfI4G+FZTUQuj2JrPSLPOEMVHqCwSzXS6Rww=;
        b=pwwIiEsPpgvNXyfqZsSovwjnCG+gplOnee/vyJpUNHhDz2hzGllYMagJhaGisBO92b
         xfsCRqsxQ6VrkV/frAHFQYJoXURWfE5ixUA0uv27Sv7nvmowlY/g/Dj3gK9t5ocPAfYA
         1wDiGOEVaNlPBVnJJ02L1RozoQZmPYmeOHXN6LqFoNLhSZuGvZFs2e9adf2Tz0PW7uo5
         kH22mrU92Hgb6TQsitTUqY+tWQ37fc7GC9L9wQcvzzSFG/fFiyMld8bciWWOR5pdoXUT
         OCz3SHheDHXwUCLzF+VaNj4qB+OfBDIZYZqnr0zONPUPJQihWbtPa2Hvr6oZ3comqMIz
         I4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXrVHu07UDX88EEmjsxmn0y42nkDmFrZ7enEGUbygKPUw+/vloGuJp5GbVruxoWo+79ENv2u6Ij/ax1NZsYr2LU+vqlW+aZ/tSeQO5tmMkLAqPfdZOhhncnqm1+T+tWXjxqO7zmgjpbuUoo0kY0+hE6cPhV+Zxs9w==
X-Gm-Message-State: AOJu0YyiKJQUN8ouI+vx6VEG4HHWX3r2ZMHyhJtJyD30cpy1rbjwhAwG
	RgZqHF8q7QW8UvYl4u62B5Gqn1MoozB329+9RxNKNmfyaMIsUcBt
X-Google-Smtp-Source: AGHT+IF8JFcDTdrR6y73cIEurgS8m7OxloBy+Evb9Ck/KwLltIcZEonwX1GXrqEsB7VlxG9x+XagxQ==
X-Received: by 2002:a5d:5487:0:b0:33d:3ee3:cc11 with SMTP id h7-20020a5d5487000000b0033d3ee3cc11mr2153461wrv.47.1708325849679;
        Sun, 18 Feb 2024 22:57:29 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id bp1-20020a5d5a81000000b0033d38cbe385sm5147560wrb.6.2024.02.18.22.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 22:57:29 -0800 (PST)
Date: Mon, 19 Feb 2024 07:57:27 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Message-ID: <ZdL713ae1swwTU_B@Red>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <ZcsYaPIUrBSg8iXu@Red>
 <20240215104719.njq6ie2niisntcnv@cab-wsm-0029881.sigma.sbrf.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215104719.njq6ie2niisntcnv@cab-wsm-0029881.sigma.sbrf.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_225732_138004_F7F94208 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Le Thu, Feb 15, 2024 at 10:47:24AM +0000, Alexey Romanov a =E9crit :
> On Tue, Feb 13, 2024 at 08:21:12AM +0100, Corentin Labbe wrote:
> > Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a 'ecrit :
> > > Hello!
> > > =

> > > This patchset expand the funcionality of the Amlogic
> > > crypto driver by adding support for more SoC families:
> > > AXG, G12A, G12B, SM1, A1, S4.
> > > =

> > > Also specify and enable crypto node in device tree
> > > for reference Amlogic devices.
> > > =

> > > Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> > > custom tests [1] and tcrypt module.
> > > =

> > > ---
> > > =

> > =

> > added patchs up to  "drivers: crypto: meson: process more than MAXDESCS=
 descriptors"
> =

> Including this patch or not?

The crash start with "drivers: crypto: meson: move algs definition and ciph=
er API to cipher.c"

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

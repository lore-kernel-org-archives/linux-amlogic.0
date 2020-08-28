Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDD7C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 08:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B54E20776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 08:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUhIuqEG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECtC8Qr2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B54E20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=emaUMaK91OzU7DcN7vX3DxzZaeXeyRKyxvNSveLGLPI=; b=WUhIuqEGfOabzFaOPQeLUDqtl
	sHFHHxD6xcStZ/SP0/ruxPwUi6dOqxMlwHrWYxYtyqr1RTjBufNsg4aIANotzh5GfE3wEy0x/wR6w
	sYneePdfVs7kVkL5XyH0TsFlgmUfVpCOl+m0rm2xRe210IWzfZO1yVHHtqtPM+l6do5xhNo0nXBMX
	kWGrEH0s/P53FAeRIGhc91Et2dDh3eG4XSgkbv9C4txzJkBtmjNZrCiR7jMvVF0XdA7BlpoB1sUWr
	WNjpvVP6VL16E7R9xGAeDlnMKk6TCN18s3ZNBAVZpmPbRsOpEHkXZ/fnGdcdsvDpuY5IyJ7XVoaS7
	BTZ/Q+E5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBZhR-0003Cs-Ul; Fri, 28 Aug 2020 08:25:29 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBZhN-0003CG-Ma; Fri, 28 Aug 2020 08:25:26 +0000
Received: by mail-pl1-x643.google.com with SMTP id bh1so125162plb.12;
 Fri, 28 Aug 2020 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hgp9U9Y/G0zo5rd2YjDP3ShdcPx6s9r42iPuJEDI0jc=;
 b=ECtC8Qr2QpWVT5Ln1YYdt0d41D8iu4+1QljOFImcKWuMAAwp02hB9Z/uL8VN2ey2J+
 p3GD3wlvEExKnV3Z319A58NvE45esf1chM+0V/fjhkBUwXersN3vaLphhdr1J4difc+p
 0CAUiHbAVl9ixDZFHnIBUOaHukXywdJoUMvTFy3YA0YF9c3y5XU82ueUeX/Egnq+CmRC
 9hNwIbKnSRxOMPUVO8etY6uZgLfo6aqikvMDuvVT9IqO2gK9kJBCJF/qz+RdRz2245Vy
 DFaJDmcxFVDbDqen+wlr2csyHQ1eWpt/RK7KSuNhW3eyhUvIV3DI9LK5Mo5H9XXISrU7
 E5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hgp9U9Y/G0zo5rd2YjDP3ShdcPx6s9r42iPuJEDI0jc=;
 b=IJOWrPSOhdYySi/wEZu6XJ8ungCDPOLQyQHL3D6soGT8kn0M/84Yjs5sZUAhil/uik
 +Mj/c8/CRKCbnv1HSOzaRRXSdhYJSDXVibbMrHDySp0V+P+BKn19wPhgkQRpZsVXSHkb
 j889RwkjMbx5UwNZjncJcL7hTEYQFhgjz9hk6OgGHzLTA/Tyswiidjws9I+qL16k/v+b
 IkJ6HXW+RI7OebMqkaOu6M8HeLAm6uKE42oEAg73NcArnKhTNE7F514O8Hq2N+afi916
 y1qtsH5zHlqr3YBQfNRGoWYGdyg+nuvCwutfe75wt60EjvE41PdgfJGV8PfA311mMGPO
 wXjA==
X-Gm-Message-State: AOAM530iH5yeQycR9pjYO6Uv4Blz4ifbFBYhvT2uzavNfkmC3tZ2XeLR
 3meYHAbgGqRs314NGBQfM4K5UMac4F/5d5EMZXI=
X-Google-Smtp-Source: ABdhPJwsbuw20O2OB1p5m5faNM+P4s8DD8aLK8TuvYw3gq+cYE8m/WMyHxDzBvhpeh/QCh5ExRey2Xy2BFReiumdd/0=
X-Received: by 2002:a17:902:b194:: with SMTP id
 s20mr408970plr.321.1598603123368; 
 Fri, 28 Aug 2020 01:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
In-Reply-To: <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Aug 2020 11:25:06 +0300
Message-ID: <CAHp75VdWDtoGxm3uxxeXveZQ3Y_ofShdYPSXHL0Vxsz5d0miuQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] iio: afe: iio-rescale: Simplify with
 dev_err_probe()
To: Peter Rosin <peda@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_042526_147847_99B9CE3A 
X-CRM114-Status: GOOD (  14.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 12:46 AM Peter Rosin <peda@axentia.se> wrote:
> On 2020-08-27 21:26, Krzysztof Kozlowski wrote:

...

> I'm not a huge fan of adding *one* odd line breaking the 80 column
> recommendation to any file. I like to be able to fit multiple
> windows side by side in a meaningful way. Also, I don't like having
> a shitload of emptiness on my screen, which is what happens when some
> lines are longer and you want to see it all. I strongly believe that
> the 80 column rule/recommendation is still as valid as it ever was.
> It's just hard to read longish lines; there's a reason newspapers
> columns are quite narrow...

Why not to introduce 66 (or so, like TeX recommends)? Or even less?
I consider any comparison to news or natural language text is silly.
Programming language is different in many aspects, including helpful
scripts and utilities to browse the source code.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

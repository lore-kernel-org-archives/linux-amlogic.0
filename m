Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48500C43458
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBpw3vCUnCKbXOoDhytX3eHU7XB1zGqw1Lujdu9OwS4=; b=sVg54GBN7wMJEZ
	Zz4GJFlLZX0DMU1JcPPtHsD5F0fDJHhcSY/B3+U6J23tfCns/UVnbjrerYgxVuimRAM55E4tFBkoG
	HEn6yj6S7D/2I5M6eEtOXaIRoOFNOzypaSiAvrsGdZHRbzRUWqXBmknZZCV+/xu6S8/3edRxUZrm3
	s785jIOcdX2jWmWEm2Q5VWaopcMUx0oRhsnjh2VZtaNJegISzWTlmL3OJtirtDtL0OtPIhw2LvgOh
	xGnrUxmkjuUBuyQFeYq/JlKDcwwPPedJ21Y2v7zw20YzGbCzNahfeQZl56bCg7TvEry8c3EYKIjpF
	QXd/F6oC6nwHwi+p5mKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYnj-00000006Jax-0Eea;
	Fri, 03 Jul 2026 07:59:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYnf-00000006JZt-1dHb
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jul 2026 07:59:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-475417f010dso151885f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 00:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783065541; x=1783670341; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zqjm78soCzOZsah5k4plTO+J9DTAjqlcZkOG5zlqAcQ=;
        b=ib1ojA3Zq3p1kCf6DhsmsWgBg7mltB4hHpgRL+M+gbmVv81isHbn2ul/BOLqUofy2+
         4S+iSjXcP2X/lk4ZSs/jFOhOfT2uXkzS9icJ5V7zgc1hIefuUo1LKjzGB+GirsiuCKhz
         4LmMH7QosWrT6/eRLkNltS/LpkKyM86665ub28h59d5tTKawi3F/KtY2KpqEf2J7JjPj
         T+HLe5pnxoX18yjp9A1VV4FhH0XLNNjt8WxPJ9+17ZTlBckmKJ4gXr3q8FRowNs6g+01
         b40hKw2dYCIzDAozgHapxu+lVxWU/ArsjUYxvv5Qey3g4m8TcNqUqHqtatRM+B0MytWu
         wOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065541; x=1783670341;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zqjm78soCzOZsah5k4plTO+J9DTAjqlcZkOG5zlqAcQ=;
        b=lLaRRJTfbC9YQHc+Nfy5ybmlkoKKjGoc6I9Dqt4Npj+ZauQJRq+y/zywtlI5dkm66G
         NuW/bYL3ue859suxW+aBcPVd5ybjQi6Q18M9XLNDlRlUAxvJNYH3NxM0ETWYBAO1hKY/
         mr2BNzN5FRuVVmw7H3RDxtZADIinrdB9kMKlj7XrLJFS2sXA8OAbmYecQOAVW9FPPiMh
         G5rBwLMJsyxYZkKm7PpynXCKQIKX3q9NIku30wSK2IN3pYpY1KowSPKYBy5C2ZATgkoE
         bV6RpuQRus35HBiWufJXiTkFGHc+Lo1fidI/6Bwiy+7nAktykTGISqQPVCJOhjHTj0C1
         nw6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoBqGs3fcEdV5KDUPBP0vVi+qZH058klP7ACj3pta07x0zt876G4rCXkNWxFjjWjuubThRYKj+o0NohKhYk@lists.infradead.org
X-Gm-Message-State: AOJu0YxTKTkPmHStsf7wfwBvhCLVG34u4Bk9O16yJaBMJjbz0jrVma+W
	hey3pEGbFz/n1QOYTwn/naRb4ieslAMb7w4VS4gnlzX1rwu0Mkbq2uDRRFH30cZt3r8=
X-Gm-Gg: AfdE7ckmK6HrIx4wkL2n9WQHG14bBc7q7KW+INQ4ck/NwYLo3aEErZAGw2mk7slruVz
	YUIIfqT/SdTUEqe6HVGAl+hRL3EUlpZVh/sbYQyKGT0DuHtbwriWHwtlHr9ASAH8Zo3WcfHjnnI
	3gXcdEseb/eTZ4tMSYxp52CSAXhgXOdtojsbn7F9sJnXn3TUryFmcLXEQkePTKMwNgxQ3si0H6e
	uX1c/QZfkMGGMDaNYfH3JdOSkUs/Ze2X5xPxGDX3ni9Esg+fQZPIx8RI8/eOP59uh1P85c4cMOu
	VQCaLBQI6AQvqO2FRNi5pPgKoOAlYXCV9ZAk1VGzZ7lbFazdNoFnIjzgKOu0jXmd6VAnNZfnTPL
	NaDQb/Su8hpX43Eyy5eOM3C4DnEedISvK/WhOHFu7lCw2U3cnT2WeBMTLGHI9OTAjxIjIRdwJJA
	VkUw+dE6MYZzpqSCCQFsq81g==
X-Received: by 2002:a05:6000:2310:b0:46f:e796:c3fc with SMTP id ffacd0b85a97d-47757c6d1e4mr14250190f8f.25.1783065541604;
        Fri, 03 Jul 2026 00:59:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fb6a:cb8b:b7f7:bb42])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477dde19fd3sm16565369f8f.25.2026.07.03.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:59:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset
 from prepare
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
	(Valerio Setti's message of "Thu, 02 Jul 2026 12:56:41 +0200")
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
	<20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 03 Jul 2026 09:58:59 +0200
Message-ID: <1jfr20ijwc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_005903_442381_1AEF411E 
X-CRM114-Status: GOOD (  15.42  )
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

On jeu. 02 juil. 2026 at 12:56, Valerio Setti <vsetti@baylibre.com> wrote:

> 'aiu-formatter-i2s' already performs the very same reset in
> 'aiu_fifo_i2s_trigger' for all relevant trigger scenarios. There is no
> need to duplicate the operation in the formatter.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
> index b4604734fe88..cb554c2e7ce4 100644
> --- a/sound/soc/meson/aiu-formatter-i2s.c
> +++ b/sound/soc/meson/aiu-formatter-i2s.c
> @@ -13,7 +13,6 @@
>  #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
>  #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
>  #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
> -#define AIU_RST_SOFT_I2S_FAST		BIT(0)
>  
>  #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
>  
> @@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
>  {
>  	/* Always operate in split (classic interleaved) mode */
>  	unsigned int desc = 0;
> -	unsigned int tmp;
>  
> -	/* Reset required to update the pipeline */
> -	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
> -	regmap_read(map, AIU_I2S_SYNC, &tmp);
> +	/*
> +	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
> +	 * trigger time.
> +	 */
>  
>  	switch (ts->physical_width) {
>  	case 16: /* Nothing to do */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

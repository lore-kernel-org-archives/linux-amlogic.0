Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF1AC5DF81
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMpqjEKzvZSQZCfFVOFxW7OswuqmvhYhPcFHj8LIlFE=; b=QIgk+LjjDmUMRV
	CI3CLhJH8xOWWx860cVHUDBENHqpmFx+suuF6z5y9TcXZQ8FEbJUbeJJwpvh37b+CvNnjxGqzTmS8
	zRgzVW3z4B5kAAfvxAbjq+OPITjTE1QxJyWsD5mxtMwfpx8hXLxOBmWvIbl50gyAKv08QJX/ckmjn
	H0D6I/DT+8hbPmFsaKo4Hw7v3CN+SNLDQwJ667IgW19eiBQVamvopAp+EfeoPNBzVhaAsBZofyvM+
	XfB+quN1wkziefD/vIhKFZuaGQhm4hxO9f62ARKZ1LLGzG0NWTVCG3TFh/8LVGreR6ull0nmsHES5
	7/Hx26hfXSHlbp1ud50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmxP-0000000AWXY-1y0z;
	Wed, 19 Aug 2026 20:32:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmxM-0000000AWWL-2nRQ
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 20:32:17 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1617271a91.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Aug 2026 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787171535; x=1787776335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=;
        b=mBuamQXKHfn77Ff0OKYFJZTEGVnYi55S1n4KiJgOlOVv2BuCUIA1s1X7bE7To7cnLi
         eh2i7KI2hYBQxWFsc4bUOu/J40F0zUR3sKsip9MmW+njBHMKHnMESMixvQtwXnuw70ZV
         yGxPyVi1PJnIA5LjUCEYCmejd2cKfwvrvCcCcSrm/8IY6ljcHBtVf4zuWcaz11JVFhQu
         htzqnsm+HfnJniyC2pn6JNpwMFV8I9MTWRzrhDSo673gGtVZ2b6LstKk6UDQ4L8jpF/r
         brDu6EAdraOtAPTVm+IDhEEW587FLa/Ivya84d8rOye582nYPYyFsBz3ZN7kFoN4pPXZ
         DH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171535; x=1787776335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kakQd7SwwB4qJFxzAT3GLQtskQ627s0NDgwkRoO1YnU=;
        b=PxLPFT6ka/uqxy9rVBh1mmLLvXIJqQ3CiS6u0rh/llauHRuq8Id08IeNHuNgc4l19f
         /rXDQpnZ7kbJGx9m0D9q2V5e1IQ7hsPoZCES1+4PjU5naJ8e3KxZr19Lq9tG7a8veeuZ
         brTocnMmI1GNRLnP9Fp/Wv4vhToF/V98kDBdjPj5zt3XUF+GNvEZbFaLLMSUoyrGANBJ
         f7NVv0KheBA/2KxByW1qI6ojp0tzNFAUHqI8WrQU99lUFOdfMWvxvs6HBqr8at8jfbGK
         FImdJvVB58PEnxPS9ZhhVSPTkzBBDe9t2H+YPgrHk4Uhl7OvuVd8R28wJiv1jjzHj90e
         EEzg==
X-Forwarded-Encrypted: i=1; AHgh+RrURKZMzRiOYT2F72sJ1IT1LCrkHSb0K6LY6LPyzhUX+GCFAwjctGBJ5mrgrIREIqzlQlRalrkijpmdpap2@lists.infradead.org
X-Gm-Message-State: AFuF++k4yaKi2dRsAx7UUIm/EWX1skggjZHzL9d+jJuclFqjrvSYIJyR
	jqOlC7UtUJ4L7mhvD0pE4H4Oit3q6veXkDXaR1+pcrrcOdOI5za06j2C
X-Gm-Gg: AR+sD13f/ZkHG+0fa6+z0p5u9o2YvXkFIaH4j89aT3mWX7iOD1oq3d5bOkma7s6rw/U
	YTeuip84zzkE9AtEn0HoVDcp0LiE6goln4Uuc/qFCIVHqFdWckP5c6//ZRmUtbMinl3uuaVEGAQ
	MS4H522idbhhN+nYskkV9v+JPqvWPSRqx0jv66Zy4mTGcsrRoDTQr3iFnTAXNrSSanEI3PBeyOm
	mTYlZuuW7w3FYO8KgHhv0h6aX9BE1OGYANqgTpL5SdZxpyFu/Oca3zNZ0JBQ3/GDuoTIEm9Ju2u
	xACO6gKhsoqaERFim+UHD3hizUtpykqx3neveFzThOM7JbMARNdOxXhLpi1NKrwudlSmdSOLRZh
	BN0ccJUCBoCfpfoJw7VGYxuWOvz78sk3DPvIgB44BWqedcbXb9DEi9bMIx6bXRj0VsNkzL2psS7
	Tg4d+X9rmJ7rPuoTKzvXUKlNdkRSviUAnAzDeILIqQqIZ2mKXqaUm0vXNkYNCnseQdPxR/mJj5P
	w==
X-Received: by 2002:a17:90b:4a8d:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-39580553dfamr13842543a91.0.1787171535016;
        Wed, 19 Aug 2026 13:32:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm16706081c88.6.2026.08.19.13.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:32:14 -0700 (PDT)
Date: Wed, 19 Aug 2026 13:32:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <0ee768d3-f913-4d29-902b-39f8bf973dd6@roeck-us.net>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_133216_714681_89AD4586 
X-CRM114-Status: GOOD (  22.80  )
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

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter

> ---
> Compile-tested only.
> ---
>  drivers/hwmon/ltc4282.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index b1675dc5b3c7fd2f..54ba4b8542e94b7b 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -1106,7 +1106,7 @@ static const struct clk_ops ltc4282_ops = {
>  static int ltc428_clk_provider_setup(struct ltc4282_state *st,
>  				     struct device *dev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_COMMON_CLK))

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

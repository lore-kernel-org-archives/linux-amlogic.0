Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B27B606A31A
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ptel/Tm4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+tpsMCi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yf47x/Sgz9CpG9vvzrlGbLFuuRGqPrqCqmCYEdBiiIw=; b=Ptel/Tm4Xus2v4hz+/HGehRqkH
	6/022zwd9RjV6WOBKYqxYujV83gCNHDKHY7VcHygKSBUKuVcjOQsNBESThn6StNCBMdaxNVdUzhJ6
	9KhFhtkdWlkoPGSDv9oE4x1r/J3SeW87n8lB8pNJlYHovEvtoLyJVgIhk6WxDGs0GCOfV6jmpm/nO
	/6hQgNmfTv2WTU1GL5JdQuk+gL1D8sstaMW6tz8ZSuT8S3YTUhdV9ny+B04265MfGnkHxuBjNrL8h
	wAKGoYqRiWuyjpWm/JR01ErOT0qZftYEcendNF4zSL3LUB2doOeb0E/GI33jhSDMvMiBHLVhd4m4w
	aSPC3Xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkPi-00000005Q3v-3BPk;
	Tue, 27 Oct 2026 16:52:42 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkPg-00000005Q3B-16A9
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 16:52:41 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6798af41644so53552d50.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119958; x=1793724758; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=z+tpsMCidc9SrkA/YGiMRgfJWjcqesmvmUCjwLJU3OjIM+MTEby421UqOUXzIB3f1b
         CQP0ys20Y96Ly/D3Rnqlud4XJgaTr+wrYfuLNLGm63B1tRvBEWZ0rDcWy+nIJFQ/4T5R
         B1itN+vPTZmPXaM+0PaDhKgmZxIqeyW8vmbJ7r1B+GPWjEs72HvpbIqYXjyVUX6RMuVq
         JKhVeNwFT9jpX3fUpLEJHH5OzBMizgtaMewvkE6vnuy6zg6WL33Prmthdn9UOgpX4Jvw
         mcEVVtjIHELwlgYB3ETD/xeNOOsw6rVafS3CQxXOaexKL+aYB5zO2/GdNCFEttnvSPw+
         zZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119958; x=1793724758;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=itHfdqwPyi3ZzcRvA3H3dG6p1Fr8KBZUnpqJETx2dS8SOXTLCrz4sDZ6+Og5zvunOP
         XtwlIyogrfKbZ+gAaYVb1i1Ci1JNAqLhsDqLcSVd2bCi/H8aY8qg2oGOF6MUHhsgbi1K
         M2hHT/0EtpkukboqX4XpERAVXgbgwQ/3RKRJd7KZP1tTP940PSzflTyxdpA9Lv1GsFm2
         pzUU4+iUoZxAVnlBkTTGRzEgVG/egrh/SuvASzT2Ii90xx5BSQDFvaVCJkl8LKZWR1/d
         GjsbmB61h+B5/LcjNJcBym+3Tk+wI1w+F8TcsKNj0i6UA6eVn1TssAWSIV4VPyG6fIvm
         9aSw==
X-Forwarded-Encrypted: i=1; AKwUvByFzt1sqYNbn9ZtqipvAuluk8F7F0tJ0GSOF3C1ROgidkMTFIljaOZOT2XfaxvEsN/SEfJ/eDSMbbyLZ+Mk@lists.infradead.org
X-Gm-Message-State: AFq9FYLR+FbFjZltTd7fIvngHA7xbQYoX/+pUWEoit3JWAiduoG3xLj9
	ICNIOJJpZ90jyMLIzVozB93RZwuixuPIpfKrW/3WHYv3kB8i5Z8p94Rb
X-Gm-Gg: AYBFou1mmuSbHnugYi09obMgTMUe0VFoW8WThHu03tCJAX6fLrNTTEzCCvUASg9ccRK
	7alsk9G0ntnlwk3g48Jqqw41gyfpA0JH5FmhEtI27c6YzNrEth2X1c6D8hz2gbaSzgxUhjAiowW
	jZGxddjfUk/N03qBYh+tSv2wrn6eI6Xg+KfF5j4s/t67HOE//ICmNHwJscMN0RvusGNkD5m/0Qd
	MVSpZ38O36dnS0Q9dpHr71odQLv+6Zk2PKSkkQiUNTjazsP/jG50RR7caCFGyYYi269Sz07YWcb
	q1LgNbETU/U1jhrYrnFHchtDYkerTUf9JwjA67LJyvTMUkg9CZvK57/EnxQKFMV3QZCf2/XNgAX
	QAxpToYapUL3ZIVBF8p7tihPiXd+H5WyA2I6zpSL39wUtxOUr3/QNr/I2d1Y6IXXTOpik2T8WGF
	emKOJoeX8NhuiSMDQ+5exggLwDvX3AfrHMXQgTrxnrDdIhFxM5KnWV35k+FIPdhYmwFVHyfBLEQ
	+kS+kBQ3ZbBh7wpEUhTJf2kdd9hMv9cfh22geFMMNQKCPBVZ/OXql1wkDPzsIsNFmcIwSuZ8z+3
	ebOBpQd3u58O7R5IsFRT9REJEb9S/RUNbRgsKyh7QSR72gr7HuM9DtGL+cLDwNA+AIehEvWv6tH
	trtDlrtU/XKNu
X-Received: by 2002:a53:e7d0:0:b0:677:c8af:d149 with SMTP id 956f58d0204a3-67a7bd1804fmr61705d50.74.1793119958354;
        Tue, 27 Oct 2026 09:52:38 -0700 (PDT)
Received: from localhost (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a080d4csm425545d50.4.2026.10.27.09.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:52:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 27 Oct 2026 11:52:34 -0500
Message-Id: <DMFRZ3B3A6CH.P7SKUZSQR23T@gmail.com>
Subject: Re: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event
 enable helpers
Cc: <chrome-platform@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Marco Elver"
 <elver@google.com>, "Bart Van Assche" <bvanassche@acm.org>
To: "Rupesh Majhi" <zoone.rupert@gmail.com>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Andy Shevchenko" <andy@kernel.org>, "Benson
 Leung" <bleung@chromium.org>, "David Lechner" <dlechner@baylibre.com>,
 "Guenter Roeck" <groeck@chromium.org>, "Jagath Jog J"
 <jagathjog1996@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jinseob Kim" <kimjinseob88@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Remi Buisson"
 <remi.buisson@tdk.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-9-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-9-zoone.rupert@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_095240_304038_89446E0C 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Oct 27, 2026 at 7:49 AM EST, Rupesh Majhi wrote:
> veml6031x00_event_enable() and veml6031x00_event_disable() call
> veml6031x00_set_interrupt(), which needs irq_lock held. Their only
> caller holds it, so mark both __must_hold(&data->irq_lock).
>
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
>
>  drivers/iio/light/veml6031x00.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
> index f6308498e422..476ac3717f8e 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
> @@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_dev *iio,
>  }
>
>  static int veml6031x00_event_enable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev = regmap_get_device(data->regmap);
>  	int ret;
> @@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x00_data *data)
>  }
>
>  static int veml6031x00_event_disable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev = regmap_get_device(data->regmap);
>  	int ret;

Thanks!

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

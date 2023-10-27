Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9692CC25B67
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jCziFBDaf4T6Plmg3Y6ib9LRyEfqcUtKK97KWYjVbc=; b=AJLuEq943ieg8B
	xEfjvydMDVuIAsiSBJGoHMLZ2kb7r3URWjH4Ua3wTLDwvuEYweH/7UHr5AF98tVbOIB84FFwIIFyV
	Jgyu6dtHf8I1d0EPQsc8lk1xkE171aN8qLA0+E9+aTd3wV3zLFitmDTfWunUWHMQrQDaDdNt3h/7V
	qLA8hxDHSLyqs2qEErXiHVIquqniJa28RhukdVCoc+h+iOjJ7HWqzsF0bBrVGUjRyRucjXxJhpDBc
	Mv/YA7etRi1mf9cgdMQJJJtLZPust84YkPFvcz6yVulRGsyojquzK9gMzg9w2YeQhLp0RNXFhp43O
	H9wCynx219VjRE8B/mYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIlh-00FzRx-1j;
	Fri, 27 Oct 2023 09:04:37 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIle-00FzRK-1q
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Oct 2023 09:04:35 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b2b1af09c5so1116164b6e.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Oct 2023 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698397472; x=1699002272; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYwW0s2BOh04TrQgARy+ZAGjgN1hKxj4KAq6p+VCH1M=;
        b=bAum1O4VYjiEFqXY18cMMb8EITcjZ3BBac4O3Mw0v/OZf6oUb4679oj5IgF11aMkfT
         CwExT/hrqyRId6JPCCffprH0R7zlW41U4eRIS/a3lovpWuSHbEaGfqzZbszcGtCKk+y1
         OzUV7UYBIQ8D8ziCy2CMQx1+Ckni+qTRIngyDV7v00QBENEdK6j1dxJUpmYhVbX5uj52
         kikg+zhLKxy+4HkA3r0HXsbzLqeu83Mucqi2jhX+x7/iNJWS6tQEpSlUmrfI4EK14UE5
         BFxowq1xLvkEXiU2ptD5LmMukywcwvEKL8NieCJUWIpLZswn/T3UrDLbeDS64ngcuL3w
         pC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698397472; x=1699002272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYwW0s2BOh04TrQgARy+ZAGjgN1hKxj4KAq6p+VCH1M=;
        b=nIMZ2MWABzLVme14wlJ9ieZ/g4xGkW09/RXnKzV79f9y2lktBj4p3Y3VvThP84QWKJ
         SCgKGf7BpipNVPFHqZa/t7TmZb/fKNOZCb4y40QGUvNW/dZxzsQM+xycQHaVWZ52UIYY
         AwTKP/Rp2L+99i6EnxKXE5SGBqbr/LZ1GLGAn1QwIi5q1GYPeAgCsh6TJjM5U/sju4+P
         1mRw9ZLtMXF8qQwy9314Btva2psOwucWxbdQD7lo8jiqzGZxUKAPh+FsPt9sm1nyuntd
         MisyjsCCK+7fcuujhqtHaZ5glnscyWqx4ng441fXm90TRjAjYM6qj7IYS8wVFdZl8Wd0
         1xXA==
X-Gm-Message-State: AOJu0YyBUvuy0UbuW0tBT9UwmmPPMpNq3fPZA8mHpLBAz/bZE1a6BE8D
	vSq9bVz14aEX7uuS8p0nrrUtxwV3qnI/FruzkPRGgw==
X-Google-Smtp-Source: AGHT+IERiaQhDUuJ+K73/pCAPsO3dmX+uBgBKrfXATpvIXv7hztsC5N3Wu7K3OXqiqxsi1yk3Oi/hglez561ytzAqJ4=
X-Received: by 2002:a05:6808:10d2:b0:3ae:156f:d319 with SMTP id
 s18-20020a05680810d200b003ae156fd319mr2312336ois.45.1698397472641; Fri, 27
 Oct 2023 02:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231016080205.41982-1-tomeu@tomeuvizoso.net> <20231016080205.41982-2-tomeu@tomeuvizoso.net>
In-Reply-To: <20231016080205.41982-2-tomeu@tomeuvizoso.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 27 Oct 2023 11:03:53 +0200
Message-ID: <CAPDyKFpecaKQSJCTP5ntm243WTiQ-Y0TpU7x7F8f6Xh74+LT0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: amlogic: Fix mask for the second NNA mem PD domain
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Da Xue <da@libre.computer>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_020434_629697_2761E171 
X-CRM114-Status: GOOD (  15.15  )
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

On Mon, 16 Oct 2023 at 10:02, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>
> Without this change, the NPU hangs when the 8th NN core is used.
>
> It matches what the out-of-tree driver does.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Applied for fixes and by adding a fixes/stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index cfb796d40d9d..0dd71cd814c5 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -228,7 +228,7 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>
>  static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
> -       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
> +       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
>  #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)        \
> --
> 2.41.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

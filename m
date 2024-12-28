Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4B8E77188
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2024 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+utGEkJhGHGsbTqUQSU85Zb4X4UCUzaPsk+JDq9p3k=; b=2RysAENwxDSIXH
	07pLj30GDVVG/VSP4zvPRdlVWMkrMTxc/W4l44fdwVltBvFrQv/9QhWUJhdc6D1a4idSvbJUf/f+x
	Ykl2QOlisSFi5SagEJ0yi/YyRIh/0QSFSTLbQSTZkuKGsiZ7DcSztR7iLyqlORKqi0VxZxtcfeO1+
	SP9ZQiQKcmnRn1NGbpWPY/3kx17O//60rdW86NVErm9NHm08hgtVXOx9zFwnCMzPYVhyfavpGK+92
	2EV1q7j+sEg1yug06bW6drQHQDelOK+ZNLxfV/MV2psQzbZatlUZKSshMOWTzwMXZCCzakj4Dn1l/
	Z2nvBWk1fgXs/QP8CVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRX3O-00000001wCG-2TrH;
	Sat, 28 Dec 2024 13:40:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRX3L-00000001wBa-3JbT;
	Sat, 28 Dec 2024 13:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC93AA400AF;
	Sat, 28 Dec 2024 13:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58F9C4CECD;
	Sat, 28 Dec 2024 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735393226;
	bh=Ws77mFO+Nb16yI+ZZOatgdOyPQiA00A6vd+eNtyHFOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fMqoFzNj25bHV/NuP1qtroxtqMG+yyQlsf8jC5lCufwQ9OC6fg6GebqQj4OjZJYtL
	 hMkoakx46m8qtazpy6i/FAbcE2cyM8Hi7S8rtPoRhOubL59+UoO80cFrovMOHy5wDe
	 zv+SG5Vps683HwwDWy+h1Y5+6LXvGarfXeBgVAxvw/PmoX1YRe6RNQyqzhg9x5THk7
	 Ldl/z5YmvtMpr8fFuZq/d1GAVimWz57exbq0G9fSIYV6hamc2f8gaR7+HqbwTqbfTP
	 EurlzY0obPVdlCApale+v9n3dCYgx5V1lRNXfBT+Tb+GIwEqFJXCwMRvbMnr/63enh
	 wlwnaCyBDPDTQ==
Date: Sat, 28 Dec 2024 13:40:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 lars@metafoo.de, gnstark@salutedevices.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/3] iio: adc: meson: a few improvements
Message-ID: <20241228134017.321c7e60@jic23-huawei>
In-Reply-To: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
References: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_054027_905608_96D51A51 
X-CRM114-Status: GOOD (  16.05  )
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

On Tue, 24 Dec 2024 15:29:38 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This series contains three improvements to the meson SAR ADC driver.
> None of them are meant to change the existing behavior. The goal is
> to make the driver code easier to read and understand.
> 
> Changes since v1 at [0]:
> - drop the patch 2 "iio: adc: meson: consistently use bool/enum in
>   struct meson_sar_adc_param" for now as the purpose of the fields is
>   unfortunately still not clarified
> - add space to tab conversion from former patch 2 as a separate patch
> - Cc linux-iio (which was forgotton in v1)
> 
Applied to the togreg branch of iio.git

Dropped fixes tag from patch 1.   A typo fix on something entirely internal
to the driver is just cleanup, not a fix and definitely not something
we want anyone to backport!

Thanks,

Jonathan
> 
> [0] https://lore.kernel.org/linux-arm-kernel/20240324140429.5484eb54@jic23-huawei/T/#m81d92c2192de1936646543543501d8a62527da8d
> 
> 
> Martin Blumenstingl (3):
>   iio: adc: meson: fix voltage reference selection field name typo
>   iio: adc: meson: use tabs instead of spaces for some REG11 bit fields
>   iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access
> 
>  drivers/iio/adc/meson_saradc.c | 47 ++++++++++++----------------------
>  1 file changed, 17 insertions(+), 30 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

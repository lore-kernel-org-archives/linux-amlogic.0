Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28BCC47DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2024 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzWlgKt7Y26IvdgMnoDBnm0MpsHVthynlhb3rukQoyc=; b=Hm/koCAcglBQcy
	f+lvfptampjuqIySHyRSCafCol1C2Fw2wqN03jjF7/VO871jfYwVBNVmMxowTe+9bAC4Af/Ah7QSC
	kr1FaDgLYrcxUL24v7/ld+euklkdtzC0bC3u4WYErOpGCHcmrl1Yvj0u6Ls1Oq/IXcfaVNhCVkk5u
	52c+04CjR3+iqzrxBID9UTouYOvmk8imYEYs16TRhRsXuq/rqU9VP46l2UPao+0ImOqOsHkC0l4Rj
	GgfPKcPZIcnh+Yq+1m4kl+zkOzue8bAjn7Xrjvq8JXGvhloFrBHu+jGJUqM1i5xfdqoPlFRmfEbuJ
	qW3RsN30HSEa+LmbOqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roOT0-0000000Cgit-215S;
	Sun, 24 Mar 2024 14:04:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roOSw-0000000Cgg1-3UyI;
	Sun, 24 Mar 2024 14:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34CC7CE0AFE;
	Sun, 24 Mar 2024 14:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29768C433F1;
	Sun, 24 Mar 2024 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711289082;
	bh=Kspn8gzhUPZ9YM9spyq9jZwQzCKtXO9aU6dyN3b33zs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CznqUHPlE7oJ3pKMWNj1e6aI+DmjnG6tA2+NLcZk0Ifw8NJtLxU1Y+fM0CEA7Jowl
	 8M9ZAdg0wvsyAbh9dWN4GBPlcbV1iBJdfE6mosH16C5GYT4y4ggJCnvcIKpmkRWDjz
	 rsHvA3gLVDwzBCCfOF6Dfb1Q9Tkj4i6APWUvrkF5PiKHn7Vilk6ZljPUCv0ZUp73rF
	 iS6SEcmmzPdRXrYRUC8svH7Cw9yTcE7vLMrdZLOHsiNZijid3nFRDblMI/SwkmaeeK
	 4kswhZhdtRjRSBcCPmsYGT7PMMxIDoI1d52R4Z6ECjf7xNyGNcQHWLJ8V5b/74CwGc
	 u0Zj9aotlwvBw==
Date: Sun, 24 Mar 2024 14:04:29 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gnstark@salutedevices.com,
 neil.armstrong@linaro.org, lars@metafoo.de
Subject: Re: [PATCH v1 0/3] iio: adc: meson: a few improvements
Message-ID: <20240324140429.5484eb54@jic23-huawei>
In-Reply-To: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_070451_205264_CAE68EB6 
X-CRM114-Status: GOOD (  13.90  )
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

On Sun, 24 Mar 2024 00:13:06 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This series contains three improvements to the meson SAR ADC driver.
> None of them are meant to change the existing behavior. The goal is
> to make the driver code easier to read and understand.
> 
> 
> Martin Blumenstingl (3):
>   iio: adc: meson: fix voltage reference selection field name typo
>   iio: adc: meson: consistently use bool/enum in struct
>     meson_sar_adc_param
>   iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access
> 
>  drivers/iio/adc/meson_saradc.c | 78 ++++++++++++++++------------------
>  1 file changed, 36 insertions(+), 42 deletions(-)
> 

Hi Martin,

Please resend +CC linux-iio@vger.kernel.org

I'll take a quick look but I won't pick up anything that hasn't been on that
list (as I use patchwork to track status etc).

Jonathan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

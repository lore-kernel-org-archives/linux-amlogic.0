Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBEECF6491
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Sep 2024 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRHKGigxWeEVTGd7TruS+E22hFygS5SOBXG+P8LV5CM=; b=jypUUMlYcH0Tjm
	zGSa40pQ1o3lp3TGkg8/42pgnzFhkLeCjFoDMNnqBPjZb0I6tH1XEewGoYZQA3bcNy6MNAWlBkRlS
	ziH1tQ1fNbie9oAAbhNLcaUBeTZUik0TaUKtE+qB3J4FHjKJtUQwNWnsb8+QkU8cBefqLUhlqRgXC
	xbPvhc8uu2qi4v2CCXQcsiNv1Y1aMsye6+LfDvYe+0p6K7B/tjGyzjj5fA++A15GbZU1d5PINJVjz
	DBvcNBqsqgff1WNW71Yffl/+TfY/MYe78mSZ3ljaB3IAADJMg4Uzk199JfT9JIxW8B0Gagw+nx642
	X2JibAwlSSnamVkvQjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suYO0-0000000DBSd-3u4S;
	Sat, 28 Sep 2024 14:25:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suYNy-0000000DBSA-3FRw;
	Sat, 28 Sep 2024 14:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05F25A400B6;
	Sat, 28 Sep 2024 14:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBAAC4CEC3;
	Sat, 28 Sep 2024 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727533524;
	bh=n/Y0Anj9nP0Sgfmkct6Br5yJAJkrMZ80Y0JmDNmOs14=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LAThjtkjZxXFpNqc4Shx4Tkjwl/raQB20DWTxaXmJnpWJWZUeKrTGPhVJ3KVQgKt1
	 V2eQvujJWO7QWo57DMmMyBb46A2eqgZkwZVlpVXQCBaEo9E0IdtxD9hzA4IMZUO4In
	 Py4GYPSuH//cFM7g0ghVmIO+l6n2bbyqkbmFuwIQZeQUG+3dPoM0jDbZAZZpRZ3j89
	 mYIEiukC4Vej2YFaUrFBxGGb07Zs7KVcej2uraSlYnJH+rd4ch1b1ob7A0XWMY93yu
	 G4wULi10wxi1+aLxuUGOBW09waRh6MFsLmsXwQ7MfOx54q8xC3FNnG3GNaqhqUNfIx
	 8UWWBwYUoGF2A==
Date: Sat, 28 Sep 2024 15:25:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: also allow
 meson8-saradc to have amlogic,hhi-sysctrl property
Message-ID: <20240928152517.7386f220@jic23-huawei>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_072526_917948_699AFB89 
X-CRM114-Status: GOOD (  15.26  )
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

On Wed, 11 Sep 2024 17:29:53 +0200
Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The SARADC on the Amlogic Meson8 SoC also requires the amlogic,hhi-sysctrl,
> property, document it by adding the amlogic,meson8-saradc compatible in the
> adequate allOf:if:compatible:contains:enums along meson8b and meson8m2.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Applied to the togreg branch of iio.git.

Shout and provide a fixes tag if this should be in stable.

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> index f748f3a60b35..b0962a4583ac 100644
> --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> @@ -98,6 +98,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - amlogic,meson8-saradc
>                - amlogic,meson8b-saradc
>                - amlogic,meson8m2-saradc
>      then:
> 
> ---
> base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
> change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-127d3feddf3a
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

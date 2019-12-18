Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1F5C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 02:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05A621775
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 02:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eOWfofDD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8gElQ6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B05A621775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgMF95fGOJ4ekNYNB8QSwUXpg1uRuKgik62435jDEnE=; b=eOWfofDDfUc0+A
	foI1yTiJOu0fj1cJY7YgIxNWeSR7P3fUS8p9OX3aNP4Eub9T9rS0P4XuI32evjh5E1W3UqfSEqhrC
	h2CqZxtjBms7bhp/RpSgGxE4ZNWVlj6gDWM+SnbVh9AUmgr3nvYLyPhMyRcNYJmoxGnSZXNL2p6Em
	kmkvvfrNXcnU8R0RJ250IAiRSmkj8zaEXiakRud/kOosg5w2ZSdrt1UHqo0Dp1pLDsUQ77IJeAsWW
	oCnTWIfe5TU0aSHB6mA6k2OtBm8K7Wc1prX9vpWXWIxj/y7ph06fdXoOvzMyMLWyAzJ98mderLJcV
	2OrNC1JjERrlQGqBhdow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihPMc-0002JL-Vb; Wed, 18 Dec 2019 02:47:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihPMa-0002IT-L3; Wed, 18 Dec 2019 02:47:01 +0000
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0725021835;
 Wed, 18 Dec 2019 02:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576637220;
 bh=EN9XGbtCVFK944Al0uckJBpC3fwAtS4+X+y3O5WYLdA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W8gElQ6oUB4T3v7WLZo0xo/RWlXTJ4G1338qddAWGZocy4sQqcExFpivqsupYWXw9
 /ez6h5tkCZx9ba0610UE/DI1i4tgrsUycRKdOiENqXqww6Q0OXbHnweB1/hYYQAhrs
 QvkVbsingA+2bcvptfW18RFWZ4ILB/e70Otx2yqY=
Received: by mail-wr1-f45.google.com with SMTP id z3so611626wru.3;
 Tue, 17 Dec 2019 18:46:59 -0800 (PST)
X-Gm-Message-State: APjAAAUDGUeAUQlWzpAeX/9JyQiGYEjEIhCI4PBRq8JMAPpsaO7Yt/ym
 W6MdBaTFaC82uD/lcpG5kvD+e549Y1tfC5Nngus=
X-Google-Smtp-Source: APXvYqysa4a+4xeUb9YQTX1Eh4yJtSOADgVQZkRKpq63DrhasVdvKDjwwOKDppLi9wiOP9XubpNTkYeEip1VsbgqxhI=
X-Received: by 2002:adf:cf12:: with SMTP id o18mr1139856wrj.361.1576637218572; 
 Tue, 17 Dec 2019 18:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20191210203149.7115-1-tiny.windzz@gmail.com>
 <20191210203149.7115-2-tiny.windzz@gmail.com>
In-Reply-To: <20191210203149.7115-2-tiny.windzz@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Dec 2019 10:46:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65vb0HOHS18-z2dzu=icQGssKtSNWGKa9Uy5dYREURheg@mail.gmail.com>
Message-ID: <CAGb2v65vb0HOHS18-z2dzu=icQGssKtSNWGKa9Uy5dYREURheg@mail.gmail.com>
Subject: Re: [PATCH 1/5] nvmem: sunxi_sid: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_184700_706168_5778B57A 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Thierry Reding <treding@nvidia.com>, Mans Rullgard <mans@mansr.com>,
 rafael@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 suzuki.poulose@arm.com, linux-kernel <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 4:32 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/nvmem/sunxi_sid.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> index e26ef1bbf198..c54adf60b155 100644
> --- a/drivers/nvmem/sunxi_sid.c
> +++ b/drivers/nvmem/sunxi_sid.c
> @@ -112,7 +112,6 @@ static int sun8i_sid_read_by_reg(void *context, unsigned int offset,
>  static int sunxi_sid_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct resource *res;
>         struct nvmem_config *nvmem_cfg;
>         struct nvmem_device *nvmem;
>         struct sunxi_sid *sid;
> @@ -129,8 +128,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
>                 return -EINVAL;
>         sid->value_offset = cfg->value_offset;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       sid->base = devm_ioremap_resource(dev, res);
> +       sid->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(sid->base))
>                 return PTR_ERR(sid->base);
>
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

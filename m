Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F115DC25B77
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjnhQEyRPlcSz9t/RVuqBEhd9nWZaPZNs24lVwhGWnA=; b=J8Qh8L03F7fGXW
	XPtSjPekA9w1iT1UjsHXx6niQiO3ISeCxq7X0jfxbOOUJuk7Cj/XiUIOqZjXJ5EZiisE1ID896pPN
	CurR5L/bsK38Wqu3U3w49ky5SuV+Fd3XsVOQLonsmG10fFAr3qCBwG0bdwCf2E+den9/zx4qqmPdT
	esvMym9eRZgR6Xdfo7ZiAZ8CX6xX8biDJSj63GZssdqJCoAvtbjITcxleDfpGKxQPBzVz3aSauAkY
	uIDReJS3SxQMSL0bIaSYt6xcZFEWzWPBjMrb/iYuAaa9NsvI91ylB+5hfrX06Mtb1qbJDeYAWyr5s
	8tQkZ5WyoZi2JrkCL3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Dc-00000000ntX-2ddp;
	Wed, 15 May 2024 07:38:32 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79DW-00000000npN-2YQO;
	Wed, 15 May 2024 07:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JWlVGgM4WxsBCRWGiN8tEacLiYuKgkna6fVzADW0xEU=;
  b=c4O8ie8vWPJ0uSdN92/luS57dGrcQ9mdKUMBobUBfkY+YaoX7XiTvoak
   H/lbY3LoO8frvRnQ+SEs6fy4AaN14HO0zZduchtSoram8kRNQGuTzR58Z
   2DP8v1bPY/i53qKPKMXrXeJ+E3Dq4H/2JjRNhi7ClAEenIg4VywJ3GX0k
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,161,1712613600"; 
   d="scan'208";a="165794184"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 09:38:20 +0200
Date: Wed, 15 May 2024 09:38:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
    Neil Armstrong <neil.armstrong@linaro.org>, 
    Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
    linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: meson-efuse: Replacing the use of of_node_put to
 __free
In-Reply-To: <768c3e38-724a-42d7-a51d-16044bc69ed5@gmail.com>
Message-ID: <b628913c-559e-67ee-efe2-913992c98551@inria.fr>
References: <20240416011751.93016-1-marilene.agarcia@gmail.com> <768c3e38-724a-42d7-a51d-16044bc69ed5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_003827_147144_C487FB21 
X-CRM114-Status: GOOD (  21.39  )
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



On Tue, 14 May 2024, Marilene Andrade Garcia wrote:

> On 15/04/2024 22:17, MarileneGarcia wrote:
> > Use __free for device_node values, and thus drop calls to
> > of_node_put.
> >
> > The goal is to reduce memory management issues by using this
> > scope-based of_node_put() cleanup to simplify function exit
> > handling. When using __free a resource is allocated within a
> > block, it is automatically freed at the end of the block.
> >
> > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> > ---
> >   drivers/nvmem/meson-efuse.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> > index 33678d0af2c2..400a9a075e53 100644
> > --- a/drivers/nvmem/meson-efuse.c
> > +++ b/drivers/nvmem/meson-efuse.c
> > @@ -42,20 +42,19 @@ static int meson_efuse_probe(struct platform_device
> > *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> >   	struct meson_sm_firmware *fw;
> > -	struct device_node *sm_np;
> >   	struct nvmem_device *nvmem;
> >   	struct nvmem_config *econfig;
> >   	struct clk *clk;
> >   	unsigned int size;
> > +	struct device_node *sm_np __free(device_node) =
> > +		of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> >   -	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);

There should be a blank line after the last variable declaration, so here.

julia

> >   	if (!sm_np) {
> >   		dev_err(&pdev->dev, "no secure-monitor node\n");
> >   		return -ENODEV;
> >   	}
> >     	fw = meson_sm_get(sm_np);
> > -	of_node_put(sm_np);
> >   	if (!fw)
> >   		return -EPROBE_DEFER;
> >
>
> Hello everyone,
> Did you have a chance to look at the patch? Any questions or suggestions about
> it?
>
> Thank you,
> Marilene
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

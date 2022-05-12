Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D420C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIndfGNaazArZ4nImM++x8is/sZCIV9IwRvGOpBK0j8=; b=z5thVm869QaXEy
	FZIWLNCKkgNOZurwuR4tBpx85FFbl4RksQTAdTUNZ0FLKTcMUW/WUCZpysXAx9KCi7dKM6XiYSlpN
	eGnYbM22iyNHrQPA5zURyukX5F/UVIeFzxzLoRRcMuiySXYObjc01Juk7OKTjZgyCdKxue7NQvq8N
	RtsrNA8jh8c2lylDFuvzdKRG0Ms6ogxx2gTV2g6xyy1uZPeY3+jqpLQ9tqDmuMPfJDUitFVhXa9jt
	MWFjqbfk+Q6MgHyNTqh8Oq0RCsgd8fsJBOGNb4RV1cLt+IsDsO4Si9nOeF76uf6zvZisuYrhRO/zI
	kglA4j2+c2725ETdej4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np6Ut-00BTL6-HU; Thu, 12 May 2022 10:56:43 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np6Ug-00BTGM-T4; Thu, 12 May 2022 10:56:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z19so5740456edx.9;
 Thu, 12 May 2022 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1qOQZQPTy4U7t+rkSLUr0kIO0VTPczZpQ9pnwXXnwbA=;
 b=WD7JQy6fN3kvH6v4mOydQ947Tw31kQgVUnaXgy31ouUajVtLLLRAW1tgkdaVG1wsak
 D2lRTCB/1lP7bJrcocRs4RbF1VsL3M68OHMwq1mDNsIoQdp3EqUAK8F2nKKhE4DTCrzp
 EmJpK9fI2F/0QHtUYcgGpcAMt9PbzdjpLG6bldHlUC9+qJoytLJr05g0AwEGgTvS1L+M
 Y+B9cUTITp90Zi8awi4Dppw5hqncJs5ox1bzohJ/DAllxsX0TgSQkfXdzNJP7ULIkSZc
 kua/FlRjij/TYEwClw3iq7oaN9yrVNHHegzNfMn31Rv9qE5GMO95VrNrpznV5kWBKNHg
 lP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qOQZQPTy4U7t+rkSLUr0kIO0VTPczZpQ9pnwXXnwbA=;
 b=CoYGncCS3rpjZ/taZBBuvQ5EAKjryoF7Flq0l6haMWenqGtB0l+tqGg9/+L5UTAF8c
 JkRJRacQSqEJJokvRu86OIoEkEo2vVJCrnyaF4ia7yLW+QYPpLtzgPLx6ZiQl6ZbBJ/o
 5mQwKTISz2LhIDRGZxh7qfARxNkP3nR7GJ3L6GzviaiZSdg6FDYQLwaN3uBFMrubVrnt
 DFTwjg76Cq/s84verd8G9HrWJbjbcC5J+2fy7ydoCBoafklPB4Q08B+OmNX9JO+fchAA
 UZi5L3hWefp/HFjnSjWUwL+y3rpRH2n1YowiCftzv1x0qPecUR3xxADxTQMDwAhq3KHQ
 Aulw==
X-Gm-Message-State: AOAM531GHcpj905quMSs3Mk9m2GIpNR/trdByVlcqjfhD8ExDtrjrJr5
 x9au/ewZoK/3QC0C4uR+iZNeAD9Bjw8dx5GA28iRYGgSi7M=
X-Google-Smtp-Source: ABdhPJzZ/2UZwO8JVwO/F5piUiIPlJxVyh3uQd8vtnwVDQmeJ+cTHuVyEFiamoilO0JkH6nwoeYkA45H8vNAuB88uc4=
X-Received: by 2002:a50:ed0e:0:b0:425:e476:f4ed with SMTP id
 j14-20020a50ed0e000000b00425e476f4edmr34023372eds.32.1652352988427; Thu, 12
 May 2022 03:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220512021611.47921-1-linmq006@gmail.com>
In-Reply-To: <20220512021611.47921-1-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 May 2022 12:56:17 +0200
Message-ID: <CAFBinCCJYjunsRjKmgxwBkQu+aL-42TPdSrCi1g=0jofXeYe+A@mail.gmail.com>
Subject: Re: [PATCH] ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Carlo Caione <carlo@endlessm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_035630_971361_F791A84D 
X-CRM114-Status: GOOD (  10.09  )
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

On Thu, May 12, 2022 at 4:16 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_compatible_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: d850f3e5d296 ("ARM: meson: Add SMP bringup code for Meson8 and Meson8b")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for spotting and fixing this issue!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

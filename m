Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0F3C4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 08:19:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6107E2084D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 08:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdNPoMeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6107E2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkM6aqZiJsbR5PPcLsBt4+BS17RNlDJRLdqvhZGGMYA=; b=RdNPoMehjCKVBu
	1eFaG3XxsdOZF5Q7nKN4dzqjp671RvZnklSqfj7G2+qvsvxqEh5rvTBeVrDJFvZocQamjPKOEyO6I
	CAy1xbg99uO9XeJHqDw+iQKh/ukA9vkk4uvYYp75pU/Kof1Nl9vSNBWmmjf8p+IThxA7lWwZ6H9vO
	pQEn5Ug9Qr+dgZXbsFwH5D2OEq6Yj14NjtpBZFgugj3uKk6dLBPLCWull+GeaAxwTE+IbMArjzzyW
	GIEEgUhnfHdO8CTcBUoNEhGwqkTb4gfXDXbKuzrCGaY94rQBwt5VPhXPg7k6MwngVZN5if0e9Tp3w
	5asniJ5Ncw59idxVO4jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHOEU-000444-EY; Mon, 07 Oct 2019 08:19:06 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHOEH-0003sc-TT; Mon, 07 Oct 2019 08:18:55 +0000
Received: by mail-ed1-f41.google.com with SMTP id r9so11529367edl.10;
 Mon, 07 Oct 2019 01:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Snb3N5jBGTny2lV0Bq/REXN2i4LAg5y7Btj+sL3kJn0=;
 b=rEqcqv0ksdvjemILtmgSxT2bVoW66JKdP8KBYORTBsxoH3CgoDQFoQFNhSi+uE7R39
 ZrQzRaeDl6z5gqGWYhlr0XF85r1DCkBbdpoSSgbqNYSGK+ak94sh9nfTp7O617tR0czq
 T5MKansMFHBEaacSzOzcNpCfYkAjxJ4XUSu8VJcoevSsRIFzxDnpPIzIi60qw+qC8Bcv
 VVVddU1Y8EuvcVdXFURvpc6qSUJ8HvtRbh4NH1x5mB279nzlkeviAXP7plDE4JG71n52
 ZJLV/KUZbQ/uVS2CS2D5rV2uOEew830+3IQcp7BNOlOX0VWyQ+nfOaoFODJMo9SSQo6U
 UBHw==
X-Gm-Message-State: APjAAAUeUK+hcgPYDzVl4z6y1U4qqLPx5dPPzXxOkY4Hcdsh+JAPXCUC
 4QhEKrdTdt1DTN1VYLR+lhQ/Cee7/cI=
X-Google-Smtp-Source: APXvYqw1CV0woisCxSDFd49QJz/X95NXB+nJA85mJyjiVl0DzzoVW/Tm2WoIhGRoOsuFs+TjBs0ZrQ==
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr6911093ejv.300.1570436331523; 
 Mon, 07 Oct 2019 01:18:51 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id y18sm1768402ejw.87.2019.10.07.01.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 01:18:51 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id w12so14086407wro.5;
 Mon, 07 Oct 2019 01:18:51 -0700 (PDT)
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr16979718wrr.23.1570435909394; 
 Mon, 07 Oct 2019 01:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-30-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-30-yuehaibing@huawei.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Oct 2019 16:11:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Subject: Re: [PATCH -next 29/34] rtc: sunxi: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_011853_947511_1C84E562 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Baruch Siach <baruch@tkos.co.il>, Patrice Chotard <patrice.chotard@st.com>,
 paul@crapouillou.net, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, jonathanh@nvidia.com,
 ludovic.desroches@microchip.com,
 "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>,
 joel@jms.id.au, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 gregory.0xf0@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 eddie.huang@mediatek.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alessandro Zummo <a.zummo@towertech.it>, andrew@aj.id.au,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Oct 6, 2019 at 6:39 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

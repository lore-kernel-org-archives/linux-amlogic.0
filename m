Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A9CC47404
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 20:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC71C20835
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 20:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBOq4ZjJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ldZWZLPY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC71C20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1HOgsQf/iwHnzp0e6RlsPDq8CSsCZkLaDocE3un0T0=; b=QBOq4ZjJ7aaQl+
	cCkDCuG89t2x/YVULDB0wAZAV5GYLhH/WQbzh1jpGq9LokrMpEkWBa60ShuiIJP7BvA5NpFDtan2n
	A8b0UyLznS99yD6myBURdgaQeyktrBI5+eJCdlazuOsG1Jum/z0+qTuRb9okn2zOIP4/axStICqfG
	SuDmrAna6vZbIYClQYIDbO4aI/aDOr15Rur6kl49cd7gwztA7AkFUcyEAH7+TC2nX1Seq+jRfcHkn
	h5YEQYo4c/IEBT0HU7SFZF2KK22CbEwMT9EL6y0O/aoRxrlfXfIC2pDCLsqD/LlFyGBNQpvwO9mTt
	Dgj63FYsLXpnpepAhRQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHZCL-0003rl-DI; Mon, 07 Oct 2019 20:01:37 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHZCI-0003q3-Bm; Mon, 07 Oct 2019 20:01:35 +0000
Received: by mail-oi1-x241.google.com with SMTP id k9so12799549oib.7;
 Mon, 07 Oct 2019 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
 b=ldZWZLPYdSK/lW58g3GggUrvVCJd1bSherkZ3i1sSTYmEWn8xkwIcVHcmZ3icueHQp
 oy5jhaY7EWxyWVR9117SxscpYTuLMHxESfnKRG8OiuTaUqvhUU6ovZmkM9O2vxxFt+eU
 j1Ahl1lPiieioT2lbA364gHNXQWxIF0DgKTKQLSIoQ9sNQu3MyZJlIheMi1AbflSbGt4
 FMBBws1iMdul9gqqFEcvBoTYYrPIjtJ8f054Son5rjx4xSysmRjtnZZEtvqD1noCgWOm
 IoXuRgR8rfAJ12qdkaYZR+biJvf7tEDnz8LaI7EH80M+v2A1gn7VKk1h0BWgQr+cPfKB
 CGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
 b=skFiYqSvVvja7BZ4K1WlPVQd5ay4YeKuERGEwTsSKmnxCSDtZBYy7CHzgkfxgmw0SR
 QevN7p3roOMKtKc4nrUzym1u4xJFooRuQoGz8Beimp3GuL3yfFMf/Hprs7wbIceM5Grt
 Z9K/7G8xfSzQkI9sy71wyRQI6ozRc4NiDK72DZ6wFd+x2A2FPqyJjo0hwpLzftQGKFjc
 zjrw7a1xRtjPZZp9+EKv58XNevE3bmdR0MSXdw4gU0bVPj/0WcPAQouXA7iCTRT/8kHj
 c4w4CQOC+9DK31wLqQlFcIS2f3cyASlor4+IJZP49zSo+FhbSa2qzATnFGtk4b4o4kXM
 n63A==
X-Gm-Message-State: APjAAAXfppcw8Bz1qSnhCrySzbRQZapZ4izZ+UAFszSzRjLxCA0JiE+R
 aDFLJQmeGQleViHaZskLFGoP1+RclGZC/7z+ZjM=
X-Google-Smtp-Source: APXvYqxw4MwTHhEk1nJATSbu3GLXbTfDZIxzJF0EPb2WPk2JVoRBmvrn3TlNb7LKr7TGaqwsqjCfogj/ATlyGhjt7wk=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr851452oig.129.1570478492843; 
 Mon, 07 Oct 2019 13:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-17-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 7 Oct 2019 22:01:21 +0200
Message-ID: <CAFBinCD+DSDoPiza2KKJAB_s6793ZeCZ6vjb5Zx9y0Cdz0mGjA@mail.gmail.com>
Subject: Re: [PATCH -next 16/34] rtc: meson: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_130134_401897_235F9BB7 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, baruch@tkos.co.il, patrice.chotard@st.com,
 paul@crapouillou.net, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 michal.simek@xilinx.com, linux-rtc@vger.kernel.org, f.fainelli@gmail.com,
 khilman@baylibre.com, wens@csie.org, jonathanh@nvidia.com,
 ludovic.desroches@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 joel@jms.id.au, slemieux.tyco@gmail.com, alexandre.torgue@st.com,
 sean.wang@mediatek.com, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, gregory.0xf0@gmail.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 a.zummo@towertech.it, andrew@aj.id.au,
 linux-stm32@st-md-mailman.stormreply.com, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, linux@prisktech.co.nz, mcoquelin.stm32@gmail.com,
 computersforpeace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Oct 6, 2019 at 12:38 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for taking care of this!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

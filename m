Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BA5C43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 19:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FE42173E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 19:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0KA4+GW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0bWiTGIV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89FE42173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yGg39sa5C6Fu9f5u7krkP4bYmunFm0ODK6+kuMqCH0=; b=f0KA4+GW9S07kz
	9m2pd/Pu/WTy2vukmnF2we3do4JoGTXK2QOnQn5B2TOcfcHegKwO+AKzY6hF0QS99Niep0InTl4+t
	/4z6a3nNxC10h20+dT4DeLqnClnR9aU6dCgNtWCLON+3iPl1bpik/NDdDSF/TIDqIg1iqPOyTs/uK
	TIbxDKQuJ14XACxRO5tHpthUeX/MM7swjNBruA9Amv9N+7RNyfekvxiDbwiNAh5FOAT7cWvlTIhVE
	Iipt6tdWEYtxvT3tUU9uT0EU/sVkf4GX0Wcfj1HLKN9rxidD90iM4xN/KXL6VSo1QL2pFYC9WtdLF
	YWjI0o+JpfL+MLVnXaHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifUGU-0003RH-Pp; Thu, 12 Dec 2019 19:36:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifUGS-0003Pt-0c
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 19:36:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id z7so3990603wrl.13
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 11:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=26CQo4we7KtCfvTKv993lhoi2F1fM7dxkL37tJToeiU=;
 b=0bWiTGIV4TBC4HQqKJut7ledSmNzlbafeuunBgzcIJHkJax0jtZ0jMLzGHUvMlvUuL
 wBaw5vXg3akzsq37fDpW0Q77N7e5aXa/S06o7cgYA7NgLr0o69KowlOxqiuu19P8M24q
 /Bg6rqy7WTOzij1WpJmt3SfL44lA5iGWSoYTl66uT3vqQrhKxRcmNhCen02yyDuy5XyE
 Rk3rRk22Fpc5+Xowl9Ui0okoHiTUhTzE0iEYZvYdCHBVlXEumzAdIY+w4iT13p2AFJGP
 /Zi5u3XtQbysQFaHFQQYTaPgLmcFyDyiTa8KzJsxJc2zxI3dBjQlIcRzYDX5UHHITBRQ
 mIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=26CQo4we7KtCfvTKv993lhoi2F1fM7dxkL37tJToeiU=;
 b=ejK6J0gpaJvtfMI1WaBbB5c5t87Rzc0yMvowBQ0U1h1nlhh+pUWd73jhGsGoDQ5k1W
 OqM6Y+FZf/Zgr2hiS+U+x8HxHiU4hfpiAJdoHjFvYmMOw0Lgog5xtUN7Q/IvsVjT/+40
 Lli9gqQHWLReL05vlWLOYnGNgKrzzhtmtnPHnPh3LLJ2ZoM0wd1D1eXkRMF1Hd+h+QSw
 YGluWLE7UQBhMWaqeRtV429TfOecGpN9AaQcMsjWcrFrAayqLlTtfSTyaigCoQ6R9+y2
 B3mUEBdmYoQnKkU2zUaDuxx4xJbhAvtZezERFcaR/bam896Z30US2km9opzHQQd6M5Kr
 DBCw==
X-Gm-Message-State: APjAAAVNiCRCoyoDRoldjN+zmZhSl4HpTJw9zkQ852mTzV8dD7OPUpnA
 k5t7tm+gaApcTHCwCkryHP/AxQ==
X-Google-Smtp-Source: APXvYqwQhaWhC3pY0IFwMztpCBjDmmW+hlZfOXqucMqAQkOxn9NE6sIr+fEMQaQAqzfUrg84KXG7Dw==
X-Received: by 2002:a5d:6441:: with SMTP id d1mr8161069wrw.93.1576179402329;
 Thu, 12 Dec 2019 11:36:42 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id k19sm6820349wmi.42.2019.12.12.11.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:36:41 -0800 (PST)
Date: Thu, 12 Dec 2019 20:36:39 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v1 5/7] crypto: amlogic: add unspecified HAS_IOMEM
 dependency
Message-ID: <20191212193639.GA25451@Red>
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-6-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211192742.95699-6-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_113644_105420_0C3973C1 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, richard@nod.at, jdike@addtoit.com,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, davidgow@google.com,
 linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 anton.ivanov@cambridgegreys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 11:27:40AM -0800, Brendan Higgins wrote:
> Currently CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y implicitly depends on
> CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> the following build error:
> 
> ld: drivers/crypto/amlogic/amlogic-gxl-core.o: in function `meson_crypto_probe':
> drivers/crypto/amlogic/amlogic-gxl-core.c:240: undefined reference to `devm_platform_ioremap_resource'
> 
> Fix the build error by adding the unspecified dependency.
> 
> Reported-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/crypto/amlogic/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/amlogic/Kconfig b/drivers/crypto/amlogic/Kconfig
> index b90850d18965f..cf95476026708 100644
> --- a/drivers/crypto/amlogic/Kconfig
> +++ b/drivers/crypto/amlogic/Kconfig
> @@ -1,5 +1,6 @@
>  config CRYPTO_DEV_AMLOGIC_GXL
>  	tristate "Support for amlogic cryptographic offloader"
> +	depends on HAS_IOMEM
>  	default y if ARCH_MESON
>  	select CRYPTO_SKCIPHER
>  	select CRYPTO_ENGINE

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

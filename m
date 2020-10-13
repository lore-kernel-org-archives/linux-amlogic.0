Return-Path: <SRS0=MZ2k=DU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81428C43457
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 14:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16899248A7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 14:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xlJcGKEU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16899248A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jRmwns4FB57mNIUttALwD345/cAwoXgOd80jGvJtAqk=; b=xlJcGKEUzNfiHK8NNxjVGB5zB
	TiUuJZWeFzVFWc/ohhdsTW+wxA5gT9FuPjOW8MYvM09yX+HIZWGP++OO/imZBfnG/zAmIDXZOnyyu
	Eg/2VhVqcL/Pdo6GzRNnvmUfDX/Jr33F+Q5A7PKbJIq5opB6KkHX9NPJEBq3WynJK6imyt4YiwLwV
	smRh/x8SlQE7tjXEav/JCQYH9SAOkFgIsEqUfnSVIwcsIRlXMVOFQhBb0bpvGpx69qUtqmUbtdRXl
	Kk/S4SUvB0ZiIIb3jiQVvubvpEqfHgVB0Td+LNfcO7J2VDfSqlIgOs35XUxdkXmOTY0tZiKu5ojAT
	rUa5VUckQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSLjv-00084p-LH; Tue, 13 Oct 2020 14:57:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSLju-00083u-26; Tue, 13 Oct 2020 14:57:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A01630E;
 Tue, 13 Oct 2020 07:57:20 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F7133F66B;
 Tue, 13 Oct 2020 07:57:19 -0700 (PDT)
Subject: Re: [PATCH] reset: meson: make it possible to build as a module
To: Neil Armstrong <narmstrong@baylibre.com>, p.zabel@pengutronix.de
References: <20201013133943.412119-1-narmstrong@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f8c0feba-c235-e22f-2ea5-61e54fe97c0f@arm.com>
Date: Tue, 13 Oct 2020 15:57:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201013133943.412119-1-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_105722_145925_18E14104 
X-CRM114-Status: GOOD (  21.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-10-13 14:39, Neil Armstrong wrote:
> In order to reduce the kernel Image size on multi-platform distributions,
> make it possible to build the reset controller driver as a module.
> 
> This partially reverts 8290924e ("reset: meson: make it explicitly non-modular")
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/reset/Kconfig       | 4 ++--
>   drivers/reset/reset-meson.c | 7 ++++++-
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d9efbfd29646..ab315617565f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -94,8 +94,8 @@ config RESET_LPC18XX
>   	  This enables the reset controller driver for NXP LPC18xx/43xx SoCs.
>   
>   config RESET_MESON
> -	bool "Meson Reset Driver" if COMPILE_TEST
> -	default ARCH_MESON
> +	tristate "Meson Reset Driver"
> +	default ARCH_MESON || COMPILE_TEST

How about an actual dependency like:

	depends on ARCH_MESON || COMPILE_TEST
	default ARCH_MESON
?

That way the option won't be presented to users where it's completely 
irrelevant, e.g. running "make oldconfig" with an x86 distro config. It 
always bugs me when I rebase a branch and have to manually confirm that 
indeed I don't want to build random drivers specific to x86/RISC-V/etc. 
SoCs for my arm64 config... ;)

Robin.

>   	help
>   	  This enables the reset driver for Amlogic Meson SoCs.
>   
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 94d7ba88d7d2..434d5c0f877e 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -9,6 +9,7 @@
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> +#include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
> @@ -142,4 +143,8 @@ static struct platform_driver meson_reset_driver = {
>   		.of_match_table	= meson_reset_dt_ids,
>   	},
>   };
> -builtin_platform_driver(meson_reset_driver);
> +module_platform_driver(meson_reset_driver);
> +
> +MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

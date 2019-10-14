Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBB6C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:41:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D9520873
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:41:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PA5JsibL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D9520873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aq80cD8M66jqo61FsbwHkAMRlpPK9WyZioPCnPT7yDI=; b=PA5JsibLCXK4xN
	Jwz7AB8hkbkFnsWFffRmM9mnakthGk2b9pHhPaaUwg0qddPB17RfNa5Qd2bTcHOXQJ1sZQ+xUO00Y
	R8MYaTJCW3i0TAtb3VobSvaAg0BpqWJ6syxI5BXkmnl9iobl4clp3v9UA9c4pk9cChUP1h0S5+izC
	QBkAEHLTNI+rGZmU6AXxHD5OsFr8tQijGMeM0sCDJxlfEeOkcyCdNfUitKNA6Rsj83VB7+6ykcxe3
	vB+bQGWYWCl+fzMeYh8wNbKy1Yg2v+tdQmtuMobEvQpHkDog5agUXWyF+xS2Fg9bvQvstDMbuQWHg
	l47LYld8KkcK8ih/Cxxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJt6i-0001Ms-W4; Mon, 14 Oct 2019 05:41:25 +0000
Received: from [2601:1c0:6280:3f0::9ef4]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJt6S-0001Ax-Ej; Mon, 14 Oct 2019 05:41:08 +0000
Subject: Re: [PATCH v2 3/4] crypto: amlogic: Add crypto accelerator for
 amlogic GXL
To: Corentin Labbe <clabbe@baylibre.com>, davem@davemloft.net,
 herbert@gondor.apana.org.au, khilman@baylibre.com, mark.rutland@arm.com,
 robh+dt@kernel.org, martin.blumenstingl@googlemail.com
References: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
 <1571031104-6880-4-git-send-email-clabbe@baylibre.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8f9be4a8-ed6c-a2bd-f3ba-df22752e7172@infradead.org>
Date: Sun, 13 Oct 2019 22:41:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1571031104-6880-4-git-send-email-clabbe@baylibre.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 10/13/19 10:31 PM, Corentin Labbe wrote:
> diff --git a/drivers/crypto/amlogic/Kconfig b/drivers/crypto/amlogic/Kconfig
> new file mode 100644
> index 000000000000..9c4bf96afeb3
> --- /dev/null
> +++ b/drivers/crypto/amlogic/Kconfig
> @@ -0,0 +1,24 @@
> +config CRYPTO_DEV_AMLOGIC_GXL
> +	tristate "Support for amlogic cryptographic offloader"
> +	default y if ARCH_MESON
> +	select CRYPTO_BLKCIPHER
> +	select CRYPTO_ENGINE
> +	select CRYPTO_ECB
> +	select CRYPTO_CBC
> +	select CRYPTO_AES
> +	help
> +	  Select y here for having support for the cryptographic offloader

	                to have support for

> +	  availlable on Amlogic GXL SoC.

	  available

> +	  This hardware handle AES ciphers in ECB/CBC mode.

	                handles

> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called amlogic-crypto.

That module name does not match the Makefile's name.

> +
> +config CRYPTO_DEV_AMLOGIC_GXL_DEBUG
> +	bool "Enabled amlogic stats"

	      Enable

> +	depends on CRYPTO_DEV_AMLOGIC_GXL
> +	depends on DEBUG_FS
> +	help
> +	  Say y to enabled amlogic-crypto debug stats.

	           enable

> +	  This will create /sys/kernel/debug/gxl-crypto/stats for displaying
> +	  the number of requests per flow and per algorithm.
> diff --git a/drivers/crypto/amlogic/Makefile b/drivers/crypto/amlogic/Makefile
> new file mode 100644
> index 000000000000..39057e62c13e
> --- /dev/null
> +++ b/drivers/crypto/amlogic/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic-gxl-crypto.o
> +amlogic-gxl-crypto-y := amlogic-gxl-core.o amlogic-gxl-cipher.o


-- 
~Randy

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

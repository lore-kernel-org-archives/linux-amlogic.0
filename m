Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D49FA3728
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 20:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016EB21848
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 20:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/A4kN5R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D0+TbLXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 016EB21848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yblgZ7RSedlcPyKBf5hbDPNkkxTU8jUnnXvHb2WM1Js=; b=q/A4kN5RAcrAs5
	V+557dzhpz6Cu/4DKz7Etxn+T6G5lDh+tQAXXPKlpe7RWqM2D1t5Q59sw0qPDj1vRVLxL+TdKXVOU
	++n4jdxY95v8dfflWnD5yC7I+dM4oxAK7f2HVsDoTtKMfjXew4CkMEmeC8H+stpZlVIVcMUY0xi8S
	d+F9WkDzLEMMnWGZ4RR5vYe15UPXOAs7g9j7dxUgs0ULeM6uSOeZzZEH9mgGwBu/tL6ITHYe0BIDx
	CDNG3Yvn0tGudmFIsyN7RL0wicsn5hlEOjzQrryLLMnWo4WNmaiWLaEpP25Fg4RH690ZAxU0lKFZC
	ku3lrYoewxC0hCqyf4Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKpoz-0002TA-MC; Wed, 16 Oct 2019 20:23:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKpeK-0006in-Kd
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 20:12:03 +0000
Received: by mail-wr1-x444.google.com with SMTP id r3so29513503wrj.6
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0edoD8qXLxIMb9lHusA8ctqCBdpgHnIWpnlud4IpS5A=;
 b=D0+TbLXKv4nLHH1PICBuG4OHzzfCNolpysA0NdqnggM3oNHvONZBsSdcdyYHeY9PTX
 BP6Q63iG+P0ZkFrmsMgZT2VJOejwCv/iBGW5e0FpACARXwR8xLRqsCvBYYKdlB1L+noa
 Lx/omyHvcnCfCbRtMo6vA/PY8I3hPfWaxFVsbLjbAfNU6LF/WG20V9YcGalaWYe7Hd0u
 EdO3lyIna8hymw4xsraJB5FfvRxQTbWl+aeoUziSGcsuQ2Edln+e7pMsaNFPqtxmKqEo
 p8/mYJAKLUed5W2eaIdkVXtkgFPBl/9U2+YXsjyAHA+8A0PaKzQC/8Q1eBg9jfscJ+Sz
 hVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0edoD8qXLxIMb9lHusA8ctqCBdpgHnIWpnlud4IpS5A=;
 b=ni38dOVqU2A8VzX+i20gKh4JHhv0QOEm8LGAdZNNlYh7AuH8xfZhrKwbo/PA0NLc+D
 5wkbjAhaZB16cf4DbjCZGgG3sKobwVj8QrnGMwH/CZ53Y8CU6vrjMkdcvHtTnPMWd5X5
 5uJep2WeLlFfFuBYVeFeZmGoEdTQVXAR58kqeSGP3uLkaf2ZNQSvkBdKA5pUA/Jt3+5J
 y0zPzcAWwxXrhZ+2zd9IyNhvf7EyNVnekvayL87WOi3crUuGUl9UOSx1LxBnTmqhVcku
 5fUjsfSs5iiH7/u/OQztXdHaSPs2+ZoBe2/9w+iV/3gvRixpzQwVMhmT5/dnmxRE6Vne
 aEAg==
X-Gm-Message-State: APjAAAX3quHjVwAjpKmObV0pV4bhbRqR7Y4uSOxMA0gcDV6oIWePEo+6
 6FBPBHY1AiEGrpLqMRPVmV4xtg==
X-Google-Smtp-Source: APXvYqw8vdKpG2sCTiy78c9P1m7wEQV56IyUIiYGlFpvMM6Z1PosXut/bgrU1zDYkR1e8mM7XnTE5A==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr4127114wro.229.1571256716203; 
 Wed, 16 Oct 2019 13:11:56 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id l18sm29539138wrc.18.2019.10.16.13.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 13:11:55 -0700 (PDT)
Date: Wed, 16 Oct 2019 22:11:52 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 3/4] crypto: amlogic: Add crypto accelerator for
 amlogic GXL
Message-ID: <20191016201152.GA31674@Red>
References: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
 <1571031104-6880-4-git-send-email-clabbe@baylibre.com>
 <8f9be4a8-ed6c-a2bd-f3ba-df22752e7172@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f9be4a8-ed6c-a2bd-f3ba-df22752e7172@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_131200_730436_1900404C 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 herbert@gondor.apana.org.au, martin.blumenstingl@googlemail.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Oct 13, 2019 at 10:41:06PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 10/13/19 10:31 PM, Corentin Labbe wrote:
> > diff --git a/drivers/crypto/amlogic/Kconfig b/drivers/crypto/amlogic/Kconfig
> > new file mode 100644
> > index 000000000000..9c4bf96afeb3
> > --- /dev/null
> > +++ b/drivers/crypto/amlogic/Kconfig
> > @@ -0,0 +1,24 @@
> > +config CRYPTO_DEV_AMLOGIC_GXL
> > +	tristate "Support for amlogic cryptographic offloader"
> > +	default y if ARCH_MESON
> > +	select CRYPTO_BLKCIPHER
> > +	select CRYPTO_ENGINE
> > +	select CRYPTO_ECB
> > +	select CRYPTO_CBC
> > +	select CRYPTO_AES
> > +	help
> > +	  Select y here for having support for the cryptographic offloader
> 
> 	                to have support for
> 
> > +	  availlable on Amlogic GXL SoC.
> 
> 	  available
> 
> > +	  This hardware handle AES ciphers in ECB/CBC mode.
> 
> 	                handles
> 
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called amlogic-crypto.
> 
> That module name does not match the Makefile's name.
> 
> > +
> > +config CRYPTO_DEV_AMLOGIC_GXL_DEBUG
> > +	bool "Enabled amlogic stats"
> 
> 	      Enable
> 
> > +	depends on CRYPTO_DEV_AMLOGIC_GXL
> > +	depends on DEBUG_FS
> > +	help
> > +	  Say y to enabled amlogic-crypto debug stats.
> 
> 	           enable
> 
> > +	  This will create /sys/kernel/debug/gxl-crypto/stats for displaying
> > +	  the number of requests per flow and per algorithm.
> > diff --git a/drivers/crypto/amlogic/Makefile b/drivers/crypto/amlogic/Makefile
> > new file mode 100644
> > index 000000000000..39057e62c13e
> > --- /dev/null
> > +++ b/drivers/crypto/amlogic/Makefile
> > @@ -0,0 +1,2 @@
> > +obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic-gxl-crypto.o
> > +amlogic-gxl-crypto-y := amlogic-gxl-core.o amlogic-gxl-cipher.o
> 

Thanks, I fixed it

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

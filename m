Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B389C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52ECA206BB
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GFh2wR4j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pqJjLkPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52ECA206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JswsTrW0GllDwtktbvsmjDou5bzSdtEQZdjO+Pzjp2c=; b=GFh2wR4jwk1vLW
	BUAmjjL1QE2guncpqFtmfHSxdCnQhFVQR7pVHGUPhqn5S/E8S1yfBtoljEDBp2m7IObF3c1P1oTGA
	wrLhrmn7wS8KCa2sUavE0dFe11UnzUb2642c0K1n5/GMo0wPTMEsfsViwj5FtmH22xCdDhHKpoIuv
	q95cibCsgB8RGVSkpKsjHtTk7VkkGBnxEmY5D3yoNXAEBG7EwfXIJit4210RmqByitCfk06lOMU5X
	0x0rtFKqHGEvNIBRHtZILvc56pJi/PjjRFy5PxFtsXe474w0MZnrWGeG59p+dTxgSACTaKnOO6uH5
	2L/qK5YstvDqMLXahmHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTQp-0000Kc-Hm; Sat, 27 Apr 2019 19:56:19 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTQn-0000JP-7F
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 19:56:18 +0000
Received: by mail-oi1-x242.google.com with SMTP id k6so5558016oic.4
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q9nFnukBcztno5ri1jckznxdxHQ3aJXeM2a654Thfkg=;
 b=pqJjLkPMqbgnK0WJSuUEYoescitzjb1Y5b/H0EwqnX8QLW3N70rXY3yBmwus37t7AR
 RGNVUdlWeRelnxVCZSDO3RwjZZBwxx0P43u3KowXf2HhTHZpUYUolqPkNhPtyMb9aRNI
 L7t2EpWcD0N3dzK77WjF6XxJHHSVJFua2cnXjBrP4+UD9aOtlUa0l8JpGJdpaeIRyg26
 if7yIGDJ4INPztRn61axvg6ZEyPoaWA9sW/nTRXeVfO/ndLirOs4QJ57Gce/KUeYUkQo
 kl23mt4Z4Bs5LxZ6na7ACY838U3V6ROJLytWQK5N+3ouSbAHS4FP3xiO13+D7wluPbWm
 fm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q9nFnukBcztno5ri1jckznxdxHQ3aJXeM2a654Thfkg=;
 b=UfIn/Jiyc1+EZ+XsJJOxTlnDMUO2MRIZB7drec+yx2M1CsMd2u8Zc+lirSoDwp4qZ7
 U5xxgq3QtlzLFso0ccZLoIwYC5oFEPJPI3lOqb9Bd0dpSxMQuXlIq7W25WgSbEdy3MPX
 XCFm080ythy6ZsMp9nQVh9EDfSkFd1X7IwFnVWR/np7R/PBVp+SLrkCblIknC7v05cNy
 WC59WMcraLB6zXuR8sdBb8lP8ZBm6SDRkNqg8TvPj0T8pTqclqNelgLsD7QWz28dcxRL
 rhOKxZEcJi6OayyYHGpFJps6nFFCE5AMWipwwVKQlvW/nfScXdhg93owrNm2BrT3zX9A
 Fahw==
X-Gm-Message-State: APjAAAUGtI/OgaXegKxrF44iZ1vMHBvgWaXi0ucQNHeSppbkndbARYMB
 MpesMtAb1tDjTjxt2P1TVVqQ57i7bubJ4HjPYfZdNE8i
X-Google-Smtp-Source: APXvYqy0qMwct+wA0tOyVb0ib4pQidtKK2ChUuSi3sBBjQlTS45HArmHzDL/yFiOGi7O2oxB/idSFkqNbQPHEUW/Fvg=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr11444991oif.47.1556394974763; 
 Sat, 27 Apr 2019 12:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-4-jbrunet@baylibre.com>
In-Reply-To: <20190423090235.17244-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 21:56:03 +0200
Message-ID: <CAFBinCC8hfFXXPhRP6A=wXpTrB=3=re=k_E-Ge+mStcjuLxCMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] mmc: meson-gx: correct irq flag
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_125617_264643_1A76ECA6 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> There is no reason for another device to request the MMC irq. It should
> only be used the MMC device, so remove IRQ_SHARED and replace by
> IRQ_ONESHOT as we don't the irq to fire again until the irq thread is
> done
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
I'm doing the same thing (for the same purpose) in the meson-mx-sdio driver:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

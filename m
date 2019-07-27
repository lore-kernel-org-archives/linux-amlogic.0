Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25161C7618B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08AB72070B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQkBKIwB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cG6Q289S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08AB72070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0J139+7mOSxwUzNTWK5BJAs9mvFw9mxwx/PLFQpmmY=; b=sQkBKIwBNxOPkk
	JlS8A7iR3Jk8Y8x2W43RAbGdX+36Wd9Quy48P7C5gMvwHStFM+qKupSx8z/Ltz78qNFUK+AtTPea5
	/TFcgclyOr0BMGQbWP1btDd83iRS3Mi/YY3pcw54Eu7JscAkAX3L23rZC6ENWCWkiSH+f5H9F5NyJ
	uaFg/D1W9xexrjr2rUzZvAMqf+iHHv8luJ6Kw4uhtK1Kkil3cMHUA0XOTSzukarOOgoUuCOowQ8Km
	FCuiamLb+Fdj1UirkodihzBIGcfHo5TURqR2ljVQn7nBqwgO7thmXZgz9IO8jsPVMTpTTcGF6e5Kv
	+JSc3rsEQUmZH9+Dn/SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrLe5-00046G-GJ; Sat, 27 Jul 2019 12:17:53 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrLe2-00045l-Oy; Sat, 27 Jul 2019 12:17:52 +0000
Received: by mail-oi1-x241.google.com with SMTP id m202so42160031oig.6;
 Sat, 27 Jul 2019 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNhzHRz2iYbGXTP3IdkSPFEl3dlcBhQ0pu5ysWhbMII=;
 b=cG6Q289SNMExyqzT4BzCmFr+agW8QLE1G4qTS2lsKXwVxXNT3vnliR9NUCiJkWb4xa
 vv0mIgP2g9+350JqUUFYxCyArFuss1h1e6tua1+bGGeJIhxODu3Ca8AYeU1w9FP/v8iI
 MhZRHQjeTZU9ZhOSTQHw5+MavL3KVbpg3gYGy75V492PRmtmOQP1h0HsWUIrqQYsJEE6
 VGA92fXomnLb+NbLAV1HnkMtcWqbTipnp/jgiQRN2/fkFoHYEBEpHZX99vlLQQe95XU+
 zY7eAKlSeOxuKctyhesPANP5vpf2YzPuKkrEdLbrHf10PIAjG8cms8yoMCAMLto5iGBG
 3UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNhzHRz2iYbGXTP3IdkSPFEl3dlcBhQ0pu5ysWhbMII=;
 b=hn4wHwKL0HsaFXXNXX7JUe76tY+ywVswfR59FA31nvHatDbPtKHgE1Fmhxe5l9j/e9
 xsslLhRe++q0oxJtqnIA0fQajShIJT3CDHwjQrzyl1VejVpygLXqtxnycFxA4CkElgNF
 qmOCTKeAQ8HHSbryM8+yYw5b7nuBi5BA7HSMPWBTfKT49W5deTX9mcjY4tA8yIxsT46G
 QImvU9MYvDLJif7yOgbc/F0oTuOgJBbXdZT607zIIPnW0rZRH2HfqSKP49V4wR4MB7Sp
 aoLIXdT0a459lNjU/Ii99fxVamsv6bGWnTyfaSlRBlNYHyqp8JUfd5oTjGIyGayCK7R7
 zXvA==
X-Gm-Message-State: APjAAAVcJsvMXi/SWlWSMlR+ezGejIntYqskaw3iEw8YW4lSaXA5QLT+
 z6PoM8fTUlsXr5X1ESmKTVj131ZWjuF1QSD7MkU=
X-Google-Smtp-Source: APXvYqwYmHppUXdfjPmHAHr52sRX654Hjj0LrUImUSO2z34wUj15h3dYIjxdcEN6XIljQQh4wx43Te/Ly0JritXHa9A=
X-Received: by 2002:aca:4ad2:: with SMTP id
 x201mr48673019oia.129.1564229869688; 
 Sat, 27 Jul 2019 05:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
 <1564083776-20540-3-git-send-email-clabbe@baylibre.com>
In-Reply-To: <1564083776-20540-3-git-send-email-clabbe@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Jul 2019 14:17:38 +0200
Message-ID: <CAFBinCD7pgUaBJgeGHTOu-uZRA9a6K2kxPsu+huKe23wcnKPoA@mail.gmail.com>
Subject: Re: [PATCH 2/4] crypto: amlogic: Add crypto accelerator for amlogic
 GXL
To: Corentin Labbe <clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_051750_812068_9B020CF1 
X-CRM114-Status: GOOD (  12.73  )
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
 herbert@gondor.apana.org.au, baylibre-upstreaming@groups.io,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Corentin,

it's great to see you working on this :)

On Thu, Jul 25, 2019 at 9:45 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> This patch adds support for the amlogic GXL cryptographic offloader present
> on GXL SoCs.
>
> This driver supports AES cipher in CBC/ECB mode.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/crypto/Kconfig                  |   2 +
>  drivers/crypto/Makefile                 |   1 +
>  drivers/crypto/amlogic/Kconfig          |  24 ++
>  drivers/crypto/amlogic/Makefile         |   2 +
>  drivers/crypto/amlogic/amlogic-cipher.c | 358 ++++++++++++++++++++++++
>  drivers/crypto/amlogic/amlogic-core.c   | 326 +++++++++++++++++++++
>  drivers/crypto/amlogic/amlogic.h        | 172 ++++++++++++
>  7 files changed, 885 insertions(+)
>  create mode 100644 drivers/crypto/amlogic/Kconfig
>  create mode 100644 drivers/crypto/amlogic/Makefile
>  create mode 100644 drivers/crypto/amlogic/amlogic-cipher.c
>  create mode 100644 drivers/crypto/amlogic/amlogic-core.c
>  create mode 100644 drivers/crypto/amlogic/amlogic.h
there are two different crypto IPs on Amlogic SoCs:
- GXL and newer use the "BLKMV" crypto IP
- GXBB, Meson8/Meson8b/Meson8m2 (and probably older SoCs) use the
"NDMA" crypto IP

personally I think it makes sense to either have the IP name (blkmv)
or SoC name (GXL) in the file or directory names as well as being
consistent with that in the Kconfig option names

(I have no experience with the crypto framework so I cannot comment on
the driver implementation itself)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

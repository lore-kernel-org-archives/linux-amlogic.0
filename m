Return-Path: <SRS0=iDid=3K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B5BC2D0CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2020 22:11:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD31824655
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2020 22:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RjSTQuHq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="s/rSw8mv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD31824655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=im/QkqopmLtjiLwM74dFDrveXUlirBUnyz/u+YcV50Y=; b=RjSTQuHqYz4/E5
	AAisd/srPJLBnmhZ8kMo/1EZfFnc7ErdF6bE8IumbTjNZ7gxYbgVrDxMXPeZuU2psHFsoxmsKGIEI
	ZcYb3SYEpc9f53+XR7Su6VT5xM90eSPuLUo68Tf33hWX75HYoow2VgNPrEC8A8tq2uhW7QuGDJMIl
	wfIVmbwBVcMjL0rmoaXe95vaaMVgPaDKYxRVzJf21VBdtCikyCQT6MyYKJ9r0Y74BEDmEo3iatq61
	8GoNCR8NOZGRIpfkucZabUUzwytwb/9OoF1o17ETLOj8jqI+SW9PkfHiPO6kWoPVlhGcBN7izNmVW
	Y5CY6nhi5gINZZv54BbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu1kM-0002WI-Pl; Tue, 21 Jan 2020 22:11:42 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu1kA-0002Mm-Sc; Tue, 21 Jan 2020 22:11:33 +0000
Received: by mail-ed1-x543.google.com with SMTP id r21so4706883edq.0;
 Tue, 21 Jan 2020 14:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x52RfIzWuhptiT6HtlO6I538NLkJPevuS3cIwYyZteg=;
 b=s/rSw8mvL48WPMh/ngVylCpVlto/w/+l5lPClTNQgf8CDydp9BA5lDSfeI1kWU6uHG
 +nNcYIO7Ec+B/37EzZnnAzaHWk8rXhIIWEpJrS4SBTW+VSPxVwoC0T2MgqNgkhyLq9ur
 sXrxGR+rzlid5R924smwd9wb1o3y6PWF9nRCkdfDNO47lnYRCW+iMnf2QUZ7KLXiiF4g
 ACFETfI7/6ZW/XcM55v/bWCZeS+noIhIpfUWyiWFshrbcEgv0qRlAoW+yD8F67NyYHGE
 IsCiVkI+FbIHz5detETS+LDAYI+hWa5kFOUTYXZysK3vuocEt4A27ojjizGTd8MpNjX0
 JUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x52RfIzWuhptiT6HtlO6I538NLkJPevuS3cIwYyZteg=;
 b=C0egbXCEkGilsM9fuTZFhVqLFjI2owj1AOGBsptozWMIn0HKytBU8L+YuTJiZBLZhA
 VsvbsnwVXXk5N/IM+yj7zLc/cNNNlKRa3wkEvjt/PaTk37TVFfol2/UgzMg+3Jn9p6AS
 /SFDRCducDWrn+7dG9E8W7dg5e6TrG4LUh17C0+2bzyYbPoAleHO/pHefdqP0d+tImsA
 +1Lk8biLcj/3A+2iemfwvN2PMMHto6Y8cT7CpE5E8dj2+KtvyyRkPLcMXT6yWIMB9YeP
 srTLgifGIRsPT83CESnEYsPXLd+8NYuUf6MuiIbtAMeiPCX36xEjE/cneCOtvGj+BjOX
 Vhvw==
X-Gm-Message-State: APjAAAWy+Zbbl3CESaKT7onvRjYaV5hyb2MFwc2jMoW2yFpsL+sHEhOg
 FZK+Xa2bGfkkzBABdBxCSWX4ImpfAtSXaeps7tQ=
X-Google-Smtp-Source: APXvYqy2Lvp66HQg3tF0U4y7uCLYIvj+NbcFeMsCn8O5mdlF4fZ8zrHwSodtdIlnVzrkNoyj9B2fqN0+7Jg90Y1Co7s=
X-Received: by 2002:a05:6402:221c:: with SMTP id
 cq28mr342907edb.110.1579644686374; 
 Tue, 21 Jan 2020 14:11:26 -0800 (PST)
MIME-Version: 1.0
References: <20200121103413.1337-1-geert+renesas@glider.be>
 <20200121103722.1781-1-geert+renesas@glider.be>
 <20200121103722.1781-12-geert+renesas@glider.be>
In-Reply-To: <20200121103722.1781-12-geert+renesas@glider.be>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Jan 2020 23:11:15 +0100
Message-ID: <CAFBinCD=LTAT-HQ+wSSmLQux+W5Y6vBju6RQDwf_1t1FhZoXgw@mail.gmail.com>
Subject: Re: [PATCH 12/20] ARM: meson: Drop unneeded select of COMMON_CLK
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_141130_950450_9F421659 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 12:47 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Support for Amlogic Meson SoCs depends on ARCH_MULTI_V7, and thus on
> ARCH_MULTIPLATFORM.
> As the latter selects COMMON_CLK, there is no need for ARCH_MESON to
> select COMMON_CLK.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
I assume that Kevin should take this through the linux-amlogic tree
(instead of someone else applying the whole series directly to the
arm-soc tree)?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

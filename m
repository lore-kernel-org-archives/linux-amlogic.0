Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE7C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E98120644
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UYl9iIhx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="b6p5/u/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E98120644
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so1AR2+IYZT/IamXqZaktGBRL8/GJwhQ+KvIX+ePEFs=; b=UYl9iIhxGLtVcB
	+R2RB2R3X4wl2wgeZaFuuh0+7jcrkNCIp9fzZBlIq9TapLl7fLMkq66FcixPj7G3aYE7vJwFwvN5k
	Vkt5EC7r3vrRPQ8wE9YTvOyrZiIZ50y/SS/EuNOIyqk7Qm/PWAXXcXfyhgrRBuuw5aIBG2mxLj7wz
	i6E8RCSA3auF4bpBo8xp8o7mbC2lsy+I4panT0LkB3NzzySpzpFReYM+oX5CeJdbdw/lm+Rc7bDPL
	wCYpbMTUQNUYIpQQcjzxQIJSbL2HxezXaV9UPa3LN0PCrDQrDSnxJ8adQAPdfx0e9r+vE+gM2s0db
	ahmcjNMdOI4xLeAEQVhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Xwp-00087O-BR; Wed, 21 Aug 2019 21:15:15 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Xwm-00086y-SW; Wed, 21 Aug 2019 21:15:14 +0000
Received: by mail-oi1-x243.google.com with SMTP id y8so2717498oih.10;
 Wed, 21 Aug 2019 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f11r5rDIrPHkeH+HjkUpHOS2su3knSlDIuohz37NErM=;
 b=b6p5/u/3tSHVdNTddkdJYeuyTycpn608S/Ffw98gMhYlEzN/fNlicwctGXe7dTarhI
 fhITIj0x8uY+xBequHvjilYoNHB7bIv8PpZ41t/jpuR219c0uoHLvEFnIlfTTB/PZi+w
 5xZ2XPDYoyFeLNvZRGi4+4vmaaudb+p+iZSvQfumNNG0+Q7CZbvBLb5F6JJVph51jmFQ
 /sAwC36dvjGgAl95/cBVtd4K3cYcU2fIN71oAyusPjTPA3yZZW0xVcZ1uWfKlUCMDlE+
 xjgrq+Z0NdrhEMhpSsTBVQBilY5FHB6zmcLZZWe8m0zJV0cASv9ZbtCdkB7M4cTwoSSE
 xojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f11r5rDIrPHkeH+HjkUpHOS2su3knSlDIuohz37NErM=;
 b=pGn0zsiFKbhaWSjYfKv9tgkgs9nR8KjeDU55sZWLEzxa8of57JJSd2HcXWhH+mThlv
 +jj2Uy1jc7oI1TpBEmATmj3Vg+Pn+LnRVDWGD6wb+a2lmLzOdoIULZQ7ofBa3tQXc5Ud
 aScR1vKJAxSJAYVMmYNyd8gKQHqvnwaqne4iwJZ9T9GOKL6LYDgygGhhzYv/lyrM5etE
 fC2RHehhKYyuiMiVnUQamssjxlx2XHHpZrAzlzEUeZSievnHWvhtL7SO6TxGkkG7BB74
 /sXR0PjxmPG/2MwCAZpVujSjWPI4Mum4wauSKN96tDNtKNARnGWakmjJP4F3NuhQGJpJ
 estA==
X-Gm-Message-State: APjAAAUBpEVuD2wnooGiFBVM93/XPXXmjRS/eS1pS4agFP9IvidmmEdt
 Pq/uMHtoNcAX+VV8H7JpOuFh+BmEyWBWvSzBgQwXOGaS
X-Google-Smtp-Source: APXvYqzWYLbDJgY7jblPNDvJdCDNspP35RWDkTdkhOJypCJj8+By07BAkOd+Pc2Ew6gsVJok0cawdVBqY3xnEvZFnyI=
X-Received: by 2002:aca:d650:: with SMTP id n77mr1514987oig.129.1566422111539; 
 Wed, 21 Aug 2019 14:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190821142043.14649-1-narmstrong@baylibre.com>
 <20190821142043.14649-13-narmstrong@baylibre.com>
In-Reply-To: <20190821142043.14649-13-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 21 Aug 2019 23:15:00 +0200
Message-ID: <CAFBinCAb+mxh_FPa4P8pe4gGEACJD8qH+jJMb7b9pd8nAt5hqw@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] arm64: dts: meson-gxbb-nanopi-k2: add missing
 model
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_141512_920513_DFF4346F 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 4:24 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-nanopi-k2.dt.yaml: /: 'model' is a required property
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

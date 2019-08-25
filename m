Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17758C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 20:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC43D20870
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 20:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5rkZcgY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F2OO1oz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC43D20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvTDEdHbIncB7eLvvnMQgR/i5FDNLyvelxD5AurCi2c=; b=i5rkZcgYK8/My5
	GmOVKNshnsf8/S1H7GXGi3kWmHBjMGEb/gpb66VKv2HVZ/Wdi4q5zXcpCe84GOWe0InPNXjIPkerL
	23zmf/AYH0vtR2IyeDDmol/O+l0IdfKXQ1FSFQA1a2S93cbrx9iDHHe3ehw0O1Y/iHcKBWZXkibjJ
	HoVEU0VrYWfIhMVKIOcliStkoL7UUNLUfavnOI07HjQMbP2ZBFD8cHk1HBTCbEgG65tSCT+wfjSB9
	U3BqZZHgcB5c0nxNHPL+4/crxoK6WVK+NBSqup+XdtxgD9CFk9dPzmsKN1zEop4zxAQV7UPpKFgdM
	1MLudDC1hFgyLdE0QNJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1ygM-0001U1-Dg; Sun, 25 Aug 2019 20:00:10 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1ygK-0001Tf-DW; Sun, 25 Aug 2019 20:00:09 +0000
Received: by mail-ot1-x343.google.com with SMTP id f17so13340302otq.4;
 Sun, 25 Aug 2019 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXY+vp9jRGpj9AwVjvaZbbtqnQMg4LrCQrKGAkuzItM=;
 b=F2OO1oz7p1xplg6LJMZYwvRm0fnVwDnp6BRBhYp0l8A0qZjst2X8KsuaKIMIkDoZEQ
 pCHsZ9rC94kNLoL6YSH6/UWkUw1spBjrUwNIBJvzjRCuxSBZse74rLt6T3Jx9ngLcKtc
 H/yi/sDUOMb3elM1YnWXXuYV8esWMdW4hvGp2i90GxJGo1wxktZINaHPZiQcJVgnRdVV
 LL9oSNIQr/Vg0fd15sq9o34SjRfS6hwtW68De9wkPWyKiUewd5+ODOJOcUwRzwb+LhBx
 +r6b7s9vRhtciZ4c5Zu6Uj4vwu4f1icD7pmiOm8XkYCAHbnwDvMuzXYE7u8lXOrfH8qp
 bxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXY+vp9jRGpj9AwVjvaZbbtqnQMg4LrCQrKGAkuzItM=;
 b=N6zQQQkkoXwe8IHNreCwdKmfBp5WaW7Cg8RbY7pJqxSX057WMj2QQ7zG5AEpvNkae0
 j3J+ReNRqT1KyN0TgWgW79A9BUI9rqdqnYsin35krgN0d7PBzWvpDLOuCjTQcm349vgk
 wY3pp60mMEvPo/RlcFcBzYIguwBgzvNTa7aGG4lexO4T+RooIvSF0A6ryDH6xQgkufTA
 LY7NoWEztS7aosGp9O5EGhIXcP6qjfEUrZ4CEssU5Zz9RzN5+a9muChU2fu6871woHbm
 16WPcif2tzNS3jylLUjlOWt/7zQKN+XIaVUCAu2fCTx6g5pWG1tqzIslfvHY5RfFMxCJ
 IiwA==
X-Gm-Message-State: APjAAAVKK10CbxX5SWRf+qAEKhsYlXkOmXil/Fm5Ssi6V9q7wWOuahw+
 W1DMnghhVGrrMIce30ET221CcNtXa8lizW4rEKE=
X-Google-Smtp-Source: APXvYqyZu4IJ7I+DpLeCK6W/EgEKtsIl2fZBrWMoOYcz2co8fxVnv4eQJJUV/XDH381rnV0JfTwdjzjeHaJs5fJoXAg=
X-Received: by 2002:a9d:7b44:: with SMTP id f4mr3819368oto.42.1566763207717;
 Sun, 25 Aug 2019 13:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190823090418.17148-1-narmstrong@baylibre.com>
 <20190823090418.17148-6-narmstrong@baylibre.com>
In-Reply-To: <20190823090418.17148-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Aug 2019 21:59:56 +0200
Message-ID: <CAFBinCDjO2sWcE8hmPfn1vsar52yeeTVAZaYJ6vR3rXaVJQQPg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: meson-sm1-sei610: add USB support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_130008_485590_70CF5E3B 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: ulf.hansson@linaro.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 23, 2019 at 11:06 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the USB properties for the Amlogic SM1 Based SEI610 Board in order to
> support the USB DRD Type-C port and the USB3 Type A port.
>
> The USB DRD Type-C controller uses the ID signal to toggle the USB role
> between the DWC3 Host controller and the DWC2 Device controller.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
(based on the patch description as I don't have the schematics for this board)
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

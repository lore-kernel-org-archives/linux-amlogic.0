Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858DDC7EE2A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQZFsw7KSEdUdNlLw8z6ls2+8tpLvY0IZjZzA1MwKK4=; b=tlZoC7TO6zHehB
	jMhoVm1U1atSC6NOZbSOF4OccVAfAXxulF9XKa/fz6ZxUfIrFAydMtWulLE5+NOI0dshCgFwGIKj4
	1B4IeEvdUFvOkbod9VAx+YzNuONCnDEdHhtYfrynmuxhlVzEDORiZdhWkh+b5u0PXTRdUraDDcCgG
	H199j/viPmonQwnXCvjx4oh2KhkaMahe6/uM05IdKgpN7PDw47hACTnGReFQLW99GHB0icIe1GePZ
	GP3HCCaMAZ8pqc5npGyu3IwSN/z6xAxvNvzKqiP0xvQPzDyJMA5ddWb4NHIh76ByXeFPCh6uf1rTR
	QTTZztRMbOpiT3TAM3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6c8n-002usk-08;
	Tue, 06 Jun 2023 19:14:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6c8j-002ur3-01;
	Tue, 06 Jun 2023 19:14:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-970028cfb6cso1075980066b.1;
        Tue, 06 Jun 2023 12:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686078881; x=1688670881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SJEaV8T/sYYCwdM8Gx2yuajVAOxeMIbe0SRp4ADBgM=;
        b=omnYlGR/GNyTd0IiUcIrv5Z0/d4ZIfPzPgWmMjdUi3mIjPrO+pvqdgaV6U8U6RitAj
         rk+PvSopMXP0QgDe33krTiaSElPbAAo0k/POIhOu7UJ0euj68r0VrhkI5guMWb7Nwat0
         ymhfPYOTydjhu4tNBC/w4z3nX/D8kZJ/Lj1SIazbquP34Pu9CFqPDq4gCtnN6uEO8L8q
         F1cLUKhfb9KOYLPUTZrohGwxRuli1wD0nqOITn3ZRRrfwzGBmFBqjCfHuKp0D/6+wkLM
         +f2WWf/guPHFWHTyRwBTwKNPaVSRRPAKWv1PKpylHl864JdMgnw9ktb2YRgrWJqiVjPg
         bHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078881; x=1688670881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SJEaV8T/sYYCwdM8Gx2yuajVAOxeMIbe0SRp4ADBgM=;
        b=SbP0K3TM5hbEiTRsSVlhR0GEubsnxhC3qo6DUZliOTKj6jjBKd32h8RhxO8KkgIo/y
         uZsC2PMmQ7LxGaqqlAz4H3fdL1u0/ndSUPCx0jflSqfN4FjwUaNnzndEsHcVo6psElXq
         ujIbYkb7qu6m3wMEF6oDbdf0vqJbE/wf6TskBsITNlpZ3tNghWz4inG0WcLKzdaAuAI5
         VkQAF31P6hxNQxReIErW+jcSYTYztppYnppyxsE2A3IXjU43hXt287sIoH/LuIA45CqT
         TnBNglpqlSE3T3e3ZdViXG0bDKC6I0/ve6UEmmfsQIeY5aeT+Uh/PGw3FBKteOqFgAJQ
         XBbg==
X-Gm-Message-State: AC+VfDwFYpeSRYIUvPsvArNLki6FfMaImeOKJt244DoXG3yYPfur9FnK
	YcifSQ6vkVTM1qfx8Tsu2X3I0Qbkj1/U4lDH8wY=
X-Google-Smtp-Source: ACHHUZ4VYL03ivVNoI46To2Gjh7laENXTsosnF2kr0WLbdADTsBChuCXHWGzOLkkOrIgSRFMhq4NALegpRF94Ir9Z0A=
X-Received: by 2002:a17:907:9721:b0:94e:2db:533e with SMTP id
 jg33-20020a170907972100b0094e02db533emr3738942ejc.49.1686078880474; Tue, 06
 Jun 2023 12:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230606165357.42417-1-gnstark@sberdevices.ru>
In-Reply-To: <20230606165357.42417-1-gnstark@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jun 2023 21:14:29 +0200
Message-ID: <CAFBinCBzrXpfzNb9COVHg13uCmXTBhnS6YLVyFR=YCkj9v-ypg@mail.gmail.com>
Subject: Re: [PATCH v3] meson saradc: fix clock divider mask length
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, andriy.shevchenko@linux.intel.com, 
	nuno.sa@analog.com, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_121445_050446_3B3534C2 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IEdlb3JnZSEKCk9uIFR1ZSwgSnVuIDYsIDIwMjMgYXQgNjo1NOKAr1BNIEdlb3Jn
ZSBTdGFyayA8Z25zdGFya0BzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4KPiBBY2NvcmRpbmcgdG8g
ZGF0YXNoZWV0cyBvZiBzdXBwb3J0ZWQgbWVzb24gU09DcyBsZW5ndGggb2YgQURDX0NMS19ESVYK
PiBmaWVsZCBpcyA2IGJpdHMgbG9uZy4gQWx0aG91Z2ggYWxsIHN1cHBvcnRlZCBTT0NzIGhhdmUg
dGhlIHJlZ2lzdGVyCj4gd2l0aCB0aGF0IGZpZWxkIGRvY3VtZW50ZWQgbGF0ZXIgU09DcyB1c2Ug
ZXh0ZXJuYWwgY2xvY2sgcmF0aGVyIHRoYW4KPiBBREMgaW50ZXJuYWwgY2xvY2sgc28gdGhpcyBw
YXRjaCBhZmZlY3RzIG9ubHkgbWVzb244IGZhbWlseSAoUzgqIFNPQ3MpCj4KPiBGaXhlczogM2Fk
YmYzNDI3MzMwICgiaWlvOiBhZGM6IGFkZCBhIGRyaXZlciBmb3IgdGhlIFNBUiBBREMgZm91bmQg
aW4gQW1sb2dpYyBNZXNvbiBTb0NzIikKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgU3RhcmsgPEdO
U3RhcmtAc2JlcmRldmljZXMucnU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

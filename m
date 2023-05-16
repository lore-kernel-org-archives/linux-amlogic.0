Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91173C77B7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVXVCwoofqWaYSYb5uN8DCWCMvksG+S9dlSQK3dSPvM=; b=3x8eXAWZePCoKv
	PdlsNHaCdjrhL3uaF8/2YTsBHu+fRhTPIZTezZDVokpotdztLzRsxIlhOcLkFUm9bfjrBnQDr7/fd
	Iw9/28RN5ySumOXSSFy2YU3ZzhbqED8XbSKm3488QBPICttxqUXV5vX2+xVUZg8n2b4O0F0oF1y6x
	s/8evjk+zv1XpVfpSNaxJWyLZ9iQq8NsxB96pNULCQDiYZ8lhWXvkRykFQzU34ecmBirSjO3rnQL4
	P2tsOieEWAO7OK0xUC/SUAQfzz/faIZLSx1Sw3RjhLhdRdVqe48oG8wNGWMUP6aHiSrPSZlGTZwA4
	zWuXzvp1KCSVC+qr0WIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz02N-006sAk-2C;
	Tue, 16 May 2023 19:08:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz02K-006s9A-1e;
	Tue, 16 May 2023 19:08:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso26778342a12.2;
        Tue, 16 May 2023 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684264118; x=1686856118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WtzMLu63pIrTGFp+PcKVzZjdLbw2sc1wB016+LNuaU=;
        b=UTDLK4JBXJdCSsteU249UG5b0kr62BoJEtt/hUKzhj09Rr78qyUa3slTquGZhGkZfM
         RV3BAbyoQTatQUS66ycgD0Vgk/MwBEo/LrszGnPA9OWAD9FNg6v/JQa8WB1fssf6MB18
         q1xJj4lraxXhLckehH06aljsrrPcycuHHoJTYu4gWc3t/pmegbfL2HpkvcnQClUNfO3m
         ixnRtgW8ffIddpC9fdnetEZyCUk9yhhv7tPI5TCVK7/rEFglF9IfoQ3K0n5ekMpl29qC
         r+KM2Dd4DuhPXWoHd4Ee3jO9SEfR6JF5FxTgLQx/pXso3EqL6ZYuRzWdvZelCYeL4oDa
         Ge0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684264118; x=1686856118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WtzMLu63pIrTGFp+PcKVzZjdLbw2sc1wB016+LNuaU=;
        b=HqR6a/cZTkTXsxLG13sUzeugGyeKtMOTm+BtYTsnhEyyT97L9741tVxKbp7sbpwgqc
         2tbb3osJH0BHklrQO8gOrCXxpa4eQs3hoPXDegFZ6FKVjxxnTpJUwPb3urnXe+BRFPXA
         74Gh/AnOOUap9Z7bKfvRix14hu7kcz8w9dZHi4MAEL1ZB6Xl7iP26LF9A7A1Igccxv6o
         h59nflfb0KKkHBkF6anwzido41KDMSXOd9OH9KE73dovCVdoArps74GMMmrpASBjlxKH
         DCWdvJQqdoe/pKcvzaXZERS/Oqi8bQu4rP31qqRxmB++JxKoTwBFDwzBjsleUDtT7tD+
         prMw==
X-Gm-Message-State: AC+VfDyCSJmHy5pEc92HbJ3p9XNOmT19M6R9zjkVkAL+YUmlEytCCwnm
	/0N5y8BFCa1nvULy0F0JveoicmXtZN1gDZ6PdsE=
X-Google-Smtp-Source: ACHHUZ4eC8eESbfjQaOZgv2ujRD9L5D7PpQo/8swdsxdY5pdDtBYJDm7UhynpXSDjE2x5IatL1oZ+1rsKe2dYgWqwRg=
X-Received: by 2002:a17:907:c1e:b0:94f:250b:2536 with SMTP id
 ga30-20020a1709070c1e00b0094f250b2536mr36485052ejc.28.1684264117702; Tue, 16
 May 2023 12:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
In-Reply-To: <20230515210545.2100161-1-gnstark@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 16 May 2023 21:08:26 +0200
Message-ID: <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, andy.shevchenko@gmail.com, 
	nuno.sa@analog.com, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_120840_546603_30A75606 
X-CRM114-Status: GOOD (  10.24  )
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

SGkgR2VvcmdlLAoKdGhhbmsgeW91IGZvciB0aGlzIHBhdGNoIQoKT24gTW9uLCBNYXkgMTUsIDIw
MjMgYXQgMTE6MDbigK9QTSBHZW9yZ2UgU3RhcmsgPGduc3RhcmtAc2JlcmRldmljZXMucnU+IHdy
b3RlOgo+Cj4gRnJvbTogR2VvcmdlIFN0YXJrIDxHTlN0YXJrQHNiZXJkZXZpY2VzLnJ1Pgo+Cj4g
QWNjb3JkaW5nIHRvIGRhdGFzaGVldHMgb2Ygc3VwcG9ydGVkIG1lc29uIFNPQ3MKPiBsZW5ndGgg
b2YgQURDX0NMS19ESVYgZmllbGQgaXMgNiBiaXRzIGxvbmcKSSBoYXZlIGEgcXVlc3Rpb24gYWJv
dXQgdGhpcyBzZW50ZW5jZSB3aGljaCBkb2Vzbid0IGFmZmVjdCB0aGlzIHBhdGNoCi0gaXQncyBv
bmx5IGFib3V0IG1hbmFnaW5nIGV4cGVjdGF0aW9uczoKV2hpY2ggU29DIGFyZSB5b3UgcmVmZXJy
aW5nIHRvPwpUaGlzIGRpdmlkZXIgaXMgb25seSByZWxldmFudCBvbiBvbGRlciBTb0NzIHRoYXQg
cHJlZGF0ZSBHWEJCIChTOTA1KS4KVG8gbXkga25vd2xlZGdlIGFsbCBTb0NzIGZyb20gR1hCQiBv
bndhcmRzIHBsYWNlIHRoZSBkaXZpZGVyIGluIHRoZQptYWluIG9yIEFPIGNsb2NrIGNvbnRyb2xs
ZXIsIHNvIHRoaXMgYml0bWFzayBpcyBpcnJlbGV2YW50IHRoZXJlLgoKPiBGaXhlczogM2FkYmYz
NDI3MzMwICgiaWlvOiBhZGM6IGFkZCBhIGRyaXZlciBmb3IgdGhlIFNBUiBBREMgZm91bmQgaW4g
QW1sb2dpYyBNZXNvbiBTb0NzIikKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgU3RhcmsgPEdOU3Rh
cmtAc2JlcmRldmljZXMucnU+ClNpbmNlIG15IHF1ZXN0aW9uIGFib3ZlIGRvZXNuJ3QgYWZmZWN0
IHRoaXMgcGF0Y2g6ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=

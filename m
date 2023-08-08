Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EFCC001DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 05:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRDPDEa79IAp5vLN7+3RHC+5v46mJ4EyntiBU9mBK5w=; b=18xMeT5BkSf0E0
	i3FuEeZNlC+9/Us58+KgJM6alAnxME+oFh2PDT0FvC7DL5K/ZCFX8akhJ1fQ4xLxrEWb4BlLvsoBU
	macX0GC7lHI1Qr34yUi7Acv2bV7aAdcPybFBtbIR4b0HZUYl5o92SJCiv7XQ2LaQ8rYKpxa8sjFXi
	XROWpOViVkkYLyRNNjQqJcHuEEiq59rbn4mo9C5P6W3IQvNOv1KBTFZqTZA70IY5qj3UUtGGbkgoY
	g5ntGOotI/tOiCgMmdRLc78CBDWHTbIrVS1IkZBY+3WhwZx3DjdKzSzb616+SGtuk79IdBLgWxMA8
	n4JJvjjnil1cBm+T4N+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFM5-001lQV-1C;
	Tue, 08 Aug 2023 05:34:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFM1-001lPu-1a
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 05:34:02 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9c55e0fbeso81063081fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Aug 2023 22:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691472836; x=1692077636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGhuIKV/L3bAbsUWL0BAHFtTykQxuprzMPnTwpvh1C8=;
        b=ZzKJT5ZZVfhoToZLlswA83n7QV42qSdr2/+YuxTVRRqecaGBf7w/icg9odRNfqOXW5
         IFtkVN8SDqvkxjglqZx9znqKgaP8UBfaFhASx7FLFf4ZW+vAnePQ9c1LuuWoX8E8HJ+4
         F0Zp66tGuzPQXIdQimz9ZXkgXK07RLx4lxgS1HdJqhMi+B3SaiVVJYNUspyZGXowwflS
         BPY6iBfFYFX5qAm7i+SSIPM1ysR5shqjso9RqvD9ZLe4+9h8gsQS3noxxqwG/8+mK7cp
         Ciib5Q84GhHVVQ1PQ39oKlKZ/7CK9VaUjnjfNaR0nhfEAoWncTZCeZOpskL2DyWp4P3V
         3RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691472836; x=1692077636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGhuIKV/L3bAbsUWL0BAHFtTykQxuprzMPnTwpvh1C8=;
        b=VnG1ykKKiSkuwq23hNkm5J5AUWHmW02n/63XZA0AMY11cf39ohC1Uo0DzumIQrL21/
         XJk8cavo0dfE7tHIt5IxetC07Dm+dZy1tbXuSx5uZCrE0bxSsUDZAllXluaU9trBMzLV
         qZMreefiz+ku82DXlAmKAzNqNbbybzOD0cLlB7YMBa7JPPO0UomlxtCHql9BiLOeiaVE
         EVRLgqT1rDRiGQNaTWgO0RKu9Jlts6AMTKJ0JX9CUjdRlxptae41L00pYiIWvPfZ2Qa9
         0YP9IRcYrdkqox9Gud0UAmT3/XxXOEFP3fHKqGnnEH3FhxYywRpbpxAXcEXD84u6SIDb
         xcsw==
X-Gm-Message-State: AOJu0YwT0V9Rk+PR9PDP3oyQOoGNItfKsT+k9VR2YJcomFxDTT06yZ0s
	3FnUWlOnO44+e4Co+YSYjKhNevKAUdO3LZEqTGOc
X-Google-Smtp-Source: AGHT+IH55JKIqgT6Ka9IEuC2AaX5V6W9W2P33HjRg8M3EvAK1ZRJKlSCDPgy0lTJ5+Q1iHi68i4Q9DYZvDifVThfZ2E=
X-Received: by 2002:a19:ca09:0:b0:4fa:6d62:9219 with SMTP id
 a9-20020a19ca09000000b004fa6d629219mr7169552lfg.62.1691472836351; Mon, 07 Aug
 2023 22:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230808032510.31754-1-luke.lu@libre.computer> <2023080851-duh-scroll-09bf@gregkh>
In-Reply-To: <2023080851-duh-scroll-09bf@gregkh>
From: Da Xue <da@libre.computer>
Date: Tue, 8 Aug 2023 01:33:45 -0400
Message-ID: <CACqvRUaK_Pj1DT4QY+YpKmvGeFqmM8KPcYWqTLNJoUJJaEbFAg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luke Lu <luke.lu@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Da Xue <da@libre.computer>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_223401_604713_FF3CF1E8 
X-CRM114-Status: GOOD (  13.82  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAxMjo1NuKAr0FNIEdyZWcgS3JvYWgtSGFydG1hbgo8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMDgsIDIwMjMg
YXQgMDM6MjU6MTBBTSArMDAwMCwgTHVrZSBMdSB3cm90ZToKPiA+IERldmljZSBjb25uZWN0ZWQg
dG8gdXNiIG90ZyBwb3J0IG9mIEdYTC1iYXNlZCBib2FyZHMgY2FuIG5vdCBiZQo+ID4gcmVjb2du
aXNlZCBhZnRlciByZXN1bXB0aW9uLCBkb2Vzbid0IHJlY292ZXIgZXZlbiBpZiBkaXNjb25uZWN0
IGFuZAo+ID4gcmVjb25uZWN0IHRoZSBkZXZpY2UuIGRtZXNnIHNob3dzIGl0IGRpc2Nvbm5lY3Rz
IGR1cmluZyByZXN1bXB0aW9uLgo+ID4KPiA+IFsgICA0MS40OTI5MTFdIHVzYiAxLTI6IFVTQiBk
aXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDMKPiA+IFsgICA0MS40OTkzNDZdIHVzYiAxLTI6IHVu
cmVnaXN0ZXJpbmcgZGV2aWNlCj4gPiBbICAgNDEuNTExOTM5XSB1c2IgMS0yOiB1bnJlZ2lzdGVy
aW5nIGludGVyZmFjZSAxLTI6MS4wCj4gPgo+ID4gQ2FsbGluZyB1c2JfcG9zdF9pbml0KCkgd2ls
bCBmaXggdGhpcyBpc3N1ZSwgYW5kIGl0J3MgdGVzdGVkIGFuZAo+ID4gdmVyaWZpZWQgb24gbGli
cmV0ZWNoJ3MgYW1sLXM5MDV4LWNjIGJvYXJkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEx1a2Ug
THUgPGx1a2UubHVAbGlicmUuY29tcHV0ZXI+Cj4KPiBXaGF0IGNvbW1pdCBpZCBkb2VzIHRoaXMg
Zml4PyAgU2hvdWxkIGl0IGFsc28gZ28gdG8gc3RhYmxlIGtlcm5lbHM/CgpIaSBHcmVnLAoKU3Vz
cGVuZCBkZXZpY2UgdHJlZSBmbGFnIGhhcyBub3QgYmVlbiBlbmFibGVkIGluLXRyZWUgZm9yIHRo
ZSBBbWxvZ2ljCkdYTCAoUzgwNVgvUzkwNVgvUzkwNUQpIHNlcmllcyBkdWUgaXQgaGF2aW5nIFBT
Q0kgMC4yIGFuZCB0aHVzIG5ldmVyCnVudGVzdGVkLiBNb3N0IG9mIHRoZSBzdXNwZW5kIHJlc3Vt
ZSBjb2RlIHdhcyBvbmx5IHRlc3RlZCBvbiBuZXdlcgpHMTJBL0Igc2VyaWVzLgoKVGhpcyBhbmQg
IltQQVRDSCB2M10gbmV0OiBwaHk6IG1lc29uLWd4bDogaW1wbGVtZW50Cm1lc29uX2d4bF9waHlf
cmVzdW1lKCkiIGZpeGVzIFVTQiBhbmQgRXRoZXJuZXQgYWZ0ZXIgcmVzdW1lLiBIRE1JCnJlcXVp
cmVzIGFub3RoZXIgZml4LgoKSXQgd291bGQgYmUgZ3JlYXQgaWYgdGhleSBjb3VsZCBnbyBpbnRv
IHN0YWJsZSBzaW5jZSB3ZSBhcmUgY2FycnlpbmcKdGhlc2UgdHdvIHBhdGNoZXMgaW4gb3VyIHRy
ZWUgb24gNi4xIGFuZCB0aGV5J3JlIGFwcGxpY2FibGUgYmFjayB0bwo1LjQgYnV0IEkgYW0gbm90
IHN1cmUgd2hhdCB0aGUgY3JpdGVyaWEgaXMuCgpCZXN0LApEYQoKPgo+IHRoYW5rcywKPgo+IGdy
ZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==

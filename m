Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1310EC001B3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10Nk6cLnZGh83bo/gBEszy3k/Cj4p+ZJ1447msM3Lfs=; b=4wHppLFelono4o
	fn4lbVUWVRXu+sI1BCVFNOV+dTbHjisVgqqoTkA7pWa64n7J1e5Y/E1K5XDz5twilSX8QhT2xrKd5
	y8yzGYgUNChVe6gJWfLiUZW+NwIJ71tWKjmsDXpBtzT5pEug/uemLtxN3NyPmCvZQgBkMdscm4KlY
	w05W17zaUJrVmkhhjoNw8JlUbKG37oWvJUklwsjBSQVWgnQRFmrcOP/gnArotAwitW6l1nhwS5GZH
	vl/FSl0Tu6u2nbt3XoMZ4xrr6NuZuymajSZA3qidpwy6R1CCxoKGx0ejSOaDGGgMrxVeFtTRtlBaX
	FDagcLniPRdmbWyGNJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGPRb-00BJW5-0e;
	Mon, 03 Jul 2023 19:42:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGPRX-00BJV3-2K;
	Mon, 03 Jul 2023 19:42:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9741caaf9d4so419756866b.0;
        Mon, 03 Jul 2023 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688413355; x=1691005355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHpbgFKpTD8xyMMsUKJDP7HTZGPJXYiLdAwhhyFxXzY=;
        b=dhUIdSVuPvke3OcqobcMYvUxlZOEnd7zXrHUiOCrzFwD1BnYRl+ejs1qZUqo+s2ivA
         Ldj6xb4nF1Gdu+uPMp1Rcagpn5ztvr5+f4rHr3kIjOVYw/PVHCM68wNi/tuTN1AkXZ4R
         yUWHREjXCIAoKSWiyylyt0SC7xDLqL5y59h624IxOqnKczAfQ0w/0ec8QcyWlDE8q+mG
         n89aaTlAex0IaFb9hChVxTATNNFBHX7iVXFjlCMMNYle7KpRj2ONcYjES1p2Z2yVjuhS
         ubt81BBtjMrcU/hSEdM0FFQJAHiDI8xY+JjcHQTdAUAAfjbgq1p7z0LQzupWtCjopxS/
         qkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688413355; x=1691005355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHpbgFKpTD8xyMMsUKJDP7HTZGPJXYiLdAwhhyFxXzY=;
        b=TmJ2RWlCeeKMMPBO66/MqCd8TW9qdzyUCPC1GegXF8kl+TFuN9pgPdioYzd43+dfTP
         kao5D1mhPbkcKWyEj53jxpfdLPhxx+Xg5vbR6TOrM82sCHAR+CkJoI2t0nqaFVnS0a3R
         JLuHZie1JhFmSWhjjFMJgCDVIZyBmpkV/zvWE+5jKgsALdEaIaYkvpMJ9nVJmPV2MOb1
         G4peGey8+h66SfaufUXc4ovi3O6LRUL+w9Htse94r7Hn12WAuO23ET3otEoAdt53EvOp
         SaoWxN/KsqGQzbVyUpjduOMVgoEQMW+4Tb0Wi1FboYEUy7oSz8STovJijLzqzaMKVdlB
         4Zdg==
X-Gm-Message-State: ABy/qLZBprEWvj1hTQhqpZaJ5epDciDGw1e4P42OP7+Jp74KgJje0ZeF
	GsIjEnyGUPohqzz0ezDW7vnmb6gCWLLutcZpc2s=
X-Google-Smtp-Source: ACHHUZ5bc6b1LsZSjCtzxjl5rhDrJGvOmXYyTdGOEXruOouI2c8QbFGzhwvOKHtrOZ+AIBlJX+hBQ/tkr4Xx64GJJII=
X-Received: by 2002:a17:906:5fcf:b0:986:f586:b97 with SMTP id
 k15-20020a1709065fcf00b00986f5860b97mr7738475ejv.59.1688413355077; Mon, 03
 Jul 2023 12:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230630121059.28748-1-zelong.dong@amlogic.com> <20230630121059.28748-3-zelong.dong@amlogic.com>
In-Reply-To: <20230630121059.28748-3-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Jul 2023 21:42:24 +0200
Message-ID: <CAFBinCCpK_YWZqP-YX4hNdRHprckcSvVJ7e-Q3tzfPabWULTNA@mail.gmail.com>
Subject: Re: [PATCH 2/3] reset: reset-meson: add support for the Meson-C3 SoC
 Reset Controller
To: zelong dong <zelong.dong@amlogic.com>
Cc: narmstrong@baylibre.com, p.zabel@pengutronix.de, khilman@baylibre.com, 
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_124239_760766_7C210233 
X-CRM114-Status: UNSURE (   9.11  )
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

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMjoxMeKAr1BNIHplbG9uZyBkb25nIDx6ZWxvbmcuZG9u
Z0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdA
YW1sb2dpYy5jb20+Cj4KPiBBZGQgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3VwcG9ydCBm
b3IgdGhlIHJlc2V0IGNvbnRyb2xsZXIKPiBvbiB0aGUgQzMgU29DLiBUaGUgY291bnQgYW5kIG9m
ZnNldCBmb3IgQzMgU29jIFJFU0VUIHJlZ2lzdGVycyBhcmUKPiBzYW1lIGFzIFM0IFNvYy4KPgo+
IENoYW5nZS1JZDogSTY1MTEzZjZhOTA1NDVjZDQ2MDE1YWJmNjBiNGJjYjYzZmExNDgyNjcKd2l0
aCB0aGlzIENoYW5nZS1JZCByZW1vdmVkIChhcyBtZW50aW9uZWQgZm9yIG90aGVyIHBhdGNoZXMg
aW4gdGhpcyBzZXJpZXMpCgo+IFNpZ25lZC1vZmYtYnk6IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9u
Z0BhbWxvZ2ljLmNvbT4KdGhpcyBwYXRjaCBnZXRzIG15OgpSZXZpZXdlZC1ieTogTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

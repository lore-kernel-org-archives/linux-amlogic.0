Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C2606A32E
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 21:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QoH+esy4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tAuGll0a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mvCu7wAuhYBnvVRZ4bzP5U7jsm2MPUtEUP3HNxgJWOE=; b=QoH+esy4WFNT2ImzyUpos1r0gB
	DtEPoEPahD4Hr1Kiy9F8X+4ezBnvEfkez8PvRo0IDMSkOo5szY2rm+q7EghGKJDEeyy92ZcK+ZxEZ
	vVlCmc5wvDiuKR6j+n2x/I9PU890H2AKkjXERxH745bSrA1Ew3T2fCmPWLqvrqFIeRbREIHgTJliX
	QW2McB2oTRMInxWx4JaJLL9GscjZfUHAgrzKieepWznHiZgCm8BfuhsmbLucBwOEXQugOu1VJ9xbI
	awmqTszhmARH+YxYRlWQaAhf0dMf7CW88B7ImESQAtwlNSicZk6WAoPLS9jVR9Oj2+Q0D8VIXbnHe
	seyeBtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXj-00000000TWV-0WLz;
	Mon, 02 Nov 2026 21:26:15 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXf-00000000TUL-2IJT
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 21:26:14 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-675617e81f9so3134856d50.3
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Nov 2026 13:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654770; cv=none;
        d=google.com; s=arc-20260327;
        b=TamByczNiH+OwD69G2202ZnLObP+ovCYk76zLazE+d/O+luqeppQeuNLR6xPxeA+sf
         SD706XDaSmzKEsnWPhUeJgF4bsmDf9KRHNfpZwQoEkRZ9FocacfiwbUpFFiQj3Sup7Hh
         KpC6GX3vj29nFO5jj4SWZo3MgTkDL8qHcGK/GkIL9uNVsOG4xpzzzpukZTzrGNReWrKJ
         reZcuo6UA9AlUS9b+DfB2lp/NMFGdI84k2FpoUg57lwh3XdbIEi5Xe/A0ebBjis8SCJR
         6DX+ve6opgRkWbpZHZuFpwZBJm3lqZd9Zmrxti36txrBmYCIIVwTPY94OXTod7YeBExr
         N9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        fh=SSkSnEyKr8M46iHTLdgE+FUoOSuTee3iJB2XvwW6Zx8=;
        b=U0FXd7TRpGfNefUyabMouxhAyzrIVVgY4JT6g+fYF6uOnds52expQHpTfPbO17zCy6
         7iJTDFpRx5gEA22N3rJb6CsEOl+xFp6z0o7+C/KTuZUernW2GZVPLveYG1sFuC7gSCFa
         g0mWvHs0859870YUfttoCDMXWergLFpfftW7b0NmT8waqnEQzr/0D0skeaDhtffJcXYX
         ClvFlhv/qHHWewYafMDhK204byTExRTlJW12OoUeVGOMfUcM+ph3BFblK2ZVvFdp/HEP
         ldgvYWjymsl6HIl3toB5hK/h9XYPGXdZIjJED8pL0zKBU/10BUG6fbXIR4Zx2HUvz7KD
         8D8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654770; x=1794259570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=tAuGll0a7svpkTkFtLQ9ORQ7MianvvoG/We/lDVkqXFmsXbOZAeaLkFVfJ7Oi7lJrR
         cp6r8XA7uQyy1QEnFUTgy4Wa9qhLXpCYncpcPd2x/w4+6xNleOYSJ3VHjhzmcLJ7lTMt
         7Nw3Lk39Mj3dNttZd8S94gIc065SSrXl6R0DmpOP0QFO2KT92/65sjuC4FxOpdW7n7b4
         uUAIZLsYY3VqSi0VniNNWHAQm09i8PbmxZGXXFD9bsvJhpv4xPgG+g2anPrTqKe24F7L
         3Laew7zk09cRPFIqrzS/YNFgiLmv69T10YDF2lVbQZiTPydvBm5QRIxo7FWO+dow5r57
         R+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654770; x=1794259570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=vJf5IdUuPY1kQ6F5Df0tOpX9WDEVP0T3EfFdlFoCcxBqZ4Y7CdqqH5SUItmVzWUrmr
         E8pI+ukOwOpJYU0ag+Z+Gj20bpPt8Fyv8nJXcKUB60DinlzpXyIH9CT73zwauTwxflkc
         RWhsDBQpHxcuNabEL7MZH196JccoIVaXsfb/FfEX0i77tlhuYYG6E0nZZE5WPBlCp11v
         OzUsdlJ3Vm7SR0F5v0HOfXsR+j2xh5r19EJ9Wx/a2dUSEYDU01TFHHKG79MRO3dTVsy7
         3vyCkZ+0KooMKUUmN5hw3oHFpHK2KftUB4OMf+BvXjpbwxm3ivHJjZWxP0RK+0PiMOZQ
         qZvQ==
X-Forwarded-Encrypted: i=1; AKwUvByGML+1mPUCMRkidLsmKuhe5xHoXIZe7IhpPTSCPQ8O3V2rSMPyktT/PLwvg+pHEiwF8aBg0o6jwJO2Qs9E@lists.infradead.org
X-Gm-Message-State: APuU4Z9sfN1s++ZnXuvQ153ytb6ff3juUDBzFfs53oJnzn4B4dsC10Bp
	kAHc7CGExhQfcgp4rcuFI2OZaZ/7zYNML10qAz8cy0qiOcsmaBCs4OsmvfL09WvQ6rGt7SLtoXM
	bhy18HzhywoTUSwMq33CkcNHqkibEYrY=
X-Gm-Gg: AYBFou3RoPGzq7G8KjqqffRhcIjnL8jWUTZRF0tBDcrGLonSqnm8NPNBOy4ds10YFC8
	uj3S66gWv5+4gul2dvD7R7ec439T1hLgam0Cw2zSKVL6klJLdCuW3mD/USHoFKyLaVmWbLUrWHv
	yf2aM3/UtfblfPesYU1XC202ZsuBs6pDdbCWbKVNMfuC8JSjirUx/W3EoOXNqBd4UTVUZHESv76
	JOi3FWHrvsVhQlR2CTfiObrFqVsUI5SwceWOeEoa6XtG/OVYiV43q48YCfpAOwgN/E4VlFZoHbF
	8h/QyTB+8B/K4HpdE9NcHXdN8iXGv44NPI/eouaOT++FsZ+Omi8wYcS+Q6KV0yQgkrxfLFQ/YD1
	lxx9RTVVzI0EA5Rj5+TL2r4+x04LgI1SRZVDTIo7Fl4vp7AsjwqSJWJXl
X-Received: by 2002:a05:690e:4548:20b0:679:8af3:af24 with SMTP id
 956f58d0204a3-67ba4f07cdamr5305703d50.52.1793654770101; Mon, 02 Nov 2026
 13:26:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv> <20261102-ping-fan-1@iav.lv>
In-Reply-To: <20261102-ping-fan-1@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 22:25:58 +0100
X-Gm-Features: AclHuK8ZaSBmGhthz5zT-hTxTfEuu2AtIUbTr5TxRdgub1ai_FkOm5Oe-6lP88c
Message-ID: <CAFBinCB=oJO06YrBGxYBPTTA2HP-xoOCKCivfRSGGryGRf-DZg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
To: Igor Velkov <iav@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132611_592666_412CDD0F 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWdvciwKCk9uIE1vbiwgTm92IDIsIDIwMjYgYXQgNzo0N+KAr1BNIElnb3IgVmVsa292IDxp
YXZAaWF2Lmx2PiB3cm90ZToKPgo+IEhpIE5laWwsCj4KPiBHZW50bGUgcGluZzogdGhpcyBoYXMg
eW91ciBSZXZpZXdlZC1ieSBmcm9tIE9jdCA3LCBidXQgSSBkb24ndCBzZWUKPiBpdCBpbiBmb3It
bmV4dC4gQ291bGQgeW91IHBpY2sgaXQgdXAgZm9yIHY3LjU/CkknbSBzdXJlIGl0J3Mgc3RpbGwg
b24gTmVpbCdzIGxpc3QuIFlvdXIgcGF0Y2ggY2FtZSBpbiBhcm91bmQgfjcuMy1yYzYKd2hpY2gg
aXMgd2hlbiB0aGUgYmF0Y2ggb2YgQW1sb2dpYyAuZHRzIGNoYW5nZXMgaGFzIHRvIGJlIHNlbnQg
dG8gdGhlCnNvYyBtYWludGFpbmVycy4KUGxlYXNlIGdpdmUgaGltIGEgZmV3IG1vcmUgZGF5cyBh
cyA3LjQtcmMxIGhhcyBqdXN0IGJlZW4gcmVsZWFzZWQuIFRoZQpub3JtYWwgYXBwcm9hY2ggaXMg
dG8gZ28gdGhyb3VnaCB0aGUgbGlzdCBvZiBub3QteWV0LW1lcmdlZCB0b3BpY3MKY2hyb25vbG9n
aWNhbGx5LgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

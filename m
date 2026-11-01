Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24CC606A324
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BW4QTdvH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lf4beQsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JmV1gZRPS+dzXN6BZEg3K7tP3/Iq4GWuXcjRH8QJiU4=; b=BW4QTdvHA3McKUKkubo04T5lF7
	EbSiKZs4dcb7zQUHC2LpxVBHfDzm0hrUl7oy+1w8u1jUcd8UuNr662wuJz4Z6s1+oPVmSw0T8JhCd
	g4AEcJTXYMblvHSAdPJcmbbcbgWqemsVygFQ4dtZTe+Knd8fRszqmz87PeUxVvSAOReinFLm+VA/m
	WT+be5K2553KlqtRZ8Kn2Pc38kOeERLQhCNux/Xf1XG/GukT369x484/NE4Wm/Iihf5iMpJq72bre
	0n5yW6vhBolsLVQ106BijV3lnMuXuDkFggATPAuif81yAj61En4dlYgoKKUwTUq4PS5ZBWy92paLk
	uBQ5k2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRLF-0000000E2Xa-2cSf;
	Sun, 01 Nov 2026 08:55:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRLD-0000000E2Wn-00aV
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 08:55:04 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c169ae1cb26so498032366b.1
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 01:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793523301; cv=none;
        d=google.com; s=arc-20260327;
        b=olsYGpO00TSrPfNux+J64eFIYCnRInHAiLx/CiWMi0sFUCX5nzgtwLbzJXtZzIlOVY
         Y5AghmRw9O/Pj6ejCcTS5yk7MAjaJILZoW7VR9Am8GSJ/WNJ5cbv0SSyTR/kC5XVEF6A
         ohRWW8aKiOM5j39hr66/V4O1enFXiffWNbQMicUvioSj9lyn9l9eyrtTuZBnwoJfeqAt
         QkxsTq956H/fpwp95pV8+DY8QBY0K3Odr/SsYytg7z6mrOMk+nYRhshqaTJ//RYvRhKo
         QqzoP9v6G9ehebmqudOLpKqtTu7VkL3OgFTCl3El79on7S8GWOT8ywc3SX6qlW5tHmrJ
         SHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=;
        fh=BAB1NhYR1gqjIPlMVOB9D5F70TN7DSZWfW7zgUXdNBQ=;
        b=Qsv0m5eYYz/gV/m0Rg+geIQiEmyEXALvW57BZ09Sn+8EXXzx/6sG4RpBEqvk6RmoiS
         9JtEoQMFaGvCntnQ/J/HXgDY7bsow0IAUh9YCoaJB56kBq3CGkAYiyJ9TwmFOsSC/iEE
         jdd+RzDFyg2aILDLNvxvkC5mOEC0ViJvHIPKDH3Ak9haqwXKfuNbsJ7QnrJ49GoO2xIq
         XmHC9fGuRY4FCu4m4StpCguiEgPKYAvrNNTtgks3tuITcarlcV3ay0hyXc0Y1I7rhV0u
         YmfnN3STF8moJBX5kDkIWpJixrRgL87lq33lAUwTGlQHxIDpiEb6mdWaQbmJ0GBPYStn
         t3BQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523301; x=1794128101; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=;
        b=Lf4beQsyM8Q8DRvv1MXKCVpRVGj1crX9m3qt0ZjEYgDpNJU7w+GfnmNMbeWstgP0VL
         IuVmIaSAsxx2LWe0ZAfaZCt7i1MXTxjzuhGOmZx4l0PblZXESzEafVho31QOk0Sb7wqJ
         kKQOPntlmYvAlSK5KxSeuJz0Gc3oM+obuJtsELRWX79j7Zr3O0H2LZc/vcszHG67te/U
         oKw1LlwOI8JPGc390e8SYNqaf70oA8xBMqxRT5Zxe6WdNwtFdqaPAH0vlxWzwDSejnhC
         YMn/M6D0tosOUW9xTTET49cgxxnsXfsPDLLl/I0qki1IgGSlX1AwaoDOwM/26BaRnaGJ
         d35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523301; x=1794128101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOlyAtS6nw4UaimVZudbFA9N9IY+hFNzuca71S7UO7A=;
        b=Yv0VeIkjA9OqDiOjat+Mgk88ryc0tBlIdMY6a77kkXEH89K2O8s843Ux5OSl7SGOlp
         yAVEVsooW1r2sCl/2hfcDlECP6YDZU/+kxOeJFh/AmK2tycv/TrA+mvHbfyuQQnfZVjt
         U0XM/kJauiDaGSZzCvMKHD84fglUOb1OzPj2g5aT6TMbnapPJV0q6yK0k7FYnWIRgsHw
         JlBIFMQiwwu0BcSikZqQvsNDHVGAerstHUSchbLBUCOuVPxwDPJBCLm6tWrd1zQvAsJV
         xGOTVuyHuuS5rvdCkPjPY1O6/AeXqk8YKdky5U0/3Iy7m2OmNE0fGUdbKcnKD9gMfiqw
         oqmA==
X-Forwarded-Encrypted: i=1; AKwUvBzHdMxulr6Rb5EdCPtpL170i+wiJ5bFGQ1XUSEFZUU8bJD7gxhjwHpaY9ngxQ23YS6pBoC0CVpFTx/XT/M/@lists.infradead.org
X-Gm-Message-State: AFq9FYKzuY68wjXnOWdr0gD+9ee7v2xqIsc+0SoKesOX86pzFQ/cmqn9
	5IQ8MVuyij+O+Epl67rCG5R/vWioltgxdNzMNUbSrZNjB+RhM/moizVNhOVwyw5BFb/Goi4ZrtY
	+8yhu8WJkYeDnfM4SC5NkMtt1j9aDv9U=
X-Gm-Gg: AYBFou27abWhMcDqIVdGuci8D88eWEy2lxkPnv0BPembRskJ8M46UN7G6r10nKrItXl
	Lt2kUC936oU1MKd2vQ2p8Qu5lDhVIcOLZMhr3AYKs6cHZs1y7aqrh4ywWhgUi0aZ+eKpSUHOFnE
	+cMdXHUJEIuTntUP13EA9aEUPKU+qGzRKVMBSeRZXTIHOmvnsj74ijvoXDJqGJs5aVjQXSfUddk
	7spRTZnCBe47IGxyEajD+JV9R2H6WBr3QdzxyOJRBr5HqMpydebi8erqMRtoyJBxHkioe0BY0OM
	/1FXeRtVwOA5b4hC1yL5YbLOVJDlsizZhEUCByYgWmcFoAQICG0JNSMUZjDP1H05vpvWXWDaM2o
	vwCLU87f2aMUduhsQw141Pr34gphhrQwBh6tfig==
X-Received: by 2002:a17:906:c112:b0:c41:9a35:17a2 with SMTP id
 a640c23a62f3a-c49d14eac79mr860609266b.31.1793523300772; Sun, 01 Nov 2026
 01:55:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com> <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
In-Reply-To: <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
From: HELPMEEADICE <yuanzhenpeng210@gmail.com>
Date: Sun, 1 Nov 2026 16:54:49 +0800
X-Gm-Features: AclHuK83pVomP0hrq6j_fybbi3W3-j8J1pzjtv8v1_2m4qUqV-NOu-WaXgCPqzA
Message-ID: <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_015503_083356_C76E9F2E 
X-CRM114-Status: GOOD (  30.72  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFydGluLAoKVGhhbmsgeW91IGFnYWluIGZvciB5b3VyIGZlZWRiYWNrIQoKSSd2ZSBjb21w
bGV0ZWQgdGhlIGNvbXBhcmlzb24gYmV0d2VlbiB0aGUgb3JpZ2luYWwgZHJpdmVyLApNTUNfQ0FQ
Ml9NRVJHRV9DQVBBQkxFLCBhbmQgdGhlIDEyOCBLaUIgYm91bmNlIGJ1ZmZlciBpbXBsZW1lbnRh
dGlvbgpvbiBteSBYdW5sZWkgT25lQ2xvdWQgKEFtbG9naWMgUzgwNSkuCgpUaGUgcmVzdWx0cyBz
aG93IHRoYXQgTU1DX0NBUDJfTUVSR0VfQ0FQQUJMRSBhbG9uZSBkb2VzIG5vdCBpbXByb3ZlCnBl
cmZvcm1hbmNlIG9uIHRoaXMgcGxhdGZvcm0uCgpSdW50aW1lIGluc3RydW1lbnRhdGlvbiBjb25m
aXJtZWQgdGhhdDoKCi0gZG1hX2dldF9tZXJnZV9ib3VuZGFyeSgpIHJldHVybnMgMC4KLSBob3N0
LT5jYW5fZG1hX21hcF9tZXJnZSByZW1haW5zIDAuCi0gVGhlIGJsb2NrIHF1ZXVlJ3MgbWF4X3Nl
Z21lbnRzIHJlbWFpbnMgMS4KLSBUaGUgbWVyZ2Utb25seSB2YXJpYW50IGJlaGF2ZXMgZXNzZW50
aWFsbHkgdGhlIHNhbWUgYXMgdGhlIG9yaWdpbmFsIGRyaXZlci4KCkhlcmUgYXJlIHRoZSBzZXF1
ZW50aWFsIHJlYWQgcmVzdWx0cyAoTWlCL3MsIG1lYW4gb2YgNSBydW5zKToKCiAgICAgICAgICAg
ICAgICAgQmFzZWxpbmUgICBNZXJnZS1vbmx5ICAgQm91bmNlCiAgICA0IEtpQiAgICAgICAgICAx
MS44MSAgICAgICAxMi4yMCAgICAgIDEzLjAxCiAgIDY0IEtpQiAgICAgICAgICAxMi44OCAgICAg
ICAxMi44MCAgICAgIDU3LjUyCiAgMTI4IEtpQiAgICAgICAgICAxMi45NyAgICAgICAxMi44MCAg
ICAgIDY3LjY4CiAgICAxIE1pQiAgICAgICAgICAxMy4xMSAgICAgICAxMy4wNSAgICAgIDY5LjQz
CgpUaGUgYm91bmNlIGJ1ZmZlciBpbXByb3ZlcyBzZXF1ZW50aWFsIHJlYWQgdGhyb3VnaHB1dCBi
eSB1cCB0byA1LjN4CmFuZCBzZXF1ZW50aWFsIHdyaXRlIHRocm91Z2hwdXQgYnkgdXAgdG8gMi4x
eC4KCkZvciB0aGUgMTI4IEtpQiBzZXF1ZW50aWFsIHJlYWQgdGVzdCwgaW5zdHJ1bWVudGF0aW9u
IHNob3dlZCB0aGF0IHRoZQpudW1iZXIgb2YgTU1DIGRhdGEgcmVxdWVzdHMgZGVjcmVhc2VkIGZy
b20gNzAsNTk5IHRvIDIsNDY1LCB3aXRoIHRoZQphdmVyYWdlIHJlcXVlc3Qgc2l6ZSBpbmNyZWFz
aW5nIGZyb20gYXBwcm94aW1hdGVseSA0IEtpQiB0byAxMTggS2lCLgoKSSBhbHNvIHRlc3RlZCBE
TUEgbWFwcGluZyB3aXRoIDMzIHBoeXNpY2FsbHkgbm9uLWNvbnRpZ3VvdXMgcGFnZXMuCmRtYV9t
YXBfc2coKSByZXR1cm5lZCAzMyBETUEgc2VnbWVudHMsIGNvbmZpcm1pbmcgdGhhdCB0aGVzZSBw
YWdlcwpjYW5ub3QgYmUgbWVyZ2VkIGludG8gYSBzaW5nbGUgRE1BIHNlZ21lbnQgb24gdGhpcyBw
bGF0Zm9ybS4KCkZvciBzYWZldHksIHRoZSB0ZXN0ZWQgbWVyZ2Utb25seSB2YXJpYW50IGluY2x1
ZGVkIGEgY2hlY2sgdG8gcmVqZWN0CkRNQSBtYXBwaW5ncyB3aXRoIG1vcmUgdGhhbiBvbmUgc2Vn
bWVudC4gVGhlIHB1cmUgb25lLWxpbmUgdmFyaWFudCB3YXMKbm90IGV4ZWN1dGVkLgoKQWRkaXRp
b25hbGx5LCBJIGFkZHJlc3NlZCB0aGUgaXNzdWUgaWRlbnRpZmllZCBieSBTYXNoaWtvIGJ5IGNo
ZWNraW5nCmNtZC0+ZXJyb3IgYmVmb3JlIGNvcHlpbmcgYm91bmNlZCByZWFkIGRhdGEgYmFjayBh
bmQgcmVwb3J0aW5nCmJ5dGVzX3hmZXJlZC4KCkFsbCAxMzUgZmlvIGpvYnMgY29tcGxldGVkIHN1
Y2Nlc3NmdWxseS4gU0hBMjU2IGFuZCBDUkMzMkMgaW50ZWdyaXR5CmNoZWNrcyBwYXNzZWQsIHdp
dGggbm8gTU1DIGVycm9ycyBvYnNlcnZlZC4gRmF1bHQgaW5qZWN0aW9uIHRlc3RpbmcKaGFzIG5v
dCB5ZXQgYmVlbiBwZXJmb3JtZWQuCgpCYXNlZCBvbiB0aGVzZSByZXN1bHRzLCB0aGUgYm91bmNl
IGJ1ZmZlciBhcHBlYXJzIG5lY2Vzc2FyeSB0byBzdXBwb3J0CmxhcmdlciBNTUMgcmVxdWVzdHMg
b24gdGhpcyBoYXJkd2FyZS4KCkkgcGxhbiB0byBpbmNvcnBvcmF0ZSB0aGUgZXJyb3IgaGFuZGxp
bmcgZml4IGludG8gdGhlIG5leHQgcmV2aXNpb24gb2YKdGhlIHBhdGNoLgoKUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHlvdSBoYXZlIGFueSBmdXJ0aGVyIHN1Z2dlc3Rpb25zLgoKQmVzdCByZWdhcmRz
LApaaGVucGVuZwoKCkhFTFBNRUVBRElDRSA8eXVhbnpoZW5wZW5nMjEwQGdtYWlsLmNvbT4g5LqO
MjAyNuW5tDEx5pyIMeaXpeWRqOaXpSAxNjo0NuWGmemBk++8mgo+Cj4gSGkgTWFydGluLAo+Cj4g
VGhhbmsgeW91IGFnYWluIGZvciB5b3VyIGZlZWRiYWNrIQo+Cj4gSSd2ZSBjb21wbGV0ZWQgdGhl
IGNvbXBhcmlzb24gYmV0d2VlbiB0aGUgb3JpZ2luYWwgZHJpdmVyLCBNTUNfQ0FQMl9NRVJHRV9D
QVBBQkxFLCBhbmQgdGhlIDEyOCBLaUIgYm91bmNlIGJ1ZmZlciBpbXBsZW1lbnRhdGlvbiBvbiBt
eSBYdW5sZWkgT25lQ2xvdWQgKEFtbG9naWMgUzgwNSkuCj4KPiBUaGUgcmVzdWx0cyBzaG93IHRo
YXQgTU1DX0NBUDJfTUVSR0VfQ0FQQUJMRSBhbG9uZSBkb2VzIG5vdCBpbXByb3ZlIHBlcmZvcm1h
bmNlIG9uIHRoaXMgcGxhdGZvcm0uCj4KPiBSdW50aW1lIGluc3RydW1lbnRhdGlvbiBjb25maXJt
ZWQgdGhhdDoKPgo+IGRtYV9nZXRfbWVyZ2VfYm91bmRhcnkoKSByZXR1cm5zIDAuCj4KPiBob3N0
LT5jYW5fZG1hX21hcF9tZXJnZSByZW1haW5zIDAuCj4KPiBUaGUgYmxvY2sgcXVldWUncyBtYXhf
c2VnbWVudHMgcmVtYWlucyAxLgo+Cj4gVGhlIG1lcmdlLW9ubHkgdmFyaWFudCBiZWhhdmVzIGVz
c2VudGlhbGx5IHRoZSBzYW1lIGFzIHRoZSBvcmlnaW5hbCBkcml2ZXIuCj4KPiBIZXJlIGFyZSB0
aGUgc2VxdWVudGlhbCByZWFkIHJlc3VsdHMgKE1pQi9zLCBtZWFuIG9mIDUgcnVucyk6Cj4KPiAg
ICAgICAgICAgICAgQmFzZWxpbmUgICBNZXJnZS1vbmx5ICAgQm91bmNlCj4gNCBLaUIgICAgICAg
ICAgMTEuODEgICAgICAgMTIuMjAgICAgICAxMy4wMQo+Cj4gNjQgS2lCIDEyLjg4IDEyLjgwIDU3
LjUyCj4gMTI4IEtpQiAxMi45NyAxMi44MCA2Ny42OAo+IDEgTWlCIDEzLjExIDEzLjA1IDY5LjQz
Cj4KPiBUaGUgYm91bmNlIGJ1ZmZlciBpbXByb3ZlcyBzZXF1ZW50aWFsIHJlYWQgdGhyb3VnaHB1
dCBieSB1cCB0byA1LjN4IGFuZCBzZXF1ZW50aWFsIHdyaXRlIHRocm91Z2hwdXQgYnkgdXAgdG8g
Mi4xeC4KPgo+IEZvciB0aGUgMTI4IEtpQiBzZXF1ZW50aWFsIHJlYWQgdGVzdCwgaW5zdHJ1bWVu
dGF0aW9uIHNob3dlZCB0aGF0IHRoZSBudW1iZXIgb2YgTU1DIGRhdGEgcmVxdWVzdHMgZGVjcmVh
c2VkIGZyb20gNzAsNTk5IHRvIDIsNDY1LCB3aXRoIHRoZSBhdmVyYWdlIHJlcXVlc3Qgc2l6ZSBp
bmNyZWFzaW5nIGZyb20gYXBwcm94aW1hdGVseSA0IEtpQiB0byAxMTggS2lCLgo+Cj4gSSBhbHNv
IHRlc3RlZCBETUEgbWFwcGluZyB3aXRoIDMzIHBoeXNpY2FsbHkgbm9uLWNvbnRpZ3VvdXMgcGFn
ZXMuIGRtYV9tYXBfc2coKSByZXR1cm5lZCAzMyBETUEgc2VnbWVudHMsIGNvbmZpcm1pbmcgdGhh
dCB0aGVzZSBwYWdlcyBjYW5ub3QgYmUgbWVyZ2VkIGludG8gYSBzaW5nbGUgRE1BIHNlZ21lbnQg
b24gdGhpcyBwbGF0Zm9ybS4KPgo+IEZvciBzYWZldHksIHRoZSB0ZXN0ZWQgbWVyZ2Utb25seSB2
YXJpYW50IGluY2x1ZGVkIGEgY2hlY2sgdG8gcmVqZWN0IERNQSBtYXBwaW5ncyB3aXRoIG1vcmUg
dGhhbiBvbmUgc2VnbWVudC4gVGhlIHB1cmUgb25lLWxpbmUgdmFyaWFudCB3YXMgbm90IGV4ZWN1
dGVkLgo+Cj4gQWRkaXRpb25hbGx5LCBJIGFkZHJlc3NlZCB0aGUgaXNzdWUgaWRlbnRpZmllZCBi
eSBTYXNoaWtvIGJ5IGNoZWNraW5nIGNtZC0+ZXJyb3IgYmVmb3JlIGNvcHlpbmcgYm91bmNlZCBy
ZWFkIGRhdGEgYmFjayBhbmQgcmVwb3J0aW5nIGJ5dGVzX3hmZXJlZC4KPgo+IEFsbCAxMzUgZmlv
IGpvYnMgY29tcGxldGVkIHN1Y2Nlc3NmdWxseS4gU0hBMjU2IGFuZCBDUkMzMkMgaW50ZWdyaXR5
IGNoZWNrcyBwYXNzZWQsIHdpdGggbm8gTU1DIGVycm9ycyBvYnNlcnZlZC4gRmF1bHQgaW5qZWN0
aW9uIHRlc3RpbmcgaGFzIG5vdCB5ZXQgYmVlbiBwZXJmb3JtZWQuCj4KPiBCYXNlZCBvbiB0aGVz
ZSByZXN1bHRzLCB0aGUgYm91bmNlIGJ1ZmZlciBhcHBlYXJzIG5lY2Vzc2FyeSB0byBzdXBwb3J0
IGxhcmdlciBNTUMgcmVxdWVzdHMgb24gdGhpcyBoYXJkd2FyZS4KPgo+IEkgcGxhbiB0byBpbmNv
cnBvcmF0ZSB0aGUgZXJyb3IgaGFuZGxpbmcgZml4IGludG8gdGhlIG5leHQgcmV2aXNpb24gb2Yg
dGhlIHBhdGNoLgo+Cj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBmdXJ0aGVy
IHN1Z2dlc3Rpb25zLgo+Cj4gQmVzdCByZWdhcmRzLAo+IFpoZW5wZW5nCj4KPgo+IE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IOS6jjIwMjbl
ubQxMeaciDHml6Xlkajml6UgMDU6MTflhpnpgZPvvJoKPj4KPj4gSGksCj4+Cj4+IFRoYW5rIHlv
dSBmb3IgdGhpcyBwYXRjaCEKPj4KPj4gT24gU2F0LCBPY3QgMzEsIDIwMjYgYXQgOTowOeKAr1BN
IFpIRU5QRU5HIFlVQU4gPHl1YW56aGVucGVuZzIxMEBnbWFpbC5jb20+IHdyb3RlOgo+PiA+Cj4+
ID4gVGhlIE1lc29uIE1YIFNESEMgY29udHJvbGxlciB1c2VzIGEgc2luZ2xlIERNQSBhZGRyZXNz
IGZvciBlYWNoCj4+ID4gdHJhbnNmZXIuIFNpbmNlIHRoZSBkcml2ZXIgbGVhdmVzIG1heF9zZWdz
IGF0IHRoZSBNTUMgY29yZSBkZWZhdWx0Cj4+ID4gb2YgMSwgbGFyZ2UgSS9PIHJlcXVlc3RzIGFy
ZSBzcGxpdCBpbnRvIHNpbmdsZS1zZWdtZW50IHJlcXVlc3RzLAo+PiA+IHR5cGljYWxseSA0IEtp
QiBlYWNoLgo+PiA+Cj4+ID4gT24gYW4gQW1sb2dpYyBTODA1LCB0aGlzIGxpbWl0cyBlTU1DIHNl
cXVlbnRpYWwgcmVhZCB0aHJvdWdocHV0Cj4+ID4gdG8gYXBwcm94aW1hdGVseSAxNSBNaUIvcyBk
ZXNwaXRlIHVzaW5nIEhTMjAwIHRpbWluZy4KPj4gPgo+PiA+IEFkZCBhIDEyOCBLaUIgRE1BIGJv
dW5jZSBidWZmZXIgZm9yIG11bHRpLXNlZ21lbnQgcmVxdWVzdHMgYW5kCj4+IEZXSVcsIHdoaWxl
IHJldmlld2luZyB5b3VyIHBhdGNoIEkgZm91bmQgdGhhdCBBbWxvZ2ljIGFjdHVhbGx5IHVzZXMg
YQo+PiA1MTJLaUIgYm91bmNlIGJ1ZmZlciBpbiB0aGVpciBkb3duc3RyZWFtIGRyaXZlcjogWzBd
Cj4+Cj4+ID4gYWR2ZXJ0aXNlIHVwIHRvIDY0IHNjYXR0ZXJsaXN0IHNlZ21lbnRzLiBTaW5nbGUt
c2VnbWVudCByZXF1ZXN0cwo+PiA+IGNvbnRpbnVlIHRvIHVzZSBkaXJlY3QgRE1BLiBJZiBidWZm
ZXIgYWxsb2NhdGlvbiBmYWlscywgZmFsbCBiYWNrCj4+ID4gdG8gdGhlIG9yaWdpbmFsIHNpbmds
ZS1zZWdtZW50IGxpbWl0Lgo+PiA+Cj4+ID4gVGVzdGluZyBvbiBhIFh1bmxlaSBPbmVDbG91ZCAo
TWVzb244YiwgU2Ftc3VuZyA4R01FNFIgZU1NQykKPj4gPiBydW5uaW5nIExpbnV4IDcuMy4xOgo+
PiA+Cj4+ID4gICBCbG9jayBzaXplICAgICAgIEJlZm9yZSAgICAgICBBZnRlcgo+PiA+ICAgNCBL
aUIgICAgICAgICAgICAxNC40NyAgICAgICAgMTQuNjkgTWlCL3MKPj4gPiAgIDY0IEtpQiAgICAg
ICAgICAgMTUuMDYgICAgICAgIDYzLjIxIE1pQi9zCj4+ID4gICAxMjggS2lCICAgICAgICAgIDE1
LjA4ICAgICAgICA3NS4xMyBNaUIvcwo+PiA+ICAgMSBNaUIgICAgICAgICAgICAxNS4wNyAgICAg
ICAgNzUuOTMgTWlCL3MKPj4gPgo+PiA+IEZvciBhIDEyOCBNaUIgc2VxdWVudGlhbCByZWFkLCBi
bG9jayByZXF1ZXN0cyBkZWNyZWFzZWQgZnJvbQo+PiA+IDMyNzY4IHRvIDEwMjQuCj4+IFRoYXQn
cyBhIG5pY2UgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQhCj4+Cj4+ID4gRGlyZWN0IEkvTyBTSEEy
NTYgcmVhZGJhY2sgdmVyaWZpY2F0aW9uIGFuZCBmaW8gQ1JDMzJDIHdyaXRlCj4+ID4gdmVyaWZp
Y2F0aW9uIHBhc3NlZC4gTm8gTU1DIGVycm9ycyB3ZXJlIG9ic2VydmVkLgo+PiA+Cj4+ID4gQXNz
aXN0ZWQtYnk6IExMTQo+PiA+IFNpZ25lZC1vZmYtYnk6IFpIRU5QRU5HIFlVQU4gPHl1YW56aGVu
cGVuZzIxMEBnbWFpbC5jb20+Cj4+IENvdWxkIHlvdSBwbGVhc2UgY29tcGFyZSB5b3VyIHBhdGNo
IHRvIHNpbXBseSBzZXR0aW5nIG1tYy0+Y2FwczIgfD0KPj4gTU1DX0NBUDJfTUVSR0VfQ0FQQUJM
RTsgPwo+PiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIHRoaXMgd2lsbCBhbGxvdyBwaHlzaWNhbGx5
IGNvbnRpZ3VvdXMgU0cKPj4gZW50cmllcyB0byBiZSBtZXJnZWQgYnkgbW1jIGNvcmUuCj4+Cj4+
IFVsZjogdGhlIGNvZGUgaGVyZSBsb29rcyBzaW1pbGFyIHRvIHRoZSBzZGhjaS5jIGltcGxlbWVu
dGF0aW9uLiBJJ20KPj4gd29uZGVyaW5nIGlmIHRoZXJlIHdlcmUgYW55IHBsYW5zIHRvIHNvbWVo
b3cgbW92ZSB0aGlzIHRvIE1NQyBjb3JlLgo+Pgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IE1hcnRp
bgo+Pgo+Pgo+PiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL2VuZGxlc3NtL2xpbnV4LW1lc29uL2Js
b2IvZDZlMTNjMjIwOTMxMTEwZmU2NzZlZGU2ZGE2OWZjNjFhN2NiMDRiNi9hcmNoL2FybS9tYWNo
LW1lc29uOC9pbmNsdWRlL21hY2gvc2QuaCNMNjI3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

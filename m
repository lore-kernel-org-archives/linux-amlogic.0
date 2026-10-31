Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B740E606A31A
	for <linux-amlogic@archiver.kernel.org>; Sat, 31 Oct 2026 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1pOcTdGv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ILLwOeKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D+2M2HEOsJNlOOtKvZMf4oau2p7klY11Y4MrBc9XZLA=; b=1pOcTdGvlI6Gnu+SMS3tQOA2K5
	9/UcLy8T+/qCmmPhl3asSuNxhtEvHAfDdOjgtTo6cA+gXU7PyGHTvOEHJp0kxTTd/TBG06GWxRz5k
	f3+gwapbMf/DeXYDeGKe6NhuKLZSYwItbQLZCM70cnEk9cEBvwIc21+80pKOe69pOxeu/Ls9qx/IG
	QWfzbCznElBgy6ftUOe9ogv3YK5Z9GenmUGF5ybNqa4w4C4dZTJw0gGRPE9uRVps4ko4b5X9FIrNW
	NvGd+dX6fYmGhwEJtohZoAoOEFAZxb8spD1LiK276S+3Ad64UIF5JuVUjf9PFRgbf8Uucd7N9YOem
	YwYbcmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGSN-0000000DhJu-4Blp;
	Sat, 31 Oct 2026 21:17:44 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGSL-0000000DhJF-19Ft
	for linux-amlogic@lists.infradead.org;
	Sat, 31 Oct 2026 21:17:42 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67a000ac7efso1447916d50.0
        for <linux-amlogic@lists.infradead.org>; Sat, 31 Oct 2026 14:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793481459; cv=none;
        d=google.com; s=arc-20260327;
        b=IhtYAZEG93vM6MAfGcB6l7jtba5G/khu4bAnUJrdz/ybjqxAM8Oaof/BPZIcDAC9+j
         dwjzTBY5b0NPZjtJhuLByCb1KLJfrbCf27wt0DSITl+HqZITAIdRr996EoVQ50g40lLV
         nTxZHmqoHgpmnDnwz0ihX8tgrlaVplX0rFN1tQeY9yAWQzJoBznt5T/VDHg7dS7hnYXJ
         SH6ntNaJ129C/8hYrJDAHQv2PlPafbvoklCGl749wP2yfXuBimC8h3aY0pZgsfo5cB3a
         ulN6bHUCTuaWM4BQN8Uzv/ZvsrJmV3UQ5wJ7wd6EbAse3Cftx9UN6GGrZ7KL4fJYNW5q
         ht3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        fh=BDl1q18tD09Z6phkEiJH0ZH+kGx5G3LSFWuX1XUi3zM=;
        b=LSsD1KNphX9PqnOldqXiwr69u3DxP+tXBnPp9/U+OQ/p9GKmQOC5ToAlk95tNI91OO
         Gr7DMFme5KFEK+FRfVRdZyHXu4y2j9x3g+oHPr7gL3AWYflVlIWD+cn+LCWU2cAtGMUA
         sdxHWKexpIU/3+7ncwvs67WrdNX5SS8DJ9LT754aW0XDZp+uQ+qJo60pzTPkENw9m8aq
         06x15NSxEa6RybTrmlf64U0Zsey2LV5OgPnQ5cJcgbXlNn/U+/JlYhGS/Scji5CIe/0O
         0o1yjziqDLKVTBEtC23fvu6Qf9E91xhW85wJMPUt0Z5agfgPmHMezFx97+80ovazidxO
         0CYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793481459; x=1794086259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        b=ILLwOeKjGD8S7RYuz1e8VL8A3PUL9hwYzbgfrqIAcQfFghs9zS14vZQzV5ZsOihErt
         22tWtGZm8rY/soMAwMBP3vWklekBTdDrS7MSEjJT6PCe6uAXGW3GkoRr/eHQra07uHEQ
         pGKKuKDNokQNwxoKsSTAjTTpj1EhIuv5VzzwKNdwcy3PB0nHOmmiehqEga/kAeywcFgd
         iACCQfukoGyWCL6HQ9D5nyNdZZTaceMk33vwB8teEZEKPtU/j2xVT33kcSfaH41YUmT/
         5J7bhwWlpKVVHjarl9KV+WccqgrivBTQKMGpKDJdHv8vsyX2LZ3egBC/nERRRFt2Lm71
         C9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481459; x=1794086259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        b=rKF8BWSfx979LNYURdaSTJGVTZeZwmJ0cGnMkP97/QjyWZUmy2kx0jDxkouZ/FLXMa
         quF1M3qRoMNtiHVdifhoVLBezQ2xleO0DPpzZBAdaDcBwcmuVLFLelRkrOTfTHM90bW8
         +L5Hj9dh2Q07dSSQl37y+SOz/Xx+DH0eK2sG73cGioQEqsZi6uyVQrDpooCrUvNwttM3
         CvX8ssEAE+ToOSkrqIKVrmQ13Fs05w6DjR/2Izb4qittC14wIDXwzKE67+Nl/D8ptgeJ
         n6+oTTZ6X5R7cB6z1J8gLX9yYV3U/V3Z1q6bKsKTKNR2xPmRpXpttlx8/OJ3+N5ODh2y
         DU7w==
X-Forwarded-Encrypted: i=1; AKwUvByDPzjqqpW6BKYFHfqIlN8qbVmTjspiLKkRXUzVaUmF8mW6JZEyeChGrJB1N/muh7ObPfgZamF+XsutQVnl@lists.infradead.org
X-Gm-Message-State: APuU4Z+qOVvtUsNvj7Gs5NiGiBpxuXzQzWGvpzOYNS/XvDVgJVIA6dWH
	RjYQLDpX9ZqMmh3uZjOzhxS0amUjEJUsoS2p5mu/NvBYbORo/6H7Z9mVjT4TttSM5NxYDCXw5iY
	wHCzEBoqqcnvsiZvW1XeKao0jkxHn17Q=
X-Gm-Gg: AYBFou3xTiCmJxtGa2DqsiVoq+TNAF5oAtv3+S7jYxb6vRTq+2F+taY4c5xc32Og7E/
	EnT8P/zVXktbeN4Z3wcKNgHIlX+4iIwTdSXR+NfaqOZ83f4gqbYp69XGdST31LZmxiXnJsXwhIB
	Uu4VcuVVSKIpAwBFZkOmw3dkl3sbwUD8/B5r4371FWorMkRqYFB+e+W5jJGfWnpG/kkmBF1muTU
	3Bb/y8mON+y3ksz97sRWP3kMU7fHfY1VQJMrT4jNEhpT+vnol0ryOWQx6U77MKugRlaNE8drbq1
	MGbJXY9K2tI2jRBdHKITgogbKVPvAD7WR646Xq5ad6bt4ELZmBZfdBAjrBKZP0eiA5XntyVeBGT
	ptS75+PrIt7IENuZ4dz27rqiPrbIVon7u3t4YCGrWyyYHyw8M7a4a7EjiGnorZJX84krubLee8q
	SGE9MgJrOLmHjcGuY=
X-Received: by 2002:a05:690e:dcb:b0:679:ad95:8ef8 with SMTP id
 956f58d0204a3-67ba4f44351mr3951527d50.62.1793481458984; Sat, 31 Oct 2026
 14:17:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
In-Reply-To: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 31 Oct 2026 22:17:28 +0100
X-Gm-Features: AclHuK9aT_AtsyMcO-RHgeZfhZoWmnaHOU2QYfBUHDRz-4_ywAKOHyMlNGOtG-I
Message-ID: <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_141741_354405_82D189E3 
X-CRM114-Status: GOOD (  15.11  )
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

SGksCgpUaGFuayB5b3UgZm9yIHRoaXMgcGF0Y2ghCgpPbiBTYXQsIE9jdCAzMSwgMjAyNiBhdCA5
OjA54oCvUE0gWkhFTlBFTkcgWVVBTiA8eXVhbnpoZW5wZW5nMjEwQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiBUaGUgTWVzb24gTVggU0RIQyBjb250cm9sbGVyIHVzZXMgYSBzaW5nbGUgRE1BIGFkZHJl
c3MgZm9yIGVhY2gKPiB0cmFuc2Zlci4gU2luY2UgdGhlIGRyaXZlciBsZWF2ZXMgbWF4X3NlZ3Mg
YXQgdGhlIE1NQyBjb3JlIGRlZmF1bHQKPiBvZiAxLCBsYXJnZSBJL08gcmVxdWVzdHMgYXJlIHNw
bGl0IGludG8gc2luZ2xlLXNlZ21lbnQgcmVxdWVzdHMsCj4gdHlwaWNhbGx5IDQgS2lCIGVhY2gu
Cj4KPiBPbiBhbiBBbWxvZ2ljIFM4MDUsIHRoaXMgbGltaXRzIGVNTUMgc2VxdWVudGlhbCByZWFk
IHRocm91Z2hwdXQKPiB0byBhcHByb3hpbWF0ZWx5IDE1IE1pQi9zIGRlc3BpdGUgdXNpbmcgSFMy
MDAgdGltaW5nLgo+Cj4gQWRkIGEgMTI4IEtpQiBETUEgYm91bmNlIGJ1ZmZlciBmb3IgbXVsdGkt
c2VnbWVudCByZXF1ZXN0cyBhbmQKRldJVywgd2hpbGUgcmV2aWV3aW5nIHlvdXIgcGF0Y2ggSSBm
b3VuZCB0aGF0IEFtbG9naWMgYWN0dWFsbHkgdXNlcyBhCjUxMktpQiBib3VuY2UgYnVmZmVyIGlu
IHRoZWlyIGRvd25zdHJlYW0gZHJpdmVyOiBbMF0KCj4gYWR2ZXJ0aXNlIHVwIHRvIDY0IHNjYXR0
ZXJsaXN0IHNlZ21lbnRzLiBTaW5nbGUtc2VnbWVudCByZXF1ZXN0cwo+IGNvbnRpbnVlIHRvIHVz
ZSBkaXJlY3QgRE1BLiBJZiBidWZmZXIgYWxsb2NhdGlvbiBmYWlscywgZmFsbCBiYWNrCj4gdG8g
dGhlIG9yaWdpbmFsIHNpbmdsZS1zZWdtZW50IGxpbWl0Lgo+Cj4gVGVzdGluZyBvbiBhIFh1bmxl
aSBPbmVDbG91ZCAoTWVzb244YiwgU2Ftc3VuZyA4R01FNFIgZU1NQykKPiBydW5uaW5nIExpbnV4
IDcuMy4xOgo+Cj4gICBCbG9jayBzaXplICAgICAgIEJlZm9yZSAgICAgICBBZnRlcgo+ICAgNCBL
aUIgICAgICAgICAgICAxNC40NyAgICAgICAgMTQuNjkgTWlCL3MKPiAgIDY0IEtpQiAgICAgICAg
ICAgMTUuMDYgICAgICAgIDYzLjIxIE1pQi9zCj4gICAxMjggS2lCICAgICAgICAgIDE1LjA4ICAg
ICAgICA3NS4xMyBNaUIvcwo+ICAgMSBNaUIgICAgICAgICAgICAxNS4wNyAgICAgICAgNzUuOTMg
TWlCL3MKPgo+IEZvciBhIDEyOCBNaUIgc2VxdWVudGlhbCByZWFkLCBibG9jayByZXF1ZXN0cyBk
ZWNyZWFzZWQgZnJvbQo+IDMyNzY4IHRvIDEwMjQuClRoYXQncyBhIG5pY2UgcGVyZm9ybWFuY2Ug
aW1wcm92ZW1lbnQhCgo+IERpcmVjdCBJL08gU0hBMjU2IHJlYWRiYWNrIHZlcmlmaWNhdGlvbiBh
bmQgZmlvIENSQzMyQyB3cml0ZQo+IHZlcmlmaWNhdGlvbiBwYXNzZWQuIE5vIE1NQyBlcnJvcnMg
d2VyZSBvYnNlcnZlZC4KPgo+IEFzc2lzdGVkLWJ5OiBMTE0KPiBTaWduZWQtb2ZmLWJ5OiBaSEVO
UEVORyBZVUFOIDx5dWFuemhlbnBlbmcyMTBAZ21haWwuY29tPgpDb3VsZCB5b3UgcGxlYXNlIGNv
bXBhcmUgeW91ciBwYXRjaCB0byBzaW1wbHkgc2V0dGluZyBtbWMtPmNhcHMyIHw9Ck1NQ19DQVAy
X01FUkdFX0NBUEFCTEU7ID8KRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCB0aGlzIHdpbGwgYWxsb3cg
cGh5c2ljYWxseSBjb250aWd1b3VzIFNHCmVudHJpZXMgdG8gYmUgbWVyZ2VkIGJ5IG1tYyBjb3Jl
LgoKVWxmOiB0aGUgY29kZSBoZXJlIGxvb2tzIHNpbWlsYXIgdG8gdGhlIHNkaGNpLmMgaW1wbGVt
ZW50YXRpb24uIEknbQp3b25kZXJpbmcgaWYgdGhlcmUgd2VyZSBhbnkgcGxhbnMgdG8gc29tZWhv
dyBtb3ZlIHRoaXMgdG8gTU1DIGNvcmUuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0
cHM6Ly9naXRodWIuY29tL2VuZGxlc3NtL2xpbnV4LW1lc29uL2Jsb2IvZDZlMTNjMjIwOTMxMTEw
ZmU2NzZlZGU2ZGE2OWZjNjFhN2NiMDRiNi9hcmNoL2FybS9tYWNoLW1lc29uOC9pbmNsdWRlL21h
Y2gvc2QuaCNMNjI3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==

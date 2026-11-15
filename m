Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA188606A323
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2qP1fjwf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Rn+smbFE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SaeB6JltktNFyBXx+OQ3ImJP/jCAOy3DnZtBpYjsUtQ=; b=2qP1fjwfAORjJ/BzWGCYoIHeTx
	QpKpTznld5RmunTOgKZ/mf4OqEof18fV8Ixbpook1/sugZoVPgA5GGcTEHf8UW8lrwffLDDsCIRpX
	rg4nU/971v0Fplrjaux25ennSNjV9BJ9p1GkLCdH+D0ROkwXhhJvaQ6hLkyVSgTfCBPwLQ0dUQARP
	y6io+S6tP0hb+sajMwebmnfZOAfRYQnGN0G0eeb2NU1kfMf3EGCkWjKM/KBTB1QkKqX7mZ72qul6k
	uzjiMn46GMYPFxnAnuU4FeBHsHStlbULyuQ7OXznwwBtnMxWF0NUqHkkpOLihUNAngVFyyb+DfpPq
	fVfk5CpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgwV-00000000Rjf-3rDa;
	Sun, 15 Nov 2026 20:35:15 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgwT-00000000Ric-0Ms1
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 20:35:14 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67db3a48dc6so445429d50.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 12:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794774912; cv=none;
        d=google.com; s=arc-20260327;
        b=n5dEPkAIYQi7/UFw2NRSi+lAuXXfjEkUmHYsy/Hbe92yU+j2+lTG+O5OY823C3oowe
         78HSKxkhlj759+mOAG1Yw4vrhHPNJBYFX6BZ7i8r31z7WOdMe+5B2NCk7/AhMF2kdxo1
         3b7Eoe2NvCn4cfosAr7Ar2o2jgs+E/Vkx0thKnJC+2rn32YsIDnRYoz6tXVhG3PkotNM
         W+zQIm17QgJIDtZLmZqc6/9EcWA0u1OCEf17SS1NRwHKL51Mz5w3OL2hgRquPBXrnMSI
         H0q2oKtdS8xBS0YQ0/35VSEH1hggfTxBoLi/Lz9K8U4vTbUoQH0zghQvbpnPdmhBbDIz
         kkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        fh=NGqOmAB2TC+fjgRdIz1gxpsIVFH7hKuzC4DSplDMN8A=;
        b=kQUuOcUoAKB27Fm8qjjwytQNUbWnzVDytlN+k5YryTQOajdKI+bs/WKkjOuOr1vHB3
         yWFTTu6VS7fGkUMwxM46QJ+69vv1GEdlhg8rFi2DH6keSc22ePu814q1jFUjFIuKFTFV
         7l1j5p9A7K6gcgnefZVFgsFfxOCS6FQWTPrKIdjcHpuwXzObtgBpVTo4+WiMZFLLh1Eq
         I5lM5cCZfVlM8H8sgfPm57pHnRFxIA4AlqcYkynqj8SNfAm+VUSwEje5CzVB+by5tKvn
         urGn1DlAU7wwjgosabJlrzVCWjmp8C/llb4viEENodqOj6KbJp4cDb27tw5UUdMrnA4q
         H4xw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794774912; x=1795379712; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=Rn+smbFE6aS/BsypiGIo6T47q1ic/NOAu89o9+7CGhTRD96Z61BFtbh9C0ntlGWzHl
         NniHMZOPmhFMPiMXwxN6v8SgcdVJlx3rU/RGJSw1JNiABRQ3ok92rW41Kc57wkizY7pJ
         cleZbFteY79nYgLKi1kb9yxmNTfVOYL7T6jUe7yHLfupPtYg6aMATzTHJI8IbV2SXX1Y
         QLZien2rvj+7AHUPOQWRgNXRF3NQ4en1A1jmndz8K84rpRGdlrKs3iaipoPLfbnYrdts
         2oLum2OMfaHSN+xIKRTxtvzJOcxYqSpCFP8nAiKP11fDS4N7/HETCOWcUbp+T79nXtOz
         0eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794774912; x=1795379712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=gDka04mejnb2T0b1OgCBDFSIX7jmCq3Cg3yqcj7BKC9Axu29M+QmYPqCXpQtSLUBYg
         rUdmJm2XA6HaFGa7D/OEA5ePOHJzJk4hu4Ij4Jlb4TMcY0DWqe48FMNcJVg8X9HK+Ma9
         18Hcaaz4GN8+0Af2MTdNQIwzChNkrQ2NRISKmX5642jVd2MXo+INb3E4WibVRShko1rs
         cDOR9mgdinHsG5lmAZOj6LmUSMu3+9NxUjNTpG42/gd5lIutvRs2pYk1S7PTOQtxpAHE
         yeTCliATt3deJn/mrxcVTnQD6ELaQfOwMySWcu96B2YLQmK0vQfeUszb5d1pDqOd732q
         gcLA==
X-Forwarded-Encrypted: i=1; AL+hErGfcdDASv5PgVxbPh25syYAvUCnpQW9n2sBpeBevW2VtPJkQgihnexyblA4KqLmU39STHoTIqwKUcjV9i6D@lists.infradead.org
X-Gm-Message-State: APuU4Z+4sXlfoYpLCFIAHrK/084rjPc7wkg9PMDjSRnnXklST5lj47QN
	caJOHbBiBY9FAkIlvuKg6jzOvB2O9apgwE5rb6DNHbwE1I93/tkqsLJBiQWU4QfrOx+ESoIsXB9
	JHPAjFJZPEZ10ImjYGNGucdv4mKOU+3g=
X-Gm-Gg: AYBFou2lK8ZjQE/2gCVHv29XB3Y2amoJp7jfj93FYNyqTF0ViAmTbDbiWsF46aGwczI
	uSfLfGEK0XSA1WSK6vU1GVrqwZMS1nMbrNzt/Dg7aiwCeekWDX/5L2KlxHa+i2VS+Yby4OwQCH8
	UQ8yhUwYSxNDRi3BHlRttNxzuHSjD5+uUFpJ2GZIwPKO4WIBGnGmWl31rOsLrGxYCfhIYZ3YTg1
	WLlwVLizV/s5gFdeBp0kw66ABPiopGRrNFQ2LS3mHihBsMyJiTnn9SSG1ftlzYL88OBJBrMiXw1
	JCiUZxG8DnMwd3OsrpEYyGYD5gjMg1XlvrMJH5y0fIyz9e4GvKPaI3m+cOY4xq7iiOPwvbO7VPV
	BKLMttT61vwr6z58CSA9o/9q9NP6pkM5BihZbS0dUDoWkKghFX3AXPAwhMIDDRhh0BkaSKg==
X-Received: by 2002:a05:690e:12cb:b0:67d:b94b:6021 with SMTP id
 956f58d0204a3-67db94b66dcmr213466d50.143.1794774911740; Sun, 15 Nov 2026
 12:35:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 21:35:01 +0100
X-Gm-Features: AclHuK-bZ0RnQfOiBUZa9VF3gQt02asaFssBFzc6vFvqnEmYWhTqvHFuHS-Culc
Message-ID: <CAFBinCDfE9J7fFnvJ2YqeFx1ZijY+5aFjGcpcBLMDrnpU8OipA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, krzk+dt@kernel.org
Cc: gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_123513_134588_DC660ADC 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMTo0NuKAr0FNCjxjaHJpc3RpYW4ua29ldmVyLWRyYXhs
QHN0dWRlbnQudWliay5hYy5hdD4gd3JvdGU6Cj4KPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSBTNCBVU0IgZ2x1ZSBpcyB0
aGUgRzEyQSBvbmUsIGJ1dCBpdCBmcm9udHMgYW4geEhDSSBob3N0IGNvbnRyb2xsZXIKPiBpbnN0
ZWFkIG9mIGEgRFdDMyBjb3JlLCB3aXRoIHR3byBVU0IyIFBIWXMgYW5kIG5vIFVTQjMgUEhZLiBB
ZGQgYW4gUzQKPiBjb21wYXRpYmxlIHdpdGggdGhlIEcxMkEgb25lIGFzIGZhbGxiYWNrLCBhbmQg
YWxsb3cgYSBnZW5lcmljIHhIQ0kKPiBjaGlsZCBub2RlLgpLcnp5c3p0b2YsIEkgaGF2ZSBoYXZl
IGEgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSBsYXN0IHNlbnRlbmNlOgoKWy4uLl0KPiAgICAgIG9u
ZU9mOgo+ICAgICAgICAtICRyZWY6IGR3YzIueWFtbCMKPiAgICAgICAgLSAkcmVmOiBzbnBzLGR3
YzMueWFtbCMKPiArICAgICAgLSAkcmVmOiBnZW5lcmljLXhoY2kueWFtbCMKRG9lcyB0aGlzIG1l
YW4gd2UgbmVlZCB0byB0aGUgYWxsb3dlZCBjaGlsZC1ub2RlcyB0byB0aGUgY29tcGF0aWJsZQpz
dHJpbmcgKHNvIG9ubHkgUzQgYWxsb3dzIGdlbmVyaWMteGhjaSBhbmQgRzEyQSBvbmx5IGFsbG93
cyBkd2MyL2R3YzMKYnV0IG5vdCBnZW5lcmljLXhoY2kpPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFD606A331
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AXZhcYhq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WfjJGYvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A/ecJUU66sXWkTAvIqjoUxihScdsfs0BQF1cog8OFGg=; b=AXZhcYhqWw3lXvZp4V+zujqEW8
	k/9hmnGIUysO8MurfE3Mgn+FC/YDxTjH1vCMcGTWuQLc98f2vitk5ifkiUGjR81gm1Ot1LJWcL33h
	7mLljwaNns2FmCPhxw8pYLqOneMk7LiistWGLnVYh6D+i+ucBjApNrRStHs9dSyqeewVpr3tVVCvU
	VONbAV4tcEL1t9FIbAs8S/OwcTL87DknEAxErdeLnyFp0UIIZi6fdbPB750ermp6dI86yN9fUtMrw
	8ldh5y2WICuSfFVPJk04RbCo4bNpVI5ynrGEwNkyBI+Qa6TkyNWdECJocRQqOBMbzyVNi00dfIY7L
	BpBoh36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePK-0000000FB9y-1HLa;
	Sun, 01 Nov 2026 22:52:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePH-0000000FB9E-3dBg
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 22:52:09 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-8b0d91601bdso26223327b3.1
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 14:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573526; cv=none;
        d=google.com; s=arc-20260327;
        b=mTNP1tkyvBKQqJCxX7ntV+dVUiirmqCGCInOWMKapQmRTDMXsYuF/ZlybhbTbt6ipu
         uj+5cw5DNT+fb7wrUE1+hL8aF4zxcNSfH+9Sawiy/SIOu2f4i0/ZiOSswX7IDlonLJ9C
         Lfn8CZWF3MXwrYXs5JWMdbQWiZUbaH7SB2tjihLhhkN/C9Axr5EqXWHnXSsx6ObdjSG1
         kWUixInrUQ0m3QsZWZ0JIZESvpydz53x10WXJWFhIL2yA/92KiSA+KlZDamvIlkIType
         73mV/Dlf4Z0vNW5qxzhaCtT2r90T5Qdis8MAr+akXRGZplGJu+Ap5mctUijLXQgllr09
         2rzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        fh=57JKfdNdX6h9rG3tSgCUHxOAJZXcnKy4oOO4vs6od6c=;
        b=Y9qQHG52bp7n16mcYsv5BxKZNDqdlR99CvOXOQMpLFymcM3Yy3sNiTO+JGMZfIk3aR
         zrDwptmPQtgjkkIxILohlLGxE44BoygzGFdxyj5XEFV/hAHacy9IXo+oAHdZ6e7xidnV
         ZWWAJy/DfIfOTykoF1IAcJi7fr+z2RjgcwhGCyVjgBVAQjrShTxeu9iGQkDwZ5UblHoP
         4qgF5LUJ4eCLLh7supRJWk+fEj4gGmdLBeQcVtZiEbl/D1oFBB+9gI/b/BuES229lCrg
         UH5vL2KBvMStauDyoTcJSEU2FL6BwlJfLs8PzorYXZ8roP/zed4n/PBYYh6zS8VPeQVA
         paRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573526; x=1794178326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        b=WfjJGYvrVO+7Z9XJ271q/Dq9XvIAmJcHvDcp0gsjSeQpy48pOi7/YfhPGTRvqoFq2A
         olMifvQPo3RyjQ0mONRJX56xR7vAjCqRW/8nRRTCVoRjEMk/YoiaG59BRapuXDpNOZEb
         Lndyi13XpUNqQRTH3K2E4JoM7oowri0jrSF7i0D+jZv7xVgpEixV2RVUg1/NF/eHnH6x
         4LV6Pr+IpBbA4AXC/tfNXVncnKiQY0FJLzhlDFHdOSkulz3+ktXuTpYCpGoGgTLcZzST
         sQn6SejOJF858OeNwuWkjZZc3tIG9BpMRoqUTUFScxDf8VJ3Kr12c8GeH6rLFCG5tBR3
         V8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573526; x=1794178326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        b=2S3UzgXYQwndVvmkcGPSwMAAGe5bBDJNM4+hVwXLaG8n2ih1PW/Vz6duSofom7mCDp
         EuxVKtUoSIhfARF2gZYZ2f8DwVlEGXbZShYHe2LGB4rCeFoci31z2N5RmEczQZlzskaR
         K+0bcGwW598u2mOsUVQMu0+ey9DVoD0++/pgE2/BkwsZj5Bkoi2bahFv5IzLS7KIHJ+Q
         08I6fwE0G9ef6VRkpVELK/2E4AxSfKGJJyx3mxpxDYyGAAOfeihSDUzSdM7tMF7ayHAc
         eHBiKTo58MpbOfVNWb+IcS3QXf7EpMhKC8DzSujGWhIVLpBUbiCFXN4O8OGC8ZSytZ7l
         WFsQ==
X-Forwarded-Encrypted: i=1; AKwUvByfsbSYNGPAjNEm3n+fDu1ncybMJpIpbJwa8ZIYND6Rxmux0+pfFui93IF+uk/B0pXOxfnELlHM0k0nMwrf@lists.infradead.org
X-Gm-Message-State: APuU4Z+Pa84Wx8ekUHK0QMPTJnH1UWLh17P9BRArCbiyYQZPfqMGdHDb
	ZmR0ibqkDGkFPoCcQVN2SgKH8zyWkW8285Dn00um/BmAwe5njLK++12IttrG9qmgK2wmKKTHjS5
	jU40cF8PLA5TycPKzwHyBtYX03puvLPrNAfQz
X-Gm-Gg: AYBFou17PwlGCfHH940gQKrbf29ave0dh3gepPq4y0eLmWQwOCpiQUVS3L69li4OmBt
	dXnVM8jsiX7JVVESTqn+gLtX4tLf35aYurQrfz6UYU+SsT4sFclHQ9t6iXwyu3z2qbG+aAz1DR9
	tNPQ/3MVz4j14sbm5ChIQWib85UnYeUgcwKLjz/66fEL2I5RTshURdDdl0xSanB5N4dR9WAxUrD
	Kyly/ZCzezaDkmH52RNheXN5MMJlZ3mVrXp3rFnqdk1hgPKfYjU59eVvnqx1dd8dmQ8ZiYwWsth
	/FWhP5ThubnsWWQRtZFyg7fZ2r70Sqmz6FTcQ8Ne9bz9Poxwq4Ngy/wgCykxvvV1dGtU4QQSxWE
	7FcNl+AiqAoa9DEbcI8XshFqtWCYay1/OQeq/byc80cEKTPQ0SmuR6lGn5JmKvyoyfQLxIA==
X-Received: by 2002:a05:690e:d8b:b0:679:c17e:407a with SMTP id
 956f58d0204a3-67a8d6465a6mr9056359d50.49.1793573526001; Sun, 01 Nov 2026
 14:52:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
In-Reply-To: <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:51:55 +0100
X-Gm-Features: AclHuK_A-gwxcDtkBYM_gQIRYpVip7Aj0wblI5gGxYX_krXiPxYiKaGZaOCuxQI
Message-ID: <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_145207_914487_1A456CD5 
X-CRM114-Status: GOOD (  29.40  )
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
Cc: =?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>, neil.armstrong@linaro.org, conor+dt@kernel.org, christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org, sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, bmasney+clk@redhat.com, robh@kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2h1YW4sCgpPbiBUaHUsIE9jdCAyOSwgMjAyNiBhdCA2OjMw4oCvQU0gQ2h1YW4gTGl1IDxj
aHVhbi5saXVAYW1sb2dpYy5jb20+IHdyb3RlOgpbLi4uXQo+IFJlZ2FyZGluZyB0aGUgY29uY2Vy
biBJIG1lbnRpb25lZCBhYm92ZSBhYm91dCBzdXBwb3J0aW5nIGEgdW5pZmllZAo+IGNwdWZyZXEg
ZHJpdmVyIGFjcm9zcyBTNCwgQzMsIFQ3LCAuLi4sIEE5LCBsZXQgbWUgZXhwbGFpbiBpdCBpbiBt
b3JlIGRldGFpbDoKPiAgICAgLSBUaGVzZSBTb0NzIGZhbGwgaW50byBzZXZlcmFsIGhhcmR3YXJl
IGFyY2hpdGVjdHVyZSBjYXRlZ29yaWVzLCBhbmQKPiBJJ20gd29uZGVyaW5nIHdoZXRoZXIgd2Ug
Y291bGQgdGFrZSBhbGwgb2YgdGhlbSBpbnRvIGNvbnNpZGVyYXRpb24gYW5kCj4gaW1wbGVtZW50
IHRoZW0gaW4gYSBzaW5nbGUgYW1sb2dpYy1jcHVmcmVxLmMsIGZvciBleGFtcGxlOgpJIHRoaW5r
IHRoZSBtYWluIHF1ZXN0aW9uIGhlcmUgaXM6IGhvdyBtdWNoIGNvZGUgaXMgc2hhcmVkIGJldHdl
ZW4KdmFyaW91cyBTb0MgZ2VuZXJhdGlvbnMuCgo+ICAgICAgICogUzQvQzM6IDEgKiBjbHVzdGVy
Cj4gICAgICAgKiBUNzogMiAqIGNsdXN0ZXJzCj4gICAgICAgKiBTNy9TN0QvUzY6IDEgKiBjbHVz
dGVyICsgRFNVCj4gICAgICAgKiBBOTogMiAqIGNsdXN0ZXJzICsgRFNVICh0aGUgMiBjbHVzdGVy
cyBzaGFyZSBvbmUgRFNVKQo+ICAgICAtIEZvciBkaWZmZXJlbnQgaGFyZHdhcmUgYXJjaGl0ZWN0
dXJlcywgdGhlIHJlc291cmNlcyB0aGF0IHRoZQo+IGNwdWZyZXEgZHJpdmVyIGhhcyB0byBtYW5h
Z2UgYWxzbyBkaWZmZXIgYW5kIGFyZSBjb3VwbGVkIHdpdGggZWFjaAo+IG90aGVyLCBmb3IgZXhh
bXBsZToKPiAgICAgICAqIFM3L1M3RC9TNjogdGhlIENQVXMgYW5kIHRoZSBEU1Ugc2hhcmUgYSBz
aW5nbGUgcG93ZXIgcmFpbCwgYW5kCj4gdGhlIERTVSBmcmVxdWVuY3kgc2NhbGVzIHByb3BvcnRp
b25hbGx5IHdpdGggdGhlIENQVSBmcmVxdWVuY3kKPiAodHlwaWNhbGx5IGRzdV9jbGsgPSBjcHVf
Y2xrICogODAlKQo+ICAgICAgICogQTk6IHRoZSByZXNvdXJjZXMgdGhhdCBBOSBuZWVkcyB0byBt
YW5hZ2UgYXJlIHJlbGF0aXZlbHkgbW9yZQo+IGNvbXBsaWNhdGVkIC4uLgo+ICAgICAtIE9wdGlt
aXppbmcgdGhlIGNwdWZyZXEgdHJhbnNpdGlvbiBsYXRlbmN5Ogo+ICAgICAgICogQ2xvY2sgbGF0
ZW5jeTogZm9yIG1vc3QgUzQvQzMvVDcgY3VzdG9tZXJzLCB0aGUgcmVsZWFzZWQgYmwzMS5iaW4K
PiBvbmx5IHN1cHBvcnRzIGNvbmZpZ3VyaW5nIHRoZSBDUFUgY2xvY2sgdGhyb3VnaCBTTUNzIHdp
dGggZGlzY3JldGUgY2xvY2sKPiByYXRlcy4gRnJlcXVlbnQgc2V0X3JhdGUoKS9zZXRfcGFyZW50
KCkgY2FsbHMgaW4gdGhlIGtlcm5lbCB3b3VsZCByZXN1bHQKPiBpbiBhIHJlbGF0aXZlbHkgbGFy
Z2UgY2xvY2sgbGF0ZW5jeSwgYW5kIHdvdWxkIGNhdXNlIHRoZSBzdWdvdiB0aHJlYWQgdG8KPiBj
b25zdW1lIHRvbyBtdWNoIENQVSB0aW1lLCBodXJ0aW5nIHNjaGVkdWxpbmcgcGVyZm9ybWFuY2Uu
CldlIGFsc28gc3VwcG9ydCBhIGZldyBtb3JlIFNvQyBnZW5lcmF0aW9ucyB1cHN0cmVhbToKLSBN
ZXNvbjgvOGIvOG0yICgzMi1iaXQgQVJNIENvcnRleC1BNS9BOSkgd2hlcmUgd2UgbmVlZCB0byBy
ZXBhcmVudAp0aGUgQ1BVIGNsb2NrIHRvIFhUQUwgZm9yIHN0YWJsZSBvcGVyYXRpbmcgZHVyaW5n
IGNsb2NrIGNoYW5nZXMgKHdoaWNoCnNob3VsZCBnbyBpbnRvIGEgY3B1ZnJlcSBkcml2ZXIgdGhh
dCBpbXBsZW1lbnRzIHRhcmdldF9pbnRlcm1lZGlhdGUpLgpUaGVyZSdzIG5vIHNlY3VyZSBtb25p
dG9yIG9yIGZpcm13YXJlIGludm9sdmVkIGZvciBDUFUgY2xvY2tzLgotIEdYQkIvR1hML0dYTSB1
c2UgU0NQSSBmaXJtd2FyZSBDUFUgY2xvY2sgY29udHJvbCBzbyB0byBteSBrbm93bGVkZ2UKd2Un
cmUgZ29vZCB3aXRoIHdoYXQgd2UgaGF2ZSAobWVhbmluZzogbm8gY3VzdG9tIGNwdWZyZXEgZHJp
dmVyCm5lZWRlZCkKLSBHMTJBIHNpbmdsZSBjbHVzdGVyLCBubyBEU1U6IG5lZWRzIGEgY3B1ZnJl
cSBkcml2ZXIgdGhhdCBpbXBsZW1lbnRzCnRhcmdldF9pbnRlcm1lZGlhdGUgKGN1cnJlbnRseSBp
dCdzIG1hbmFnZWQgb24gY2xvY2sgZHJpdmVyIHNpZGUgaW4Ka2VybmVsIHNwYWNlLCBubyBmaXJt
d2FyZSBpbnZvbHZlZCkKLSBHMTJCIG11bHRpIGNsdXN0ZXIsIG5vIERTVTogbmVlZHMgYSBjcHVm
cmVxIGRyaXZlciB0aGF0IGltcGxlbWVudHMKdGFyZ2V0X2ludGVybWVkaWF0ZSAoY3VycmVudGx5
IGl0J3MgbWFuYWdlZCBvbiBjbG9jayBkcml2ZXIgc2lkZSBpbgprZXJuZWwgc3BhY2UsIG5vIGZp
cm13YXJlIGludm9sdmVkKQotIFNNMSBzaW5nbGUgY2x1c3RlciBhbmQgRFNVOiBuZWVkcyBhIGNw
dWZyZXEgZHJpdmVyIHRoYXQgaW1wbGVtZW50cwp0YXJnZXRfaW50ZXJtZWRpYXRlIChjdXJyZW50
bHkgaXQncyBtYW5hZ2VkIG9uIGNsb2NrIGRyaXZlciBzaWRlIGluCmtlcm5lbCBzcGFjZSwgbm8g
ZmlybXdhcmUgaW52b2x2ZWQpCgpbLi4uXQo+IFRoZSBhbWxvZ2ljLWNwdWZyZXEuYyBhcyBpbXBs
ZW1lbnRlZCBoZXJlIGNhbiBpbmRlZWQgY292ZXIgdGhlIGNhc2Ugb2YgYQo+IHNpbmdsZSBjbHVz
dGVyIHdpdGggbm8gc2hhcmVkIHJlc291cmNlcywgc3VjaCBhcyBTNC9DMy9UNy4gSG93ZXZlciwg
Zm9yCj4gdGhlIHVwY29taW5nIFNvQ3Mgd2hlcmUgbXVsdGlwbGUgY2x1c3RlcnMgc2hhcmUgcmVz
b3VyY2VzLCBpdCBtYXkgbm90IGJlCj4gc3VmZmljaWVudCB0byBjb3ZlcjogZm9yIGV4YW1wbGUs
IG9uIFM3L1M3RC9TNiB0aGUgQ1BVcyBhbmQgdGhlIERTVQo+IHNoYXJlIG9uZSByZWd1bGF0b3I7
IG9uIEE5IHRoZSB0d28gY2x1c3RlcnMgc2hhcmUgdGhlIGRzdV9jbGssIGFuZCB0aGUKPiBzaGFy
aW5nIHJlbGF0aW9uc2hpcHMgYW1vbmcgY3B1X3JlZywgY3B1X3NyYW1fcmVnLCBkc3VfcmVnIGFu
ZAo+IGRzdV9zcmFtX3JlZyBhcmUgZXZlbiBtb3JlIGNvbXBsaWNhdGVkLiBGb3Igc3VjaCBjYXNl
cywgZXh0ZW5kaW5nIHRoZQo+IGN1cnJlbnQgYW1sb2dpYy1jcHVmcmVxLmMgd291bGQgYmUgcmF0
aGVyIGRpZmZpY3VsdCwgc28gd2Ugd291bGQgbGlrZSB0bwo+IG1ha2UgYW4gb3ZlcmFsbCBldmFs
dWF0aW9uLgpJIHRoaW5rIHlvdSdyZSBtYWtpbmcgYSBnb29kIHBvaW50IHdoeSBpdCdzIGZpbmUg
dG8gaGF2ZSBtdWx0aXBsZQpjcHVmcmVxIGRyaXZlcnMgZm9yIEFtbG9naWMgU29Dcy4KTXkgc3Vn
Z2VzdGlvbiBpbnN0ZWFkIGlzIHRvIG5hbWUgdGhlIGRyaXZlciBpbiB0aGlzIHNlcmllcwphbWxv
Z2ljLXM0LWNwdWZyZXEgKG9yIHNpbWlsYXIpLiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIEMzIHN1
cHBvcnQKKG1heWJlIGFsc28gVDc/KSBjYW4gYmUgZWFzaWx5IGFkZGVkIHRvIHRoZSBzYW1lIGRy
aXZlci4KRm9yIHRoZSAzMi1iaXQgU29DcyBJJ20gcGxhbm5pbmcgdG8gaW1wbGVtZW50IGFtbG9n
aWMtbWVzb244LWNwdWZyZXEuCkkgZG9uJ3Qga25vdyBob3cgcmVsZXZhbnQgRFNVIGlzIG9uIFNN
MSwgZGVwZW5kaW5nIG9uIGhvdyB0cmlja3kgaXQgaXMKc3VwcG9ydCBtYXkgZWl0aGVyIGdvIGlu
dG8gYW1sb2dpYy1tZXNvbjgtY3B1ZnJlcSBvciAoYSBuZXcpCmFtbG9naWMtbWVzb24tZzEyYS1j
cHVmcmVxLgpBbmQgZm9yIHRoZSBuZXdlciBTb0NzIGxpa2UgUzcvUzdEL1M2L0E5Ly4uLiBJIHRy
dXN0IHlvdXIgaW5zdGluY3Qgb24Kd2hldGhlciB0aGV5IHNob3VsZCBiZSBpbiBvbmUgZHJpdmVy
IG9yIG11bHRpcGxlLgoKPiBXZSBoYXZlIGRvbmUgYSBsb3Qgb2Ygb3B0aW1pemF0aW9uIG9uIHRo
ZXNlIGlzc3VlcyBmcm9tIGJvdGggdGhlCj4gaGFyZHdhcmUgYW5kIHNvZnR3YXJlIHNpZGVzLCBh
bmQgd2Ugd291bGQgbGlrZSB0aGUgY3B1ZnJlcSBkcml2ZXIgd2UKPiBzdWJtaXQgdXBzdHJlYW0g
dG8gY292ZXIgdGhlc2Ugb3B0aW1pemF0aW9ucyBhcyBtdWNoIGFzIHBvc3NpYmxlLiBGb3IKPiBl
eGFtcGxlLCB0aGUgYmwzMS5iaW4gZm9yIFM0L0MzL1Q3IGhhcyBhbHJlYWR5IGJlZW4gcmVsZWFz
ZWQsIGFuZAo+IHVwZGF0aW5nIGJsMzEuYmluIG1heSBjYXVzZSBleHRyYSB0cm91YmxlIGZvciBj
dXN0b21lcnMsIHNvIHdlIHdvdWxkCj4gYWxzbyBsaWtlIHRvIGJhbGFuY2UgdGhpcyBhbmQgc2Vl
IGhvdyB0byBtaW5pbWl6ZSB0aGUgaW1wYWN0LgpJIGFncmVlLiBJIG15IG9waW5pb24gaXQgd291
bGQgYmUgYmVzdCB0byBhbGxvdyB0aGUgT1MgKGluIHRoaXMgY2FzZToKTGludXgpIHRvIG1hbmFn
ZSBjbG9ja3Mgc28gKGNsb3NlZCBzb3VyY2UpIGZpcm13YXJlIGJpbmFyeSBibG9iCnVwZGF0ZXMg
Y2Fubm90IGNhdXNlIGFueSB0cm91YmxlLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

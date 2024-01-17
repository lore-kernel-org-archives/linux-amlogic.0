Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75774C47258
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jan 2024 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSkTr0oTjyswL4Mt9aAvNJRZ2+Se11fjvHQApgrGOQc=; b=FIceLFZndP2pRm
	M5VQfxO0umgO3ZtMdZ3TbEzq8FWvOwwIzGogrof3OylDUF/K3jUOFsKJb5A25L+MWpsq/SkSVXfbZ
	fnokNPkruEbOtrVodJNMKZPcHbe6hTtWPfBHt5GOQVzif9Ncum90fdL3NWKNe1AGGHMmoKpEHt4uf
	gY1Fa8A+lg+o4z1OXdy3j6yHif1L4iaiEqtqsg1thhEq6JtaSZgnnQxfoqmjVGCNm/cbriBrZ8Ana
	DNWNJjRQg+LkVQ1p4JW4X2/hObE1CDUq7jf9apsHfNDd2oLA9TOQSOD9UlA5Z1w6nBGP0ZtPTZ0YM
	qk/bxNWfV0kWu9DvsIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ32o-00FFZL-2L;
	Wed, 17 Jan 2024 10:21:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ32k-00FFYq-0I
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jan 2024 10:21:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40e86a9fbd9so11909975e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jan 2024 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1705486867; x=1706091667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mSVG7D4F/4/rMlg7YZmDmtDRH4U8gyyZuRonzPy+H4=;
        b=UmOo/PD0XnqC6YvQpniFA+UrEuinCvUg/A6BY2wOUKuuLX7jb13rSjOy7BZRAxpaDB
         BlGzDsKJp1x9s3xwxC6MLG88LrHquwVvDfZiTbSfsclyffEz/4hRKvlFWtcUaM1SLl6a
         GMMvKtiKUMlWY/yz93LNqjJZgVR6/B/svocSqNi2+4a+o0t9K/dykRw5fsaOuK2+c9On
         zKnyvD5z9eECNXlfjJ1thxS9SCnMPP3Zdo7IceoS6T8bNCFrHIC3of2+56WYJzRgBsNv
         EnlqrKDUTwR305IdIWdItXWl10GBHKwD8Sq7ektlekKO5MPzz0RLcraSynh7EUyS2aMU
         eQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705486867; x=1706091667;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5mSVG7D4F/4/rMlg7YZmDmtDRH4U8gyyZuRonzPy+H4=;
        b=b1gWf4TPdIKM8yNPyXfqxii0pzUv0g/Phm+mxy+eVfxUOd/MGJSj7+vcsMt6MJ48V5
         hbUASrAxg1HtQXEqdBzOPw3ulguIi+RqVuarlzuairolwBb0uaSdaVcTRk8heFHvsPdW
         TQ/Of+BrkdWWj169l+0B5Ex4tK4c2o/r2zigwDgcra4APAe6ePJheVzJtwJyjygJFZTj
         j6XMOgodjP04RO+FeNnGPmEqHO9V32vBCJsH87Ss2Pd4y6HpxnJS8gjQkf2cgo1vnPWy
         gju2ZRFSErtK/RSubAI/BFf6oqDc18D/gOIDF1/5aINWImhia6r9qJWUwfA7Br62ov9B
         exCw==
X-Gm-Message-State: AOJu0YwlNrLoKzqh7Il0yRqmFsaHQCii3K0Lh4QfiK3QyrWsXx2/THUQ
	EAEmLzjKJIb8HLNwGh2bnZH+HqNYE8jUcQ==
X-Google-Smtp-Source: AGHT+IHkPtaUfaJlpb5rgGajtKU+P5rzVz0YPS17UdzuHDV8aXYHDcinmlVZjk1+b215qJd7ggkx8A==
X-Received: by 2002:a05:600c:22cc:b0:40e:3dcd:2e24 with SMTP id 12-20020a05600c22cc00b0040e3dcd2e24mr4695637wmg.180.1705486867325;
        Wed, 17 Jan 2024 02:21:07 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:c1f6:14ce:b96f:2df5])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0040e526bd5fdsm1894578wmn.1.2024.01.17.02.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 02:21:06 -0800 (PST)
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-3-jbrunet@baylibre.com>
 <4rdb2be2bfzak3s4uaizthcdcdwdrxnx4kr2sgn527hvsie3pb@gfqciim7yryz>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: pwm: amlogic: add new compatible
 for meson8 pwm type
Date: Wed, 17 Jan 2024 11:16:31 +0100
In-reply-to: <4rdb2be2bfzak3s4uaizthcdcdwdrxnx4kr2sgn527hvsie3pb@gfqciim7yryz>
Message-ID: <1jfrywxnu5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_022110_374256_20C346E7 
X-CRM114-Status: GOOD (  12.76  )
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

Ck9uIFdlZCAxNyBKYW4gMjAyNCBhdCAxMDo1OCwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gSGVsbG8sCj4KPiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAxMjoxNjo1MFBNICsw
MTAwLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tYW1sb2dpYy55YW1sCj4+IGluZGV4IGExZDM4MmFh
Y2I4Mi4uZWVjZTM5MDExNGEzIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2ljLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tYW1sb2dpYy55YW1sCj4+IEBAIC0yMSwyMyArMjEs
MzUgQEAgcHJvcGVydGllczoKPj4gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1lZS1w
d20KPj4gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1hby1wd20tYWIKPj4gICAgICAg
ICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1hby1wd20tY2QKPj4gLSAgICAgICAgICAtIGFtbG9n
aWMsbWVzb24tczQtcHdtCj4+ICsgICAgICAgIGRlcHJlY2F0ZWQ6IHRydWUKPj4gICAgICAgIC0g
aXRlbXM6Cj4+ICAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1neC1wd20KPj4gICAg
ICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWd4YmItcHdtCj4+ICsgICAgICAgIGRlcHJl
Y2F0ZWQ6IHRydWUKPj4gICAgICAgIC0gaXRlbXM6Cj4+ICAgICAgICAgICAgLSBjb25zdDogYW1s
b2dpYyxtZXNvbi1neC1hby1wd20KPj4gICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29u
LWd4YmItYW8tcHdtCj4+ICsgICAgICAgIGRlcHJlY2F0ZWQ6IHRydWUKPj4gICAgICAgIC0gaXRl
bXM6Cj4+ICAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjgtcHdtCj4+ICAgICAgICAg
ICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjhiLXB3bQo+PiArICAgICAgICBkZXByZWNhdGVkOiB0
cnVlCj4KPiBJIHRoaW5rIGRlcHJlY2F0aW5nIHRoZSBvbGQgYmluZGluZyBhbmQgYWRkaW5nIGEg
bmV3IGNvbXBhdGlibGUgc2hvdWxkCj4gYmUgZG9uZSBpbiB0d28gY29tbWl0cy4KCkhpIFV3ZSwK
ClRoZXJlIHdhcyB0aGUgc2FtZSBjb21tZW50IG9uIHYzIGFuZCBLcnp5c3p0b2Ygc2FpZCBpdCBz
aG91bGQgYmUgZG9uZQpsaWtlIHRoaXM6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1w
d20vZTEyN2RjZWYtMzE0OS00NDNhLTlhOGMtZDI0ZWY0MDU0ZjA5QGxpbmFyby5vcmcKCkkgdGVu
ZCB0byBhZ3JlZSB3aXRoIEtyenlzenRvZiBvbiB0aGlzIGJ1dCwgYXMgSSBwcmV2aW91c2x5IHNh
aWQsCkkgZG9uJ3QgcmVhbGx5IG1pbmQgb25lIHdheSBvciB0aGUgb3RoZXIuIEp1c3QgaGF2ZSB0
byBwaWNrIG9uZS4KCj4KPj4gKyAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244LXB3bS12Mgo+
PiArICAgICAgLSBpdGVtczoKPj4gKyAgICAgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgICAg
IC0gYW1sb2dpYyxtZXNvbjhiLXB3bS12Mgo+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVz
b24tZ3hiYi1wd20tdjIKPj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1wd20t
djIKPj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMi1wd20tdjIKPj4gKyAgICAg
ICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uOC1wd20tdjIKPj4gKyAgICAgIC0gY29uc3Q6IGFt
bG9naWMsbWVzb24tczQtcHdtCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCgotLSAKSmVyb21lCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

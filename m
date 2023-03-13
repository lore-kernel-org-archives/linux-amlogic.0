Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8561C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIiR+G5mW++q1nSGYv46miQXZsw161EC5iwywNSQ1nE=; b=2+wQlu1Rm3SRmf
	r2+zhIq7PLVQ448WWayH4h/n1mj+YrekYbPz2P5iXlHaenT3M8cMJV4QcY8gCTzvfjGlR0FUh6Xd/
	QVARChQpoI30G+FXZ5wrqNUDpQYZEUErrT99xUjbe/UTSX3Q5Db9a0JdqdZDaxO6kV7nN3eQc0T+T
	otx1PiG+e3gBi9khBac7F9uTMsT97VHF3tiN8OBNIYEXrbHtFpa8ZlpYEBc4DquYe68dM0ghm+FwM
	3Gwzgi1/erkpuFYrh7LPPoRRHHLinBrHzXUsXQQHiR66Qc/FYsBMmYSgLsG/+xZu6geAjZr5uMBAn
	pzEXlJteM4gYl27raQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboFc-007aGl-AR; Mon, 13 Mar 2023 19:54:32 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboFY-007aGE-Uo; Mon, 13 Mar 2023 19:54:30 +0000
Received: by mail-ed1-x531.google.com with SMTP id ek18so22228364edb.6;
        Mon, 13 Mar 2023 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678737266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1TeuIm6ayHjIy24Lm3ETv+nxzgalcm9KhKyxrfJQ8k=;
        b=n0gE71gKXxWqBOLCKophLCySCKtpSftsMH7F/l6SBwyRZF5jWw9Abi8PCE62XAPeK1
         svIW3bisv86v4MpohTZsk8+nDvnD5b3a2WUxoDgtGxjj/Lo1+36VHPYNBWusuTA7ENrJ
         zdRM/NZ0Nzg7qbpcqX45TDA/NK/ynrOcvuQTzB3sAvI0OSFtYSbucMQiDC7X/aeAXdL6
         00rxYpwJttwC4j0Zbpx8u3ys19tO4GlmkzPY8JkPSBDqbThqpVz74pukLv01+g4cZWm0
         amsNufYYTmCXHna0gpUob69JRlA0k7nJsQawOb9S58jWzmslss/l2v42664VS3s3gmF/
         tRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678737266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1TeuIm6ayHjIy24Lm3ETv+nxzgalcm9KhKyxrfJQ8k=;
        b=rgvPecsW31A1lqgatR0B3fbU0h1FFdyJZHO1mRx6B/ZHwHX7JAeF40jO5JSK5Iwdjp
         jKilHL1C2VZExWMkkF7GX3+tZztF0e2WAZFW6OkDpRIPJ/73KU1XzSO417ZmDmpRBlv1
         X4VIxMQzd8EJM9y72TVMEbDlgr4o12Grrw3sDEhBtZ2nNjiZc9WPh8ZZs7T9KQ4yN0aw
         n7zYi3IrW6x2AYjAg31xBUijHeR0DQGw3mVJGTVeHNz3EuO4/Ri15dF6BlPI/eShUCwq
         PW3k8KkY2s11E84TZqEpUQHbLD5dM8JN3NdXcTGkbz+TvX3M5w7a8n1ESCFu7fyuU09d
         kcjw==
X-Gm-Message-State: AO0yUKUuQ1B0VHnMIYyvEdQ6JlHhYlxTlwPEHphS4gPJsTweqKfZlW8+
	lrN2iF0YUqpJ44h36RRtwBN7NAAalrvQ2rO//FE=
X-Google-Smtp-Source: AK7set/ef1AFRFqDEKbt/RkM7VrxwvnKeYXk/ywKWy6Q/J+AZLdhDuawXgnw9h/yqAuThr4Qf/VobiC8GSdSIObal8I=
X-Received: by 2002:a17:906:1749:b0:8b1:2fff:8689 with SMTP id
 d9-20020a170906174900b008b12fff8689mr18339374eje.6.1678737266469; Mon, 13 Mar
 2023 12:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
 <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
 <1ja60h106q.fsf@starbuckisacylon.baylibre.com> <20230313095121.fsjw2gk3givwabvj@pengutronix.de>
In-Reply-To: <20230313095121.fsjw2gk3givwabvj@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 13 Mar 2023 20:54:15 +0100
Message-ID: <CAFBinCDDLEB1O5mAVzNugPKdXz7VWTJvw-peTXtu4xkTwLKsKA@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-pwm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
	Munehisa Kamata <kamatam@amazon.com>, Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_125429_035415_9EE3040D 
X-CRM114-Status: GOOD (  14.43  )
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

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgMTA6NTHigK9BTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKWy4uLl0KPiBBbm90aGVyIG9wdGlv
biBpcyB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGF0Ogo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiBpbmRleCAxNmQ3OWNh
NWQ4ZjUuLjI1YTE3N2EzZmEwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24u
Ywo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4gQEAgLTE2Miw4ICsxNjIsMTAgQEAg
c3RhdGljIGludCBtZXNvbl9wd21fY2FsYyhzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgc3RydWN0
IHB3bV9kZXZpY2UgKnB3bSwKPiAgICAgICAgIGR1dHkgPSBzdGF0ZS0+ZHV0eV9jeWNsZTsKPiAg
ICAgICAgIHBlcmlvZCA9IHN0YXRlLT5wZXJpb2Q7Cj4KPiAtICAgICAgIGlmIChzdGF0ZS0+cG9s
YXJpdHkgPT0gUFdNX1BPTEFSSVRZX0lOVkVSU0VEKQo+ICsgICAgICAgaWYgKHN0YXRlLT5wb2xh
cml0eSA9PSBQV01fUE9MQVJJVFlfSU5WRVJTRUQpIHsKPiArICAgICAgICAgICAgICAgV0FSTl9P
TkNFKDEsICJXcm9uZ2x5IHRyeWluZyB0byBzdXBwb3J0IGludmVyc2VkIHBvbGFyaXR5LiBQbGVh
c2UgcmVwb3J0IHRvIGxpbnV4LXB3bUB2Z2VyLmtlcm5lbC5vcmcgaWYgeW91IHJlbHkgb24gdGhp
c1xuIik7Cj4gICAgICAgICAgICAgICAgIGR1dHkgPSBwZXJpb2QgLSBkdXR5Owo+ICsgICAgICAg
fQo+Cj4gICAgICAgICBmaW5fZnJlcSA9IGNsa19nZXRfcmF0ZShjaGFubmVsLT5jbGspOwo+ICAg
ICAgICAgaWYgKGZpbl9mcmVxID09IDApIHsKPgo+IGFuZCB0aGVuIGRyb3AgdGhhdCBmYWtlZCBz
dXBwb3J0IGluIGEgeWVhciBvciBzbyBpZiBub2JvZHkgc3Bva2UgdXAuCj4KPiBEaXNjbGFpbWVy
OiBJIGFzc3VtZSBUaGllcnJ5IGlzIG5vdCBhIGZhbiBvZiB0aGlzIGFwcHJvYWNoLCBoZSBvcHBv
c2VkCj4gc2ltaWxhciB3YXJuaW5ncyBpbiB0aGUgcGFzdC4KSSBwZXJzb25hbGx5IHRoaW5rIGl0
J3MgZmluZSB0byBoYXZlIHRoaXMgd2FybmluZy4KSWYgVGhpZXJyeSBoYXMgbm8gb2JqZWN0aW9u
cyBpbiB0aGlzIGNhc2UgdGhlbiBpdCdsbCBoZWxwIHVzIGZpbmQKd2hldGhlciB3ZSByZWFsbHkg
bmVlZCBwcm9wZXIgc3VwcG9ydCBpbiBQV00gY29yZSBvciB3ZSBjYW4ganVzdApyZW1vdmUgdGhp
cyBmYWtlIHN1cHBvcnQgZnJvbSBwd20tbWVzb24KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

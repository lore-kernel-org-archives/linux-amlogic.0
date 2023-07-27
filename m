Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B269C04A94
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jul 2023 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIDQT6fwmL6kJ64H2TLFaHCkj7yghn0JasCkG82Dbbg=; b=lnKRGMgJ/kzF5G
	MzrpE0psjw/SNM6QgZ/xvdfpyLyj2lTNpV70mY3JkRej659wsRZsQpMNbawCQrrKkEUkHE8dNkLVM
	YSPTp4gHQC2c7XuvX5WrQZc2PWaP1kdo+qasZtlfbk6T+NYUep79IyJmjDjs4n2w90OE5nMzg8FXi
	F7WiJrMF2GQRwwUfPAqTea0AD0KxI+vKpuwuvrCzUd/dGZI4FhcDTxNogCWiVSa3FZ69RC+9xf3aY
	UV1xdthImtY43GCv9kJDUF9JPREW6nBirEfwbqMAPjXe9wt65HDQYjuHIAtmAsAOI9KEnUSzqCKOD
	kswhvhXLB+JSLBcRWb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6S3-000HVv-0u;
	Thu, 27 Jul 2023 19:15:07 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6S0-000HUd-1x;
	Thu, 27 Jul 2023 19:15:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98de21518fbso175882866b.0;
        Thu, 27 Jul 2023 12:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690485302; x=1691090102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3mLrIEj6i09sZTd8OZW9bqC9iQyhJ5LXxHWMM4QrZY=;
        b=Ed3WOFVlxxamSM13Mr4fMTkJyvhgXdfRjANj6CrginYJFyFM41FDvfaK2vEJ5lwNc0
         GCkIfkbG9ZzIQwucDgCEIA7MmvO+nPemT0JAPfHH9B8cDGWSFaPuX9GjHJc8r6fiF0kn
         c0J2EhpZMe7ibv9H00kQN/D+KPpdnbpTq3ISAInV0aj6BJMX6+Pxd6jbQeiVObPG/t0Y
         I2q5Fq01wTc26v18AQLeyxsN7Nyk7CFrdsz0KsgLwEL5dZ5o7QZ/SdhRZ+ikg/qXYtJQ
         5S1SS6l0X9C0fjahWw+fRxzAs2LRucCLwD9x7LSR5Hbvtetua/jA+LA+qtNO13QNZK+j
         BwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690485302; x=1691090102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3mLrIEj6i09sZTd8OZW9bqC9iQyhJ5LXxHWMM4QrZY=;
        b=H21oVTftTf15SqeHgiuNCFrIPMMI2+WLpohJRfj+yFdqZPU/MjVwbKtLAOtxDPDQfO
         vtSEMMwulfb+3fHXSVuKV++oYcraZ26CBGap1D0QA4B6gQgDNJwYZB7+s8t+kRExq21c
         CYkUyyy0He2KYaA8klBpc8Ah1l32haZsdbVt3bejU6TrVPfJ/CsOE2VfTVtHlyFiPwqd
         8LCwWS3+btq1pmPWzMuc796TVywXkbvxIq72LMkWJzW5wA6NA10LDtFQtbnoU2a7WnFP
         gs2q70rLiMV8bCXMoI5jZBj2NG5RxfhL1H5uQQ0Gvflx2EsbreGMt03Rz2ZU+ev27Od1
         PLCQ==
X-Gm-Message-State: ABy/qLZZCf1uzeB8uZlQVWe+84uT828WaipD/iW/8b57lpYO+1Ewn5/T
	xKxwmP4EqGgAaa58f0gugB+cihS4hWkE1uKVpWA=
X-Google-Smtp-Source: APBJJlHqe8Db9+ktxLkIwQKQ2FJd+P31M6a8NsywGTFbag00ryYo1w0bdwp358gbe5zeurhcoNMOkxR2lEulMI9JAmU=
X-Received: by 2002:a17:906:3189:b0:99b:c35a:8865 with SMTP id
 9-20020a170906318900b0099bc35a8865mr113365ejy.1.1690485301887; Thu, 27 Jul
 2023 12:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230725141252.98848-1-avromanov@sberdevices.ru> <20230725141252.98848-2-avromanov@sberdevices.ru>
In-Reply-To: <20230725141252.98848-2-avromanov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 27 Jul 2023 21:14:51 +0200
Message-ID: <CAFBinCBLjE051KeFzFZzjc=0ZuMHOQwRfWasxWRUOSwQO3jqYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drivers: rng: add check status bit feature
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com, 
	herbert@gondor.apana.org.au, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, f.fainelli@gmail.com, hkallweit1@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_121504_668089_3F7C5A68 
X-CRM114-Status: UNSURE (   8.66  )
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

SGVsbG8gQWxleGV5LAoKT24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgNDoxM+KAr1BNIEFsZXhleSBS
b21hbm92IDxhdnJvbWFub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ICBzdGF0aWMg
aW50IG1lc29uX3JuZ19yZWFkKHN0cnVjdCBod3JuZyAqcm5nLCB2b2lkICpidWYsIHNpemVfdCBt
YXgsIGJvb2wgd2FpdCkKPiAgewo+ICAgICAgICAgc3RydWN0IG1lc29uX3JuZ19kYXRhICpkYXRh
ID0KPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250YWluZXJfb2Yocm5nLCBzdHJ1Y3QgbWVz
b25fcm5nX2RhdGEsIHJuZyk7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbWVzb25fcm5nX3ByaXYg
KnByaXYgPSBkYXRhLT5wcml2Owo+ICsKPiArICAgICAgIGlmIChwcml2LT5jaGVja19zdGF0dXNf
Yml0KSB7Cj4gKyAgICAgICAgICAgICAgIHZvaWQgX19pb21lbSAqY2ZnX2FkZHIgPSBkYXRhLT5i
YXNlICsgcHJpdi0+Y2ZnX29mZnNldDsKPiArICAgICAgICAgICAgICAgaW50IGVycjsKSGF2ZSB5
b3UgY29uc2lkZXJlZCBqdXN0IGNyZWF0aW5nIHR3byBzZXBhcmF0ZSBmdW5jdGlvbnM6Ci0gbWVz
b25fcm5nX3JlYWQKLSBtZXNvbl9zNF9ybmdfcmVhZAoKVGhlbiB5b3UgZG9uJ3QgbmVlZCBhbGwg
b2YgdGhlc2UgaWYvZWxzZS4KWW91IGNhbiBldmVuIHNraXAgdGhlIHdob2xlIG9mZnNldCBkZXNj
cmlwdGlvbiBpbiB5b3VyIG5ldyBzdHJ1Y3QKbWVzb25fcm5nX3ByaXYuCkFsbCBvZiB0aGlzIGNh
biBtYWtlIHRoZSBjb2RlIGVhc2llciB0byB1bmRlcnN0YW5kLgoKPiArICAgICAgICAgICAgICAg
d3JpdGVsX3JlbGF4ZWQocmVhZGxfcmVsYXhlZChjZmdfYWRkcikgfCBCSVQoU0VFRF9SRUFEWV9T
VFNfQklUKSwgY2ZnX2FkZHIpOwpXaHkgbm90IGp1c3QgI2RlZmluZSBTRUVEX1JFQURZX1NUUyBh
cyBCSVQoLi4uKSByaWdodCBhd2F5PwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

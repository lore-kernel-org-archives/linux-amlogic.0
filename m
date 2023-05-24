Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734D7C7EE2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D18pjE2gTSmSXz7xqC4iT3Kjc6n5DROqDpa7zYK0wYY=; b=SR7pjlVkXzwhqh
	oRt/rhCbNLlvvIbOmEIxUlWtZxQ74ENvtNhv1TU/YhsvYZpBdQgEyH2sUitxHuvw6kuuZFEaOMauK
	Ip3QfZZGWWz0/0q0Qem6KNWj3Qtrlf3LGPGNnoWfFIfA64usU6+4OCgArfkpJ7K5anicNR0DAscWj
	C8AV9zA3DfW5WVzBaRHMtbeLg5JCfpMObpm/qnVy24Orf2UXoX1ojguMiNVDhPYU0RZC+1GER4zaF
	cnnKaGOvPQURjcZORrrAovWso/3+3deUYrUwolNRpYJIi156z8yBBoeJfcGzUr8JLxg0o/eThFon9
	gIshhFao2qpJQQRgTBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXW-00EWMO-1L;
	Wed, 24 May 2023 19:52:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXN-00EWCg-2d;
	Wed, 24 May 2023 19:52:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-970056276acso196779966b.2;
        Wed, 24 May 2023 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957960; x=1687549960;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQt4vB+zOkte7n2X6CmDlExagU5OjizdoI8k0JY4EOQ=;
        b=VLVIYvlc3xdaG9fQAmq0qTM3/d1XkHI3Dy98zU6LPqU4j5jkVLj8I0l/QfJ7fopq98
         Y7udraFpDOT4vT7TH7YRfIGNbH+0QmXBCVX2c8K5/ts1UEuHJwJcwBh8F5nRiCqnmu7z
         64PwJNGolisTqhQv51c9N+U5tgIiGUcNEi17zZAc1zvKnN/CYHpWc8L/7QE/KjYta1ew
         xDlfRkAn+LD8+6awh1IWOSRb2KBGHzdBJ6X6MD0Dd1NuxloSv54VIxiByoAtQPWzP57T
         w1qrMJvK4K7conyQxYAGkGqWpGMN3bV3R4GVwYOACNWGCQeMU+P8aYtAISWeLYpMcUQz
         mrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957960; x=1687549960;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQt4vB+zOkte7n2X6CmDlExagU5OjizdoI8k0JY4EOQ=;
        b=On/Ckd2gXClqy23cqI/8iZ9TuazEc7a6PP0XX/Sgi5bQ2nYaOzsEopLHkWANwtUFt9
         tMhMwSeBFu6nsfMsgAUvqkuwokwRtjl2a5CBm9LaiLBWgLmfCLBFzgIMfpvVoftpf/KZ
         rTMj0mkSwf7VCVaqKZ0f/KOxLkvzuNsr6ze9vs1md3voHKV2OwfLmQ10Zv2vmjkMT8Ls
         er2TV9HHBr07ycSsnpxUNLCXcbMOS6Zqa8VJvyc111dw6letX4RtYGnKam4HZ+ynkMYT
         ZUuypvV6vC5hgPx8PTEBTkAGXSoUriaSnR4t9MsbiPolnIJutyzs69aX/if8r5rYkRrx
         YLUg==
X-Gm-Message-State: AC+VfDxKL2hNq7TjXep/kVSe00jgaFkoD+tz6bQBn4TCWLtzMn+vEOIK
	7epTDy2blBI25JvxJ5jzQvk=
X-Google-Smtp-Source: ACHHUZ6dOxNjjb/xWU+h6RMte8RHv9yjBTI+rcetpEsrC+chSNhcbvNnj6piReqjqfzJg4MSRSPQtA==
X-Received: by 2002:a17:907:9449:b0:969:cbf4:98fa with SMTP id dl9-20020a170907944900b00969cbf498famr17499502ejc.65.1684957960342;
        Wed, 24 May 2023 12:52:40 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id jy2-20020a170907762200b0096f689848desm6160383ejc.195.2023.05.24.12.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:52:40 -0700 (PDT)
Message-ID: <404a7747-298c-683f-e32c-5f009fff744f@gmail.com>
Date: Wed, 24 May 2023 21:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5 RESEND 2/6] pwm: meson: fix handling of period/duty if
 greater than UINT_MAX
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
In-Reply-To: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_125245_855894_01FC454B 
X-CRM114-Status: GOOD (  10.81  )
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

c3RhdGUtPnBlcmlvZC9kdXR5IGFyZSBvZiB0eXBlIHU2NCwgYW5kIGlmIHRoZWlyIHZhbHVlIGlz
IGdyZWF0ZXIgdGhhbgpVSU5UX01BWCwgdGhlbiB0aGUgY2FzdCB0byB1aW50IHdpbGwgY2F1c2Ug
cHJvYmxlbXMuIEZpeCB0aGlzIGJ5CmNoYW5naW5nIHRoZSB0eXBlIG9mIHRoZSByZXNwZWN0aXZl
IGxvY2FsIHZhcmlhYmxlcyB0byB1NjQuCgpGaXhlczogYjc5YzM2NzBlMTIwICgicHdtOiBtZXNv
bjogRG9uJ3QgZHVwbGljYXRlIHRoZSBwb2xhcml0eSBpbnRlcm5hbGx5IikKQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSGVpbmVy
IEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tbWVz
b24uYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIv
ZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggMzg2NTUzOGRkLi4zMzEwNzIwNGEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNv
bi5jCkBAIC0xNTYsOCArMTU2LDkgQEAgc3RhdGljIGludCBtZXNvbl9wd21fY2FsYyhzdHJ1Y3Qg
bWVzb25fcHdtICptZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJCSAgY29uc3Qgc3Ry
dWN0IHB3bV9zdGF0ZSAqc3RhdGUpCiB7CiAJc3RydWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFu
bmVsID0gJm1lc29uLT5jaGFubmVsc1twd20tPmh3cHdtXTsKLQl1bnNpZ25lZCBpbnQgZHV0eSwg
cGVyaW9kLCBwcmVfZGl2LCBjbnQsIGR1dHlfY250OworCXVuc2lnbmVkIGludCBwcmVfZGl2LCBj
bnQsIGR1dHlfY250OwogCXVuc2lnbmVkIGxvbmcgZmluX2ZyZXE7CisJdTY0IGR1dHksIHBlcmlv
ZDsKIAogCWR1dHkgPSBzdGF0ZS0+ZHV0eV9jeWNsZTsKIAlwZXJpb2QgPSBzdGF0ZS0+cGVyaW9k
OwpAQCAtMTc5LDE5ICsxODAsMTkgQEAgc3RhdGljIGludCBtZXNvbl9wd21fY2FsYyhzdHJ1Y3Qg
bWVzb25fcHdtICptZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAogCWRldl9kYmcobWVz
b24tPmNoaXAuZGV2LCAiZmluX2ZyZXE6ICVsdSBIelxuIiwgZmluX2ZyZXEpOwogCi0JcHJlX2Rp
diA9IGRpdjY0X3U2NChmaW5fZnJlcSAqICh1NjQpcGVyaW9kLCBOU0VDX1BFUl9TRUMgKiAweGZm
ZmZMTCk7CisJcHJlX2RpdiA9IGRpdjY0X3U2NChmaW5fZnJlcSAqIHBlcmlvZCwgTlNFQ19QRVJf
U0VDICogMHhmZmZmTEwpOwogCWlmIChwcmVfZGl2ID4gTUlTQ19DTEtfRElWX01BU0spIHsKIAkJ
ZGV2X2VycihtZXNvbi0+Y2hpcC5kZXYsICJ1bmFibGUgdG8gZ2V0IHBlcmlvZCBwcmVfZGl2XG4i
KTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JY250ID0gZGl2NjRfdTY0KGZpbl9mcmVxICog
KHU2NClwZXJpb2QsIE5TRUNfUEVSX1NFQyAqIChwcmVfZGl2ICsgMSkpOworCWNudCA9IGRpdjY0
X3U2NChmaW5fZnJlcSAqIHBlcmlvZCwgTlNFQ19QRVJfU0VDICogKHByZV9kaXYgKyAxKSk7CiAJ
aWYgKGNudCA+IDB4ZmZmZikgewogCQlkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgInVuYWJsZSB0
byBnZXQgcGVyaW9kIGNudFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCWRldl9kYmco
bWVzb24tPmNoaXAuZGV2LCAicGVyaW9kPSV1IHByZV9kaXY9JXUgY250PSV1XG4iLCBwZXJpb2Qs
CisJZGV2X2RiZyhtZXNvbi0+Y2hpcC5kZXYsICJwZXJpb2Q9JWxsdSBwcmVfZGl2PSV1IGNudD0l
dVxuIiwgcGVyaW9kLAogCQlwcmVfZGl2LCBjbnQpOwogCiAJaWYgKGR1dHkgPT0gcGVyaW9kKSB7
CkBAIC0yMDQsMTQgKzIwNSwxMyBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVjdCBt
ZXNvbl9wd20gKm1lc29uLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQljaGFubmVsLT5sbyA9
IGNudDsKIAl9IGVsc2UgewogCQkvKiBUaGVuIGNoZWNrIGlzIHdlIGNhbiBoYXZlIHRoZSBkdXR5
IHdpdGggdGhlIHNhbWUgcHJlX2RpdiAqLwotCQlkdXR5X2NudCA9IGRpdjY0X3U2NChmaW5fZnJl
cSAqICh1NjQpZHV0eSwKLQkJCQkgICAgIE5TRUNfUEVSX1NFQyAqIChwcmVfZGl2ICsgMSkpOwor
CQlkdXR5X2NudCA9IGRpdjY0X3U2NChmaW5fZnJlcSAqIGR1dHksIE5TRUNfUEVSX1NFQyAqIChw
cmVfZGl2ICsgMSkpOwogCQlpZiAoZHV0eV9jbnQgPiAweGZmZmYpIHsKIAkJCWRldl9lcnIobWVz
b24tPmNoaXAuZGV2LCAidW5hYmxlIHRvIGdldCBkdXR5IGN5Y2xlXG4iKTsKIAkJCXJldHVybiAt
RUlOVkFMOwogCQl9CiAKLQkJZGV2X2RiZyhtZXNvbi0+Y2hpcC5kZXYsICJkdXR5PSV1IHByZV9k
aXY9JXUgZHV0eV9jbnQ9JXVcbiIsCisJCWRldl9kYmcobWVzb24tPmNoaXAuZGV2LCAiZHV0eT0l
bGx1IHByZV9kaXY9JXUgZHV0eV9jbnQ9JXVcbiIsCiAJCQlkdXR5LCBwcmVfZGl2LCBkdXR5X2Nu
dCk7CiAKIAkJY2hhbm5lbC0+cHJlX2RpdiA9IHByZV9kaXY7Ci0tIAoyLjQwLjEKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

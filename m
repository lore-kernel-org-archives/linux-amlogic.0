Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E36C48BC4
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iDspK9CcPoD37537WO4z1HFJPOHWi7ZAgaMaUtZ4i8=; b=fgzlO+qEIzindq
	9ExNW/IEoY7HLGOlr5mVhqGs/BJR/EQSmqga/SnW3r/XBI1yQgMDokIDNziImf2wKH8Ys7CThCFFE
	gAX/4MUHdAhUo9Mo8bp+NWQASBeoIInFqRvgdIbFZOE5oHpl7SsWllF43/oBTKsvkSovIpbIzT54f
	pXdm+13irL8s321UVAlNJ+bw/FP/lx8f+hEAuwcqYJWVwiXFL7IDoJFHzR8r7Y+paIwdYW903BXCy
	M3aOnHEfnHTRlj17rZWAhJRr8snTfNJMsmP6gjqWW+xijhryUy7tGeoWJ0+ioeeePwO57AtLoSIr/
	GSD/fXFeT1cYfxVSUWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbq7t-00000008ahL-45xV;
	Sun, 18 Feb 2024 22:59:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbq7q-00000008agL-1C5X
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Feb 2024 22:59:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4126144d931so6967695e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Feb 2024 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708297148; x=1708901948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQQ2o/VIHyGxkFM7utx97JYZDFKZ38CN7sWDsc4f9qI=;
        b=UsQpOOAM3f5Ph5cj3bK20MaTseyTR3nVU6CbXngHgfUNtglvDd4ENmzvs2rflQnKlx
         c5UauQ3VpSLNTe93aidfbHaJR3GxloH1HKrLlY3QYWenAfzmjgtHzuevXNDTl2agOaS/
         RqWj+SBZssIQ5YYK+JT3LItlYoadOfvjNT+3B9rIZokBz4vAU9N4EZuNstg4EP3sEFKy
         u7i5V1JBiZt/Qq2jyLEBg5RSO3b1+angpBoVHOWMxp4qxrKQLm052rcyqI+/TR3CW81R
         bcLt82fHTj6h19BZPK7rM7ZLXw+oUssOYly+FhDl3OQj49l2hfODOGdZdzy53biw2AO+
         SD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708297148; x=1708901948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQQ2o/VIHyGxkFM7utx97JYZDFKZ38CN7sWDsc4f9qI=;
        b=DlD41klxMuh9Kyjg3pSAdZUX0B+f+DHTlFKY8H6xhfyVUSbPG/KhfQstJXSaHYYZrz
         w5qLDjHkFxCITm7+S/5QyvY6BHvHvpbALpNH7stinJryeDn8Vqy/ZxOCvXy69E5Un6Tz
         w6n6G3Q1pT9rNbg41bKQeruabmjeJqr04wtjGb03KqiKst62uJn6H7C8u37B1TjfWzDE
         1OJtzoy+I2g8Llo/IgrgSTLlgocTWKRP/0dsLx0Y0krY2glohl0kEh+DOpve4pB2YUG0
         COOxCr27Mdj/Y8zLE7p4ym327orbbeUSlY0ckhA+zmO/S8oR8J3CaOH3IIX1RhRfg2gf
         OmDw==
X-Forwarded-Encrypted: i=1; AJvYcCWCBREf9rWMtO4FDljfAEDTgWYbHBEuT17kjCc3p3b4kEQXCU4jQKrRmrtQyvJQbAimAIp+CWLC56Hq5xYb6tmxG8igyFDZ9L5n20W9J0lLx4E=
X-Gm-Message-State: AOJu0Yw1Mo2P4fpYl+gUjaqisSrAd1yxnV6+vduui17MPAHs8c1UPJoC
	uJQYiT5bnyp6MkcJqxA9IgIPZlZQWXTsX9V7zHz+NQ2VRiJS0+py0tiUFIGCucg=
X-Google-Smtp-Source: AGHT+IHeIJpIVjXPkhSQ8GhS6dd+ec6VWCACvhZGppCrUdq2BjsMWx2siRd1nRn9MmkDNotK0sVyHQ==
X-Received: by 2002:a5d:45c2:0:b0:33d:1596:d916 with SMTP id b2-20020a5d45c2000000b0033d1596d916mr4831372wrs.50.1708297148290;
        Sun, 18 Feb 2024 14:59:08 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ay3-20020a5d6f03000000b0033d1b760125sm8742879wrb.92.2024.02.18.14.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 14:59:07 -0800 (PST)
Message-ID: <ec0b3dfb-3ce2-43f2-9cd4-042c3aca4cf7@linaro.org>
Date: Sun, 18 Feb 2024 23:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] clocksource/drivers/arm_global_timer: Fix maximum
 prescaler value
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andrea.merello@gmail.com, patrice.chotard@foss.st.com,
 linux-amlogic@lists.infradead.org
References: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
 <20240218174138.1942418-2-martin.blumenstingl@googlemail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240218174138.1942418-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_145910_521356_B9FEE553 
X-CRM114-Status: GOOD (  13.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTgvMDIvMjAyNCAxODo0MSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBUaGUgcHJl
c2NhbGVyIGluIHRoZSAiR2xvYmFsIFRpbWVyIENvbnRyb2wgUmVnaXN0ZXIgYml0IGFzc2lnbm1l
bnRzIiBpcwo+IGRvY3VtZW50ZWQgdG8gdXNlIGJpdHMgWzE1OjhdLCB3aGljaCBtZWFucyB0aGF0
IHRoZSBtYXhpbXVtIHByZXNjYWxlcgo+IHJlZ2lzdGVyIHZhbHVlIGlzIDB4ZmYuCj4gCj4gRml4
ZXM6IDE3MWI0NWE0YTcwZSAoImNsb2Nrc291cmNlL2RyaXZlcnMvYXJtX2dsb2JhbF90aW1lcjog
SW1wbGVtZW50IHJhdGUgY29tcGVuc2F0aW9uIHdoZW5ldmVyIHNvdXJjZSBjbG9jayBjaGFuZ2Vz
IikKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rp
bmdsQGdvb2dsZW1haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fZ2xv
YmFsX3RpbWVyLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fZ2xv
YmFsX3RpbWVyLmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9nbG9iYWxfdGltZXIuYwo+IGlu
ZGV4IDQ0YTYxZGM2ZjkzMi4uZTFjNzczYmI1NTM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xv
Y2tzb3VyY2UvYXJtX2dsb2JhbF90aW1lci5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9h
cm1fZ2xvYmFsX3RpbWVyLmMKPiBAQCAtMzIsNyArMzIsNyBAQAo+ICAgI2RlZmluZSBHVF9DT05U
Uk9MX0lSUV9FTkFCTEUJCUJJVCgyKQkvKiBiYW5rZWQgKi8KPiAgICNkZWZpbmUgR1RfQ09OVFJP
TF9BVVRPX0lOQwkJQklUKDMpCS8qIGJhbmtlZCAqLwo+ICAgI2RlZmluZSBHVF9DT05UUk9MX1BS
RVNDQUxFUl9TSElGVCAgICAgIDgKPiAtI2RlZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVgg
ICAgICAgIDB4Rgo+ICsjZGVmaW5lIEdUX0NPTlRST0xfUFJFU0NBTEVSX01BWCAgICAgICAgMHhG
Rgo+ICAgI2RlZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLICAgICAgIChHVF9DT05UUk9M
X1BSRVNDQUxFUl9NQVggPDwgXAo+ICAgCQkJCQkgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfU0hJRlQK
Ckdvb2QgY2F0Y2ghCgpJTU8gdGhlIGluaXRpYWwgY29uZnVzaW9uIGlzIGNvbWluZyBmcm9tIHRo
ZSBzaGlmdCBhbmQgdGhlIG1hc2sgc2l6ZS4KCkJ1dCBzaG91bGQgR1RfQ09OVFJPTF9QUkVTQ0FM
RVJfTUFYIGJlIDI1NiA/IHNvICgweEZGICsgMSkKClRoZSBmb2xsb3dpbmcgbWF5IGJlIGxlc3Mg
Y29uZnVzaW5nOgoKI2RlZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9TSElGVAk4CiNkZWZpbmUg
R1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFTSwlHRU5NQVNLKDE1LDgpCiNkZWZpbmUgR1RfQ09OVFJP
TF9QUkVTQ0FMRVJfTUFYCShHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLID4+IFwKCQkJCQkgR1Rf
Q09OVFJPTF9QUkVTQ0FMRVJfU0hJRlQpICsgMQoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
Lz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

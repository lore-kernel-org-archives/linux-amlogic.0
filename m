Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9ECCCFA13
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 22:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/dtrkm9sVuCE1shHX3XyEAXeBUAgwC1GYoYRpQIC6M=; b=ISrOEdXjm09z8w
	cXfR0jqTGUulX+3h9d/gfx5dH70LQ2VMWhI7MQN2jEq12ABXpI2iRoDuQqfkfF/jykv49C/3a3iPl
	GQ20Trse76qZIwC9lBkhD/HKhiKyIB3EhXffXP3vv7xQCN9cz1d87gwBXQ0r9DO2TPkl86OWGZ7kq
	rNXnyFQEfBy+ezYr8mr24XxRW1N8NQ9EaRr21nxLNHCiYN0L/oHpfa5HNMRuJgzqITbbvWIPMvXKt
	4w4mjXLgdZvll+6PKqPLUBHbuTktZEFhB5l3Md0YcewG2CCAdsR6POCuY8l9FAlB7GxMbtIRPiKy2
	/7kCScPUkOYNo1GS4w2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHroA-00000003Xn2-2vM8;
	Sat, 08 Nov 2025 22:53:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHro7-00000003Xmc-36kE
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 22:53:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-297ec50477aso3360555ad.1
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 14:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762642399; x=1763247199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woeNf9SnFDKMh9COMO6hWAKnDrWNbFGLLR+aeDPR/i8=;
        b=MP1LzkSpxoDzOp/6PptknOYIQaSDsP3jJbh9numAS5HTnFDWbtPgmXLt/e/NCcx4FE
         D7iHSF51YzW3KC5INNC/CQD2nojrEhMBsn8nP384TESXotePbeSaD8CvU+/xOwWD8KAU
         /E7hfsvnpBCIu9MwZF9JXFhuKZniww2xAxXfwBLgSGx8f1gSh1YjYsdghMPcgQbyBoIw
         AT+3DebvCOyxI8FIeZim4Y353XESL5jy5ggxZmWLMXE0IfZbFcez0uKy0vrRqrk/6TrQ
         +PY62z84eHAel5KWXb45DPLQ9xbwxu7Vqh2XFwXTw6r3EyL1XRC2xBrsKIWnFAsaYvwv
         3/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762642399; x=1763247199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=woeNf9SnFDKMh9COMO6hWAKnDrWNbFGLLR+aeDPR/i8=;
        b=vnhYjD2rCL67KfX7Cf+BDb7sPSCtO1FQvt/g3NeNh7/PZMHuWkplfJiim9DIc4bREE
         9r/XQIUFVBH3cjD6vayvGhbejDILUbEEKQBxugCzzy3S2UB3hYJLIy34A1u9OZYw0Tg/
         acbvvt+oVqLh7z7rhGRtKta9edGtay6OPXqsdhgsC+vvMVmKTGg5HJGW5c0U/cP8URF0
         GCuvurRrLFROMzB6Pq+1Wi1FCuK68R5Zs2MIW5r8Ps8lrGAwtn7kPeSVvKA/mksOYuoB
         jvfLaTUL5AzzMVAzU1BWJfuSLl8oxcLO37wQdnOqZxCg3dP3RsCtJQ/5tJYDdlrGG1VS
         lijQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXluoJCKt99Z+VD95n5qyavMdr46/62CE2Scckt26AISqG07n3mVa6rbsxhMbU8igIWSFheGkgiR5J2LJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxXFY8VoeQ3a8RpY6XbFNzL7N72yQY4OxBvwNWfRTfhgKIPQobP
	c7c3kW4fT5Npief+pPs1Xmq7M41Uu3E721wfnoul0FDGA7Sz0YoBTvnwUSXra5rz5ABjYcuYmQS
	BtB2ox4mdv88LLNMpuIij0RFN/fhvuHw=
X-Gm-Gg: ASbGnctQz54UK+y7Axb7PzmE9SCp/JwmL+S396hHUTcmX+46mijAoxphf0QcOTB8fsu
	tg/mJva3kSezWq8jhnJXXWvMzZIt36GwpPT8x/ElcZHqyjyF4dHot0x+I7lQS4+R58bcaTDMegf
	xci5dAcixVAeNQ7m+KP3MDUeTvaav1UkPZV1voXCjvudBKB20YM/gVQJWuZz76Mp3e91x44eRqO
	KEzdvF/sEnFMkk8wS8Kq3SOOs69/9nqQxG+ws7ENNdmAvUjhbq9XzZaAZd6ZSQdaA0UES+fD4cy
	DSUCsC04M38qONuePGEQCHwJYyef
X-Google-Smtp-Source: AGHT+IG+/PJGnDmxUNMI7+aZcN60vo2SoWlora4RSCXqNkbJIUjbFrzUdNRAqKB5MSZuajIzoZgImhzbTKgTAYjlkVM=
X-Received: by 2002:a17:903:37cf:b0:295:134:9ae5 with SMTP id
 d9443c01a7336-297e1e61caamr46129275ad.24.1762642398835; Sat, 08 Nov 2025
 14:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com> <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 23:53:07 +0100
X-Gm-Features: AWmQ_bni7l89RyP8uXpthsz3XoYRD2BT1Es7uRWB0DG1y_IRoUhPm173lpNSDGc
Message-ID: <CAFBinCBy7vPq0oX0PQ=yC5E3Mx3sv6qdVHsMh-NQQzAkbDuvRQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: zhentao.guo@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_145319_785431_F2DC5512 
X-CRM114-Status: GOOD (  14.75  )
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

SGVsbG8sCgp0aGFuayB5b3UgZm9yIHlvdXIgd29yayBvbiB0aGlzIQoKT24gTW9uLCBPY3QgMjcs
IDIwMjUgYXQgNjo0MuKAr0FNIFpoZW50YW8gR3VvIHZpYSBCNCBSZWxheQo8ZGV2bnVsbCt6aGVu
dGFvLmd1by5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKWy4uLl0KKy8qKgorICogZW51
bSBhbWxfcG93ZXJfdHlwZV9lIC0gVHlwZSBvZiBkZWNvZGVyIHBvd2VyLgorICovCitlbnVtIGFt
bF9wb3dlcl90eXBlX2UgeworICAgICAgIEFNTF9QTV9QRCA9IDAsCit9OwpBcmUgdGhlcmUgYW55
IG90aGVyIHBvd2VyIHR5cGVzIHRoYXQgeW91IGFyZSBhbHJlYWR5IGF3YXJlIG9mIC0gb3IgaXMK
dGhpcyBhZGRlZCAianVzdCBpbiBjYXNlIiBhbiBhZGRpdGlvbmFsIHR5cGUgaXMgbmVlZGVkIGlu
IGZ1dHVyZT8KCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgZ2F0ZV9zd2l0Y2hfbm9kZSAtIGNsb2NrIG5v
ZGUgZGVmaW5pdGlvbgo+ICsgKiBAY2xrOiBQb2ludGVyIHRvIGNsayBpbnN0YW5jZS4KPiArICog
QG5hbWU6IENsb2NrIG5hbWUgdXNlZC4KPiArICogQG11dGV4OiBNdXRleCBsb2NrIGZvciBtdWx0
aSBkZWNvZGVyIGluc3RhbmNlLgo+ICsgKiBAcmVmX2NvdW50OiBDdXJyIGNsayBpbnN0YW5jZSBy
ZWYgY291bnQuCj4gKyAqLwo+ICtzdHJ1Y3QgZ2F0ZV9zd2l0Y2hfbm9kZSB7Cj4gKyAgICAgICBz
dHJ1Y3QgY2xrICpjbGs7Cj4gKyAgICAgICBjb25zdCBjaGFyICpuYW1lOwo+ICsgICAgICAgc3Ry
dWN0IG11dGV4IG11dGV4Owo+ICsgICAgICAgaW50IHJlZl9jb3VudDsKPiArfTsKR2VuZXJhbGx5
IEknbSBub3Qgc3VyZSBpZiB0aGUgd2hvbGUgc3RydWN0IGlzIG5lZWRlZCBhcyBJIHRoaW5rIHRo
ZQpjb21tb24gY2xvY2sgZnJhbWV3b3JrIGhhcyBldmVyeXRoaW5nIHdlIG5lZWQuClRoZXJlJ3Mg
c3RydWN0IGNsa19idWxrX2RhdGEgd2hpY2ggYWxsb3dzIG1hcHBpbmcgY2xvY2tzIGZyb20KZGV2
aWNlLXRyZWUgdG8gYW4gYXJyYXkgaW4gdGhlIGNvZGUuCgpkcml2ZXJzL3N0YWdpbmcvbWVkaWEv
c3RhcmZpdmUvY2Ftc3Mvc3RmLWNhbXNzLmggZm9yIGRlZmluZXMgYW4gZW51bQooc3RmX2Nsaykg
dG8gYWNjZXNzIGVhY2ggb2YgdGhlIGNsb2NrcyBieSBpdCdzIGluZGV4IGluIHRoZSBhcnJheS4K
WW91IGV2ZW4gc2VlbSB0byBoYXZlIGFuIGVudW0gKGNsa190eXBlX2UpIHdoaWNoIHlvdSBjb3Vs
ZCB1c2UgdG8Kc2ltcGxpZnkgdGhlIGNvZGUuCgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgb25l
IGNhbiBjYWxsIGNsa19wcmVwYXJlX2VuYWJsZSgpIGFuZApjbGtfZGlzYWJsZV91bnByZXBhcmUo
KSBhcyBvZnRlbiBhcyB5b3UnZCBsaWtlIGFuZCB0aGVzZSBmdW5jdGlvbnMKd2lsbCBkbyB0aGUg
cmVmLWNvdW50aW5nIGludGVybmFsbHkuClNvIEkgdGhpbmsgdGhlIHJlZl9jb3VudCBpcyBub3Qg
ZXhwbGljaXRseSBuZWVkZWQsIGFzIHRoYXQncyBtYW5hZ2VkCmJ5IHRoZSBjb21tb24gY2xvY2sg
ZnJhbWV3b3JrLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

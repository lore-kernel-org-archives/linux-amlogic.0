Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920CDC76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyRVJPg/9FlmQk9DRBthbK4yxM4BZPfYWutrinM3Uog=; b=aqtbGncZO/fN/W
	YV7UFi0WXp7lmTH5qL3WmM6AfD2C+2Pqdxj0waRrihW7w30HSsVA3HxM7fy/we1gEX3F/VR5WixQi
	7eEDzvgBI/i6jwaCJjbJbJGCOrEqRf0SCWsiX0U/oDa1PnlmzA9/ISLvGo1AQsNICrbhyHhtxksJd
	IdzlccKbx5GgJztM9Gif8ufIkCpZfPBNDkVNgqtSNXHyKMFQYn00ho/Ys5lGWo+tFXCcwvOMfH9Yt
	3VuSduMYmyyJPWzxjOGEpS/WqD58iTQOovcD2je4X/XCseS/QC/deJLT+1ZYrZKB/cO4XbYGzUG3V
	NALyUqlQpGYLGvsZJXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjINP-00F8Vp-0T;
	Mon, 03 Apr 2023 11:29:31 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjINM-00F8TK-1m
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Apr 2023 11:29:30 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso30362241fac.12
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Apr 2023 04:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680521367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4vs4Q7IOsuBvb2xA6jfcMJFNzPk+3jZ8pvqIxT/IUE=;
        b=yhXWY0VRgTb/7sn5EIrVPAmLPVbq9F3e53NU7KGdAQlK0uEJQiSu5CQVFqoFk7BfC9
         0E+GZvnyqC1sHoWa6U1JdUL913SLGHIwnQsGfRMyszz4RCiXmHPcKx/+q+YoSlQbtuez
         0yCq4ZPFrlGhg2MgA9Ya9UP1Vg9YCz8ALCW4TvjsN/L+HbiIYthJYfABOT5lGh63ZWC6
         WOjjijJDbYPuSNWv9V0ko3s7yMBx35bHaRRAi9q97QhiCrME8lQL3dPs7c638VADXAGS
         apZdl3uu5WvzGltiIMILb/WzggaCAPhs8IyUPq/8mb0LJJuzK3H37HwLhZ5cRZuBwiU2
         7hyA==
X-Gm-Message-State: AAQBX9crQeQHiinfA/BFm7iJsxUZuKrYUgugVwj7Z5loDfCFW4H175W/
	XSGWbzIuGOFcaqGcOKvEdB4rN6YLC+VeVw==
X-Google-Smtp-Source: AKy350aUocjcF6rul694ON5DousjzEDJcrHHCCvdf3v3Cie06tzmcYAWMMrzydOA03gFX7qXhNolFg==
X-Received: by 2002:a05:6870:597:b0:17a:fd25:470e with SMTP id m23-20020a056870059700b0017afd25470emr8209456oap.7.1680521366687;
        Mon, 03 Apr 2023 04:29:26 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id s1-20020a056830124100b0069f02111b11sm4028341otp.75.2023.04.03.04.29.25
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 04:29:26 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17683b570b8so30340037fac.13
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Apr 2023 04:29:25 -0700 (PDT)
X-Received: by 2002:a05:687c:198:b0:17e:3201:41b0 with SMTP id
 yo24-20020a05687c019800b0017e320141b0mr11414592oab.5.1680521365606; Mon, 03
 Apr 2023 04:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
 <ZCl7NFN5igCkIaLz@debian.me>
In-Reply-To: <ZCl7NFN5igCkIaLz@debian.me>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 3 Apr 2023 12:29:14 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2fqAzURWrXWKnsMH6wEE8w2o=YSk62gNmDZFcr1Yit3g@mail.gmail.com>
Message-ID: <CAJX_Q+2fqAzURWrXWKnsMH6wEE8w2o=YSk62gNmDZFcr1Yit3g@mail.gmail.com>
Subject: Re: Kernel Panic - V6.2 - Reseved memory issue
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_042928_588933_095AFAE3 
X-CRM114-Status: GOOD (  21.50  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBcHIgMiwgMjAyMyBhdCAxOjU14oCvUE0gQmFnYXMgU2FuamF5YSA8YmFnYXNkb3Rt
ZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBBcHIgMDIsIDIwMjMgYXQgMDk6MTA6MzZB
TSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gTG9nOgo+ID4KPiA+IFsgOS43OTI5NjZd
IFNFcnJvciBJbnRlcnJ1cHQgb24gQ1BVMywgY29kZSAweDAwMDAwMDAwYmYwMDAwMDAgLS0gU0Vy
cm9yCj4gPiBbIDkuNzkyOTgwXSBDUFU6IDMgUElEOiAzNDcxIENvbW06IGtkZWQ1IFRhaW50ZWQ6
IEcgQyA2LjIuMCAjMQo+ID4gWyA5Ljc5Mjk4NV0gSGFyZHdhcmUgbmFtZTogS2hhZGFzIFZJTTMg
KERUKQo+ID4gWyA5Ljc5Mjk4N10gcHN0YXRlOiAyMDAwMDAwNSAobnpDdiBkYWlmIC1QQU4gLVVB
TyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0pCj4gPiBbIDkuNzkyOTkxXSBwYyA6IGttZW1fY2Fj
aGVfZnJlZV9idWxrLnBhcnQuOTgrMHgxZjAvMHg1MjgKPiA+IFsgOS43OTMwMDRdIGxyIDoga21l
bV9jYWNoZV9mcmVlX2J1bGsucGFydC45OCsweDJmOC8weDUyOAo+ID4gWyA5Ljc5MzAwOF0gc3Ag
OiBmZmZmODAwMDBhMmViN2YwCj4gPiBbIDkuNzkzMDA5XSB4Mjk6IGZmZmY4MDAwMGEyZWI3ZjAg
eDI4OiBmZmZmMDAwMDFmMzU4NTE4IHgyNzogZmZmZjAwMDAwMDAwODgwMAo+ID4gWyA5Ljc5MzAx
Nl0geDI2OiBmZmZmMDAwMDAyNjJiMzAwIHgyNTogZmZmZjAwMDAwMjYyYjMwMCB4MjQ6IDAwMDAw
MDAwMDAwMDAwMDEKPiA+IFsgOS43OTMwMTldIHgyMzogZmZmZjAwMDAwMjYyYjAwMCB4MjI6IDAw
MDAwMDAwMDAwMDAwMDAgeDIxOiBmZmZmMDAwMDFmMzU4NTM4Cj4gPiBbIDkuNzkzMDIyXSB4MjA6
IGZmZmZmYzAwMDAwOThhYzAgeDE5OiAwMDAwMDAwMDAwMDAwMDA0IHgxODogMDAwMDAwMDAwMDAw
MDA0MAo+ID4gWyA5Ljc5MzAyNV0geDE3OiAwMDAwMDAwMDAwMDAwMDE4IHgxNjogMDAwMDAwMDAw
MDAwMDdmOCB4MTU6IDAwMDAwMDAwMDAwMDAwMDMKPiA+IFsgOS43OTMwMjhdIHgxNDogMDAwMDAw
MDAwMDAwMDAwNiB4MTM6IGZmZmY4MDAwMDhlNDg1NTAgeDEyOiAwMDAwZmZmZjlkYzkxZmZmCj4g
PiBbIDkuNzkzMDMxXSB4MTE6IDAwMDAwMDAwMDAwMDAwMDQgeDEwOiAwMDAwMDAwMDAwMDAwMDAx
IHg5IDogZmZmZjAwMDAwN2U5MzY4MAo+ID4gWyA5Ljc5MzAzNV0geDggOiAwMDAwMDAwMDAwMDAw
MDIwIHg3IDogZmZmZjAwMDAwMWQyYjEwMCB4NiA6IDAwMDAwMDAwMDAwMDAwMDcKPiA+IFsgOS43
OTMwMzddIHg1IDogMDAwMDAwMDAwMDAwMDAyMCB4NCA6IGZmZmYwMDAwMDAwMDg4MDAgeDMgOiAw
MDAwMDAwMDAwMDAwMDAxCj4gPiBbIDkuNzkzMDQwXSB4MiA6IDAwMDAwMDAwMDAwMDAwMDcgeDEg
OiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogZmZmZjAwMDAxZjM1ODU0MAo+ID4gWyA5Ljc5MzA0NV0g
S2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEFzeW5jaHJvbm91cyBTRXJyb3IgSW50ZXJydXB0
Cj4gPgo+ID4gVGhpcyBkb2Vzbid0IGhhcHBlbiB3aXRoIGRvd25zdHJlYW0gS2hhZGFzIDYuMiBr
ZXJuZWwsIGFuZCB0aGF0J3MKPiA+IGJlY2F1c2UgdGhlIGRvd25zdHJlYW0ga2VybmVsIHJlbW92
ZWQgdGhpcyBmcm9tCj4gPiBlYXJseV9pbml0X2R0X3Jlc2VydmVfbWVtb3J5IChkcml2ZXJzL29m
L2ZkdC5jKToKPiA+Cj4gPiAvKgo+ID4gKiBJZiB0aGUgbWVtb3J5IGlzIGFscmVhZHkgcmVzZXJ2
ZWQgKGJ5IGFub3RoZXIgcmVnaW9uKSwgd2UKPiA+ICogc2hvdWxkIG5vdCBhbGxvdyBpdCB0byBi
ZSBtYXJrZWQgbm9tYXAsIGJ1dCBkb24ndCB3b3JyeQo+ID4gKiBpZiB0aGUgcmVnaW9uIGlzbid0
IG1lbW9yeSBhcyBpdCB3b24ndCBiZSBtYXBwZWQuCj4gPiAqLwo+ID4gaWYgKG1lbWJsb2NrX292
ZXJsYXBzX3JlZ2lvbigmbWVtYmxvY2subWVtb3J5LCBiYXNlLCBzaXplKSAmJgo+ID4gICAgIG1l
bWJsb2NrX2lzX3JlZ2lvbl9yZXNlcnZlZChiYXNlLCBzaXplKSkKPiA+ICAgICAgICAgICByZXR1
cm4gLUVCVVNZOwo+ID4KPgo+IFdoYXQgY29tbWl0IG9uIGRvd25zdHJlYW0ga2VybmVsIHRoYXQg
Zml4IHRoZSBpc3N1ZT8KSGVyZToKaHR0cHM6Ly9naXRodWIuY29tL2toYWRhcy9saW51eC9jb21t
aXQvMmNiNTdiMTA3MWJmNjlmNjE1ZmVkYzk5OWI3ZWNhY2YyY2RlNzIyOAoKIENhbiB5b3UgcmVw
cm9kdWNlCj4gb24gbWFpbmxpbmUgd2l0aCBhYm92ZSBjb25kaXRpb25hbCByZW1vdmVkPwpObywg
d2l0aG91dCB0aGF0IGNvZGUgbWFpbmxpbmUgd29ya3MgZmluZS4KCgpBbHRlcm5hdGl2ZWx5LCBj
YW4KPiB5b3UgcG9zdCB0aGUgZG93bnN0cmVhbSBmaXggaGVyZT8KU2FtZSBodHRwczovL2dpdGh1
Yi5jb20va2hhZGFzL2xpbnV4L2NvbW1pdC8yY2I1N2IxMDcxYmY2OWY2MTVmZWRjOTk5YjdlY2Fj
ZjJjZGU3MjI4Cgo+Cj4gQWxzbywgY2FuIHlvdSBmaW5kIGxhc3Qgd29ya2luZyBjb21taXQgb24g
bWFpbmxpbmU/IElmIHNvLCB0aGlzIGlzCj4gcmVncmVzc2lvbi4KVGhhdCBpcyBkaWZmaWN1bHQg
YXMgNS4xMy4wIGhhcyB0aGUgbGluZToKT0Y6IGZkdDogUmVzZXJ2ZWQgbWVtb3J5OiBmYWlsZWQg
dG8gcmVzZXJ2ZSBtZW1vcnkgZm9yIG5vZGUKJ3NlY21vbkA1MDAwMDAwJzogYmFzZSAweDAwMDAw
MDAwMDUwMDAwMDAsIHNpemUgMyBNaUIKQnV0IGRvZXNuJ3QgY3Jhc2guIEl0IGNvdWxkIGJlIHRo
YXQgbm8gcHJvY2VzcyB1c2VkIHRoYXQgYWRkcmVzcyBzbyBubyBjcmFzaC4KCj4KPiBUaGFua3Mu
Cj4KPiAtLQo+IEFuIG9sZCBtYW4gZG9sbC4uLiBqdXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAt
IENsYXJhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==

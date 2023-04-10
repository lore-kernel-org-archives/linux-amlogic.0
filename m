Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D15AC76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7hFvJ2b8Y8CP07mn5qMfG4DJGmE0gSXbHBjizwQalQ=; b=1Puh66evJWPFVn
	DbRLp1FNhO/wkIjWnTCX2DzRODUUTTv0dGhwuZfAZ/aeiLVPKVqXzmab8IyfXgNVtqSkxe6iNSd+7
	ajeLYZuiX/LEkwkUFR5bCdvG7z70AVtfhfQG0Xk2QVTDgNV+5fG8VhLpZaSL9e1BfNuONNNylXzWQ
	VP7k9PuB8ikR+QpuUFDnUwh3iXtC4uDOPqu04oVoD9KxHcpY+GYLesDm++CfI1zMeYNiT9WqsjTsv
	ihG4VKjJ4cUpnlctKQGlM1pazWsIrcN4Kyl7FHYZ1cZGR5PFQr64/sUdScSbflMAgoG9Pq9EgsjfN
	UGXULvO+Psu5hWUeqMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plsyQ-00FPQN-1c;
	Mon, 10 Apr 2023 14:58:26 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plsyO-00FPPj-1X;
	Mon, 10 Apr 2023 14:58:25 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1841c57c221so8512900fac.3;
        Mon, 10 Apr 2023 07:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681138702; x=1683730702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZC0Mdx6dJbemnObfOPEMw+WA676pFjjKABCK5HPK6ZI=;
        b=DYg84ZsAM3YxPgJ4Vm2voYsrw5KicRQyFMkip3BYOZJr9Bh3cmpjXrH963eyf3s7bS
         Qu8XmSgx1GggrnwIjVzCS8LxpoOdxG7OiXjSfYEo849MDHiieqEwq2I0LzvGlcc2nzQB
         J8pYLNwf/TmXp8TZydBMbpAnB1HZMKeW5i1leedF4kPgrDZmys80AR/HwkW12XKEoHd/
         j79Alm0T4KSuMEHpSMLZkKMZ3jJJU1D4I4uC0a+HtBEJ57N+zYXBxTTEzyo3lD+BJ4Ps
         1/DH278T9WCnF8zQJzxeaJTSWgENN6NSoPR5dtmlTJaOz31slXWBZstLfZUoK976x1GV
         hKKg==
X-Gm-Message-State: AAQBX9cq4q25O7IuTEJivSALoetUwWLxrk7l0IGe5qAr7GaM+x/kpm7y
	LDATRqWnYjnyqeb49iwTiHqm3OtRWMiWaIvX
X-Google-Smtp-Source: AKy350ZHxy7VrQs3TSQPQYh85FSWEhOZcS8LxVI2Msb3Y8mkngu2RcZ8GCYe7Rv4Gf/blWsRx4ZgRQ==
X-Received: by 2002:a05:6871:411:b0:184:46a8:5b1d with SMTP id d17-20020a056871041100b0018446a85b1dmr2746379oag.1.1681138702059;
        Mon, 10 Apr 2023 07:58:22 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id f11-20020a9d7b4b000000b0069d602841e7sm4320774oto.72.2023.04.10.07.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 07:58:21 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-183f4efa98aso12311004fac.2;
        Mon, 10 Apr 2023 07:58:21 -0700 (PDT)
X-Received: by 2002:a05:6870:d608:b0:17d:7221:d80c with SMTP id
 a8-20020a056870d60800b0017d7221d80cmr3664255oaq.5.1681138701166; Mon, 10 Apr
 2023 07:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230410120017.41664-1-tanure@linux.com> <20230410120017.41664-2-tanure@linux.com>
 <CAL_JsqJZWmy8PGwjjBc7FA2JcgvHqmtgkkuHy=XHMT8bVEAxSA@mail.gmail.com>
In-Reply-To: <CAL_JsqJZWmy8PGwjjBc7FA2JcgvHqmtgkkuHy=XHMT8bVEAxSA@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 10 Apr 2023 10:58:10 -0400
X-Gmail-Original-Message-ID: <CAJX_Q+2thy6T8JYn4EDA5WTTv9C-m-1b2egUDtTHYisu3ePrsg@mail.gmail.com>
Message-ID: <CAJX_Q+2thy6T8JYn4EDA5WTTv9C-m-1b2egUDtTHYisu3ePrsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] of: fdt: Scan /memreserve/ last
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, jbrunet@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	martin.blumenstingl@googlemail.com, narmstrong@baylibre.com, stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_075824_510581_5BBCBA7D 
X-CRM114-Status: GOOD (  22.30  )
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

T24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgODo1MuKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgNzowMOKAr0FNIEx1
Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2hhbmdlIHRoZSBv
cmRlciBvZiBzY2FubmluZyAvbWVtcmVzZXJ2ZS8gYW5kIC9yZXNlcnZlZC1tZW1vcnkgbm9kZS4K
PiA+IC9yZXNlcnZlZC1tZW1vcnkgbm9kZSBzaG91bGQgZ28gZmlyc3QsIGFzIGl0IGhhcyBhIG1v
cmUgdXBkYXRlZAo+ID4gZGVzY3JpcHRpb24gb2YgdGhlIG1lbW9yeSByZWdpb25zIGFuZCBpdCBj
YW4gYXBwbHkgZmxhZ3MsIGxpa2Ugbm9tYXAuCj4gPiBBbHNvLCAvbWVtcmVzZXJ2ZS8gc2hvdWxk
IGF2b2lkIHJlc2VydmluZyByZWdpb25zIGRlc2NyaWJlZCBpbgo+ID4gL3Jlc2VydmVkLW1lbW9y
eSBub2RlLgo+Cj4gTGlrZSBJIHNhaWQgb24gdjEsIEkgdGhpbmsgZG9pbmcgdGhpcyBoYXMgYSBo
aWdoIGNoYW5jZSBvZiBjYXVzaW5nCj4gcmVncmVzc2lvbnMgb24gb3RoZXIgcGxhdGZvcm1zLiBJ
dCBzaG91bGQgcHJvYmFibHkgbm90IGdvIHRvIHN0YWJsZQo+IGZvciBzb21lIHRpbWUgYWZ0ZXIg
YSBrZXJuZWwgcmVsZWFzZS4KPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51
cmVAbGludXguY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9vZi9mZHQuYyB8IDkgKysrKysrKy0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9mZHQuYyBiL2RyaXZlcnMvb2YvZmR0LmMKPiA+
IGluZGV4IGQxYTY4YjZkMDNiMy4uMjZlNjA4ZDgwMjVkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9vZi9mZHQuYwo+ID4gKysrIGIvZHJpdmVycy9vZi9mZHQuYwo+ID4gQEAgLTYzNSwxNiArNjM1
LDIxIEBAIHZvaWQgX19pbml0IGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKHZvaWQp
Cj4gPiAgICAgICAgIGlmICghaW5pdGlhbF9ib290X3BhcmFtcykKPiA+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4gPgo+ID4gKyAgICAgICBmZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsKPiA+ICsg
ICAgICAgZmR0X3Jlc2VydmVfZWxmY29yZWhkcigpOwo+ID4gKwo+ID4gICAgICAgICAvKiBQcm9j
ZXNzIGhlYWRlciAvbWVtcmVzZXJ2ZS8gZmllbGRzICovCj4gPiAgICAgICAgIGZvciAobiA9IDA7
IDsgbisrKSB7Cj4gPiAgICAgICAgICAgICAgICAgZmR0X2dldF9tZW1fcnN2KGluaXRpYWxfYm9v
dF9wYXJhbXMsIG4sICZiYXNlLCAmc2l6ZSk7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKCFzaXpl
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgICAg
aWYgKG1lbWJsb2NrX292ZXJsYXBzX3JlZ2lvbigmbWVtYmxvY2subWVtb3J5LCBiYXNlLCBzaXpl
KSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICBtZW1ibG9ja19pc19yZWdpb25fcmVzZXJ2ZWQo
YmFzZSwgc2l6ZSkpCj4KPiBKdXN0IHRvIG1ha2Ugc3VyZSwgYSBwYXJ0aWFsIG92ZXJsYXAgd2ls
bCBzdGlsbCBnZXQgcmVzZXJ2ZWQ/CkEgcGFydGlhbCBvdmVybGFwIHdpbGwgZ2V0IHJlc2VydmVk
IGlmIG5vdCBhbHJlYWR5IHJlc2VydmVkIGJ5IHRoZQovcmVzZXJ2ZWQtbWVtb3J5IG5vZGUuCj4K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gU2hvdWxkbid0IHdlIGNvbnRp
bnVlIHRvIHRoZSBuZXh0IGVudHJ5IHJhdGhlciB0aGFuIHN0b3BwaW5nLgpZZXMsIG15IG1pc3Rh
a2U7IEkgd2lsbCBzZW5kIHYzLgo+Cj4gPiArCj4gPiAgICAgICAgICAgICAgICAgbWVtYmxvY2tf
cmVzZXJ2ZShiYXNlLCBzaXplKTsKPiA+ICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgZmR0X3Nj
YW5fcmVzZXJ2ZWRfbWVtKCk7Cj4gPiAtICAgICAgIGZkdF9yZXNlcnZlX2VsZmNvcmVoZHIoKTsK
PiA+ICAgICAgICAgZmR0X2luaXRfcmVzZXJ2ZWRfbWVtKCk7Cj4gPiAgfQo+ID4KPiA+IC0tCj4g
PiAyLjQwLjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==

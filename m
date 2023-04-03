Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D996CC76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXkkLIW0p9zwq9cTnazAmDhcMu9NMPvyManCpeo+D4I=; b=CVaYXOsmxTCjyV
	mxCdU/WBsJTDU8N7XFiBSJCXLeNNXeodUpkgyY1kx8T9j5EkZGVsP6y4SMj5BAznYsd132JHXyCs1
	SgslbSBVyLCrHAnsjuDvx+WJtPVPa+P1ldzz3bBJpjJ5fiOpUd2zKNcqstE2HWKlPbt5i7yhbRNe2
	P1UPYP9bf3GIt2+5fwWTY4wRipHG8kv2Ebv485xCl/WuVTj7odH5tYQ7X1+o2C29eDjZz+Yi8aFnZ
	7oagNTycgDtT7WQNFWeCIWs7lBotHTTx3vUJaV9OBMp3gz5Vjh/baY+xRiNbB4Gw6ldJE9seoywSM
	jRMwS/krEjPBdwwTKTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjM7D-00FmeR-1U;
	Mon, 03 Apr 2023 15:29:03 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjM7A-00FmdU-1K
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Apr 2023 15:29:02 +0000
Received: by mail-oi1-f182.google.com with SMTP id q27so21263610oiw.0
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Apr 2023 08:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AfXSjA7q7dvjRoKzxnHZQeB6zpJL1qkef91cGmYxqmc=;
        b=JbfjNcA26UyRLPPlTZyvR8r5tFy8vxve2GmCDv/B/3mAr2dOmNcLJwzVR3PE8ccTlI
         JirLv+h2WuqbwylSXBPE7pak2E3D8Jwwz4GbhtAqiY9PyqcZPdJagZ01Hf9W80u0S81G
         ZTpM/LttdKfJrS8a8gABm0DWXrM4JeJKKpsynp4kaiXLYrfVjTFQv5RwzI4hD1oLqWLp
         0lsBoCFPycrWBDz7KlV0bhMU4tiDRkQpoFwZHR36rrJeRNvyvdrGVG0ctBy2JXJdBucB
         3IJmJ/6p7wH7II8PIeyzTW9OKo+hy/wCzcYbqxGP9ROdik8X4XVjixEumJJbozGFnvYl
         +MUw==
X-Gm-Message-State: AO0yUKWT2UMw1ljNOxqWuJpmoLrvy0SOCtvLDfsO9KtBgw+PMHee5nXZ
	D5jrPERO2gvOcQwlHn6/7ZLnlc82LZ+KdlTx
X-Google-Smtp-Source: AK7set+RV9HjKWFrwe+4EnSUeFhQYRPvvTnNsXbicbM+sbGJm2esUSKSyN0nP7ctD1BpFyXtbSmSNg==
X-Received: by 2002:a05:6808:354:b0:384:1652:f602 with SMTP id j20-20020a056808035400b003841652f602mr15070371oie.3.1680535737266;
        Mon, 03 Apr 2023 08:28:57 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id r204-20020acadad5000000b00383eaf88e75sm3988176oig.39.2023.04.03.08.28.53
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 72-20020a9d064e000000b006a2f108924cso4348777otn.1
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Apr 2023 08:28:53 -0700 (PDT)
X-Received: by 2002:a9d:65d1:0:b0:69f:1418:7a8f with SMTP id
 z17-20020a9d65d1000000b0069f14187a8fmr11995072oth.3.1680535733526; Mon, 03
 Apr 2023 08:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
 <ZCl7NFN5igCkIaLz@debian.me> <CAJX_Q+2fqAzURWrXWKnsMH6wEE8w2o=YSk62gNmDZFcr1Yit3g@mail.gmail.com>
In-Reply-To: <CAJX_Q+2fqAzURWrXWKnsMH6wEE8w2o=YSk62gNmDZFcr1Yit3g@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 3 Apr 2023 16:28:42 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2uSBaudKrA6hcRhGP-7j__V5bTpRwGPLUoBaMjuwO+CQ@mail.gmail.com>
Message-ID: <CAJX_Q+2uSBaudKrA6hcRhGP-7j__V5bTpRwGPLUoBaMjuwO+CQ@mail.gmail.com>
Subject: Re: Kernel Panic - V6.2 - Reseved memory issue
To: Bagas Sanjaya <bagasdotme@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_082900_456976_39AA8380 
X-CRM114-Status: GOOD (  30.62  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCAxMjoyOeKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIEFwciAyLCAyMDIzIGF0IDE6NTXigK9QTSBCYWdh
cyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBB
cHIgMDIsIDIwMjMgYXQgMDk6MTA6MzZBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4g
PiBMb2c6Cj4gPiA+Cj4gPiA+IFsgOS43OTI5NjZdIFNFcnJvciBJbnRlcnJ1cHQgb24gQ1BVMywg
Y29kZSAweDAwMDAwMDAwYmYwMDAwMDAgLS0gU0Vycm9yCj4gPiA+IFsgOS43OTI5ODBdIENQVTog
MyBQSUQ6IDM0NzEgQ29tbToga2RlZDUgVGFpbnRlZDogRyBDIDYuMi4wICMxCj4gPiA+IFsgOS43
OTI5ODVdIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0zIChEVCkKPiA+ID4gWyA5Ljc5Mjk4N10g
cHN0YXRlOiAyMDAwMDAwNSAobnpDdiBkYWlmIC1QQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZ
UEU9LS0pCj4gPiA+IFsgOS43OTI5OTFdIHBjIDoga21lbV9jYWNoZV9mcmVlX2J1bGsucGFydC45
OCsweDFmMC8weDUyOAo+ID4gPiBbIDkuNzkzMDA0XSBsciA6IGttZW1fY2FjaGVfZnJlZV9idWxr
LnBhcnQuOTgrMHgyZjgvMHg1MjgKPiA+ID4gWyA5Ljc5MzAwOF0gc3AgOiBmZmZmODAwMDBhMmVi
N2YwCj4gPiA+IFsgOS43OTMwMDldIHgyOTogZmZmZjgwMDAwYTJlYjdmMCB4Mjg6IGZmZmYwMDAw
MWYzNTg1MTggeDI3OiBmZmZmMDAwMDAwMDA4ODAwCj4gPiA+IFsgOS43OTMwMTZdIHgyNjogZmZm
ZjAwMDAwMjYyYjMwMCB4MjU6IGZmZmYwMDAwMDI2MmIzMDAgeDI0OiAwMDAwMDAwMDAwMDAwMDAx
Cj4gPiA+IFsgOS43OTMwMTldIHgyMzogZmZmZjAwMDAwMjYyYjAwMCB4MjI6IDAwMDAwMDAwMDAw
MDAwMDAgeDIxOiBmZmZmMDAwMDFmMzU4NTM4Cj4gPiA+IFsgOS43OTMwMjJdIHgyMDogZmZmZmZj
MDAwMDA5OGFjMCB4MTk6IDAwMDAwMDAwMDAwMDAwMDQgeDE4OiAwMDAwMDAwMDAwMDAwMDQwCj4g
PiA+IFsgOS43OTMwMjVdIHgxNzogMDAwMDAwMDAwMDAwMDAxOCB4MTY6IDAwMDAwMDAwMDAwMDA3
ZjggeDE1OiAwMDAwMDAwMDAwMDAwMDAzCj4gPiA+IFsgOS43OTMwMjhdIHgxNDogMDAwMDAwMDAw
MDAwMDAwNiB4MTM6IGZmZmY4MDAwMDhlNDg1NTAgeDEyOiAwMDAwZmZmZjlkYzkxZmZmCj4gPiA+
IFsgOS43OTMwMzFdIHgxMTogMDAwMDAwMDAwMDAwMDAwNCB4MTA6IDAwMDAwMDAwMDAwMDAwMDEg
eDkgOiBmZmZmMDAwMDA3ZTkzNjgwCj4gPiA+IFsgOS43OTMwMzVdIHg4IDogMDAwMDAwMDAwMDAw
MDAyMCB4NyA6IGZmZmYwMDAwMDFkMmIxMDAgeDYgOiAwMDAwMDAwMDAwMDAwMDA3Cj4gPiA+IFsg
OS43OTMwMzddIHg1IDogMDAwMDAwMDAwMDAwMDAyMCB4NCA6IGZmZmYwMDAwMDAwMDg4MDAgeDMg
OiAwMDAwMDAwMDAwMDAwMDAxCj4gPiA+IFsgOS43OTMwNDBdIHgyIDogMDAwMDAwMDAwMDAwMDAw
NyB4MSA6IDAwMDAwMDAwMDAwMDAwMDAgeDAgOiBmZmZmMDAwMDFmMzU4NTQwCj4gPiA+IFsgOS43
OTMwNDVdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBc3luY2hyb25vdXMgU0Vycm9yIElu
dGVycnVwdAo+ID4gPgo+ID4gPiBUaGlzIGRvZXNuJ3QgaGFwcGVuIHdpdGggZG93bnN0cmVhbSBL
aGFkYXMgNi4yIGtlcm5lbCwgYW5kIHRoYXQncwo+ID4gPiBiZWNhdXNlIHRoZSBkb3duc3RyZWFt
IGtlcm5lbCByZW1vdmVkIHRoaXMgZnJvbQo+ID4gPiBlYXJseV9pbml0X2R0X3Jlc2VydmVfbWVt
b3J5IChkcml2ZXJzL29mL2ZkdC5jKToKPiA+ID4KPiA+ID4gLyoKPiA+ID4gKiBJZiB0aGUgbWVt
b3J5IGlzIGFscmVhZHkgcmVzZXJ2ZWQgKGJ5IGFub3RoZXIgcmVnaW9uKSwgd2UKPiA+ID4gKiBz
aG91bGQgbm90IGFsbG93IGl0IHRvIGJlIG1hcmtlZCBub21hcCwgYnV0IGRvbid0IHdvcnJ5Cj4g
PiA+ICogaWYgdGhlIHJlZ2lvbiBpc24ndCBtZW1vcnkgYXMgaXQgd29uJ3QgYmUgbWFwcGVkLgo+
ID4gPiAqLwo+ID4gPiBpZiAobWVtYmxvY2tfb3ZlcmxhcHNfcmVnaW9uKCZtZW1ibG9jay5tZW1v
cnksIGJhc2UsIHNpemUpICYmCj4gPiA+ICAgICBtZW1ibG9ja19pc19yZWdpb25fcmVzZXJ2ZWQo
YmFzZSwgc2l6ZSkpCj4gPiA+ICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ID4gPgo+ID4KPiA+
IFdoYXQgY29tbWl0IG9uIGRvd25zdHJlYW0ga2VybmVsIHRoYXQgZml4IHRoZSBpc3N1ZT8KPiBI
ZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9raGFkYXMvbGludXgvY29tbWl0LzJjYjU3YjEwNzFi
ZjY5ZjYxNWZlZGM5OTliN2VjYWNmMmNkZTcyMjgKPgo+ICBDYW4geW91IHJlcHJvZHVjZQo+ID4g
b24gbWFpbmxpbmUgd2l0aCBhYm92ZSBjb25kaXRpb25hbCByZW1vdmVkPwo+IE5vLCB3aXRob3V0
IHRoYXQgY29kZSBtYWlubGluZSB3b3JrcyBmaW5lLgo+Cj4KPiBBbHRlcm5hdGl2ZWx5LCBjYW4K
PiA+IHlvdSBwb3N0IHRoZSBkb3duc3RyZWFtIGZpeCBoZXJlPwo+IFNhbWUgaHR0cHM6Ly9naXRo
dWIuY29tL2toYWRhcy9saW51eC9jb21taXQvMmNiNTdiMTA3MWJmNjlmNjE1ZmVkYzk5OWI3ZWNh
Y2YyY2RlNzIyOAo+Cj4gPgo+ID4gQWxzbywgY2FuIHlvdSBmaW5kIGxhc3Qgd29ya2luZyBjb21t
aXQgb24gbWFpbmxpbmU/IElmIHNvLCB0aGlzIGlzCj4gPiByZWdyZXNzaW9uLgo+IFRoYXQgaXMg
ZGlmZmljdWx0IGFzIDUuMTMuMCBoYXMgdGhlIGxpbmU6Cj4gT0Y6IGZkdDogUmVzZXJ2ZWQgbWVt
b3J5OiBmYWlsZWQgdG8gcmVzZXJ2ZSBtZW1vcnkgZm9yIG5vZGUKPiAnc2VjbW9uQDUwMDAwMDAn
OiBiYXNlIDB4MDAwMDAwMDAwNTAwMDAwMCwgc2l6ZSAzIE1pQgo+IEJ1dCBkb2Vzbid0IGNyYXNo
LiBJdCBjb3VsZCBiZSB0aGF0IG5vIHByb2Nlc3MgdXNlZCB0aGF0IGFkZHJlc3Mgc28gbm8gY3Jh
c2guCj4KPiA+Cj4gPiBUaGFua3MuCj4gPgo+ID4gLS0KPiA+IEFuIG9sZCBtYW4gZG9sbC4uLiBq
dXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJhCgpIaSwKSSBnaXQgYmlzZWN0IHBvaW50
IGl0IG91dCBjb21taXQgdGhhdCBldmVuIHJldmVydGluZyBpdCB3b3VsZCB0cmlnZ2VyIHRoZSBw
YW5pYy4KU28gdGhpcyBpcyBhIG1lbW9yeSBjb3JydXB0aW9uIHByb2JsZW0gdGhhdCBhIHNpbXBs
ZSBnaXQgYmlzZWN0IHdpbGwKbm90IGZpbmQgdGhlIGNvcnJlY3Qgb2ZmZW5kaW5nIGNvbW1pdC4K
CkkgbWFuYWdlZCB0byB1bmRlcnN0YW5kIGEgbGl0dGxlIG1vcmUgYWJvdXQgdGhlIGlzc3VlOgox
ICkgZWFybHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0gaXMgZXhlY3V0ZWQgZmlyc3QsIHJl
c2VydmVzClsweDAwMDAwMDAwMDUwMDAwMDAtMHgwMDAwMDAwMDA1MmZmZmZmXSBidXQgZG9lc24n
dCBtYXJrIGFzIG5vLW1hcC4KMiApIGVhcmx5X2luaXRfZHRfcmVzZXJ2ZV9tZW1vcnkgdHJpZXMg
dG8gbWFyayB0aGF0IHJlZ2lvbiBhcyBub21hcCwKYnV0IGl0IGlzIGFscmVhZHkgcmVzZXJ2ZWQg
YW5kIG1lbWJsb2NrX292ZXJsYXBzX3JlZ2lvbiBhbmQKbWVtYmxvY2tfaXNfcmVnaW9uX3Jlc2Vy
dmVkIHJldHVybiB0cnVlLCBzbyBpdCBmYWlscyB0byBtYXJrIGFzIG5vbWFwLgozICkga2VybmVs
IHVzZXMgdGhhdCBtZW1vcnkgYW5kIGNyYXNoZXMKCkkgdGhpbmsgd2UgaGF2ZSB0d28gb3B0aW9u
cyBoZXJlOgoxKSBBbGxvdyBlYXJseV9pbml0X2R0X3Jlc2VydmVfbWVtb3J5IG1hcmsgbm9tYXAg
bWVtb3J5IHRoYXQgaXMgYWxyZWFkeSByZXNlcnZlZAoyKSBNYWtlIGVhcmx5X2luaXRfZmR0X3Nj
YW5fcmVzZXJ2ZWRfbWVtIHJlc2VydmUgd2l0aCB0aGUgZmxhZyBub21hcAppZiBuZWNlc3Nhcnku
IEkgZG9uJ3Qga25vdyBpZiB0aGF0J3MgcG9zc2libGUuCgpRdWVzdGlvbiBNTSBndXlzLCBNaWtl
IFJhcG9wb3J0IGFuZCBBbmRyZXcgTW9ydG9uOgotIElzIGl0IHBvc3NpYmxlIHRvIG1ha2UgZWFy
bHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0gcmVzZXJ2ZQptZW1vcnkgd2l0aCBmbGFncz8K
LSBJdCBvayBmb3IgZWFybHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0gdG8gbWFyayByZWdp
b25zIGFscmVhZHkKcmVzZXJ2ZWQgYXMgbm9tYXA/CgpUaGFua3MKTHVjYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

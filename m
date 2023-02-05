Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE153C636CC
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Feb 2023 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8u6HNqHfF4IZk/rtmvZytho6GxmLgRoEQcg8P1nol8=; b=pcB5TptCxjlh6P
	IEIXT82hFiEtV3wLK6T62L5lGEbqYZiAkvxzxboenPKI+hHieH2ig251N2inulzQSoLfxFilXfwnd
	WGNk8pqyZ05s/JATmv14bCJNsQBKZKFLlk7zItWysm/WnshripCucbfvcI91Tb16sslQm5F7pDpNv
	Om90XTUp/s7dW5ne0Wvhlp6nlDTjcd8tswJHUe8xMNMUcgvGdTqNhG61oHXDQVO30nre/dS8NkN8w
	Tz0q7HPQ3IOZQb5gsuG8AInIcYqS4ztqNkAlxuIcymSn2pEFuWnAqiAqscCnlsai6n10+Qt6Gf1Vj
	TLWJNekyBH9RNjMj1nsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOiIF-006ZvQ-Ax; Sun, 05 Feb 2023 16:55:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOiI4-006ZuL-NK; Sun, 05 Feb 2023 16:54:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id gr7so28075927ejb.5;
        Sun, 05 Feb 2023 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4n0911EfpptLanp0PUpzlhcgWUSYJrlrxWPWkoQnzU=;
        b=PrPeMtMovft8QZc8IH3Z+EY+Xe4oUbYrPtg2CV0SxWc/eZ3XPSQ9hvAUPf+dcBfDv9
         kLYY9n2RSFkA51TmKKQBH5JG0u+twP2HJSCyMEGCDxmtlFLKgzjz/9HCzXHzsTUZdwli
         E4+bS8gPR2WLiOY5jMIEAHh3pLTt6+esy7gNQF8QaJhPt4Dj/X6Yjp985AR0OkWqDKjJ
         kmbiEkzajEouDBnqIeGtkJCzGnDTaPpHDdLfJq7W7so6iRCyAwhTL5RNkRdgM5jPIxYc
         w8/zyTBs1+SRvLmGrTVcIL0uMvLYG6rYPAvv30eD/Dyt2WaY0SmdKmcwgYI2Cov0uXfB
         abLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4n0911EfpptLanp0PUpzlhcgWUSYJrlrxWPWkoQnzU=;
        b=b7NgaDg7QAgPGlxCV+wwDh8A0+aOExDQYkJE0vNMG7hbGwJ1ahUZquQpk88pxIGT4I
         KZSiORBUbJN4BLELTIND2+PkYrkMMU8MhXbCnvtmwCsYbkTn50sQmJ4Cq7TUBk6YBGhr
         fp/OXffQgbFNola6iAOp1uo0iuivPq0o1TFyCMzQ0KZyCpvFzTn7U6PA/g+uEZxX16aW
         SiJ6CV22MLLGxWTytenAbd3KJXwG7ilErzrQPGbOY6HTPwZT4/WRpUhO/FpoWCl/J6wD
         sVIYpqgwfDAOzHGGSwc6lNS/X+qkxPJjvCrrkZ/OWQyJ9elxk+9UiIRuWKewqxIv6moc
         krMw==
X-Gm-Message-State: AO0yUKXkfzx228+pLWES4pLBoZqejZFBPxIFrR42a0bwXdDvYmpJ6v68
	v1Sxih2R8/SfT8ttuEZ1NS+D2R9slmw=
X-Google-Smtp-Source: AK7set+yffrjGRgbY188zWjCWyoZ6XwNeMNg1pdoOfVJtd2J8fqwUyeTG9vfLz92Ji0uQ7CxZgTKQQ==
X-Received: by 2002:a17:907:2d0d:b0:88e:d435:3fd6 with SMTP id gs13-20020a1709072d0d00b0088ed4353fd6mr16680276ejc.63.1675616094177;
        Sun, 05 Feb 2023 08:54:54 -0800 (PST)
Received: from ?IPV6:2a01:c22:7648:3c00:e163:47c4:c462:6618? (dynamic-2a01-0c22-7648-3c00-e163-47c4-c462-6618.c22.pool.telefonica.de. [2a01:c22:7648:3c00:e163:47c4:c462:6618])
        by smtp.googlemail.com with ESMTPSA id gv21-20020a170906f11500b0086dd8f20a6asm4319395ejb.77.2023.02.05.08.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 08:54:53 -0800 (PST)
Message-ID: <0db3cd05-9a3a-a79b-308a-18ab49d29c17@gmail.com>
Date: Sun, 5 Feb 2023 17:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Neil Armstrong <narmstrong.kernel@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <6dcf6333-f75a-f7ec-8ce9-fbbfb81d1a60@gmail.com>
 <9DA78049-10C9-47D6-B36B-9B7E1067385A@gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
In-Reply-To: <9DA78049-10C9-47D6-B36B-9B7E1067385A@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_085456_804060_A28FAB18 
X-CRM114-Status: GOOD (  12.28  )
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

T24gMDUuMDIuMjAyMyAwODo1NywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gCj4+IExlIDUgZsOp
dnIuIDIwMjMgw6AgMDE6MDUsIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
IGEgw6ljcml0IDoKPj4KPj4g77u/T24gMDQuMDIuMjAyMyAyMzo1NiwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPj4+IEhpIEhlaW5lciwKPj4+Cj4+PiBPbiBXZWQsIEZlYiAxLCAyMDIzIGF0
IDExOjEzIFBNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+
Pj4gWy4uLl0KPj4+Pj4+ICsgICAgICAtIGl0ZW1zOgo+Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0
OiBhbWxvZ2ljLG1lc29uOG0yLWFvYnVzLXBpbmN0cmwKPj4+Pj4+ICsgICAgICAgICAgLSBjb25z
dDogYW1sb2dpYyxtZXNvbjgtYW9idXMtcGluY3RybAo+Pj4+Pj4gKyAgICAgIC0gaXRlbXM6Cj4+
Pj4+PiArICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244bTItY2J1cy1waW5jdHJsCj4+
Pj4+PiArICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244LWNidXMtcGluY3RybAo+Pj4+
Pgo+Pj4+PiBBZ2FpbiwgY2FuJ3QgaGF2ZSBib3RoIHdpdGggYW5kIHdpdGhvdXQgdGhlIGZhbGxi
YWNrIGFsbG93ZWQuCj4+Pj4+Cj4+Pj4gSGkgTWFydGluLAo+Pj4+Cj4+Pj4gbWVzb244bTIgaXMg
dGhlIG9ubHkgY2hpcCB2ZXJzaW9uIGhhdmluZyBhIGZhbGxiYWNrIGZvciB0aGUKPj4+PiBwaW5j
dHJsIGNvbXBhdGlibGUuIElzIHRoaXMgZmFsbGJhY2sgcmVhbGx5IG5lZWRlZD8KPj4+PiBMb29r
aW5nIGF0IHRoZSBkcml2ZXIgaXQgc2VlbXMgdGhhdCBib3RoIGNvbXBhdGlibGVzCj4+Pj4gYXJl
IGhhbmRsZWQgaWRlbnRpY2FsbHkuCj4+PiBCYWNrIGluIHRoZSBkYXkgd2UgZGVjaWRlZCB0byBk
dXBsaWNhdGUgdGhlIE1lc29uOCBkcml2ZXIgY29kZSBqdXN0IHRvCj4+PiBhZGQgZm91ciBuZXcg
cGluIGZ1bmN0aW9ucyB0aGF0IGFyZSBhZGRlZCBieSB0aGUgTWVzb244bTIgU29DCj4+PiBnZW5l
cmF0aW9uOgo+Pj4gImV0aF9yeGQyIiwgImV0aF9yeGQzIiwgImV0aF90eGQyIiwgImV0aF90eGQz
Igo+Pj4KPj4+IFRoZSBjb21wYXRpYmxlIHN0cmluZyB3YXMgZGVmaW5lZCB3aXRoIGEgc2ltaWxh
ciBhcHByb2FjaDogc2luY2UKPj4+IE1lc29uOG0yIGp1c3QgYWRkcyBhIGZldyBiaXRzIHRvIHRo
ZSBNZXNvbjggcGluIGNvbnRyb2xsZXIgaXQncwo+Pj4gYmFja3dhcmRzIGNvbXBhdGlibGUuCj4+
Pgo+Pj4gSWYgdGhlIGZhbGxiYWNrIGhhcyB0byBiZSByZW1vdmVkIHRoZW4gSSdtIG9rYXkgd2l0
aCB0aGF0IGJ1dCBJIHdvdWxkCj4+PiBsaWtlIHRvIHVuZGVyc3RhbmQgaXQgZmlyc3QuCj4+PiBT
byBmYXIgSSB0aG91Z2h0IHRoYXQgUm9iIGJhc2ljYWxseSBhc2tlZCB0byByZW1vdmUgdGhlIGZv
bGxvd2luZyB0d28KPj4+IGNvbXBhdGlibGUgc3RyaW5ncyBmcm9tIHRoZSBlbnVtIChhcyB0aGV5
J3JlIGxpc3RlZCBzZXBhcmF0ZWx5IHdpdGgKPj4+IHRoZWlyIGZhbGxiYWNrcyk6Cj4+PiAtIGFt
bG9naWMsbWVzb244bTItY2J1cy1waW5jdHJsCj4+PiAtIGFtbG9naWMsbWVzb244bTItYW9idXMt
cGluY3RybAo+Pj4KPj4gUmlnaHQsIHRoaXMgc2hvdWxkIGJlIHN1ZmZpY2llbnQuIFRoZXJlJ3Mg
bm8gcGxhY2Ugd2hlcmUgdGhlIDhtMiBwaW5jdHJsCj4+IGNvbXBhdGlibGVzIGFyZSB1c2VkIHcv
byBmYWxsYmFjay4KPj4KPj4gVGhlbiB0aGUgaG9wZWZ1bGx5IGZpbmFsIHZlcnNpb24gb2YgdGhl
IGJpbmRpbmcgaXMgYWxtb3N0IHJlYWR5Lgo+PiBJJ20ganVzdCBzdGlsbCBjaGVja2luZyB3aGV0
aGVyIHRoZXJlJ3MgYW55IHdheSBpbiB5YW1sIHRvIHNwZWNpZnkKPj4gYSByZWctbmFtZXMgbGlz
dCB3aXRoIG1hbmRhdG9yeSBhbmQgb3B0aW9uYWwgbmFtZXMuIERvZXNuJ3Qgc2VlbSBzby4KPiAK
PiBJdOKAmXMgcG9zc2libGUgd2l0aCBtaW5JdGVtcy9tYXhJdGVtcyBhbmQgYWxsT2Y6aWYvZWxz
ZSB0byBzcGVjaWZ5IGRpZmZlcmVudCBtaW4vbWF4IGZvciBlYWNoIGNvbXBhdGlibGUKPiAKSSBo
YXZlIGEgcHJvYmxlbSBoZXJlIGJlY2F1c2UgcmVnLW5hbWVzIGlzIGluIHRoZSBncGlvLWNvbnRy
b2xsZXIgY2hpbGQgbm9kZSBhbmQgY29tcGF0aWJsZSBpcyBpbiB0aGUKcGluY3RybCBwYXJlbnQg
bm9kZS4gQW4gZXhwcmVzc2lvbiB1bmRlciBwYXR0ZXJuUHJvcGVydGllcyBkb2Vzbid0IHNlZSB0
aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBvZiB0aGUKcGFyZW50IG5vZGUuIEl0IHdvdWxkIGhhdmUg
YmVlbiBiZXR0ZXIgdG8gcGxhY2UgcmVncy9yZWctbmFtZXMgaW4gdGhlIHBpbmN0cmwgbm9kZS4K
Tm90IHN1cmUgaG93IHRvIGRlYWwgd2l0aCB0aGlzLiBUaGUgZWFzaWVzdCB3b3VsZCBiZSB0byBq
dXN0IGhhdmUgbWluSXRlbXM6MiBhbmQgbWF4SXRlbXM6NSBhcyBjcml0ZXJpYQpmb3IgcmVncyBh
bmQgcmVnLW5hbWVzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK

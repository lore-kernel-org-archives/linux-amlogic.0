Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D6BCD5BAB
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 May 2026 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM2IpZynoZob9Exdq8AVhK79DKuWylQyghcPWvz0Oj4=; b=09XiX/MAJE6NZE
	2iJMncwLHa7aot3RfqdpltXcOIBN8OoVuZHdPPwVm5RW6ehDOx7Luthed5+iWEZl8ysHNDhI4rNOD
	G3OX5RSO0BGqPlrSGByXsRjxTeSCCGSR6PHbCreE2VPm/FqbYHr5+XzR61ugSWZ7OiLDbg297kYRE
	DbsOech2rLSoQrvTgN8+Ke06fmVeo8kNZZJ8ZTQERMFJPRzAbZWI1cS7hA4xl1R4hfzfrYsj8o7JZ
	MNQItmzJt60nHqXlAJHrreMwyGB4vjS5/87isY6u4SV2bTrnW9cTqKYB5c9oeYKpAfPH2ru0o5BIe
	vkemXOpmYLiNXu+PwUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBnq-0000000FHXZ-0lJC;
	Sun, 24 May 2026 16:35:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBnn-0000000FHWy-1SAm
	for linux-amlogic@lists.infradead.org;
	Sun, 24 May 2026 16:35:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso14061541a12.3
        for <linux-amlogic@lists.infradead.org>; Sun, 24 May 2026 09:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779640545; cv=none;
        d=google.com; s=arc-20240605;
        b=As1An4Lxrz4ZyaqJt9kc5j6GU7a24d6hIdFBbwTZo97M2D92qKcCYak84d6YFk5l/v
         4FGhbuM+fEld3jtXiPsVpRsX7OPj4VWw9od/RoW2qFUCxT+p66IW8jWjTNreqyL/f1D2
         KUcbPBZRYZ5eYNZZhT/LThcuRGIPorNeXeAPrLeZiawAurahbWpzeRYjYinOOb0QQcQV
         da7faxu0EQMXOtwKa+xFTsUumpEEScrX9L2QGm6DYEHN5Ky9Kt1IhOGOtSs8z0zF19vj
         dx9tMaU9NZ5Jmt2DBvRsPaQWnqi5EeKmpzNiEIoDB7309cUGmUKmQRFBR8VjDhaerySl
         ngig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1HLcn//nYjl34kU/2TQC8I6ZR+db2Ttx6Cx3u1ROgY=;
        fh=ouXvSjf5SmEmNeimx6xyG+CKjdQvC3UxbsGBNR8v92o=;
        b=T+aad9PheqE9Pw8cbUjurGFlbZt3nU3WDS3/U2zCtWdq27jrwvdxo1dhPai7IpgUef
         POcyx5GIPaOEL3q8wlPAYqARy3R48SqSHjrlRBtpr7c8LQIg9nhmD/oJ9zE116fygEsE
         ozVtkrXU1RnorSQFLDJ/I/6Qro6d6JqiLfI827lJfCH8HvD7sXFYN7vZvKPAeJzVbC9A
         i49U5mSKZQ1wT6caBLKv7WvcPf9i/wcaofKXHXU47k+0h+imrkRK47+MTFtoMHFcLP0v
         bIohHB90VfGkkkgy7/epSHUpQ09VRLq7WmtQ3vWxehaORX8+5XtsPYj4oQdldUGJaone
         fmsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779640545; x=1780245345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1HLcn//nYjl34kU/2TQC8I6ZR+db2Ttx6Cx3u1ROgY=;
        b=lEjMQsnXLTNJGfWQHZZUqiYm1BDWj2Mi5C/WZW/Nh/NFXoAW5bEzLmqpvG1t8pH6m7
         6q1g2vGJ6HEGjYhjlCE4wLCl0Zn+xz+Z3Zo5A01WCgY6qDURLqdXy4ZRN1r7EC//ix/r
         71kPY948yswKhcD3VVwJuhMmW0NDqNR9X8wb1mcAXvOUB/9tAFu8v9UvIv+j63+eNBOV
         /KOQ6Q3alNPZi0Q2wqpRdbKWvnzqgsYi91Wpfs/+8xYGlyoy7OFZjNIzkJq/qYyPFvOJ
         j8hBtUJp8th6fk+4m7Q2F3P5pXRgyIkQZ+IHKqyAFLNe5lI4OZ75rj1WtekcvHVzUsM7
         7VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640545; x=1780245345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O1HLcn//nYjl34kU/2TQC8I6ZR+db2Ttx6Cx3u1ROgY=;
        b=rXWFSebZTNT42JIS0Y8ayYGrvebB+xIxp2ZIG7cGmGJNYo8iGHx1seUu/Gwl1P7mHO
         3AfdDu1w7+cxxhgyVx2K167V23V1Wm4/nD9Cn5ITxREojgPlIQJU6SRFlmprRv5z6nGk
         jHbttsswYwDUXf+q7XyaZMb3yfxvGtusUddQKYdSippH8q0VvH5rRY93xm5VGPlMvsPt
         Dw3CiQWSDoYemX9/jwonO7hHXZ/IcUjFttu2GSS51FNhKoK22LRQal84VgRs8DeRPNWq
         FcgP24a1NDWMNiXuvvm+iOGCoRkhw7pBLOS42+BVXGTm8Qm0sm7NWTNVcklaUrAryH13
         zccQ==
X-Gm-Message-State: AOJu0YxaxEghAv9mQGX9xgt6tb/e7Y7RS6zP4lYEt0QyMnD9M10hatpH
	jeboG07mN3324Ldl2by+xZFUOQmNOQN5243QrCWqx6v7F7xWudahleTps561w9Rq+dFE+Y4zvM1
	UcdZqLtdgS7n1JudBTso6zGeFvfVrdI81sa4/TQ==
X-Gm-Gg: Acq92OE97XM6Or1EuUlu1t4591bbgjEFoArb/0Lj4JsmPZggoFzlRLGIznUKwWXdWrN
	bTqTHeR9Z8eLUNvTGhrYm5ZoVUZN/9Wha8d7qihL+lnIlIUljjVe/mCKwprDhichcg3Yu+kp3Aq
	KuN+vwQ9TzLRp+PZ6Ot5CjkqHGs4pzMg6c+Y19ALNY0QHwenyKZEzozI0udHAbFoo7E4py0FrJC
	SdV2Kpo1DPqqOYeEfXP/v69ucDbZSp9XlRNaB80tAiQ/W4X3wRZ3J19eOWe96CGaLm9SJUivMDT
	2I3B2Qbj/vCYUjZiqi4urgZLQlt8dpNfFKcm
X-Received: by 2002:a05:6402:350c:b0:677:75e5:a1b3 with SMTP id
 4fb4d7f45d1cf-6889c465f79mr5819047a12.18.1779640545136; Sun, 24 May 2026
 09:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260524160657.17802-1-mhun512@gmail.com> <20260524162533.A98601F000E9@smtp.kernel.org>
In-Reply-To: <20260524162533.A98601F000E9@smtp.kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 25 May 2026 01:35:31 +0900
X-Gm-Features: AVHnY4LHk1AV0u1q-ffKndmXPDLMXPr4_aduMj0oer5MdAfLPHViFp_2Gmo8zUA
Message-ID: <CAGEsz8GaGhRwAPvOdiBYxho0GyCe__mVwPtT3xfhpK_mWioO=w@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: clean up KMS polling on register failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_093547_446619_98ACA8A9 
X-CRM114-Status: GOOD (  21.30  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKQm90aCBwb2ludHMgbG9vayBwcmUtZXhpc3RpbmcgYW5k
IHVucmVsYXRlZCB0byB0aGlzIHBhdGNoLiBUaGlzIGNoYW5nZSBvbmx5CmFkZHMgdGhlIG1pc3Np
bmcgZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKCkgb24gdGhlIGRybV9kZXZfcmVnaXN0ZXIoKSBm
YWlsdXJlCnBhdGggYWZ0ZXIgZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KCkuIEl0IGRvZXMgbm90
IGNoYW5nZSB0aGUKZHJtX2Rldl9wdXQoKS9jb21wb25lbnRfdW5iaW5kX2FsbCgpIG9yZGVyaW5n
IG9yIHRoZSBjb21wb25lbnQgYmluZCBkZXZtCnJlc291cmNlIGxpZmV0aW1lLgoKSSB3b3VsZCBw
cmVmZXIgdG8ga2VlcCB0aGlzIHBhdGNoIHNjb3BlZCB0byB0aGUgS01TIHBvbGxpbmcgdW53aW5k
IGZpeC4KCgoyMDI264WEIDXsm5QgMjXsnbwgKOyblCkg7Jik7KCEIDE6MjUsIDxzYXNoaWtvLWJv
dEBrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJp
YnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0byBj
b25zaWRlcjoKPgo+IFByZS1leGlzdGluZyBpc3N1ZXM6Cj4gLSBbSGlnaF0gVXNlLWFmdGVyLWZy
ZWUgb2YgdGhlIGBkcm1gIHBvaW50ZXIgaW4gdGhlIGBmcmVlX2RybWAgZXJyb3IgcGF0aCBvZiBg
bWVzb25fZHJ2X2JpbmRfbWFzdGVyKClgLgo+IC0gW0hpZ2hdIE1lbW9yeSBsZWFrIG9mIGBkZXZt
XypgIGFsbG9jYXRlZCByZXNvdXJjZXMgZHVyaW5nIGNvbXBvbmVudCBiaW5kIGZhaWx1cmVzIG9y
IHVuYmluZCBvcGVyYXRpb25zLgo+IC0tCj4KPiBjb21taXQgMGExYjg4MmRmZjM2ODllODBjNTU0
NmY3YzBiZjM4YzY5MzBhMTY1Mgo+IEF1dGhvcjogTXllb25naHVuIFBhayA8bWh1bjUxMkBnbWFp
bC5jb20+Cj4gZHJtL21lc29uOiBjbGVhbiB1cCBLTVMgcG9sbGluZyBvbiByZWdpc3RlciBmYWls
dXJlCj4KPiBUaGlzIGNvbW1pdCBmaXhlcyBhbiBpc3N1ZSBpbiBtZXNvbl9kcnZfYmluZF9tYXN0
ZXIoKSB3aGVyZSB0aGUgS01TCj4gcG9sbGluZyBoZWxwZXIgaXMgbGVmdCBydW5uaW5nIGlmIGRy
bV9kZXZfcmVnaXN0ZXIoKSBmYWlscy4gSXQgaW50cm9kdWNlcwo+IGEgbmV3IHVuaW5zdGFsbF9w
b2xsIGVycm9yIHBhdGggdG8gY2FsbCBkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoKSBiZWZvcmUK
PiBmcmVlaW5nIHRoZSBJUlEuCj4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiA+IGlu
ZGV4IDQ5ZmY5ZjFmMTZkMzIuLmU0OWRlNWRmNzM4NjcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9kcnYuYwo+ID4gQEAgLTM1MiwxMiArMzUyLDE0IEBAIHN0YXRpYyBpbnQgbWVzb25f
ZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBoYXNfY29tcG9uZW50cykK
PiA+Cj4gPiAgICAgICByZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7Cj4gPiAgICAgICBp
ZiAocmV0KQo+ID4gLSAgICAgICAgICAgICBnb3RvIHVuaW5zdGFsbF9pcnE7Cj4gPiArICAgICAg
ICAgICAgIGdvdG8gdW5pbnN0YWxsX3BvbGw7Cj4gPgo+ID4gICAgICAgZHJtX2NsaWVudF9zZXR1
cChkcm0sIE5VTEwpOwo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICt1bmluc3RhbGxf
cG9sbDoKPiA+ICsgICAgIGRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0pOwo+ID4gIHVuaW5z
dGFsbF9pcnE6Cj4gPiAgICAgICBmcmVlX2lycShwcml2LT52c3luY19pcnEsIGRybSk7Cj4gPiAg
ZXhpdF9hZmJjZDoKPgo+IFtTZXZlcml0eTogSGlnaF0KPiBUaGlzIGlzbid0IGEgYnVnIGludHJv
ZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXMgdGhlIGVycm9yIHVud2luZGluZyBwYXRoCj4g
aGF2ZSBhIHVzZS1hZnRlci1mcmVlPwo+Cj4gTG9va2luZyBmdXJ0aGVyIGRvd24gaW4gdGhpcyBm
dW5jdGlvbiBhdCB0aGUgZnJlZV9kcm0gbGFiZWw6Cj4KPiBmcmVlX2RybToKPiAgICAgICAgIGRy
bV9kZXZfcHV0KGRybSk7Cj4KPiAgICAgICAgIG1lc29uX2VuY29kZXJfZHNpX3JlbW92ZShwcml2
KTsKPiAgICAgICAgIG1lc29uX2VuY29kZXJfaGRtaV9yZW1vdmUocHJpdik7Cj4gICAgICAgICBt
ZXNvbl9lbmNvZGVyX2N2YnNfcmVtb3ZlKHByaXYpOwo+Cj4gICAgICAgICBpZiAoaGFzX2NvbXBv
bmVudHMpCj4gICAgICAgICAgICAgICAgIGNvbXBvbmVudF91bmJpbmRfYWxsKGRldiwgZHJtKTsK
Pgo+IFNpbmNlIGRybV9kZXZfcHV0KCkgZHJvcHMgdGhlIGZpbmFsIHJlZmVyZW5jZSBhbmQgZnJl
ZXMgdGhlIGRybSBzdHJ1Y3R1cmUsCj4gd29uJ3QgY29tcG9uZW50X3VuYmluZF9hbGwoKSB0cmln
Z2VyIGEgdXNlLWFmdGVyLWZyZWUgd2hlbiB1bmJpbmQgY2FsbGJhY2tzCj4gZGVyZWZlcmVuY2Ug
dGhlIGZyZWVkIHBvaW50ZXI/Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gVGhpcyBpcyBhbHNvIGEg
cHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgYXJlIHdlIGxlYWtpbmcgZGV2bV8qIHJlc291cmNlcwo+
IGR1cmluZyBjb21wb25lbnQgYmluZCBmYWlsdXJlcyBvciB1bmJpbmQgb3BlcmF0aW9ucz8KPgo+
IEJlY2F1c2UgZGV2bSBhbGxvY2F0aW9ucyBhcmUgc2NvcGVkIHRvIHRoZSBkZXZpY2UgcHJvYmUg
bGlmZWN5Y2xlLCB0aGV5Cj4gYXJlIG5vdCBpbXBsaWNpdGx5IHJlbGVhc2VkIGR1cmluZyBiaW5k
IGZhaWx1cmUgcGF0aHMgb3IgdW5iaW5kIGNhbGxzLgo+Cj4gQ291bGQgdGhpcyByZXN1bHQgaW4g
cGVybWFuZW50IG1lbW9yeSBsZWFrcyBhY3Jvc3MgcmV0cmllcyBpZiBjb21wb25lbnQKPiBiaW5k
aW5nIGZhaWxzIGFuZCBpcyBsYXRlciByZXRyaWVkPwo+Cj4gLS0KPiBTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjQxNjA2NTcuMTc4MDIt
MS1taHVuNTEyQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

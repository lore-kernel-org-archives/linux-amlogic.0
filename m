Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8352CD5BB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP40soiH1l/6m8byQqQEd6OkyTc2Mdv6ECFV0iWP8sY=; b=p+hKIHlQ6MtCPn
	eLBKVt42UfTDqb5ikGWtZzcaenieVFUfY7ufh1+aMzhO4ecX8hpVhy7bvl1YRkkdRihZMGDbxsUo2
	IrlhveOdKY6Rkn7ZnyO9Fz6Ogb6V4XO+iI7Ds3SeEJBsbFy9AofZCtR5WYSMf943PTyIJdW7Fo5jS
	R/TJ6tpzwPI0LRFIn60D6DHgSR2CMv1mWZV7IWjYctPx46yDHOkr+V9HNfZSZ6rK1CkYklpS5sTIk
	LovFkNC6+DPMfV0IL//NME2FP7ptZJ94srXJeY1QlqZIPrOaKHPsPssRHv9Ynf6npRWSAx8ESDauZ
	W6lk3SEg40MeuHbvb9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXyW-0000000HavD-0veb;
	Mon, 25 May 2026 16:16:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXyT-0000000Haui-20Qe
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 16:16:18 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so18257416a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 09:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779725776; cv=none;
        d=google.com; s=arc-20240605;
        b=L8fPm7RiFrUIlEnh6doXrqwMWkWDv39lf1ILG3Zb6zt35QdFwVIQjaeZODG+knXGpT
         ECQme+shrOxlIv7PFML1YbrVhjplVJJ4KBmnmvSysLpLa8nfe7QMZLAgBpjPkXyhM+kK
         WDsncbfPF2o/ul5aGuv4v2gOccBfOmfYUq6NtoWwuf7nUIPgT7JNUCF+cRc82B0DBHYu
         XhCCto9aNHQ6nL3UcHqD36FcUzE4MKEmaUVacBYuAHj0oXowWkeM1GJsbyVDsJLPMbK9
         cfJiLIR+//GtwR34E+RijRFWxZSy+RJuDq3ssa5rE2GaJ6NLQ9dSU04Z3iu5S4GeI0Xn
         G8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/SOUgIW+PBGWqgmJXDGl03TtxW7cgumZ0tCc+7Z14k=;
        fh=ouXvSjf5SmEmNeimx6xyG+CKjdQvC3UxbsGBNR8v92o=;
        b=E9Joy/Tt3hrNpdG+Ys/D96k1RZbZVsaRL28qa0tfZ+9qIVFHXcOVt2IB8dnu1HnIgv
         xYSc35MFXOjaiGHGpWsKaAC+T/0bzUPrY35Ceopq2jFWnvdvzOLKcisAxZi7D/vJuuzY
         93wHy7DR7O7m6Td2MemrhWJEQwH9gidKXdoRdTTolMyh3HYI/HtztbGidCnPR6OIAJ8A
         tGVU2PEBU+RzVZDuPwvG4Uok4jDRo6X1isGER9zUCd7qq9s9vW+gy7cj2zUVUAPrbtT1
         2xEKxF8Ccz5SeE2IJLxo1wnklixJKzbSPGbf80jt2+49TefdWRqE1R9qxmVaeAKtcHCf
         8J8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779725776; x=1780330576; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/SOUgIW+PBGWqgmJXDGl03TtxW7cgumZ0tCc+7Z14k=;
        b=TW6GxfbPhPiQs1c8yBj73RAoY2Agl8nwFNfA0jEFiNIHX9NZSKu/Of+GhWBM7xDJ6r
         Oz6KFWcXJsesMZR0oDOVaHhzCX7hyVjGnqb3F8b1RBbbAh+rHEPQcHNBnleIyliS/t82
         f1+e7WeVv/8QvydwbXlT6pxihFUEr/+RoGrkF3fHhwyPrarOaDqoWB23Xbvq+AELAxv0
         x7nXNw9dMU3/DELJaMUQuCDbIWVC4ifX92yF5h0cYjITLLcu4jhTfA50z2os6LK1Kfjk
         UUD3qPFG+fxae/n1Vhf1A+he8NjgzpRBFb/a/mLI3Vf/0ZRBPB2nkaZU9zEuKIn1z1qS
         /v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725776; x=1780330576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/SOUgIW+PBGWqgmJXDGl03TtxW7cgumZ0tCc+7Z14k=;
        b=aHsaJt+l8WWDoMkLCAke8XLBBpl9mBkzPqUgElz5l7O/+yiso0PL0GtHLOOZN9IifU
         o2FMtCpdCxWRwAwyQp5aAEREwaIFyiIYrE1X0jW5uM3zVkRitxsnRwL7nwBtZmNjor4c
         uRdGj10w3lqs+6q4qDiBBLjw4X+ARevh9ftYaUqCkcAqp2/LZRHc6qvJxIpSw1O1A8//
         skuUw+csMDH8JaBUB25DNtAHqkkcyBZSdvXR0UM6d4yCTcej8iThfJcH8oM8H9Wl9cUW
         pgzqL+Iu9lGy8k2uy8QqQW9XCOf8JtRVDE4FLs4NW48iCSGbgMVQqk6Y7ji/jwoMe1Dd
         On0w==
X-Gm-Message-State: AOJu0YzUGGiU5yZkUnZzPfQqOVdDNTV8a6mIQx6wJLugvJsrCvqasb7o
	Brefzc8TWsmGvBI93qDJE6LUGnulMAPWsWGdLPz8Pp9IBLAMmFj4yfMXfyVI6w3EMWeJJ3Ly9jM
	xvarBT2uQL4lTtMZ8fdiMeTEMPDygDdio82Qe
X-Gm-Gg: Acq92OEjgFTpFO9TSM/w7Lf4hBtfzVgjy4va+3gcuRM/JFLC8L7J4KxTgDcp0eGjkFS
	roDSPeBq1HkLzZRXSZs8vIqYTi5kN2ipcrFJPu8lqiyP4400LFNs8tpASmX1cPptaCDhbw1bnv8
	BjSJx07OWV0OaQHxRR5BV8yXPY/ptjX/FDjUFgSFb1xA+SYa+AAK3eDh/x1182XQSSm3EXsqsyG
	QRr7sCBsgujeySkXbLp0RhXx2CdC5tBucdCoaT6zVmRagKTX5MILhJODHKRob/ri0xS4KkmZ164
	za6fYQ==
X-Received: by 2002:a05:6402:43c5:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-6889c42ccb8mr7409311a12.1.1779725775469; Mon, 25 May 2026
 09:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260525095216.12078-2-linux.amoon@gmail.com> <20260525102746.B58861F00A3D@smtp.kernel.org>
In-Reply-To: <20260525102746.B58861F00A3D@smtp.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 25 May 2026 21:45:57 +0530
X-Gm-Features: AVHnY4JnD3B5friicBByosla9N5iCWds37tvjlupqHMwJjZjvEE5EbdckMdNRm4
Message-ID: <CANAwSgTQQPDQjc1S4o1g9F+Uc2Fr6SYM6fm9DHB=mMR7eD6WFw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] media: meson: vdec: Fix memory leak in error path
 of vdec_open
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_091617_537799_1F99248A 
X-CRM114-Status: GOOD (  23.87  )
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

SGkgU2FzaGlrbywKClRoYW5rcyBmb3IgeW91ciByZXZpZXcgY29tbWVudHMKCk9uIE1vbiwgMjUg
TWF5IDIwMjYgYXQgMTU6NTcsIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+Cj4gUHJlLWV4aXN0aW5nIGlzc3VlczoK
PiAtIFtDcml0aWNhbF0gQWxsb2NhdGluZyBhbmQgZGVzdHJveWluZyBhIFY0TDIgbTJtX2RldiBv
biBldmVyeSBzZXNzaW9uIG9wZW4vY2xvc2UgY2F1c2VzIGEgVXNlLUFmdGVyLUZyZWUgd2l0aGlu
IHRoZSBWNEwyIE0yTSBjb3JlLgo+IC0gW0hpZ2hdIFRoZSBoYXJkd2FyZSBpbnRlcnJ1cHQgaGFu
ZGxlciB2ZGVjX2lzcigpIGRlcmVmZXJlbmNlcyBjb3JlLT5jdXJfc2VzcyB3aXRob3V0IGNoZWNr
aW5nIGlmIGl0IGlzIE5VTEwuCj4gLS0KPgo+IGNvbW1pdCBiZGU2ODcwNmZhNjMyZWZmYTg3NmMz
MGNlZjMzYjM1MjhjZDkxN2RhCj4gQXV0aG9yOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFp
bC5jb20+Cj4KPiBtZWRpYTogbWVzb246IHZkZWM6IEZpeCBtZW1vcnkgbGVhayBpbiBlcnJvciBw
YXRoIG9mIHZkZWNfb3Blbgo+Cj4gVGhpcyBjb21taXQgaW50cm9kdWNlcyBhbiBlcnJfbTJtX2N0
eF9yZWxlYXNlIGxhYmVsIGluIHZkZWNfb3BlbigpIHRvCj4gcHJldmVudCBhIHJlc291cmNlIGxl
YWsgd2hlbiB2ZGVjX2luaXRfY3RybHMoKSBmYWlscy4gSXQgYWxzbyBmcmVlcyB0aGUKPiB2NGwy
IGNvbnRyb2wgaGFuZGxlciBtZW1vcnkgaW4gdmRlY19jbG9zZSgpLgo+Cj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MjAwNDU5MDUuNkFDQkExRjAwMEU5QHNtdHAu
a2VybmVsLm9yZy8jdAo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL21l
c29uL3ZkZWMvdmRlYy5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5j
Cj4gPiBpbmRleCA0Yjc3ZWMxYWY1YTc2Li4xOGEyMmI3OWU4MzVlIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gPiArKysgYi9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiBbIC4uLiBdCj4gPiBAQCAtOTEzLDYg
KzkxMyw4IEBAIHN0YXRpYyBpbnQgdmRlY19vcGVuKHN0cnVjdCBmaWxlICpmaWxlKQo+ID4KPiA+
ICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICtlcnJfbTJtX2N0eF9yZWxlYXNlOgo+ID4gKyAgICAg
djRsMl9tMm1fY3R4X3JlbGVhc2Uoc2Vzcy0+bTJtX2N0eCk7Cj4gPiAgZXJyX20ybV9yZWxlYXNl
Ogo+ID4gICAgICAgdjRsMl9tMm1fcmVsZWFzZShzZXNzLT5tMm1fZGV2KTsKPgo+IFtTZXZlcml0
eTogQ3JpdGljYWxdCj4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgYWxs
b2NhdGluZyBhbmQgZGVzdHJveWluZyB0aGUgbTJtX2Rldgo+IG9uIGV2ZXJ5IHNlc3Npb24gb3Bl
biBhbmQgY2xvc2UgY2F1c2UgYSB1c2UtYWZ0ZXItZnJlZT8KPgo+IFNpbmNlIHRoZSB2NGwyIG0y
bSBjb3JlIHNjaGVkdWxlcyBqb2JzIHZpYSBhIHdvcmsgc3RydWN0LCBpZiBhIGpvYiBpcwo+IHNj
aGVkdWxlZCBqdXN0IGJlZm9yZSB0aGUgZmlsZSBkZXNjcmlwdG9yIGlzIGNsb3NlZDoKPgo+IHZk
ZWNfY2xvc2UoKQo+ICAgICB2NGwyX20ybV9yZWxlYXNlKHNlc3MtPm0ybV9kZXYpOwo+ICAgICAg
ICAga2ZyZWUobTJtX2Rldik7Cj4KPiBDb3VsZCB0aGUgc3lzdGVtIHdvcmtlciBsYXRlciBleGVj
dXRlIHY0bDJfbTJtX2RldmljZV9ydW5fd29yaygpIG9uIHRoZQo+IGZyZWVkIG0ybV9kZXYsIGFz
IHBlbmRpbmcgYmFja2dyb3VuZCB3b3JrIGlzbid0IGNhbmNlbGxlZCBkdXJpbmcgcmVsZWFzZT8K
Pgo+IFNob3VsZCBtMm1fZGV2IGJlIGFsbG9jYXRlZCBnbG9iYWxseSBvbmNlIGluIHByb2JlKCkg
aW5zdGVhZD8KPgo+IFsgLi4uIF0KPgo+IFtTZXZlcml0eTogSGlnaF0KPiBUaGlzIGlzIGEgcHJl
LWV4aXN0aW5nIGlzc3VlLCBidXQgbG9va2luZyBhdCB2ZGVjX2lzcigpLCBzZXNzIGlzIGluaXRp
YWxpemVkCj4gZnJvbSBjb3JlLT5jdXJfc2VzcyBhbmQgaW1tZWRpYXRlbHkgZGVyZWZlcmVuY2Vk
Ogo+Cj4gdmRlY19pc3IoKQo+ICAgICBzZXNzID0gY29yZS0+Y3VyX3Nlc3M7Cj4gICAgIHNlc3Mt
Pmxhc3RfaXJxX2ppZmZpZXMgPSBnZXRfamlmZmllc182NCgpOwo+Cj4gSWYgYSBzcHVyaW91cyBp
bnRlcnJ1cHQgZmlyZXMgd2hpbGUgdGhlIGRldmljZSBpcyBpZGxlIG9yIGltbWVkaWF0ZWx5IGFm
dGVyCj4gc3RyZWFtaW5nIHN0b3BzLCBjb3VsZCBjb3JlLT5jdXJfc2VzcyBiZSBOVUxMIGhlcmU/
Cj4KPiBTaG91bGQgdGhlcmUgYmUgYSBjaGVjayBiZWZvcmUgZGVyZWZlcmVuY2luZyBzZXNzPwpB
cG9sb2dpZXMsIGxldCBtZSBjaGVjay4gRXZlcnkgdGltZSBJIHRyeSB0byBmaXggYSBidWcsIEkg
c2VlbSB0bwpjcmVhdGUgYSBuZXcgb25lLgo+ClRoYW5rcwotQW5hbmQKPiAtLQo+IFNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyNTA5NTIx
Ni4xMjA3OC0xLWxpbnV4LmFtb29uQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

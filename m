Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD99C5DF8C
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2026 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqnSXXpQ2TEEpp8+QJxOTvol++/8wg16ANyHKGaNHD0=; b=FJHElxTP6fvzPJ
	zeXyBAHgMwgs3udKIQmwJNLRy2/28CWX7eEuOZSOeKdEjYATn8MOUxVNytyP4NH5AA1Ctk2Bz2/c/
	hcnR3365op7pa+2leT/0gDRoEQIGKKXvN3ALeQJrR25FA7iGz5ipSpljloMVApg2zaeyqD9K4A7Ib
	XJRvb8TJ3XyAW1TotPjBVBBGmfZywp5E9eeu3TqKLnZKGztxx7wF4qO9YMXL4T0I6tyG61ahFPP7C
	OnwxvnLmbyBv69uwo53lzeOkAFUmIN4/FxR7f0td0hZiqp0wNr7JJuGp/cg2dGuQzd1XCF84/fth3
	nS7BqN0I9wc2DcDzvqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6Xb-0000000FHlu-2DTP;
	Sun, 23 Aug 2026 11:39:07 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6XY-0000000FHlF-32eY
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Aug 2026 11:39:06 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so15620225e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 04:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485143; x=1788089943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qrz6vWIs7Ln59X+fS+7H6xGzZNfsFTViY3UVWM/k9UQ=;
        b=mdXg+fiGikCJTVqpivwupmS27691j9MbkZLavURNm7BXtImLaNk+dskkh/Kb7wYc/0
         LM1Whgeg04hdr6CwsqOyx7b1brtqTxHquzYZ2FnPqNSJXofGKzLEgIlAoPehn9Hvbq6D
         BCpSwHoDmBVY2XRJTy/XdxWZE2DiRihN1gWv3tKAjBrifdVcNCbFY8u80KUbfprBZ/Yy
         /IAynEE7e3oEG/JnjIfzE4HMtp7yHPVv52etZhV37H3LmKMsakojY20dHA3yWzSBkic+
         gb0xYbshdWOG4PSs/qzsPAQ0uMSWYa2bCDPsOnGoKrl5nKnAlFU48Hd5SU+tSYIwqbmR
         ApSw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0V56sFpGMMdcSLRUR3//GSDeZZTTPxqbh+hHwnl0JrAAXF3oGv8WzvNYyuLsvBaDyTqpHrQ86neu97KXh@lists.infradead.org
X-Gm-Message-State: AFuF++nEscOGJ1+kjLmRhn4qvJ3L6AlYQ9W9R5gqke3R58lk55bm4wX3
	Mwedgb8mcf/2UR+DG8pLAostnFVCtABb+6WYflEHX3JEuZDrM5FezHOe
X-Gm-Gg: AR+sD11Du6Thw9qxwYrnrBiUPZNG+SkVILvgtl6GymnKr3cBqms2J5+lJxS0m95OKNk
	j3HM6CWiwr0mBWdVUaMzzewpyDUUi5ydoUgnfFetOj/jtfXXGJrW40a14xhc3j+i2oMsyOLvRyo
	S+i4Yvz+nzr3LTnnjmGqkG70q/6iNMi38OSZI75tbzQamdqXou8bWuB1QesUCWdNUEF1YPo9gc0
	eTEeBNcQjVeH1ixdkI7MtdAXiTynH5VMR0aZE83o46Cs5gHRKAspUfvk4I3QaedlFWWJmzPZG1Y
	7Idw526WQHMuVXVTa0TGhdtEZONs5f8edCXCkfZRmg9aVZW0CWwjKRbFPQZhUB65Ouz04eVjUll
	pX4HMii70zZCK3Mtyji6+AIZ39pif/AMC/FEszvxtlEC8G8BTRni81AfpfZNAREV99VFtrZ/9oa
	dzDmgJkYXCHjvnwFEqCyZzcaxeX+moZtbkb3UT5WUPB9hhKNvJOxx+PsfIDfzvYx/ExLX6XtlZy
	XJ3gfHORCfQXz/s8u11ADhCt5WR+p6n
X-Received: by 2002:a05:600c:c48f:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499b8325d80mr195726245e9.6.1787485142600;
        Sun, 23 Aug 2026 04:39:02 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b57ab4sm61139535e9.2.2026.08.23.04.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 04:39:01 -0700 (PDT)
Message-ID: <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
Date: Sun, 23 Aug 2026 12:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_043905_619432_EFAA7CF1 
X-CRM114-Status: GOOD (  16.61  )
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

T24gMTkvMDgvMjAyNiAwODoyNSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4gT24gOC8xOS8yNiA0
OjM5IEFNLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+IEhpIEx1Y2FzLAo+Pgo+PiBPbiAyMDI2Lzgv
MTkgMDM6MTEsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPj4+IHVhcnRfYSBsaXN0cyB0aGUgMjRNSHog
Y3J5c3RhbCBmb3IgYWxsIHRocmVlIG9mIGl0cyBjbG9ja3MsIGJlY2F1c2UKPj4+IHRoZSBUNyBj
bG9jayBjb250cm9sbGVyIGRyaXZlciBkaWQgbm90IGV4aXN0IHdoZW4gdGhlc2UgYm9hcmRzIHdl
cmUKPj4+IGFkZGVkLgo+Pj4KPj4+IFRoYXQgbGVhdmVzIHRoZSByZWFsIFVBUlQgYnVzIGNsb2Nr
IHdpdGhvdXQgYSB1c2VyLCBzbyB0aGUga2VybmVsCj4+PiB0dXJucyBpdCBvZmYgd2hlbiBpdCBk
aXNhYmxlcyB1bnVzZWQgY2xvY2tzIGF0IHRoZSBlbmQgb2YgYm9vdCwgYW5kCj4+PiB0aGUgYm9h
cmQgaGFuZ3MuCj4+Pgo+Pj4gUG9pbnQgdWFydF9hIGF0IHRoZSByZWFsIGNsb2NrcywgdGhlIHdh
eSBtZXNvbi1zNC5kdHNpIGRvZXMsIGFuZCBkcm9wCj4+PiB0aGUgcGxhY2Vob2xkZXJzIGZyb20g
dGhlIHR3byBib2FyZCBmaWxlcy4KPj4+Cj4+PiBGaXhlczogNGZlZjA1NjU4OGY1ICgiYXJtNjQ6
IGR0czogYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQ6IGFkZAo+Pj4gaW5pdGlhbCBkZXZp
Y2UtdHJlZSIpCj4+PiBGaXhlczogNmYwNDhjYzdhNjM1ICgiYXJtNjQ6IGR0czogYWRkIGJvYXJk
IEFONDAwIikKPj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZTx0YW51cmVAbGludXguY29t
Pgo+Pj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtZmFibGUtNQo+Pj4gLS0tCj4+PiAgwqAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0c8Kg
wqDCoMKgwqDCoCB8IDIgLS0KPj4+ICDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1s
b2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzIHwgMiAtLQo+Pj4gIMKgIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA0ICsrKysKPj4+ICDCoCAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+Pj4gYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDItYW40MDAuZHRzCj4+PiBpbmRleCBj
YWIyZWU5ZWEwZDMuLmRjYmNkMDhhNzhiOSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4+IEBA
IC0zMyw3ICszMyw1IEBAIHh0YWw6IHh0YWwtY2xrIHsKPj4+ICDCoCB9Owo+Pj4KPj4+ICDCoCAm
dWFydF9hIHsKPj4+IC3CoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZ4dGFsPiwgPCZ4dGFsPiwKPj4+
IDwmeHRhbD47Cj4+PiAtwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gInh0YWwiLCAicGNsayIs
ICJiYXVkIjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+ICDCoCB9
Owo+Pj4gZGlmZiAtLWdpdAo+Pj4gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4+IGluZGV4IGM0MTUyNWEz
NGI3Mi4uNjc3MDY5ZTU4ZjMwIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+Pj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+
Pj4gQEAgLTI2Niw2ICsyNjYsNCBAQCAmc2RfZW1tY19jIHsKPj4+Cj4+PiAgwqAgJnVhcnRfYSB7
Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+PiAtwqDCoMKgwqDCoMKg
IGNsb2NrcyA9IDwmeHRhbD4sIDwmeHRhbD4sCj4+PiA8Jnh0YWw+Owo+Pj4gLcKgwqDCoMKgwqDC
oCBjbG9jay1uYW1lcyA9ICJ4dGFsIiwgInBjbGsiLCAiYmF1ZCI7Cj4+PiAgwqAgfTsKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4+
PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+IGluZGV4
IGNjMzcxZmNkMTg5Ni4uNzg0NzU4MmU3N2VkIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4gQEAgLTU4Nyw2ICs1ODcsMTAgQEAgdWFy
dF9hOiBzZXJpYWxANzgwMDAgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3
LXVhcnQiLAo+Pj4gImFtbG9naWMsbWVzb24tczQtdWFydCI7Cj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgwIDB4NzgwMDAgMHgwIDB4MTg+Owo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDE2OAo+Pj4gSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8Jnh0YWw+
LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNsa2NfcGVyaXBocwo+Pj4gQ0xLSURfU1lT
X1VBUlRfQT4sCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmeHRhbD47Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNs
b2NrLW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH07Cj4+Cj4+IEkgYWdyZWUgd2l0aCBtb3ZpbmcgdGhlIFVBUlQgY2xvY2sgY29u
ZmlndXJhdGlvbiB0byB0aGUgRFRTSSBmaWxlLgo+PiBIb3dldmVyLCBpdCBzZWVtcyBhIGxpdHRs
ZSBvZGQgdG8ga2VlcCB0aGUgWFRBTCBjbG9jayBkZWZpbml0aW9uIGluIHRoZQo+PiBEVFMsIGFz
IHRoZSBhbGlhcyBtYXkgbm90IGJlIGNvbnNpc3RlbnQgYWNyb3NzIGRpZmZlcmVudCBib2FyZHMs
IHdoaWNoCj4+IGNvdWxkIHJlc3VsdCBpbiBjb21waWxhdGlvbiBlcnJvcnMuIENvdWxkIHdlIG1v
dmUgdGhlIFhUQUwgY2xvY2sKPj4gZGVmaW5pdGlvbiB0byB0aGUgRFRTSSBhcyB3ZWxsLCBzaW1p
bGFyIHRvIG90aGVyIEFtbG9naWMgU29Dcz8KPiAKPiBJdCBzZWVtcyBzaW1pbGFyIHRvIGNoYW5n
ZXMgaW4gdGhpcyBzZXJpZXMgOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDQyMC1hZGQtYmx1ZXRvb3RoLXQ3LXZpbTQtdjQtMC05NTA1ZGYwZTcwMTZAYWxpZWwuZnIvCj4g
Cj4gV2hhdCBkbyB5b3UgdGhpbmsgPwo+IApUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGF0IHNl
cmllcywgdGhvdWdoIEkgd2Fzbid0IGF3YXJlIG9mIGl0LgpBbmQgYWZ0ZXIgcmVhZGluZyBJIGRv
bid0IGFncmVlIHdpdGggaXQuIFRoZSBjbG9ja3MgYXJlIG5vdCByZWR1bmRhbnQsIAp0aGV5IGFy
ZSB0aGVyZSBiZWNhdXNlIHdlIGFncmVlZCBzb21ldGltZSBhZ28gdGhhdCB4dGFsIGJlbG9uZ3Mg
dG8gdGhlIApib2FyZCBmaWxlcy4KU28gSSBzdGlsbCB2b3RlIGZvciBteSBjaGFuZ2UgaW4gdjIs
IHRoYXQgSSB3aWxsIHNlbmQgaW4gYSBmZXcgbWludXRlcy4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

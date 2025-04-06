Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C057C36002
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Apr 2025 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9ue4mpIu2LlkMWOXSv/M+54yT0J6f/aa09w4TLxg6M=; b=iRWEO+OnX0MBVA
	450XaxykTXE1Hc4XddfGvllXwNICDV101l4lyH4vOiKfQz1EnNqtcoH8Yh1TTzjeYP+7Ie3U3YoPN
	5bJwspPF1DFSjytALqcG6hGs9J8tAY27I4ggj+FKMrXh9fQtHUpLL/Lr/LOjAB73++91HwYO9+EgQ
	vpkZHS9YGsnwobxNLNsS7TrFXcVd+tK6NStY8DnbeXeUdiSb5OMtxh3rK8Pw5fCQDr7kChciltyZw
	7JxrWqm0K/JvO5FU+u6U9FnsVaSHPhrrCClfRHWVZVKtP+F8WjAAALnO3mKh/hdcEW53SM/2lLxv9
	RBcqGnnkAWN8qjdMcPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Wno-0000000FnC4-0Gu5;
	Sun, 06 Apr 2025 20:41:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WjG-0000000Fmq5-0mzb;
	Sun, 06 Apr 2025 20:36:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223fb0f619dso34107035ad.1;
        Sun, 06 Apr 2025 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971789; x=1744576589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=;
        b=cpy+Q7W6rqViIYlpq/RrGdhF/Z4XMwn9hk7gphA1cX0WdwchJyKzp6vt2P7GI7P+Yv
         Q18ZM1UCL2G+SwakBNz75JGgENPxQnKwKMPwxn7tDnhVJupDcReUYApwQGs1bqUNZEu7
         J0wlrsJzr9d0dlK6C50l6wMFewk+IFBRG9139xh3oTJP9lNZLveoVJasBa09RjBG3EK4
         zt2Uu3LWOngJiRe8gD370tFT2o/UT8EyUbVRsOSw1q+R9CUEa8QPFyJiwu355gWWPB3W
         BFp26404AwT/b2h1THoEuWeIMCIWa9OqJk/WqdT8n3yXKzJoiKf+zmsnDYGEYJJtz0mg
         8bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971789; x=1744576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=;
        b=r3tSRMdFIHPtikFLhtEmn8RwNOrxG4hw755MQ14YGlUOMChxrlUpGifwgB5GVlhA/Z
         Y6i7QueXnP4Kva1pc+hByNb932IFuYniWM7Mw0yw2KERmjtPhELN88gcUi+DnZCVbAdH
         S2q/ukd2PfplQsFpcDQkvYXNPESS9aurYDrBA3dUCKeGQIR9uFrrvaH4bKP6LTu6isCk
         DA7RMXGOJHUlF1bf6FtyCQk9G/dkuBA26vJDiKAXFmwErcsL4nJDapCffe5DU/Cv2OS5
         O+Bybyk7luAGsVtq9/VSwDreWmi4U3UqszV6c3DAQTgI701sU9LGt/WrUTsX5uNhtrSx
         dJpg==
X-Forwarded-Encrypted: i=1; AJvYcCUPe8X/XHd8ei5nOR26OP4SyYVdMgYMHrsntAbEGFa3JAyADc59U++a1QNaQZUD3HkJalXeDAzA7DL4TmIpoJOV8w==@lists.infradead.org, AJvYcCUXkdy814N52IWhP2a+DoPUHxbqpcpnsi+r5VlXTHpegHl/h//ZACA71nS1yPrTDKn3pRgTiVZmmESLztMf@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFkjnjuQsMq5CJaHFuEYDHO8hW9xNcQ+udr9z4ILEoSnISpGA
	Gb8ySKmmJ640y63tKnPTA6bx9nPfs/oUxsBgt0hy7/7Fn8KfK6/5KZvhcIpFAZvlULY5Ja5uIHc
	Dx27J/a3o6+nGjMCiWmlOiFRpVJ8=
X-Gm-Gg: ASbGncurhS2BenYIxVFflnsFjVEjKI1ym93pv08AT7svk/AbotbyvFSZvOBbT14N5TN
	K4fx+47KuXA8Wr77CbBabt5O+jehOL0+dqjYMR8I2HErc0At6V32+X9tCgg6EVZu+0RgK6w8Mkg
	pbkjBnWpI8CZbXpnELNRZAu3Gk2rsg7VoUOHZSgAX9
X-Google-Smtp-Source: AGHT+IHVq/OJ+5eWqAgV0C40CkVvYiB3g3UpuuHrRaTOdnWvFTptDTYS2PzO/EixgKcm/7GKrRXQgpJN+Y1ESqaqhMM=
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id
 d9443c01a7336-22a8a06b429mr135619515ad.23.1743971789179; Sun, 06 Apr 2025
 13:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net> <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
 <Z-vjWFFWvo1gesCe@probook>
In-Reply-To: <Z-vjWFFWvo1gesCe@probook>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:36:18 +0200
X-Gm-Features: ATxdqUGmtk00PreuVDRwGTRsD3__is8AGxXyJNh6rRQ0MhHTNzn1k6d2MHuZvGY
Message-ID: <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_133630_233483_AB19BC4B 
X-CRM114-Status: GOOD (  33.67  )
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

T24gVHVlLCBBcHIgMSwgMjAyNSBhdCAzOjAw4oCvUE0gSi4gTmV1c2Now6RmZXIgPGoubmVAcG9z
dGVvLm5ldD4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1hciAzMCwgMjAyNSBhdCAxMToxMDoyOFBNICsw
MjAwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQo+ID4KPiA+IE9uIFN1biwgTWFyIDIzLCAyMDI1IGF0IDE6MzjigK9QTSBKLiBOZXVzY2jDpGZl
ciB2aWEgQjQgUmVsYXkKPiA+IDxkZXZudWxsK2oubmUucG9zdGVvLm5ldEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+IFsuLi5dCj4gPiA+ICsgICAgICAgICAgICAgICBldGhfcGh5MDogZXRoZXJuZXQt
cGh5QDAgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBJQyBQbHVzIElQMTAxQSAo
MHgwMjQzMGM1NCkgKi8KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+
ID4gRG9lcyByZWcgPSA8MT4gYWxzbyB3b3JrIG9uIHlvdXIgYm9hcmQ/Cj4gPiAwIGlzIHRoZSBi
cm9hZGNhc3QgYWRkcmVzcy4gSXQncyB1bmZvcnR1bmF0ZWx5IHNvbWV0aGluZyB0aGF0IHdlIHN0
aWxsCj4gPiBoYXZlIGluY29ycmVjdCBpbiBhIGxvdCBvZiAuZHRzIGZpbGVzLgo+Cj4gVW5mb3J0
dW5hdGVseSBub3QuIEkgdHJpZWQgYWRkcmVzc2VzIDEgdG8gMzEgd2l0aG91dCBzdWNjZXNzLCB3
aGljaAo+IHNlZW1zIHN0cmFuZ2U7IG15IGd1ZXNzIHdhcyB0aGF0IHRoZSBQSFkgc2hvdWxkIHJl
c3BvbmQgdG8gb25lIG9mIHRoZW0uCj4gSSBnZXQgdGhpcyBlcnJvcjoKPgo+ICMgaXAgbCBzZXQg
ZXRoMCB1cAo+IFsgICAgNi44MDY4NDddIG1lc29uNi1kd21hYyBjOTQxMDAwMC5ldGhlcm5ldCBl
dGgwOiBSZWdpc3RlciBNRU1fVFlQRV9QQUdFX1BPT0wgUnhRLTAKPiBbICAgIDYuODEwNjA5XSBt
ZXNvbjYtZHdtYWMgYzk0MTAwMDAuZXRoZXJuZXQgZXRoMDogX19zdG1tYWNfb3BlbjogQ2Fubm90
IGF0dGFjaCB0byBQSFkgKGVycm9yOiAtMTkpClRoYW5rcyBmb3IgdGVzdGluZy4gTGV0J3Mga2Vl
cCBpdCBhdCB6ZXJvIHRoZW4uCgo+ID4KPiA+IFsuLi5dCj4gPiA+ICsmaTJjX0FPIHsKPiA+ID4g
KyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZpMmNf
YW9fcGlucz47Cj4gPiA+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ID4g
Kwo+ID4gPiArICAgICAgIHBtaWNAMzIgewo+ID4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJyaWNvaCxybjV0NjE4IjsKPiA+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDMyPjsK
PiA+ID4gKyAgICAgICAgICAgICAgIHN5c3RlbS1wb3dlci1jb250cm9sbGVyOwo+ID4gSGVyZSBJ
J20gYSBiaXQgc3VycHJpc2VkOgo+ID4gQXJlbid0IHNvbWUgb2YgdGhlIG91dHB1dHMgdXNlZCB0
byBkcml2ZSBWQ0NLIChDUFUgcG93ZXIgcmFpbCkgYW5kCj4gPiBWRERFRSAoZXZlcnl0aGluZyBl
bHNlIHBvd2VyIHJhaWwsIHdoaWNoIGFsc28gcG93ZXJzIHRoZSBHUFUpPwo+Cj4gVW5mb3J0dW5h
dGVseSBJIGRvbid0IGhhdmUgc2NoZW1hdGljcyBhbmQgSSB3YXNuJ3QgYWJsZSB0byB0cmFjZSB0
aGUKPiBjb25uZWN0aW9ucyBvbiB0aGUgYm9hcmQgYmVjYXVzZSB0aGV5J3JlIHNvIHRpbnkuIFNv
IGl0J3MgcXVpdGUgcG9zc2libGUgdGhhdAo+IHlvdSdyZSByaWdodCwgYnV0IEkgY2FuJ3QgYmUg
c3VyZS4KPgo+IEFyZSB0aGVyZSB2b2x0YWdlIHNlbnNvcnMgaW4gdGhlIE1lc29uOCBTb0MgdGhh
dCBJIGNvdWxkIHVzZSB0byBlc3RhYmxpc2hzIHRoZQo+IHJlbGF0aW9uIGJldHdlZW4gUE1JQyBv
dXRwdXRzIGFuZCBTb0Mgc3VwcGxpZXM/ClRoZXJlIGFyZW4ndCBhbnkgc2Vuc29ycyAodGhhdCBJ
J20gYXdhcmUgb2YpLiBCdXQgeW91IGNhbiBjaGVjawovc3lzL2tlcm5lbC9kZWJ1Zy9yZWd1bGF0
b3IvcmVndWxhdG9yX3N1bW1hcnkgYW5kIGNvbXBhcmUgdGhlIHZhbHVlcwp3aXRoIHRoZSBvbmVz
IGZyb20gYXJjaC9hcm0vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbjhtMi1teGlpaS1wbHVzLmR0cwpB
bHNvIHRoZSB2ZW5kb3IgdS1ib290IGFuZCBrZXJuZWwgbG9ncyBtYXkgcHJvdmlkZSBzb21lIGlu
Zm9ybWF0aW9uLgoKPiA+Cj4gPiBbLi4uXQo+ID4gPiArJnVzYjEgewo+ID4gPiArICAgICAgIHN0
YXR1cyA9ICJva2F5IjsKPiA+ID4gKyAgICAgICBkcl9tb2RlID0gImhvc3QiOwo+ID4gPiArICAg
ICAgIC8qCj4gPiA+ICsgICAgICAgICogVGhpcyBidXMgZmVhdHVyZXMgYSBSZWFsdGVrIFJUTDgx
ODggMi40R0h6IFdpRmkgbW9kdWxlLCB3aXRoIGEKPiA+ID4gKyAgICAgICAgKiAzLjNWIHN1cHBs
eSB2b2x0YWdlIHRoYXQgbXVzdCBiZSBlbmFibGVkIGJlZm9yZSB1c2UuCj4gPiA+ICsgICAgICAg
ICovCj4gPiA+ICsgICAgICAgdmJ1cy1zdXBwbHkgPSA8JndpZmlfM3YzPjsKPiA+IElmIHlvdSB3
YW50IHRvIGdvIGZvciBwZXJmZWN0aW9uIHRoZW4geW91IGNhbiB1c2UKPiA+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC94bW9zLHh2ZjM1MDAueWFtbCBhcwo+ID4gcmVm
ZXJlbmNlLgo+ID4gSXQncyBhbHNvIGFuICJvbmJvYXJkIiBVU0IgZGV2aWNlIHdoaWNoIHJlcXVp
cmVzIHRvZ2dsaW5nIGEgR1BJTyBhbmQgcmVndWxhdG9ycy4KPiA+IFRoZSBkcml2ZXIgc2lkZSBp
cyBzdXBlciBlYXN5IHRvIG1hbmFnZSBhcyBpdCdzIGdlbmVyaWMgKG1lYW5pbmc6IGl0Cj4gPiBw
YXJzZXMgYW55IEdQSU8gYW5kIHJlZ3VsYXRvciBhcyBsb25nIGFzIHRoZSBVU0IgSUQgaXMgcmVn
aXN0ZXJlZCk6Cj4gPiBkcml2ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2Rldi5jCj4KPiBJIGNv
bnNpZGVyZWQgdXNpbmcgb25ib2FyZF91c2JfZGV2LCBidXQgdGhlbiBjYW1lIHRvIHRoZSBjb25j
bHVzaW9uIHRoYXQKPiBJIGRvbid0IG5lZWQgaXQgYmVjYXVzZSBJIGRvbid0IG5lZWQgcmVzZXQg
c2VxdWVuY2luZywgb25seSBwb3dlci4KPgo+ID4gVGhhdCB3YXkgeW91IGNhbiBqdXN0IGRlc2Ny
aWJlIHRoZSBSVEw4MTg4IG9uIHRoZSBVU0IgYnVzIGFuZCBhc3NpZ24KPiA+IGl0J3MgdmQzMy1z
dXBwbHkgd2l0aG91dCBoYXZpbmcgdG8gKGFiKXVzZSB2YnVzLXN1cHBseSBvZiB0aGUgVVNCCj4g
PiBjb250cm9sbGVyLgo+Cj4gVGhpcyBkb2VzIHNvdW5kIHJlYXNvbmFibGUuIEknbGwgcmVjb25z
aWRlciB0aGUgb25ib2FyZF91c2JfZGV2Cj4gYXBwcm9hY2guClRoYW5rIHlvdSBmb3IgdGhlIG9u
Ym9hcmQgdXNiIGRldmljZSBwYXRjaGVzIChmb3IgdGhvc2Ugd2hvIGFyZSBjdXJpb3VzOiBbMF0p
IQoKClswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNDAzLXJ0bC1vbmJvYXJk
LXYxLTAtMTBjYTlhNmE0ZWUwQHBvc3Rlby5uZXQvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

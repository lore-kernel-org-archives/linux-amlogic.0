Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4499CC76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 21:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTzlaoBQnrNEqSGOBJiwSnhkmeviI+1XbgXGBG5HdRQ=; b=XwIKLmSP5Q79HG
	MhDcUQcTaH3ym7oYLOsOx//r3ZCuzzO99vZXci6QGz+BCzDNtZdBvwn7qdt6cNDeE5zSGWNB5wriM
	8SgQV7roBkdsoz65YOaKN5ltq8rVX1A2hhC/KQvVDQTb+nAkg8SLrPzau374sLc6VtMf9AXKMTX06
	kHu1TNPJX/i1IRGTy22ShbHlM/QOLUfiMsviLHa6+SWnsOSLT6o2J69prtSpuTLPN3SLz0KxJWw5I
	84aM9qTewaxzxYfgL/dNSPbhCUmVScfp4lXm8EWkn4sptvSl77GuuXRWNKCIsKdc5hWBCoaJwWFKw
	cQOznrV7JgYp03CTgyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRJ6-00GnIi-0w;
	Mon, 03 Apr 2023 21:01:40 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRJ2-00GnGu-2e;
	Mon, 03 Apr 2023 21:01:38 +0000
Received: by mail-ed1-f47.google.com with SMTP id b20so122551061edd.1;
        Mon, 03 Apr 2023 14:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680555694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1nokc9Y7TFTktzS0k9VBrHIX76o3+AsbuMOReWuMeQ=;
        b=hjvCmVvrQkA0+CTIwn5CBKxYc7pO5Zs+jBdXF3gSK8TcuXnObz7doXpWCpGoPuLk/S
         O02rnOt41ichiKGaSqcp4iVreBvJW/vxGr2fHqz+S3SEqAE1SdAzbza6W62EQ3cJTa+7
         NezjWCYz/ZS8B4hf0wUXGJrNMJCs5CxP+S9J0O0vMN9DKwkhwzeIeJmvIDHUTu5iRW+V
         LLQ8dFavc00tFh3+gJZXshZP0tZ0+d6Evg20qw/1OK+Gkq97ry7QPjKCeTkmwQLaPG1n
         ZDB63lJnjy6CTl9XopMwvTaTy66q+QZ2kQmuB9W4KRsaPkG0tTCKZpJev0rXeAvajlkR
         nuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680555694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1nokc9Y7TFTktzS0k9VBrHIX76o3+AsbuMOReWuMeQ=;
        b=zwIX2LNT0o8P757xO/1pmFX0NbTFjfl/jfxxj2Y/hEDyi886mTrBNDWZQEFW1h/s7q
         Oyh1tiUL3s4p2RwKlKzYs0TeO4WYNadGC8MhZPcpRAZZGQ4ePtxfEpWkCtG9kzIYxS5R
         HYY1RGRodj9M4ptOU7F50KAxiyE/tnlBR2CxpG2xKS8lUf4yldtajKZ4T4sfbXMpVsRg
         ECPzxPX4A7iNTzbDKUZB3mgsFOMcWFqYymsC6r4MxKggEGI+PzLp82xweJ15VMOEUE1p
         ryxfcdYBYjCg7qHhEIlBaWRjJrE2AhzKOFj0Xk79uYJ4Kqd56v/VaptxGt1UK5G8ybA9
         llxg==
X-Gm-Message-State: AAQBX9c7jc55jLETRBAByWeTTd7xLoBNIvY4nhpBB/+CgVDCZehvtZq4
	0mDu1JteOv+WEW9xeIUKUb2Zi6VmhtjHdX34CS4=
X-Google-Smtp-Source: AKy350ZrjMX8TvrP/gz2A/Lhmq7tXSB6K2clgxna2vUnVNV6LsNxmdSZNVlJcN0WfA9u6651pqIPMnD2SKaLhvzJx70=
X-Received: by 2002:a50:9f47:0:b0:502:1f98:e14c with SMTP id
 b65-20020a509f47000000b005021f98e14cmr286145edf.4.1680555693913; Mon, 03 Apr
 2023 14:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <abf03223-5745-0c79-7840-176c551134c5@gmail.com>
In-Reply-To: <abf03223-5745-0c79-7840-176c551134c5@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 23:01:22 +0200
Message-ID: <CAFBinCBvubso9G3hrJxCumFYcn1ggZhpsJsLA9Qehas4PH5RoQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_140136_879623_8BD5992D 
X-CRM114-Status: GOOD (  23.02  )
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

SGVsbG8gSGVpbmVyLAoKT24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMTA6NTnigK9QTSBIZWluZXIg
S2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToKPgo+IE5ld2VyIHZlcnNpb25z
IG9mIHRoZSBQV00gYmxvY2sgdXNlIGEgY29yZSBjbG9jayB3aXRoIGV4dGVybmFsIG11eCwKPiBk
aXZpZGVyLCBhbmQgZ2F0ZS4gVGhlc2UgY29tcG9uZW50cyBlaXRoZXIgZG9uJ3QgZXhpc3QgYW55
IGxvbmdlciBpbgo+IHRoZSBQV00gYmxvY2ssIG9yIHRoZXkgYXJlIGJ5cGFzc2VkLgo+IFRvIG1p
bmltaXplIG5lZWRlZCBjaGFuZ2VzIGZvciBzdXBwb3J0aW5nIHRoZSBuZXcgdmVyc2lvbiwgdGhl
IGludGVybmFsCj4gZGl2aWRlciBhbmQgZ2F0ZSBzaG91bGQgYmUgaGFuZGxlZCBieSBDQ0YgdG9v
LgpUaGF0IHNvdW5kcyBsaWtlIGEgZ29vZCB3YXkgZm9yd2FyZCB0byBtZQoKPiBJIGRpZG4ndCBz
ZWUgYSBnb29kIHdheSB0byBzcGxpdCB0aGUgcGF0Y2gsIHRoZXJlZm9yZSBpdCdzIHNvbWV3aGF0
Cj4gYmlnZ2VyLiBXaGF0IGl0IGRvZXM6Cj4KPiAtIFRoZSBpbnRlcm5hbCBtdXggaXMgaGFuZGxl
ZCBieSBDQ0YgYWxyZWFkeS4gUmVnaXN0ZXIgYWxzbyBpbnRlcm5hbAo+ICAgZGl2aWRlciBhbmQg
Z2F0ZSB3aXRoIENDRiwgc28gdGhhdCB3ZSBoYXZlIG9uZSByZXByZXNlbnRhdGlvbiBvZiB0aGUK
PiAgIGlucHV0IGNsb2NrOiBbbXV4XSBwYXJlbnQgb2YgW2RpdmlkZXJdIHBhcmVudCBvZiBbZ2F0
ZV0KPgo+IC0gTm93IHRoYXQgQ0NGIHNlbGVjdHMgYW4gYXBwcm9wcmlhdGUgbXV4IHBhcmVudCwg
d2UgZG9uJ3QgbmVlZCB0aGUKPiAgIERULXByb3ZpZGVkIGRlZmF1bHQgcGFyZW50IGFueSBsb25n
ZXIuIEFjY29yZGluZ2x5IHdlIGNhbiBhbHNvIG9taXQKPiAgIHNldHRpbmcgdGhlIG11eCBwYXJl
bnQgZGlyZWN0bHkgaW4gdGhlIGRyaXZlci4KPgo+IC0gSW5zdGVhZCBvZiBtYW51YWxseSBoYW5k
bGluZyB0aGUgcHJlLWRpdiBkaXZpZGVyIHZhbHVlLCBsZXQgQ0NGCj4gICBzZXQgdGhlIGlucHV0
IGNsb2NrLiBUYXJnZXRlZCBpbnB1dCBjbG9jayBmcmVxdWVuY3kgaXMKPiAgIDB4ZmZmZiAqIDEv
cGVyaW9kIGZvciBiZXN0IHByZWNpc2lvbi4KPgo+IC0gRm9yIHRoZSAiaW52ZXJ0ZWQgcHdtIGRp
c2FibGVkIiBzY2VuYXJpbyB0YXJnZXQgYW4gaW5wdXQgY2xvY2sKPiAgIGZyZXF1ZW5jeSBvZiAx
R0h6LiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUgcmVtYWluaW5nIGxvdyBwdWxzZXMKPiAgIGhhdmUg
bWluaW11bSBsZW5ndGguClVuZm9ydHVuYXRlbHkgSSBkaWRuJ3QgaGF2ZSBtdWNoIHRpbWUgdG9k
YXkgc28gSSBkaWRuJ3QgZ2V0IHRvIHJldmlld2luZyB0aGlzLgoKPiBJIGRvbid0IGhhdmUgaHcg
d2l0aCB0aGUgb2xkIFBXTSBibG9jaywgdGhlcmVmb3JlIEkgY291bGRuJ3QgdGVzdCB0aGlzCj4g
cGF0Y2guIFdpdGggdGhlIG5vdCB5ZXQgaW5jbHVkZWQgZXh0ZW5zaW9uIGZvciB0aGUgbmV3IFBX
TSBibG9jawo+IChjaGFubmVsLT5jbG9jayBkaXJlY3RseSBjb21pbmcgZnJvbSBnZXRfY2xrKGV4
dGVybmFsX2NsaykpIEkgZGlkbid0Cj4gbm90aWNlIGFueSBwcm9ibGVtLiBNeSBzeXN0ZW0gdXNl
cyBQV00gZm9yIHRoZSBDUFUgdm9sdGFnZSByZWd1bGF0b3IKPiBhbmQgZm9yIHRoZSBTRElPIDMy
a0h6IGNsb2NrLgo+Cj4gTm90ZTogVGhlIGNsb2NrIGdhdGUgaW4gdGhlIG9sZCBQV00gYmxvY2sg
aXMgcGVybWFuZW50bHkgZGlzYWJsZWQuCj4gVGhpcyBzZWVtcyB0byBpbmRpY2F0ZSB0aGF0IGl0
J3Mgbm90IHVzZWQgYnkgdGhlIG5ldyBQV00gYmxvY2suCj4KPiBJJ2QgYXBwcmVjaWF0ZSB0ZXN0
aW5nIG9uIHRoZSBkaWZmZXJlbnQgcGxhdGZvcm1zIHVzaW5nIHRoZSBvbGQKPiBQV00gYmxvY2su
CkkgaGF2ZSB0ZXN0ZWQgYmFzaWMgZnVuY3Rpb25hbGl0eSBvbiBhIFg5NiBBaXIgKFNNMSBTb0Ms
IHRoZSB2ZXJzaW9uCndpdGggR2JpdC9zIFBIWSkgd2hlcmUgdGhlIFZERENQVSByZWd1bGF0b3Ig
aXMgUFdNIGJhc2VkIGFuZCB0aGUgMzJrSHoKY2xvY2sgZm9yIHdpZmkgaXMgZ2VuZXJhdGVkIGJ5
IHRoZSBQV00gY29udHJvbGxlci4KVGhlIFJUTDg4MjJDUyBTRElPIHdpZmkgY2FyZCBpcyBzdGls
bCB3b3JraW5nIChmaXJtd2FyZSBkb3dubG9hZCwKYmFzaWMgY29ubmVjdGl2aXR5IGFuZCBjb25u
ZWN0aW5nIHRvIGFuIEFQKSBhbmQgdGhlIHN5c3RlbSBzdXJ2aXZlZCBhCm1pbnV0ZSBvZiAxMDAl
IENQVSB1c2FnZSB3aXRob3V0IGhhbmdpbmcuCgpGb3IgcmVmZXJlbmNlOgojIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9wd20KcGxhdGZvcm0vZmZkMTkwMDAucHdtLCAyIFBXTSBkZXZpY2VzCnB3bS0w
ICAgKHdpZmkzMmsgICAgICAgICAgICAgKTogcmVxdWVzdGVkIGVuYWJsZWQgcGVyaW9kOiAzMDUx
OCBucwpkdXR5OiAxNTI1OSBucyBwb2xhcml0eTogbm9ybWFsCnB3bS0xICAgKChudWxsKSAgICAg
ICAgICAgICAgKTogcGVyaW9kOiAwIG5zIGR1dHk6IDAgbnMgcG9sYXJpdHk6IG5vcm1hbAoKcGxh
dGZvcm0vZmY4MDcwMDAucHdtLCAyIFBXTSBkZXZpY2VzCnB3bS0wICAgKChudWxsKSAgICAgICAg
ICAgICAgKTogcGVyaW9kOiAwIG5zIGR1dHk6IDAgbnMgcG9sYXJpdHk6IG5vcm1hbApwd20tMSAg
ICgobnVsbCkgICAgICAgICAgICAgICk6IHBlcmlvZDogMCBucyBkdXR5OiAwIG5zIHBvbGFyaXR5
OiBub3JtYWwKCnBsYXRmb3JtL2ZmODAyMDAwLnB3bSwgMiBQV00gZGV2aWNlcwpwd20tMCAgICgo
bnVsbCkgICAgICAgICAgICAgICk6IHBlcmlvZDogMCBucyBkdXR5OiAwIG5zIHBvbGFyaXR5OiBu
b3JtYWwKcHdtLTEgICAocmVndWxhdG9yLXZkZGNwdSAgICApOiByZXF1ZXN0ZWQgZW5hYmxlZCBw
ZXJpb2Q6IDE1MDAgbnMKZHV0eTogMTEyNSBucyBwb2xhcml0eTogbm9ybWFsCgojIGdyZXAgXC5w
d20gL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5CiAgICAgICAgICAgICAgIGZmZDE5
MDAwLnB3bSNtdXgwICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICA2NDg5OTk5ODUKICAgICAg
ICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCiAgICAgICAgICAgICAgICAgIGZmZDE5MDAwLnB3
bSNkaXYwICAgICAgIDEgICAgICAgIDEgICAgICAgIDAKNjQ4OTk5OTg1ICAgICAgICAgIDAgICAg
IDAgIDUwMDAwICAgICAgICAgWQogICAgICAgICAgICAgICAgICAgICBmZmQxOTAwMC5wd20jZ2F0
ZTAgICAgICAgMSAgICAgICAgMSAgICAgICAgMAo2NDg5OTk5ODUgICAgICAgICAgMCAgICAgMCAg
NTAwMDAgICAgICAgICBZCiAgIGZmZDE5MDAwLnB3bSNtdXgxICAgICAgICAgICAgICAgICAwICAg
ICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwCiAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAg
IFkKICAgICAgZmZkMTkwMDAucHdtI2RpdjEgICAgICAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgMjQwMDAwMDAKICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQogICAgICAgICBm
ZmQxOTAwMC5wd20jZ2F0ZTEgICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAyNDAwMDAw
MAogICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBOCiAgIGZmODA3MDAwLnB3bSNtdXgxICAg
ICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwCiAgICAgICAwICAg
ICAwICA1MDAwMCAgICAgICAgIFkKICAgICAgZmY4MDcwMDAucHdtI2RpdjEgICAgICAgICAgICAg
IDAgICAgICAgIDAgICAgICAgIDAgICAgMjQwMDAwMDAKICAgICAgIDAgICAgIDAgIDUwMDAwICAg
ICAgICAgWQogICAgICAgICBmZjgwNzAwMC5wd20jZ2F0ZTEgICAgICAgICAgMCAgICAgICAgMCAg
ICAgICAgMCAgICAyNDAwMDAwMAogICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBOCiAgIGZm
ODA3MDAwLnB3bSNtdXgwICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0
MDAwMDAwCiAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKICAgICAgZmY4MDcwMDAucHdt
I2RpdjAgICAgICAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgMjQwMDAwMDAKICAgICAg
IDAgICAgIDAgIDUwMDAwICAgICAgICAgWQogICAgICAgICBmZjgwNzAwMC5wd20jZ2F0ZTAgICAg
ICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAyNDAwMDAwMAogICAgICAgMCAgICAgMCAgNTAw
MDAgICAgICAgICBOCiAgIGZmODAyMDAwLnB3bSNtdXgxICAgICAgICAgICAgICAgICAxICAgICAg
ICAxICAgICAgICAwICAgIDI0MDAwMDAwCiAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkK
ICAgICAgZmY4MDIwMDAucHdtI2RpdjEgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAg
ICAgMjQwMDAwMDAKICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQogICAgICAgICBmZjgw
MjAwMC5wd20jZ2F0ZTEgICAgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgICAyNDAwMDAwMAog
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCiAgIGZmODAyMDAwLnB3bSNtdXgwICAgICAg
ICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwCiAgICAgICAwICAgICAw
ICA1MDAwMCAgICAgICAgIFkKICAgICAgZmY4MDIwMDAucHdtI2RpdjAgICAgICAgICAgICAgIDAg
ICAgICAgIDAgICAgICAgIDAgICAgMjQwMDAwMDAKICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAg
ICAgWQogICAgICAgICBmZjgwMjAwMC5wd20jZ2F0ZTAgICAgICAgICAgMCAgICAgICAgMCAgICAg
ICAgMCAgICAyNDAwMDAwMAogICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBOCgpoZG1pX3Bs
bCBpcyB0aGUgcGFyZW50IG9mIGZmZDE5MDAwLnB3bSNtdXgwIC0gYmVmb3JlIGl0IHdhcyB1c2lu
ZyB0aGUKMjRNSHogWFRBTC4KSSBoYXZlbid0IHRlc3RlZCB3aGF0IGhhcHBlbnMgd2hlbiBJIGNo
YW5nZSB0aGUgdmlkZW8gbW9kZSAodGhhdCBib2FyZAppcyBjdXJyZW50bHkgbm90IGNvbm5lY3Rl
ZCB0byBhbnkgSERNSSBzY3JlZW4pLgoKTGF0ZXIgdGhpcyB3ZWVrIEkgY2FuIGFsc28gdHJ5IHRo
aXMgZS5nLiBvbiBteSBPZHJvaWQtQzEgKHdpdGggMzItYml0Ck1lc29uOGIgU29DKSB0byB2ZXJp
ZnkgdGhhdCB3ZSBkb24ndCBoYXZlIGFueSAzMi1iaXQgY29tcGF0aWJpbGl0eQppc3N1ZXMuCgoK
QmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK

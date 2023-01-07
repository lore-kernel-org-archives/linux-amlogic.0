Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81946C54EBC
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNMzg4R+GymcjPGTPGw8ofrQi9JIWy6zApP1RGbkN3s=; b=zLg0jsEmXfGSHw
	/FNpzXnMxWpSJKZmFlf79rVVAcbFb7Ln+xKYNNXF3A5yW6AB0g3Abe1V4+Nj+L9fCbpiYB4OK0JOJ
	Ox/wl6S0iP1mIuAcOu/BRuyNd4NV7TSji1abU+xXadnUjqeKV4q2i71h4ZAwLMKhXv4KOXoNYcbhc
	Z6iZEqjAWw6rqqt62S5lTDeFjMCLmgnwLmWbvOHE9dm/ZFSswMBGlVN4dhijb6vvNJYiwMBFb1spV
	dXycc6EJNI90Q0zu2Zz3nA5NrFWS8fjnMT1aK0VvtU4Nq4NB1xWphPjOE/3+YysP538EbP602TJN0
	G+DdhBsvugXQNqtSi/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAhb-007Ruh-NP; Sat, 07 Jan 2023 15:01:43 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAhY-007RtY-EJ
	for linux-amlogic@lists.infradead.org; Sat, 07 Jan 2023 15:01:41 +0000
Received: by mail-ua1-x935.google.com with SMTP id e7so990467ual.4
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Jan 2023 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkMPSY5sKQ0G3VOrU/JYEQvYOS+As5T7ufct2VUi/QM=;
        b=TNZk6gqUjOVJBmU7O/HMCzxN8LPAaAMpUKP+epKD9obgPAaNCz/sjeJriQazNYDTgI
         4Uf16VtaoRiBGkXEpp/+MJQRPGsidRVksdPATT0ooxmKWLwueysUXMFgMCuYDXM4ru/9
         Fh7sJe1YY8VU+8bxWJ0pSbs3Hp6oU/vJhJCoNqU8GSQvLyS2+mBiv7MhJV1tFg8ZQJYt
         UOF7izKu6Mq8Ee8zHLPvbF5uUi35UOfGU9MZoxiQWsMieCC5S8u1rvoXH9HFAbPbUBO0
         mU/YyS6weew+OFwoEZDdDRE1S8vMgcNQusx8y6m/+e/P2vpR5XonQcgOrYK97m3MTGth
         itaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkMPSY5sKQ0G3VOrU/JYEQvYOS+As5T7ufct2VUi/QM=;
        b=kxVGzJOf9UZ+KSFL2kXB3M1CftXP1s+9yVhUnD8iEo0Mb64nhWC7Oz26lEievjjrWr
         w9D0QnheQcG4C2gBIyUdkqbdu+doAiobCzyi4JVE/vr6nRkG8gNZq0J9ppVhxlahf9Zr
         8HIpOlIX8cHbLr7Z5O5jn529zI2CwxqprDlUGhCDdkBu601njuOtj5eYfzOxk/0j+qvU
         Jp87BOLdRyEFZs+W5vchp4LAnaX45CInTv7EZ2h3OyGM4N+iK7FLiOHDApmHngyuhAkQ
         VAbn172EXltE0Ewfkxjld9SXxZRvsC5Wk6K7V7gNSN1y9k7L+Oc2i0VjUcK3HNFWNsSp
         OKjw==
X-Gm-Message-State: AFqh2kqa5/8aOz8xXfGfZmUpWEkU0bL44so2AhjH2eqY0hRB80QWJckF
	qmcIsz6ZuJwHJcBvvwaGqB/Nqcd4sb5nCMPKx6g=
X-Google-Smtp-Source: AMrXdXtpIdeGO3n0jLF4X9cDlM+2Oq6/kcUAXyuQTzqP0oBwwKEFDlsROPij5X64Oy6R89WuzpgNZUFDF7TVhjEZqNk=
X-Received: by 2002:ab0:4566:0:b0:418:b66a:6f26 with SMTP id
 r93-20020ab04566000000b00418b66a6f26mr6268456uar.21.1673103699191; Sat, 07
 Jan 2023 07:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
 <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com> <Y7YDwJX6aqa8vbQK@google.com>
In-Reply-To: <Y7YDwJX6aqa8vbQK@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:31:23 +0530
Message-ID: <CANAwSgTVnQXGoOfuxmwT7zCMJMY0Hw+uyQx126kNPL2WKGR8Hg@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_070140_526688_A0E34ACE 
X-CRM114-Status: GOOD (  30.39  )
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

SGkgTWF0dGhpYXMsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMKCk9uIFRodSwgNSBK
YW4gMjAyMyBhdCAwNDoyNSwgTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+IHdy
b3RlOgo+Cj4gT24gV2VkLCBEZWMgMjgsIDIwMjIgYXQgMDM6NTk6MTdQTSArMDUzMCwgQW5hbmQg
TW9vbiB3cm90ZToKPiA+IEhpIEljZW5vd3ksCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3
IGNvbW1lbnRzCj4gPgo+ID4gT24gV2VkLCAyOCBEZWMgMjAyMiBhdCAxNTozOCwgSWNlbm93eSBa
aGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+ID4gPgo+ID4gPiDlnKggMjAyMi0xMi0yOOaY
n+acn+S4ieeahCAxMDowMyArMDAwMO+8jEFuYW5kIE1vb27lhpnpgZPvvJoKPiA+ID4gPiBBZGQg
dXNiIGh1YiBkZXZpY2UgaWQgZm9yIEdlbmVzeXMgTG9naWMsIEluYy4gR0w4NTJHLU9IRyBIdWIg
VVNCIDIuMAo+ID4gPiA+IHJvb3QgaHViIGFuZCBHZW5lc3lzIExvZ2ljLCBJbmMuIEdMMzUyMy1R
Rk43NiBVU0IgMy4xIHJvb3QgaHViLgo+Cj4gbml0OiBRRk4gNzYgaXMgb25lIG9mIHRoZSBwYWNr
YWdlIG9wdGlvbnMgb2YgdGhlIEdMMzUyMywgSSBleHBlY3QgdGhpcwo+IGJpbmRpbmcgdG8gYmUg
YXBwbGljYWJsZSBhcyB3ZWxsIGZvciBvdGhlciBHTDM1MjMgdmFyaWFudHMsIHNvIEknZCBzdWdn
ZXN0Cj4gdG8gZHJvcCB0aGUgc3VmZml4LiBOb3Qgc3VyZSB3aGF0ICdPSEcnIHN0YW5kcyBmb3Is
IHRoZSBHZW5lc3lzIHdlYnNpdGUKPiBvbmx5IGxpc3RzIGEgR0w4NTJHIGh1YiB3aXRoIGRpZmZl
cmVudCBwYWNrYWdlIHR5cGVzIChub25lIG9mIHRoZW0gJ09IRycpLAo+IHNvIEknZCBzYXkgZHJv
cCB0aGUgc3VmZml4IHVubGVzcyBpdCBpcyBrbm93biB0aGF0ICdPSEcnIHZhcmlhbnQgdXNlcwo+
IGEgZGlmZmVyZW50IHByb2R1Y3QgaWQgdGhhbiBvdGhlciBHTDg1MkcgdmFyaWFudHMKPgoKWWVz
LCBJIHdpbGwgYmUgc3VyZSB0byBkbyB0aGlzIHJlZmVyZW5jZSwgSSBqdXN0IHBpY2tlZCB0aGVz
ZSBmcm9tIHRoZQpib2FyZCBzY2hlbWF0aWNzLgoKPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55
YW1sIHwgMiArKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+
ID4KPiA+ID4gPiBkaWZmIC0tZ2l0Cj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiA+ID4gPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxnbDg1MGcueWFtbAo+ID4gPiA+IGluZGV4
IGE5ZjgzMTQ0OGNjYS4uZGIwMDlmM2VmNDM4IDEwMDY0NAo+ID4gPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxnbDg1MGcueWFtbAo+ID4gPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxnbDg1
MGcueWFtbAo+ID4gPiA+IEBAIC0xNiw2ICsxNiw4IEBAIHByb3BlcnRpZXM6Cj4gPiA+ID4gICAg
Y29tcGF0aWJsZToKPiA+ID4gPiAgICAgIGVudW06Cj4gPiA+ID4gICAgICAgIC0gdXNiNWUzLDYw
OAo+ID4gPiA+ICsgICAgICAtIGdlbmVzeXMsdXNiNWUzLDYxMAo+ID4gPiA+ICsgICAgICAtIGdl
bmVzeXMsdXNiNWUzLDYyMAo+ID4gPgo+ID4gPiBJIGRvbid0IHRoaW5rIGdlbmVzeXMsIGlzIG5l
ZWRlZCBoZXJlIGJlY2F1c2UgdXNiNWUzIG1lYW5zIFVTQiBWSUQKPiA+ID4gMHgwNWUzLCB3aGlj
aCBpcyBhbHJlYWR5IGxpbmtlZCB0byBHZW5lc3lzIExvZ2ljLgo+ID4gPgo+ID4KPiA+IE9rLCBJ
IGFkZGVkIHRoaXMgYXMgZ2VuZXN5cywgaXMgaXQgcGFydCBvZiB0aGUgbWFudWZhY3R1cmVyIG9y
IHZlbmRvciBuYW1lCj4gPiB3aGljaCBpcyBtb3N0IGNvbW1vbmx5IHVzZWQgZm9yIGFkZGluZyB2
ZW5kb3Itc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmdzLgo+Cj4gVGhhdCBkb2Vzbid0IGZvbGxv
dyB0aGUgZ2VuZXJpYyBVU0IgYmluZGluZywgcGxlYXNlIGRyb3AgJ2dlbmVzeXMsJy4KPgoKWWVz
LCBJIHdpbGwgZHJvcCB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+ID4gPiBJbiBhZGRpdGlv
biwgdGhlIGNvbnRyb2wgbG9naWMgb2YgdGhlc2UgdHdvIGh1YnMgYXJlIG5lZWRlZCB0byBiZQo+
ID4gPiB2ZXJpZmllZC4KPiA+Cj4gPiBXZSB3ZXJlIHVzaW5nIGdwaW8taG9nIHRvIHJlc2V0IHRo
ZSBVU0IgaHViLCBzbyBub3cgc3dpdGNoIHRvIFVTQiBvbmJvYXJkIGh1Ygo+ID4KPiA+ID4KPiA+
ID4gQW5kIHdoYXQncyB0aGUgc3RhdHVzIG9mIHRoZSBjb21wYW5pb24gaHViIG9mIHRoZSBVU0Iz
IGh1Yj8gSXMgaXQKPiA+ID4gcmVhbGx5IGEgVVNCMy1vbmx5IGh1Yiwgb3IgaXMgaXRzIFVTQjIg
cGFydCBqdXN0IGVxdWFsIHRvIGFub3RoZXIgVVNCMwo+ID4gPiBodWI/Cj4gPiA+Cj4gPiB1c2I1
ZTMsNjEwIGlzIFVTQiAyLjAgcG9ydCBodWIgcHJlc2VudCBvbiBPZHJvaWQgQzEgYW5kIE9kcm9p
ZCBDMiBib2FyZAo+ID4KPiA+IHVzYjVlMyw2MjAgaXMgVVNCIDMuMSBwb3J0IGh1YiBwcmVzZW50
IG9uIE9kcm9pZCBOMi4KPgo+IExpa2UgSWNlbm93eSBJIHdvdWxkIGV4cGVjdCB0aGUgR0wzNTIz
IHRvIHByb3ZpZGUgYWxzbyBhIDIuMCBodWIuCj4KPiBXaGF0IGlzIHRoZSBvdXRwdXQgb2YgJ2xz
dXNiJyBvbiB0aGUgT2Ryb2lkIE4yPwoKYWxhcm1Ab2Ryb2lkLW4yOn4kIGxzdXNiIC10dgovOiAg
QnVzIDAyLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1oY2QvMXAs
IDUwMDBNCiAgICBJRCAxZDZiOjAwMDMgTGludXggRm91bmRhdGlvbiAzLjAgcm9vdCBodWIKICAg
IHxfXyBQb3J0IDE6IERldiAyLCBJZiAwLCBDbGFzcz1IdWIsIERyaXZlcj1odWIvNHAsIDUwMDBN
CiAgICAgICAgSUQgMDVlMzowNjIwIEdlbmVzeXMgTG9naWMsIEluYy4gR0wzNTIzIEh1YgovOiAg
QnVzIDAxLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1oY2QvMnAs
IDQ4ME0KICAgIElEIDFkNmI6MDAwMiBMaW51eCBGb3VuZGF0aW9uIDIuMCByb290IGh1YgogICAg
fF9fIFBvcnQgMTogRGV2IDIsIElmIDAsIENsYXNzPUh1YiwgRHJpdmVyPWh1Yi80cCwgNDgwTQog
ICAgICAgIElEIDA1ZTM6MDYxMCBHZW5lc3lzIExvZ2ljLCBJbmMuIEh1YgoKVGhhbmtzCgotQW5h
bmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DC2C77B73
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKUG7CWjOaD0s7gka4NRm+h057A4d6oqSD3Zp8wN6iM=; b=qwilrtYLFgYcOC
	zDgyC1liq0KVuMs2egBlM6vv/9sjLLM4eWnFdrjKfj6HaL4z1TXQXts9m3f+tE0tuFG/x/4sjSZmM
	iAqrIVik6GfJYarmIAA9Ic2lDIWupdnjqZexcE9b0NOBRtt4PfvBZp74ysMclbyi7GZpi/MHs1l9I
	J/o36MbSZ7r65NxFWbLC6BVRROUtm1ekvogs1NLotGYksYma6L+ahZZE04FAj5iFF6NtwmAiNwJqk
	lVDefpx4UTs3y0AUxctkgcrIQo1UK0N788jiHfplXX5um8dlOsfZAw+Y0Ys0x5d6WWqzquzkQ9dx5
	etUPUkqF5h6CmIFXgzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vBu-00D3Wl-2w;
	Tue, 30 May 2023 08:58:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vBs-00D3WB-1J
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 08:58:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so28428265e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685437127; x=1688029127;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYHWRwPC1PyqtJzsHAhzg3QWrxaLFpon/Y0AWZagYyc=;
        b=qi6erHOYwJy39owpmZLKdUawt774nCiCm9mIrk6TReP6vQJg/Q2jdlQ+vXtOvCpM72
         2xuzz2FSYWAU/bJThNKAT4zmJ1UtF37p4PZbmXSlcx4Bi4MBGRjrpkIfS/3IP9eVTDvc
         s2wPs3c66zwvFPjuTk3dBwUtbr2sujASo8sChoFw9Iu16QIJ0XhOi959OqfaoHr22vxw
         e/UH6ZAQFBqEa1URrY7Uktz9B7NpKk8CR9DcDR5NW737V1YQ+t/6big3a+OwtX2s0x2u
         vNEqNZzcBfLWiWu2v/RRU2lmOOUP6wR+s5VmXE7vAO6+momkWMH3iGrjNZYRUo7PRMVj
         WBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437127; x=1688029127;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kYHWRwPC1PyqtJzsHAhzg3QWrxaLFpon/Y0AWZagYyc=;
        b=PtmfVBtNSkuu82Ah86PSfHlVo2rlWP/rc6phC6zrUJ2bnj+f0b3PGjL4ixTlut4GBD
         HtNNwqQWA4t9h50NEft3J4uN+b7DWw7kbHvzqK3T14sMQPuH2AERXwIbQRqKVbTo3OEF
         h+BS53abriWw1v5tUuingPr5T9obDej7MXPYRpMNbelDwASDDTlIm4fdYafIsWkTiocH
         cXRqEm+8Bjqg8DbvUsZlrfWRIUaZa7yVn3H4eukZU3L+JEqbTX++qivVS3wzcBUN0tN5
         5vX3sizaoV8ZXqFM1tBJiNvnK+xp+iThcRQKerge5EhNo4wtF9w03c1BWkbwHpSfeh/1
         vUmg==
X-Gm-Message-State: AC+VfDzGOEPtDQlCjL3tV1I19IALnk2Db1SpBWqBFsxMsesaAUjOgBqy
	FILS+160CaFkpMBZvgNaLepH1Q==
X-Google-Smtp-Source: ACHHUZ5V7jGuiisz0DRb9gePOQ50QMdG/I22ele4GLTmzVxV/38WaqdHuh5m1Ym1QLZTD6CqULqb4Q==
X-Received: by 2002:a7b:ca59:0:b0:3f6:a81:eb52 with SMTP id m25-20020a7bca59000000b003f60a81eb52mr1027741wml.21.1685437127075;
        Tue, 30 May 2023 01:58:47 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003f42d8dd7ffsm16724062wmd.19.2023.05.30.01.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:58:46 -0700 (PDT)
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-6-ddrokosov@sberdevices.ru>
 <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
 <20230522130033.a47vlybocme66rev@CAB-WSD-L081021>
 <CAFBinCAk9+Km3BssA8d8nc_Z_GbhY87FD3qQRpZ2k7ChKt7TBg@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Conor Dooley <conor.dooley@microchip.com>,
 krzysztof.kozlowski+dt@linaro.org
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, khilman@baylibre.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Date: Tue, 30 May 2023 10:56:52 +0200
In-reply-to: <CAFBinCAk9+Km3BssA8d8nc_Z_GbhY87FD3qQRpZ2k7ChKt7TBg@mail.gmail.com>
Message-ID: <1jmt1m42m1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_015852_460447_5367F8ED 
X-CRM114-Status: GOOD (  37.24  )
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

Ck9uIE1vbiAyOSBNYXkgMjAyMyBhdCAyMjozOCwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIERtaXRyeSwKPgo+IE9u
IE1vbiwgTWF5IDIyLCAyMDIzIGF0IDM6MDDigK9QTSBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292
QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiBbLi4uXQo+PiA+IFRoaXMgSVAgYmxvY2sgaGFzIGF0
IGxlYXN0IG9uZSBhZGRpdGlvbmFsIGlucHV0IGNhbGxlZCAic3lzX3BsbF9kaXYxNiIuCj4+ID4g
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSAic3lzX3BsbF9kaXYxNiIgY2xvY2sgaXMgZ2Vu
ZXJhdGVkIGJ5IHRoZQo+PiA+IENQVSBjbG9jayBjb250cm9sbGVyLiBTdXBwb3J0IGZvciB0aGUg
Q1BVIGNsb2NrIGNvbnRyb2xsZXIKPj4gPiAoZHQtYmluZGluZ3MgYW5kIGEgZHJpdmVyKSB3aWxs
IGJlIGFkZGVkIGF0IGEgbGF0ZXIgdGltZSBieSBEbWl0cnkuCj4+ID4gSG93IGNhbiB3ZSBtYW5h
Z2UgaW5jcmVtZW50YWxseSBpbXBsZW1lbnRpbmcgdGhlIGNsb2NrIGNvbnRyb2xsZXJzPwo+PiA+
IEZyb20gYSBoYXJkd2FyZSBwZXJzcGVjdGl2ZSB0aGUgInN5c19wbGxfZGl2MTYiIGlucHV0IGlz
IG1hbmRhdG9yeS4KPj4gPiBIb3cgdG8gbWFuYWdlIHRoaXMgaW4gdGhlIC5kdHMgcGF0Y2hlcyB0
aGVuIChmb3IgZXhhbXBsZTogZG9lcyB0aGlzCj4+ID4gbWVhbiB0aGF0IERtaXRyeSBjYW4gb25s
eSBhZGQgdGhlIGNsb2NrIGNvbnRyb2xsZXIgdG8gdGhlIC5kdHMgd2hlbgo+PiA+IGFsbCBjbG9j
ayBjb250cm9sbGVyIGJpbmRpbmdzIGhhdmUgYmVlbiBpbXBsZW1lbnRlZCAtIG9yIGlzIHRoZXJl
Cj4+ID4gYW5vdGhlciB3YXkpPwo+Pgo+PiBZb3UncmUgYWJzb2x1dGVseSByaWdodDogY3VycmVu
dGx5LCBub3QgYWxsIGlucHV0cyBhcmUgc3VwcG9ydGVkIGJlY2F1c2UKPj4gdGhlIENQVSBjbG9j
ayBjb250cm9sbGVyIGlzbid0IHJlYWR5IHlldCDigJMgSSdtIHdvcmtpbmcgb24gaXQgYXQgdGhl
Cj4+IG1vbWVudC4KPj4KPj4gSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybnMgYWJvdXQgYmluZGlu
Z3MgYW5kIHNjaGVtYSBkZXNjcmlwdGlvbiwgYnV0Cj4+IHRoZXJlIGlzIGFuIGlzc3VlIHRvIGJl
IGNvbnNpZGVyZWQuIEknbSBkZXZlbG9waW5nIHRoZSBlbnRpcmUgY2xvY2sKPj4gY29udHJvbGxl
ciBBMSBzdWJzeXN0ZW0gaW5jcmVtZW50YWxseSBpbiB0aHJlZSBzdGFnZXM6IHBlcmlwaGVyYWxz
IGFuZAo+PiBQTEwsIENQVSwgYW5kIEF1ZGlvLiBUaGlzIGlzIGJlY2F1c2UgdGhlIENQVSBjYW4g
b3BlcmF0ZSBhdCBhIHN0YXRpYwo+PiBmcmVxdWVuY3kgYW5kIHZvbHRhZ2UsIGFuZCB0aGUgYm9h
cmQgYm9vdHMgbm9ybWFsbHkgd2l0aG91dCB0aGUgQ1BVCj4+IGNsb2NrIGNvbnRyb2xsZXIsIHRo
ZXJtYWwgc2Vuc29yLCBhbmQgT1BQIHRhYmxlLiBBdWRpbyBpcyBhbHNvCj4+IGltcG9ydGFudCwg
YnV0IGl0J3Mgb3B0aW9uYWwuIE9uIHRoZSBvdGhlciBoYW5kLCB3aXRob3V0IHNldHRpbmcgdXAg
dGhlCj4+IHBlcmlwaGVyYWxzIGFuZCBQTEwgY29udHJvbGxlcnMsIHRoZSBib2FyZCB3b24ndCBm
dW5jdGlvbiBiZWNhdXNlCj4+IHRoZXkncmUgZnVuZGFtZW50YWwuCj4gSSB1bmRlcnN0YW5kIHlv
dXIgYXBwcm9hY2ggYW5kIEkgbGlrZSBpdCAod2l0aG91dCB0aGF0IGluY3JlbWVudGFsCj4gYXBw
cm9hY2ggeW91IHdvdWxkIHByb2JhYmx5IGJlIGxvb2tpbmcgYXQgYSBzZXJpZXMgd2l0aCAxNS0y
MAo+IHBhdGNoZXMpLgo+Cj4gTWF5YmUgdGhlIGR0LWJpbmRpbmcgbWFpbnRhaW5lcnMgaGF2ZSBh
IHN1Z2dlc3Rpb24gZm9yIHVzIGhlcmU/Cj4gTGV0IG1lIHRyeSB0byBzdW1tYXJpemUgdGhlIGlz
c3VlIGluIGEgZmV3IGJ1bGxldCBwb2ludHM6Cj4gLSBUaGVyZSdzIChhdCBsZWFzdCkgZm91ciBj
bG9jayBjb250cm9sbGVycyBvbiB0aGUgQW1sb2dpYyBBMSBTb0MKPiAtIFNvbWUgb2YgdGhlc2Ug
Y2xvY2sgY29udHJvbGxlcnMgdGFrZSB0aGUgb3V0cHV0cyBvZiBhbm90aGVyIGNsb2NrCj4gY29u
dHJvbGxlciBhcyBpbnB1dHMKPiAtIEluIHRoaXMgc2VyaWVzIHBhdGNoIHRoZSBwZXJpcGhlcmFs
IGNsb2NrIGNvbnRyb2xsZXIgaGFzIGFuIGlucHV0Cj4gY2FsbGVkICJzeXNfcGxsX2RpdjE2Igo+
IC0gVGhlIGNsb2NrIGNvbnRyb2xsZXIgd2hpY2ggcHJvdmlkZXMgdGhlICJzeXNfcGxsX2RpdjE2
IiBjbG9jayBpcyBub3QKPiBpbXBsZW1lbnRlZCB5ZXQgKG15IHVuZGVyc3RhbmRpbmcgaXMgdGhh
dCBpbXBsZW1lbnRpbmcgaXQgYW5kIGFkZGluZwo+IGl0IHRvIHRoaXMgc2VyaWVzIGlzIG5vdCBl
YXN5OiBpdCB3b3VsZCBhZGQgZXZlbiBtb3JlIHBhdGNoZXMgdGhhdAo+IG5lZWQgdG8gYmUgcmV2
aWV3ZWQgYW5kIGluIGdlbmVyYWwgaXQncyBhIHRyaWNreSBjbG9jayBjb250cm9sbGVyIHRvCj4g
aW1wbGVtZW50IGFzIGl0IG1hbmFnZXMgdGhlIENQVSBjbG9ja3MpCgpJTU8sIGlmIHlvdSBqdXN0
IGFkZCBhbm90aGVyIGNvbnN0IGxhdGVyIG9uLCBpdCBpcyBmaW5lLiBJIHdvdWxkIG5vdCBtYWtl
CmFueSBleGlzdGluZyBEVCBpbnZhbGlkIGFzIGEgcmVzdWx0LiBUaGUgcHJvYmxlbSB3b3VsZCBi
ZSBpZiB5b3UgcmVtb3ZlZAphbiBlbnRyeQoKVGhhdCdzIG15IHVuZGVyc3RhbmRpbmcgYXQgbGVh
c3QKCj4KPj4gUmlnaHQgbm93LCB3ZSdyZSBpbiB0aGUgZmlyc3Qgc3RhZ2Ugb2YgdGhlIHBsYW4u
IFVuZm9ydHVuYXRlbHksIEkgY2FuJ3QKPj4gZGlzY2xvc2UgdGhlIGV4YWN0IG5hbWVzIGFuZCBu
dW1iZXIgb2YgY2xvY2sgYmluZGluZ3MgZm9yIHRoZSBDUFUgYW5kCj4+IEF1ZGlvLCBhcyB0aGV5
J3JlIHN0aWxsIGluIGRldmVsb3BtZW50IGFuZCBvbmx5IGV4aXN0IGluIG15IGhlYWQgb3IKPj4g
ZHJhZnQgdmVyc2lvbnMuCj4+Cj4+IElmIHBvc3NpYmxlLCBJJ2QgcHJlZmVyIHRvIHByb3ZpZGUg
dGhlIG5ldyBiaW5kaW5ncyBhbmQgY29ubmVjdGlvbnMgb25jZQo+PiBhbGwgdGhlIGFwcHJvcHJp
YXRlIGRyaXZlcnMgYXJlIGZpbmFsaXplZC4KPiBRdWVzdGlvbiB0byBDb25vciBhbmQgS3J6eXN6
dG9mIChhc3N1bWluZyB5b3UgcmVhZCBteSBzdW1tYXJ5IGFib3ZlKToKPiBJcyBpdCBmaW5lIHRo
YXQgRG1pdHJ5IGFkZHMgYWRkaXRpb25hbCBpbnB1dHMgdG8gdGhlIHBlcmlwaGVyYWwgY2xvY2sK
PiBjb250cm9sbGVyIGJpbmRpbmcgaW4gbGF0ZXIgcGF0Y2hlcz8KPiBJZiBub3Q6IGhvdyBjYW4g
d2UgcHJvY2VlZCBpbiBjYXNlIHdlIG5lZWQgdG8gYWRkIHRoZW0gbm93ICh0aGUKPiBkdC1iaW5k
aW5nIGV4YW1wbGUgaXMgdGhlIGVhc3kgcGFydCBmb3IgbWUgYXMgd2UgY2FuIGp1c3QgbWFrZSB1
cCBhCj4gcGhhbmRsZSBsaWtlICZzeXNfcGxsX2RpdjE2X2NsayBhbmQgdXNlIHRoYXQgLSBidXQg
dGhpcyBjYW4ndCB3b3JrCj4gd2hlbiBEbWl0cnkgdHJpZXMgdG8gYWRkIHRoZSBjbG9jayBjb250
cm9sbGVyIHRvIG1lc29uLWExLmR0c2kpCj4KPiBQUzogRG1pdHJ5IGlzIHRyeWluZyB0byBnZXQg
dGhpcyBzZXJpZXMgaW50byBMaW51eCA2LjUuIEFzIGZhciBhcyBJCj4gcmVtZW1iZXIgdGhlIGNv
bW1vbiBjbG9jayBtYWludGFpbmVycyBkb24ndCB0YWtlIHB1bGwgcmVxdWVzdHMgd2l0aAo+IG5l
dyBmZWF0dXJlcyBhZnRlciAtcmM2ICh3aGljaCBpcyBpbiBsZXNzIHRoYW4gdHdvIHdlZWtzKS4K
PiBTbyB0aW1lIGlzIGdldHRpbmcgYSBiaXQgc2hvcnQgYW5kIGZvciBtZSB0aGlzIGlzIHRoZSB2
ZXJ5IGxhc3QKPiBvdXRzdGFuZGluZyBxdWVzdGlvbi4gSWYgeW91IHNheSB0aGF0IGl0J3MgZmlu
ZSB0byBhZGQgY2xvY2tzIGxhdGVyIG9uCj4gdGhpcyB3aWxsIGltbWVkaWF0ZWx5IGdldCBteSBS
ZXZpZXdlZC1ieS4KPgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

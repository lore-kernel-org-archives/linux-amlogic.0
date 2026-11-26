Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A2606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+iqPQjm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B0pmUAPcMjN5cWyMdZFwGSBFxsifUfXJ70GWgYwqwbQ=; b=R+iqPQjmpHoJgwDji7+XuJo3wv
	0gVxy2/D1Pw663wBDrl0hM75dqwRNqPZf1kMnYABlKwQkt8IXK3szbwQoAtzkEDsmDEhw8la/9l4q
	KC9lkXdiz0RM0eVtEsq+j4Sx6Ksxa0DpdfABXOLclP8Czc3jPmUlHDNNBLKJGHYeknkN5IToJr+O7
	o/n4oOEUqpTC4lsFrLNsMGQXckjS8PLV1spUnfUh9ICKaWyHP6fdLRMyAuh6bBfbFvwmjRuTZlzsO
	fiipXuf42EnwHb1VmoWJ9ItSf4EQKf9CNctvXUJzloIULNyJGAerNwBsBWttm7TuuP1d8nJ84FU+n
	OiX3DpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ17-0000000DFzi-2NZd;
	Thu, 26 Nov 2026 12:56:01 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ14-0000000DFz7-3XDv
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 12:56:00 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9212a5a66f8so56795096d6.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 04:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697757; x=1796302557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
        b=UnorXCQu/Ldxz5JPnRGRNCl7WajcfOLTZdYN2FXCJv5rX/OOh9+LozbWfAszps+tWF
         mHiCimFcXurCaKUQwqZMKvtlbO0mjp/+vmPZgi3Qrwb6NT/pdAkY6vmaquwQcKrgsBxy
         uA8RhIgpOhFBNepKPGcIz4GZHr9rcfP38+wzJcB/P64Sm+Z2K4PIOnybJNbEp9LRFogF
         1azo8hivLc5idgEjlxQ5oO8xOnl4JeGx4VJJaTeHKvBdRFnYUZgKXR0lP6C1BF4uZJ9C
         AB5j8w8u0qxaXAOh7szPMxNCHn2BgRlg39M151s6YX3wc/XVoi7V9O4/cOSVC8hpsXVg
         Zcmg==
X-Forwarded-Encrypted: i=1; AL+hErE7KYXB5JvD5wIRQ+4nkbnAmZiIz13LSjKzuGqZzDNDCz9Mj9diPrCTGwSRJ0ETJecePByLZl/NrgXrZ+lR@lists.infradead.org
X-Gm-Message-State: APuU4Z+6YeD2wpvKDxO/2Gxp9P68sRJgmG7L1X/oKBaCl9sK5xhyIe1f
	u8cZ9Zibw8cmrUwkDht70rKDR8IU0XA+HxjhlNnP1pUESCJPLX20/Rf9G1pjtaEfV9E=
X-Gm-Gg: AZFdTZfqYl0nB5RWUO+E17SCwAi0kZkeeThhWfTVZmBInkma370B45WzvSW215lMXAg
	AGiJ+rN1qwGHp5/mQ/SRkauaO4CcGkvYb5qQXcO6ThCNeTpE6eijf4o/EWPF9HJBHiD8930aw0c
	owoQAo6ubIIw/fiuI2Wi/wbzrmCLKZlMwG3CimnjTrUt8uwriZIbxowLVE0lHoqbG64uij1Ixud
	xwf4wMRnVE4bMbL2R1oBLkccJ4jj9pMJsqjtC4NdRkObrcsr6zK1G6SuEv1Ei51vy1VpVxloIEe
	MYIEd//cvQNmLSDUyRuEykm3BLUqO7zbva2Z8AWWYuRiZioLK/snBnhG+1MdkS3oRv0x6uSi8Jq
	wI4PVFwPK5Glyjg0ht6TTnfT8xHhKQ6D31ani1/6AnweicFhKO3TaX/n0iSVHTdO9DiCR4nMxSg
	eo5yOQkk83ix2mfHhj1/fHPISvRfC0C2im7pfx2zMVHUuZtC72EhZeTKBeqQTnjtAnQKqqKVzJK
	5BvE2CkJtEeQLO2X1HOA6vywiLbBQIS9Y4+Yq2aCYBcjR0SU2qlsRch99TgiEsKT4AUWfux9ZR/
	QLZwv2ZTFSAcI+I/UttWPFrQ8K+ukFmG/956j5UhJhqp5F0612WO5m6fTK7VmMkKOkI/DauC8fG
	UH+dwNN9WeBpNk+N9tJ8RTI7EbE3fZm4yqTWL6fKxZ/tRa2Jeia6KOlDKwA==
X-Received: by 2002:a05:620a:8909:b0:949:472f:2273 with SMTP id af79cd13be357-949bab23f19mr3888367985a.58.1795697757176;
        Thu, 26 Nov 2026 04:55:57 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a09477acfsm347519285a.32.2026.11.26.04.55.57
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:55:57 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d2f5f1e26so76180971cf.3
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 04:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEZq5r4YKw78jRva9GQFTw3MQQPYuciZ/aru4BWaS9zttiVd0tZgjRFdrAYN1GY0xSoG3Bk0TCC1DwGU9K9@lists.infradead.org
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr79381047b3.42.1795697368796; Thu, 26 Nov 2026
 04:49:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-5-tanure@linux.com> <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <179561837863.3135.7453763060716815613@kernel.org>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:49:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
X-Gm-Features: Aa3M54rVCY5vVqL26ka6o_i4OGggk-NPYkWlLazpuMdrAcDWKkBH6Cp6PaCVWDk
Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_045558_894157_D9CA2225 
X-CRM114-Status: GOOD (  30.46  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMjUsIDIwMjYgYXQgMjo1M+KAr1BNIDxuZXRkZXYtYm90K3Nhc2hpa29Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbAo+IGlzc3VlKHMpIHRvIGNvbnNpZGVyLgo+
Cj4gQ3JpdGljYWw6IDAgwrcgSGlnaDogMCDCtyBNZWRpdW06IDEgwrcgTG93OiAwCj4KPiBJZiB5
b3UgYmVsaWV2ZSBub25lIG9mIHRoZSBpc3N1ZXMgYXJlIGxlZ2l0aW1hdGUsIHBsZWFzZSByZXBs
eSB0byBlYWNoCj4gaXNzdWUgb2YgTWVkaXVtIHNldmVyaXR5IG9yIGhpZ2hlciBhbmQgZXhwbGFp
biB3aHkgdGhlIEFJIGlzIHdyb25nLgo+IElmIGFueSBvZiB0aGVtIGFyZSBsZWdpdGltYXRlIGFu
ZCB5b3UgcGxhbiB0byByZXNwaW4sIHBsZWFzZSBsZXQgcGF0Y2h3b3JrCj4ga25vdyBieSBpbmNs
dWRpbmcgInB3LWJvdDogY3IiIGFzIGEgc2VwYXJhdGUgbGluZSBhdCB0aGUgZW5kIG9mIHlvdXIg
cmVwbHkKPiAob25lIHN1Y2ggcmVwbHkgcGVyIHNlcmllcyBpcyBlbm91Z2gpLgo+Cj4gLSBbTWVk
aXVtXSBUaGUgY29tbWl0IHNheXMgaXQgZW5hYmxlcyB0aGUgS2hhZGFzIFZJTTQgZXRoZXJuZXQg
cG9ydC4KPgo+IC0tCj4KPiBhcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZpbTQ6IGVu
YWJsZSB0aGUgZXRoZXJuZXQgcG9ydAo+Cj4gVGhpcyBwYXRjaCBlbmFibGVzIHRoZSBUNyBldGhl
cm5ldCBNQUMgYW5kIHRoZSBNRElPIG11bHRpcGxleGVyIG9uIHRoZQo+IEtoYWRhcyBWSU00LiBJ
dCBhbHNvIGRlc2NyaWJlcyB0aGUgUlRMODIxMUYgUkdNSUkgUEhZIGF0IGFkZHJlc3MgMSBvbiB0
aGUKPiBleHRlcm5hbCBNRElPIGJ1cywgd2l0aCBpdHMgaW50ZXJydXB0IG9uIEdQSU9IXzYuIFdp
dGggcGh5LW1vZGUgPQo+ICJyZ21paS1pZCIsIHRoZSBQSFkgYWRkcyBib3RoIFJHTUlJIGRlbGF5
cy4KPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2lj
LXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4gPiBpbmRleCAwZmE4MzM2MmI0MTc5
Li43Yjg2YWIyNTc5YWFhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+Cj4g
WyAuLi4gXQo+Cj4gPiBAQCAtMjU2LDYgKzI1NywyOCBAQCB4dGFsOiB4dGFsLWNsayB7Cj4gPiAg
ICAgICB9Owo+ID4gIH07Cj4gPgo+ID4gKyZldGhtYWMgewo+ID4gKyAgICAgc3RhdHVzID0gIm9r
YXkiOwo+ID4gKyAgICAgcGluY3RybC0wID0gPCZldGhfcGlucz4sIDwmZXRoX3JnbWlpX3BpbnM+
Owo+ID4gKyAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ICsgICAgIHBoeS1tb2Rl
ID0gInJnbWlpLWlkIjsKPiA+ICsgICAgIHBoeS1oYW5kbGUgPSA8JmV4dGVybmFsX3BoeT47Cj4g
PiArfTsKPiA+ICsKPiA+ICsmZXRoX3BoeSB7Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7Cj4g
PiArfTsKPgo+IFtTZXZlcml0eTogTWVkaXVtXQo+IENhbiBhbnkgZHJpdmVyIGF0IHRoaXMgcmV2
aXNpb24gYmluZCB0byB0aGUgZXRobWFjIG5vZGUgdGhpcyBlbmFibGVzPwoKWWVzLiBjNGM4NTFh
MzMyNWUgKCJuZXQ6IHN0bW1hYzogZHdtYWMtbWVzb244YjogYWRkIHN1cHBvcnQgZm9yIHRoZQpB
bWxvZ2ljIFQ3IiksIGluIG5ldC1uZXh0IHNpbmNlIDIwMjYtMTEtMjAsIG1hdGNoZXMgYW1sb2dp
Yyx0Ny1kd21hYywKYW5kIDE4MDI5OTMxNDc4YiBkb2N1bWVudHMgaXQ7IHRoZSBjb3ZlciBsZXR0
ZXIgbGlzdHMgYm90aC4gVGVzdGVkIG9uCnRoaXMgYm9hcmQgb24gdG9wIG9mIHRoZW06IHRoZSBQ
SFkgYXR0YWNoZXMgYXQgbWRpb19tdXgtMC4wOjAxIGFuZAppcGVyZjMgcnVucyBhdCA5NDEvOTQ0
IE1iaXQvcy4KCj4KPiBUaGUgbm9kZSBpbiBhbWxvZ2ljLXQ3LmR0c2kgaGFzOgo+Cj4gYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaToKPiAgICAgICAgICAgICAgICAg
ZXRobWFjOiBldGhlcm5ldEBmZGMwMDAwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LWR3bWFjIiwgInNucHMsZHdtYWMtNS4xMGEiOwo+Cj4gVGhl
IGFtbG9naWMsdDctZHdtYWMgc3RyaW5nIGFwcGVhcnMgb25seSBpbiBhbWxvZ2ljLXQ3LmR0c2ku
IFRoZSBBbWxvZ2ljCj4gZ2x1ZSBkcml2ZXIncyBtYXRjaCB0YWJsZSwgbWVzb244Yl9kd21hY19t
YXRjaFtdIGluIGR3bWFjLW1lc29uOGIuYywgZW5kcwo+IGF0IGcxMmE6Cj4KPiAgICAgICAgIHsK
PiAgICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLWR3bWFj
IiwKPiAgICAgICAgICAgICAgICAgLmRhdGEgPSAmbWVzb25fZzEyYV9kd21hY19kYXRhLAo+ICAg
ICAgICAgfSwKPiAgICAgICAgIHsgfQo+Cj4gZHdtYWNfZ2VuZXJpY19tYXRjaFtdIGluIGR3bWFj
LWdlbmVyaWMuYyBlbmRzIGF0IHNucHMsZHdtYWMtNC4xMGEsIHBsdXMKPiBzbnBzLGR3bWFjIGFu
ZCB0aGUgc25wcyxkd3hnbWFjIGVudHJpZXMuIFVuZGVyIGRyaXZlcnMvLCB0aGUgb25seSBwbGFj
ZQo+IHRoYXQgbmFtZXMgc25wcyxkd21hYy01LjEwYSBpcyBzdG1tYWNfZ21hYzRfY29tcGF0c1td
IGluCj4gc3RtbWFjX3BsYXRmb3JtLmMuIFRoYXQgbGlzdCBkZXRlY3RzIHRoZSBjb3JlIHZlcnNp
b24uIEl0IGlzIG5vdCBhbgo+IG9mX21hdGNoX3RhYmxlLgo+Cj4gSWYgbm90aGluZyBwcm9iZXMg
ZXRobWFjLCBpdHMgbWRpbzAgY2hpbGQgYnVzIGlzIG5ldmVyIHJlZ2lzdGVyZWQuIFRoZQo+IGV0
aF9waHkgbXV4IGVuYWJsZWQganVzdCBhYm92ZSBiaW5kcyB0aHJvdWdoIHRoZSBhbWxvZ2ljLGcx
MmEtbWRpby1tdXgKPiBmYWxsYmFjayBhbmQgaGFzIG1kaW8tcGFyZW50LWJ1cyA9IDwmbWRpbzA+
LiBTbyBtZGlvX211eF9pbml0KCkgd291bGQKPiBkZWZlciBvbiBldmVyeSBhdHRlbXB0Ogo+Cj4g
ZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC5jOm1kaW9fbXV4X2luaXQoKSB7Cj4gICAgIC4uLgo+
ICAgICAgICAgICAgICAgICBwYXJlbnRfYnVzID0gb2ZfbWRpb19maW5kX2J1cyhwYXJlbnRfYnVz
X25vZGUpOwo+ICAgICAgICAgICAgICAgICBpZiAoIXBhcmVudF9idXMpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXRfdmFsID0gLUVQUk9CRV9ERUZFUjsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIGVycl9wYXJlbnRfYnVzOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgIC4u
Lgo+IH0KPgo+IFdvdWxkbid0IHRoYXQgbGVhdmUgZXh0X21kaW8gYW5kIGV4dGVybmFsX3BoeSB1
bnJlZ2lzdGVyZWQsIHNvIHRoYXQKPiBwaHktaGFuZGxlIG5ldmVyIHJlc29sdmVzPwo+Cj4gQWxz
bywgbm90aGluZyB3b3VsZCBwcm9ncmFtIHRoZSBQUkdfRVRIIGdsdWUgd2luZG93LCB3aGljaCBp
cyB0aGUgc2Vjb25kCj4gcmVnIHJlZ2lvbiBhdCAweGZlMDI0MDAwLiBUaGF0IHdpbmRvdyBob2xk
cyB0aGUgUkdNSUkgbW9kZSBzZWxlY3QsIHRoZQo+IGNsa2luMC9jbGtpbjEgVFggY2xvY2sgbXV4
IGFuZCB0aGUgTUFDLXNpZGUgZGVsYXlzLgo+Cj4gTm90aGluZyB3b3VsZCBjbGFpbSB0aGUgcGlw
ZWxpbmUgY2xvY2sgKENMS0lEX1NZU19BTVBJUEVfRVRIKSBlaXRoZXIuIFRoZQo+IHByZXZpb3Vz
IHBhdGNoIGluIHRoZSBzZXJpZXMsICJhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogYWRkIHRoZSBl
dGhlcm5ldAo+IGNvbnRyb2xsZXIiLCBzYXlzIHRoaXMgZ2F0ZSBpcyBvdGhlcndpc2UgdHVybmVk
IG9mZiBhcyB1bnVzZWQuIEl0IGFsc28KPiBzYXlzIHRoZSBwb3J0IGtlZXBzIHRoZSBib290bG9h
ZGVyJ3MgZGVsYXlzIHVubGVzcyB0aGUgY29udHJvbGxlcgo+IHByb2dyYW1zIHRoZW0uCj4KPiBh
bWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgZG9lcyBub3QgZG9jdW1lbnQgYW1sb2dpYyx0Ny1kd21h
Yywgc28KPiBkdGJzX2NoZWNrIHdvdWxkIHJlcG9ydCB0aGUgbm93LWVuYWJsZWQgbm9kZSBhcyB1
bmRvY3VtZW50ZWQuCj4KPiBEb2VzIHRoaXMgcGF0Y2ggZGVwZW5kIG9uIGEgc2VwYXJhdGUgZ2x1
ZSBkcml2ZXIgYW5kIGJpbmRpbmcgc2VyaWVzPyBJZgo+IHNvLCBjb3VsZCB0aGUgY29tbWl0IG1l
c3NhZ2UgbmFtZSB0aGF0IHByZXJlcXVpc2l0ZSwgb3IgY291bGQgdGhpcyBwYXRjaAo+IGJlIHNl
bnQgdG9nZXRoZXIgd2l0aCBpdD8KPgo+IFsgLi4uIF0KPgo+IC0tCj4gU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9uZXRkZXYtYWkuYm90cy5saW51eC5kZXYvc2FzaGlrby8jL3BhdGNoc2V0
LzIwMjYxMTIxMjEzMTAyLjE0MzEzMC0xLXRhbnVyZSU0MGxpbnV4LmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

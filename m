Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1221C04A94
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CT5xUlYj5BoDECwk/86x9lR5w8Jybs+mBxsOTgrLigM=; b=TyiWTnBdOEcgVv
	gCUFtDKolr4MBts8D6bqACjo4jcC+H0NVk8KUvmtYf2eVuVjBLlXHjrWvUBLt9uuk4ImCiW/hSR/i
	kNBx4Iu2li6EZFa9kmN2nrrlycd789s726xLskfiQhtgBe4n5f9IhumhZ3HfU5GPBwzbnLoTQ/Svv
	OA3PsTyz+0lu9bcT3f/S7vB/TIK73Of8xuJaenDYNs1fo+hEZMEkqsHzqnapCiUlbbCpoKszWEQ5d
	EsCwG8PC6rCiF3pSbY7dfqAABVf4JgjMARK485bSMnM+mCBlJ/1ca0TgpTCQpE3XREvqib8HPO1Bx
	NnvRTtmM+JRTURGnuDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHtz-001zJ9-0Y;
	Tue, 08 Aug 2023 08:17:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHtw-001zHm-1i;
	Tue, 08 Aug 2023 08:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE1A462239;
	Tue,  8 Aug 2023 08:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2BCC433CB;
	Tue,  8 Aug 2023 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691482631;
	bh=K20OPC5mIbzsPiYWUHqX9jSEjf0CZwpl3w8OqWWhKfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzyFfvsqOn2SmKgAq45rOvihS03doRh6QVDx0L+nurJuDyOhD0o9FSNMIPMledtLZ
	 4yVhXcVtf+iv4AKdL45Nuk1EOLhr47xyrvoxYA4/EurbRJWZCJAme15gWcwnynYLIq
	 X0wCYloPOy0wX9q0pAOQPvWCvzQXrZTizIRlG9mY=
Date: Tue, 8 Aug 2023 10:17:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luke Lu <luke.lu@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
Message-ID: <2023080852-estranged-limpness-aafb@gregkh>
References: <20230808032510.31754-1-luke.lu@libre.computer>
 <2023080851-duh-scroll-09bf@gregkh>
 <CAAzmgs5U=BNzNNeskUMe_YEken1-CmzssRFPDCmsmar9SQo+WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAzmgs5U=BNzNNeskUMe_YEken1-CmzssRFPDCmsmar9SQo+WQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_011712_617482_FF5EB05C 
X-CRM114-Status: GOOD (  22.99  )
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

T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDY6MDk6NDVBTSArMDAwMCwgTHVrZSBMdSB3cm90ZToK
PiBISSBHcmVnOgo+IAo+IE9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgNDo1NuKAr0FNIEdyZWcgS3Jv
YWgtSGFydG1hbgo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDM6MjU6MTBBTSArMDAwMCwgTHVrZSBMdSB3cm90ZToK
PiA+ID4gRGV2aWNlIGNvbm5lY3RlZCB0byB1c2Igb3RnIHBvcnQgb2YgR1hMLWJhc2VkIGJvYXJk
cyBjYW4gbm90IGJlCj4gPiA+IHJlY29nbmlzZWQgYWZ0ZXIgcmVzdW1wdGlvbiwgZG9lc24ndCBy
ZWNvdmVyIGV2ZW4gaWYgZGlzY29ubmVjdCBhbmQKPiA+ID4gcmVjb25uZWN0IHRoZSBkZXZpY2Uu
IGRtZXNnIHNob3dzIGl0IGRpc2Nvbm5lY3RzIGR1cmluZyByZXN1bXB0aW9uLgo+ID4gPgo+ID4g
PiBbICAgNDEuNDkyOTExXSB1c2IgMS0yOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAz
Cj4gPiA+IFsgICA0MS40OTkzNDZdIHVzYiAxLTI6IHVucmVnaXN0ZXJpbmcgZGV2aWNlCj4gPiA+
IFsgICA0MS41MTE5MzldIHVzYiAxLTI6IHVucmVnaXN0ZXJpbmcgaW50ZXJmYWNlIDEtMjoxLjAK
PiA+ID4KPiA+ID4gQ2FsbGluZyB1c2JfcG9zdF9pbml0KCkgd2lsbCBmaXggdGhpcyBpc3N1ZSwg
YW5kIGl0J3MgdGVzdGVkIGFuZAo+ID4gPiB2ZXJpZmllZCBvbiBsaWJyZXRlY2gncyBhbWwtczkw
NXgtY2MgYm9hcmQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1a2UgTHUgPGx1a2UubHVA
bGlicmUuY29tcHV0ZXI+Cj4gPgo+ID4gV2hhdCBjb21taXQgaWQgZG9lcyB0aGlzIGZpeD8KPiBV
c2luZyAiZ2l0IGJsYW1lIiB0byBleHBsb3JlIHRoZSBoaXN0b3J5LCBmb3VuZCBkd2MzX21lc29u
X2cxMmFfcmVzdW1lKCkgd2FzCj4gaW50cm9kdWNlZCBhbG9uZyB3aXRoIHRoZSBmaWxlIG9mIGRy
aXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMuCj4gYXMgRGEgWHVlIHBvaW50ZWQgb3V0
LCB0aGUgc3VzcGVuZC9yZXN1bWUgd2FzIG5ldmVyIHRlc3RlZCBpbiBHWEwgYmFzZWQgU29DLAo+
IHNvIGl0J3MgYnJva2VuIHNpbmNlIHRoZSBiZWdpbm5pbmcuLgo+IAo+IEZvciB0aGUgRml4ZXMg
dGFnLCBJIHRoaW5rIGl0J3MgcHJvcGVyIHRvIHVzZSAiNWIwYmEwY2FhZjNhOiAodXNiOgo+IGR3
YzM6IG1lc29uLWcxMmE6IHJlZmFjdG9yIHVzYiBpbml0KSIKPiBzaW5jZSB0aGUgdXNiX3Bvc3Rf
aW5pdCgpIGZ1bmN0aW9uIHdhcyBpbnRyb2R1Y2VkIGluIHRoaXMgY29tbWl0IGFuZAo+IHRoaXMg
cGF0Y2ggd2lsbCBkZXBlbmQgb24gaXQuCj4gCj4gPiBTaG91bGQgaXQgYWxzbyBnbyB0byBzdGFi
bGUga2VybmVscz8KPiA+Cj4gWWVzLCBJdCB3b3VsZCBiZSBncmVhdCBpZiB0aGUgcGF0Y2ggY2Fu
IGdvIHRvIHN0YWJsZSB0cmVlLCB0aGFua3MgZm9yCj4gc3VnZ2VzdGluZyB0aGlzCj4gSSBoYXZl
IGl0IHRlc3RlZCBvbiA2LjEtbHRzIHRyZWUuCj4gCj4gQnR3LCBJIHdvdWxkIHdhaXQgZm9yIGEg
ZmV3IGRheXMgZm9yIG1vcmUgY29tbWVudHMgYW5kIENDIHRvIHN0YWJsZSBpbgo+IG5leHQgdjIg
aWYgbm8gb2JqZWN0aW9uLgoKTm8gd29ycmllcywgSSdsbCBkcm9wIHRoaXMgZnJvbSBteSByZXZp
ZXcgcXVldWUgYW5kIHdhaXQgZm9yIGEgdjIuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

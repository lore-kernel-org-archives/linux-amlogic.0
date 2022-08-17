Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5347AC25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xGZlfToShGfUwfalR+X03j7rVA885iUnwVGtnBClgk=; b=eFTDPms/oA/prc
	QdBe5hi/+6fAwuiQw4JVHe8wMMVng1RpPYK0kcS9ZQSEttypq5Ul9GvD+lnHtX/3MiDCZelYqo1V3
	i7Mj/FAPZkd27/q7AscMgIYxUitJxsM+45oXaXIe8AzXox1Xt8YrxaSywpYEPdQsoBwQS5lJPXFi2
	qxe3yaNPqkfBlb7hIYQeaXulkrzvzWAR1kjqfX8bNIPs/GRKrHo46uQJEtb7v4j1cWvzE5yArTWAM
	fO7SPDipfMy/UfjASGowKGOUnaSeF90DA6By2L08pP/TWQyTRQM/8Gk93slQo68qHUOGSI7+gTqJw
	cImFPvcKNORdvjFSjQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIqS-002G6W-AP; Wed, 17 Aug 2022 13:12:28 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIqG-002FyP-Bq; Wed, 17 Aug 2022 13:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pDCos68B5fYwu0J1jHvoBMN3b2H9PzkwSjTTD6oc4Dw=; b=oVNxVfBIagqBVB/GeyTV+RhXYd
	S8ASJh3xQZDwqE6gAnoLqjXC9bWw93kEfTEAefgEu81WQzDL2nznsNJ4qNahSV8kmR2RxpfQc+07l
	1yRaxTwA5ko/aV0cNqLd/cz9NIrf9PAq0q7s7/1k3Yy+qS4zzo+9/rstZMPWMeehQ1U8tWBo/AqIS
	DcjahO0y3Yl75jQVKAn1QEtCUqEn4zW9UDhNrfck3LAXPee8SdrmCoWlAJdM9mbdH2MZpUMyYz7/V
	y1qCPpU0USakhogU+uY999Au6Tz/Y5yIF3GollJ6UicsaWsXbW1b+uwOptqGmYZmVDQ8up7XUhys6
	wwHeH59A==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62332)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oOIq4-0007wI-6A; Wed, 17 Aug 2022 15:12:04 +0200
Message-ID: <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
Date: Wed, 17 Aug 2022 15:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220817114605.jpb3tlnoseyvf65d@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_061216_628089_F392DFC6 
X-CRM114-Status: GOOD (  39.87  )
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

CgpEZW4gMTcuMDguMjAyMiAxMy40Niwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBPbiBUdWUsIEF1
ZyAxNiwgMjAyMiBhdCAwOTozNToyNFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IERlbiAxNi4wOC4yMDIyIDExLjQ5LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4gT24gVHVlLCBB
dWcgMTYsIDIwMjIgYXQgMTE6NDI6MjBBTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+
Pj4+IERlbiAxNi4wOC4yMDIyIDEwLjI2LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4+PiBIaSwK
Pj4+Pj4KPj4+Pj4gT24gTW9uLCBBdWcgMDgsIDIwMjIgYXQgMDI6NDQ6NTZQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+Pj4+Pj4gRGVuIDI5LjA3LjIwMjIgMTguMzQsIHNrcmV2IE1h
eGltZSBSaXBhcmQ6Cj4+Pj4+Pj4gVGhlIFRWIG1vZGUgcHJvcGVydHkgaGFzIGJlZW4gYXJvdW5k
IGZvciBhIHdoaWxlIG5vdyB0byBzZWxlY3QgYW5kIGdldCB0aGUKPj4+Pj4+PiBjdXJyZW50IFRW
IG1vZGUgb3V0cHV0IG9uIGFuIGFuYWxvZyBUViBjb25uZWN0b3IuCj4+Pj4+Pj4KPj4+Pj4+PiBE
ZXNwaXRlIHRoYXQgcHJvcGVydHkgbmFtZSBiZWluZyBnZW5lcmljLCBpdHMgY29udGVudCBpc24n
dCBhbmQgaGFzIGJlZW4KPj4+Pj4+PiBkcml2ZXItc3BlY2lmaWMgd2hpY2ggbWFrZXMgaXQgaGFy
ZCB0byBidWlsZCBhbnkgZ2VuZXJpYyBiZWhhdmlvdXIgb24gdG9wCj4+Pj4+Pj4gb2YgaXQsIGJv
dGggaW4ga2VybmVsIGFuZCB1c2VyLXNwYWNlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gTGV0J3MgY3JlYXRl
IGEgbmV3IGJpdG1hc2sgdHYgbm9ybSBwcm9wZXJ0eSwgdGhhdCBjYW4gY29udGFpbiBhbnkgb2Yg
dGhlCj4+Pj4+Pj4gYW5hbG9nIFRWIHN0YW5kYXJkcyBjdXJyZW50bHkgc3VwcG9ydGVkIGJ5IGtl
cm5lbCBkcml2ZXJzLiBFYWNoIGRyaXZlciBjYW4KPj4+Pj4+PiB0aGVuIHBhc3MgaW4gYSBiaXRt
YXNrIG9mIHRoZSBtb2RlcyBpdCBzdXBwb3J0cy4KPj4+Pj4+Pgo+Pj4+Pj4+IFdlJ2xsIHRoZW4g
YmUgYWJsZSB0byBwaGFzZSBvdXQgdGhlIG9sZGVyIHR2IG1vZGUgcHJvcGVydHkuCj4+Pj4+Pj4K
Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4K
Pj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFBsZWFzZSBhbHNvIHVwZGF0ZSBEb2N1bWVudGF0aW9uL2dw
dS9rbXMtcHJvcGVydGllcy5jc3YKPj4+Pj4+Cj4+Pj4+PiBSZXF1aXJlbWVudHMgZm9yIGFkZGlu
ZyBhIG5ldyBwcm9wZXJ0eSBpcyBmb3VuZCBpbgo+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9ncHUvZHJt
LWttcy5yc3QKPj4+Pj4KPj4+Pj4gSSBrbmV3IHRoaXMgd2FzIGdvaW5nIHRvIGJlIHJhaXNlZCBh
dCBzb21lIHBvaW50LCBzbyBJJ20gZ2xhZCBpdCdzIHRoYXQKPj4+Pj4gZWFybHkgOikKPj4+Pj4K
Pj4+Pj4gSSByZWFsbHkgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIHRoZXJlLiBJZiB3ZSBzdGljayBi
eSBvdXIgdXN1YWwgcnVsZXMsCj4+Pj4+IHRoZW4gd2UgY2FuJ3QgaGF2ZSBhbnkgb2YgdGhhdCB3
b3JrIG1lcmdlZC4KPj4+Pj4KPj4+Pj4gSG93ZXZlciwgSSB0aGluayB0aGUgc3RhdHVzIHF1byBp
cyBub3QgcmVhbGx5IHNhdGlzZmFjdG9yeSBlaXRoZXIuCj4+Pj4+IEluZGVlZCwgd2UgaGF2ZSBh
IHByb3BlcnR5LCB0aGF0IGRvZXNuJ3QgZm9sbG93IHRob3NlIHJlcXVpcmVtZW50cwo+Pj4+PiBl
aXRoZXIsIHdpdGggYSBkcml2ZXItc3BlY2lmaWMgY29udGVudCwgYW5kIHRoYXQgc3RhbmRzIGlu
IHRoZSB3YXkgb2YKPj4+Pj4gZml4ZXMgYW5kIGZ1cnRoZXIgaW1wcm92ZW1lbnRzIGF0IGJvdGgg
dGhlIGNvcmUgZnJhbWV3b3JrIGFuZCBkcml2ZXIKPj4+Pj4gbGV2ZWxzLgo+Pj4+Pgo+Pj4+PiBT
byBoYXZpbmcgdGhhdCBuZXcgcHJvcGVydHkgc3RpbGwgc2VlbXMgbGlrZSBhIG5ldCBpbXByb3Zl
bWVudCBhdCB0aGUKPj4+Pj4gZHJpdmVyLCBmcmFtZXdvcmsgYW5kIHVBUEkgbGV2ZWxzLCBldmVu
IGlmIGl0J3Mgbm90IGVudGlyZWx5IGZvbGxvd2luZwo+Pj4+PiB0aGUgcmVxdWlyZW1lbnRzIHdl
IGhhdmUgaW4gcGxhY2UuCj4+Pj4+Cj4+Pj4+IEV2ZW4gbW9yZSBzbyBzaW5jZSwgcmVhbGlzdGlj
YWxseSwgdGhvc2Uga2luZCBvZiBpbnRlcmZhY2VzIHdpbGwgbmV2ZXIKPj4+Pj4gZ2V0IGFueSBu
ZXcgZGV2ZWxvcG1lbnQgb24gdGhlIHVzZXItc3BhY2Ugc2lkZSBvZiB0aGluZ3MsIGl0J3MKPj4+
Pj4gY29uc2lkZXJlZCBieSBldmVyeW9uZSBhcyBsZWdhY3kuCj4+Pj4+Cj4+Pj4+IFRoaXMgYWxz
byBpcyBzb21ldGhpbmcgd2UgbmVlZCB0byBzdXBwb3J0IGF0IHNvbWUgcG9pbnQgaWYgd2Ugd2Fu
dCB0bwo+Pj4+PiBjb21wbGV0ZWx5IGRlcHJlY2F0ZSB0aGUgZmJkZXYgZHJpdmVycyBhbmQgcHJv
dmlkZSBkZWNlbnQgYWx0ZXJuYXRpdmVzCj4+Pj4+IGluIEtNUy4KPj4+Pj4KPj4+Pj4gU28geWVh
aCwgc3RyaWN0bHkgc3BlYWtpbmcsIHdlIHdvdWxkIG5vdCBxdWFsaWZ5IGZvciBvdXIgcmVxdWly
ZW1lbnRzCj4+Pj4+IHRoZXJlLiBJIHN0aWxsIHRoaW5rIHdlIGhhdmUgYSBzdHJvbmcgY2FzZSBm
b3IgYW4gZXhjZXB0aW9uIHRob3VnaC4KPj4+Pgo+Pj4+IFdoaWNoIHJlcXVpcmVtZW50cyB3b3Vs
ZCB0aGF0IGJlPyBUaGUgb25seSBvbmUgSSBjYW4gc2VlIGlzIHRoZQo+Pj4+IGRvY3VtZW50YXRp
b24gYW5kIG1heWJlIGFuIElHVCB0ZXN0Lgo+Pj4KPj4+IFRoaXMgaXMgdGhlIG9uZSBJIGhhZCBp
biBtaW5kCj4+PiBodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvZG9jcy9kcm0vZ3B1L2RybS11
YXBpLmh0bWwjb3Blbi1zb3VyY2UtdXNlcnNwYWNlLXJlcXVpcmVtZW50cwo+Pj4KPj4KPj4gT2gg
cmlnaHQsIEkgaGFkIGZvcmdvdHRlbiBhYm91dCB0aGF0IG9uZS4KPj4KPj4gT25lIGJlbmVmaXQg
b2YgaGF2aW5nIGEgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uIGlzIHRoYXQgaXQgaW5jcmVhc2Vz
Cj4+IHRoZSBjaGFuY2Ugb2Ygd2lkZXNwcmVhZCBhZG9wdGlvbiBoYXZpbmcgYSB3b3JraW5nIGlt
cGxlbWVudGF0aW9uIHRvCj4+IGxvb2sgYXQuIEkgZG9uJ3QgdGhpbmsgdGhlIHJlYXNvbiB0di5t
b2RlIGlzIG5vdCB1c2VkIGFueXdoZXJlICh0aGF0IEkKPj4ga25vdyBvZikgaXMgYmVjYXVzZSB0
aGUgZHJpdmVyIHBpY2tzIHRoZSBlbnVtIHZhbHVlcyByZXN1bHRpbmcgaW4gbm8KPj4gc3RhbmRh
cmQgbmFtZXMuCj4gCj4gSXQgcHJvYmFibHkgZG9lc24ndCBoZWxwLCBidXQgaXQncyBub3Qgd2hh
dCBJIHdhcyBpbXBseWluZy4KPiAKPj4gSXQncyBhIG5pY2hlIHRoaW5nIGFuZCB3YXkgZG93biBv
biB0aGUgdG9kbyBsaXN0LiBub3V2ZWF1IGFuZCBjaDcwMDYKPj4gaGFzIGEgdHZfbm9ybSBtb2R1
bGUgcGFyYW1ldGVyIHdoaWNoIGNlcnRhaW5seSBkb2Vzbid0IGhlbHAgaW4gbW92aW5nCj4+IHBl
b3BsZS9wcm9qZWN0cyBvdmVyIHRvIHRoZSBEUk0gcHJvcGVydHkgKGRvd25zdHJlYW0gcnBpIGFs
c28gaGFzIGl0Cj4+IG5vdykuCj4gCj4gWWVhaCwgdGhlIFJQaSB2ZXJzaW9uIGlzIHBhcnQgb2Yg
dGhlIHJlYXNvbiBJIHN0YXJ0ZWQgd29ya2luZyBvbiB0aGlzLgo+IFdlIHNob3VsZCBhbHNvIGNv
bnNpZGVyIHRoZSBuYW1lZCBtb2RlcyB1c2VkIGJ5IHZjNCBhbmQgc3VuNGkuIEFsbCB0aGVzZQo+
IGFkLWhvYyBzb2x1dGlvbnMgYXJlIGxpbWl0ZWQgYW5kIChJIHRoaW5rKSBjb21lIGZyb20gdGhl
IGZhY3QgdGhhdCB3ZQo+IGRvbid0IGhhdmUgYSBzb2x1dGlvbiBlYXN5IGVub3VnaCB0byB1c2Ug
Zm9yIGRyaXZlcnMgKGFuZCB0byBkaXNjb3ZlcikuCj4gCj4gbm91dmVhdSwgY2g3MDA2LCBpOTE1
IGFuZCB2YzQgYXJlIHVzaW5nIHRoZSB0di5tb2RlIHByb3BlcnR5IGZvcgo+IGV4YW1wbGUsIGJ1
dCBzdW40aSBhbmQgbWVzb24gZG9uJ3QuCj4gCj4gc3VuNGkgcmVsaWVzIG9uIG5hbWVkIG1vZGVz
IHRvIHJlaW1wbGVtZW50IFRWIG1vZGVzLCBidXQgbWVzb24gZG9lc24ndAo+IGF0IGFsbC4KPiAK
PiBBbmQgdGhlbiBub3V2ZWF1IGhhcyB0aGF0IGV4dHJhIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIg
dG8gc2V0IGl0IHVwIGF0Cj4gYm9vdCB0aW1lLgo+IAo+IEl0IGRvZXNuJ3QgcmVhbGx5IG1ha2Ug
bXVjaCBzZW5zZSB0byBtZSwgd2hlbiBhbGwgZHJpdmVycyBoYXZlIHZlcnkKPiBzaW1pbGFyIG5l
ZWRzLCB0aGF0IG5vbmUgb2YgdGhlbSBiZWhhdmUgaW4gdGhlIHNhbWUgd2F5LiBBbmQgSSB0aGlu
ayB0aGUKPiBub24tc3RhbmRhcmQgcHJvcGVydHkgaXMgcGFydGx5IHRvIGJsYW1lIGZvciB0aGlz
LCBzaW5jZSB3aXRob3V0IHNvbWUKPiBnZW5lcmljIGNvbnRlbnQgd2UgY2FuJ3Qgc2hhcmUgY29k
ZS4KPiAKPiBUaGlzIGlzIHdoYXQgdGhpcyBzZXJpZXMgaXMgYWJvdXQ6IGV2ZXJ5IGRyaXZlciBo
YXZpbmcgc2ltaWxhcgo+IGNhcGFiaWxpdGllcyBhbmQgYXMgdHJpdmlhbGx5IGFzIHBvc3NpYmxl
Lgo+IAo+PiBtcHZbMV0gaXMgYSBjb21tYW5kbGluZSBtZWRpYSBwbGF5ZXIgdGhhdCBhZnRlciBh
IHF1aWNrIGxvb2sgbWlnaHQgYmUgYQo+PiBjYW5kaWRhdGUgZm9yIGltcGxlbWVudGluZyB0aGUg
cHJvcGVydHkgd2l0aG91dCB0b28gbXVjaCBlZmZvcnQuCj4gCj4gS29kaSBtaWdodCBiZSBhbm90
aGVyIG9uZS4gSSBjYW4gdHJ5IHRvIGhhY2sgc29tZXRoaW5nIGFyb3VuZCwgYnV0IEknbQo+IHJl
YWxseSBza2VwdGljYWwgYWJvdXQgd2hldGhlciBhIFBSIHdvdWxkIGJlIG1lcmdlZCBvciBub3Qu
Cj4gCgpZb3UgY2FuIGFzayBmaXJzdCBiZWZvcmUgd2FzdGluZyB0aW1lIG9mYy4KCkJ1dCB0aGlz
IGJhZmZsZXMgbWUsIGlmIHlvdSBkb24ndCB0aGluayBwcm9qZWN0cyBsaWtlIEtvZGkgd2hpY2gg
aXMgVFYKY2VudGVyZWQgd2FudCB0aGlzLCB3aGF0IGtpbmQgb2YgcHJvamVjdHMgZG8geW91IHRo
aW5rIHdhbnQgdG8gdXNlIHRoaXMKcHJvcGVydHk/Cgo+PiBIb3cgZG8geW91IHRlc3QgdGhlIHBy
b3BlcnR5PyBJJ3ZlIHVzZWQgbW9kZXRlc3QgYnV0IEkgY2FuIG9ubHkgY2hhbmdlCj4+IHRvIGEg
dHYubW9kZSB0aGF0IG1hdGNoZXMgdGhlIGN1cnJlbnQgZGlzcGxheSBtb2RlLiBJIGNhbid0IHN3
aXRjaCBmcm9tCj4+IG50c2MgdG8gcGFsIGZvciBpbnN0YW5jZS4KPiAKPiBZZXAsIGlmIHlvdSB3
YW50IHRvIGNoYW5nZSBmcm9tIFBBTCB0byBOVFNDLCBpdCB3aWxsIHJlcXVpcmUgYSBuZXcgbW9k
ZS4KPiAKClNvIHVzZXJzcGFjZSBoYXMgdG8gY2hlY2sgdHYubW9kZSBmaXJzdCBhbmQgdGhlbiBj
cmVhdGUgYSBkaXNwbGF5IG1vZGUKdGhlIGRyaXZlciB3aWxsIGFjY2VwdCBpZiBzd2l0Y2hpbmcg
dG8gYSBkaWZmZXJlbnQgZGlzcGxheSBtb2RlIGlzCm5lY2Vzc2FyeT8gSW4gb3RoZXIgd29yZHMs
IHVzZXJzcGFjZSBjYW4ndCBkaXNjb3ZlciBmcm9tIHRoZSBrZXJuZWwKd2hpY2ggZGlzcGxheSBt
b2RlcyBhIGNlcnRhaW4gdHYubW9kZS9ub3JtIHByb3ZpZGVzIGJlZm9yZSBpdCBpcwpzZWxlY3Rl
ZD8gSWYgc28sIG1heWJlIGxpYmRybSBzaG91bGQgaGF2ZSBzb21lIGZ1bmN0aW9uKHMpIHRvIGRl
YWwgd2l0aApzd2l0Y2hpbmcgYmV0d2VlbiBtb2RlcyB0aGF0IHJlcXVpcmUgYSBkaWZmZXJlbnQg
ZGlzcGxheSBtb2RlIHNpbmNlCmtub3dsZWRnZSBhYm91dCB3aGljaCBkaXNwbGF5IG1vZGVzIGEg
dHYubW9kZSBzdXBwb3J0cyBpcyBuZWVkZWQgYmVmb3JlCmhhbmQuCgpOb3JhbGYuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

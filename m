Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19AE9D3FB
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Feb 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2HbONyl2xT18IU4ART7Ad+zeH41GHkzjLWN4EDdP3w=; b=Y8JVckGf+L/+gD
	DF5YvTYFJYSH5HW+yXmpLGe4g6NCr5eytBz4MORWIsGtAOB/HZpTfPrvp6L8WO/ueZXzQLalsCYqh
	ezYrd3haYjjD8ulKRhZ3QeSTXcst5XfWU8fxet9/fr14GTaSa9URPuKbUpzQuvkE6BlL+KqwLA8Du
	24l1B92cnkIm3HtD6unzf5Zwr4HDHUSKlYkqZFFURLZOOE+BlBSKWtKVa0t1J8pTMjdhzd0kLzkWF
	Xs0d3H63X2ofWIzpvnGrela1D8PWHiSL8IKrIaIeehw9biXYNLMEHXa5v44tT2JFaB0UQUydS0YJg
	IT1KApsElMSDV/vc8z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfZ5-00000008kGc-1Rfj;
	Wed, 04 Feb 2026 16:17:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfZ4-00000008kGH-0XGL;
	Wed, 04 Feb 2026 16:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=szPG/5QCazSZlScnVSfuJAyvGtymAIDrmzENZQeyRI0=; b=jEMTP0jf3u9oRIDZbfa43RFU9p
	WSQTvNiQ32NWziExHGuLZIadzox6owAWHObo4ka4AKMlyVlcGyqXaD1/OZmJ6/os+P+/ObsjR+E8Y
	pcvxiGoxtKBra1+R8nNaS17l+bnrO9uZoQq73AlFp7eV4SGhRp/7JpuTS2B6XHsd5Yia0PtMoQh4V
	t3h/rnSEfZg4Vfky/TpAmd31Up0g9a8gFFwLED+qigqsFPbhusIx9MvE0VOsj6V5J9NndUlJaEX+R
	s6rIrh0OWoZs5gtwNUqc1pyiTw9iHJazvIFaWjFBonktxJCbhDcz2EILTPKhIoSGFJIwauI7Ubzzi
	mrASKGzg==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfZ0-00000000qx3-06QP;
	Wed, 04 Feb 2026 16:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770221830; x=1801757830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IcghZ54w5jFehAy4KhdaevfCZ6WEwvI3d61AEC2l8NY=;
  b=j5FtVdMGwpmQBjkk9COTP4OM8r+nnurAuN8UUruD1pqm7Uj+AK63hMsI
   FSozel+xw58zzg8iVe5a2JSiQDhM7gfcTRqBywyHFcXQ26YWaOTU/7eAW
   Ec4AVdXaAhHayrYp267+PRZOpaRlqjXJKDeAW2Dz3di/SbK4SreD4fI3n
   uTY6if6jRcgC8HkKJBvhPn8lFfQuvBFVisS10YUTNXk5PwoBCsXS0TDBG
   ykTrf84e8g4aE4oACC7oTeDWXibaZ/S1GFndeEugP197hZKGn4czcOPIU
   o2rPvrZc7NdzhWE9Bvu0pS4yhJ6GTDsWVEVRx+jbFg06NG3TPJ1GpYdrV
   g==;
X-CSE-ConnectionGUID: VqN4ALzpRyi9xihXpzsdDw==
X-CSE-MsgGUID: iLN6Khm5SkCDMVb/62rtxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74016666"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="74016666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 08:17:04 -0800
X-CSE-ConnectionGUID: h0qBT9R/Sm65Ew0DhBZEFA==
X-CSE-MsgGUID: TfCa+Iy7QemO+kJ8lNsh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210227633"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 08:17:01 -0800
Date: Wed, 4 Feb 2026 18:16:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
 <20260204-credit-precinct-5424c122a79f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204-credit-precinct-5424c122a79f@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_161710_547939_3CFC06FB 
X-CRM114-Status: GOOD (  24.17  )
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

T24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDM6NTA6MDJQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDA0OjI2OjI5UE0gKzAyMDAsIEFuZHkgU2hl
dmNoZW5rbyB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDA0OjIyOjQ3UE0gKzAy
MDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gT24gV2VkLCBGZWIgMDQsIDIwMjYgYXQg
MDI6MTU6MTBQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgRmVi
IDA0LCAyMDI2IGF0IDA5OjA1OjM0QU0gKzAxMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+
ID4gPiA+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDEyOjM0OjM2QU0gKzAxMDAsIExpbnVzIFdh
bGxlaWogd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgRmViIDMsIDIwMjYgYXQgNToxN+KAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6CgouLi4KCj4gPiA+ID4gPiBO
b3RlLCBwbGVhc2UsIHJlbW92ZSBleHRyYSAnLicgKGRvdCkgaW4gdGhlIFN1YmplY3Qubwo+ID4g
PiA+IAo+ID4gPiA+IGZ3aXcsIHRoZSAuLiB3YXMgaW50ZW50aW9uYWwgY29zIEkgd2FzIHRydW5j
YXRpbmcgdGhlIHBpbmNvbmZfZ2VuZXJpYwo+ID4gPiA+IGZyb20gdGhlIGZ1bmN0aW9uIHNpbmNl
IHRoZSBzdWJqZWN0IHdhcyByZWFsbHkgbG9uZywgbm90IHJlZmVycmluZyB0bwo+ID4gPiA+IGEg
bWVtYmVyIG9mIGFuIG9wcyBzdHJ1Y3QuCj4gPiA+IAo+ID4gPiBZZXMsIGFuZCB0aGF0J3MgaG93
IHdlIHJlZmVyIHRvIHRoZSBjYWxsYmFja3Mg4oCUIHdpdGggYSBzaW5nbGUgZG90IGFuZCBwYXJl
bnRoZXNlczoKPiA+ID4gCj4gPiA+IAkubXlfY29vbF9jYigpCj4gPiA+IAo+ID4gPiBBbHRlcm5h
dGl2ZWx5Cj4gPiA+IAo+ID4gPiAJLT5teV9jb29sX2NiKCkKPiA+ID4gCj4gPiA+IGJ1dCBpdCBv
bmUgY2hhcmFjdGVyIGxvbmdlciBhbmQgVEJIIGl0IHNsaWdodGx5IGxlc3MgcmVhZGFibGUgKEkg
cGVyc29uYWxseQo+ID4gPiB1c2VkIHRoZSBsYXR0ZXIgYW5kIHRoZW4gc3dpdGNoZWQgdG8gdGhl
IGZvcm1lciBpbiB0aGUgcmVjZW50IHllYXJzKS4KPiA+IAo+ID4gSG1tLi4uIE15IG1lbW9yeSB0
cmlja2VkIG1lLCBpdCBzZWVtcyBJIHN3aXRjaGVkIHRvIC0+Y2IoKSBub3RhdGlvbiwgYXQgbGVh
c3QKPiA+IHRoZXJlIGFyZSBwYXRjaGVzIHdpdGggdGhhdCBmcm9tIE9jdG9iZXIgbGFzdCB5ZWFy
LiBXaGF0ZXZlciwgY2hvb3NlIG9uZSBhbmQKPiA+IHVzZSBpdCA6LSkKPiAKPiBJIHRoaW5rIHlv
dSBtaXNzZWQgbXkgcG9pbnQsIEkgd2FzIC9ub3QvIHRyeWluZyB0byByZWZlciB0byBhbiBvcHMg
c3RydWN0Cj4gbWVtYmVyLiBGb3IgdGhvc2UgSSBmb2xsb3cgdGhlIGZpcnN0IG9mIHRoZSB0d28g
bm90YXRpb25zIHlvdSBsaXN0ZWQuCgpJbmRlZWQsIGZvciB0aGF0IGNhc2VzIEkgdXN1YWxseSB1
c2UgYW5kIHVuZGVyc2NvcmUgKGhvd2V2ZXIgaXQgbWlnaHQKaW4gc29tZSBjYXNlcyBiZSBhbWJp
Z3VvdXMpOgoKICBwaW5jdHJsOiBwaW5jb25mLWdlbmVyaWM6IG1vdmUgX2R0X25vZGVfdG9fbWFw
X3Bpbm11eCgpIHRvIGFtbG9naWMtYW00IGRyaXZlcgoKSSB0aGluayBpdCdzIHBvc3NpYmxlIHRv
IGRyb3AgdGhlICdwaW5jdHJsOicgcHJlZml4LCB0aGUgcGluY29uZi1nZW5lcmljIGlzCnVuaXF1
ZSBlbm91Z2ggYW5kIGhhZCBiZWVuIHVzZWQgaW4gdGhlIHBhc3QgYSBjb3VwbGUgb2YgdGltZXMg
KHllcywgSSBrbm93IHRoYXQKdGhlIGNvbnZlbnRpb24gaXMgdG8gdXNlIHN1YnN5c3RlbSBwcmVm
aXgpLgoKQWxzbyB3b3JkICdkcml2ZXInIGNhbiBiZSBkcm9wcGVkLgoKVEw7RFI6IE15IHBvaW50
IHRoYXQgZG91YmxlIGRvdHMgaXMgY29uZnVzaW5nIGFuZCBub24tc3RhbmRhcmQgd2F5IHRvIHJl
ZmVyIHRvCnNvbWV0aGluZyB3aGljaCBpcyBjdXQuIElmIG5vdCBmdWxsLCBpZGVhbGx5IGl0IGNh
biB1c2UgdHJpcGxlIGRvdHMgZm9sbG93ZWQgYnkKdW5kZXJzY29yZQoKICBwaW5jb25mLWdlbmVy
aWM6IG1vdmUgLi4uX2R0X25vZGVfdG9fbWFwX3Bpbm11eCgpIHRvIGFtbG9naWMtYW00IGRyaXZl
cgoKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

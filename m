Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C4EE9D3E3
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Feb 2026 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSSsiwljhR7hn8Ck7L9AUL7r7isRuBX4JKrtEloLGnk=; b=GMuHC4okAtt2TT
	46gkE3Fp37gv//3+3aDyDbGNd5suM02crtOKQ1c8Og88q3hf/p5ckYOYKJxBT5xpj3edVtXo1sF0U
	J5nLEkgN8Um9s9eQPWuB04MFQ9gnDZYc16IPlUcahAwD53XbbdsVPF00oXEkhxFO3aXgFCfAMzUg0
	5EPZz33mKlvH6RCk2+sgG86vnmKyG6LBKEVHb31gUpNHnpVVcTnRfhnhJ4qRZLzrugEupdlwcuU7G
	aRyheDnLwpd3hNKTVw6d0qmuPaAxeShTBkPG+h4fr0u4l+btvpm4JrRbNBlvurb2TpIYwEENofd5e
	WXhU/0CX6TFQyxkjTkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndq1-00000008aa2-2YCA;
	Wed, 04 Feb 2026 14:26:37 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndpy-00000008aZc-42m8;
	Wed, 04 Feb 2026 14:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770215195; x=1801751195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mfeFe+SWrohiHZ3h2cd0B32iz7YvkWD8TRTYujmvxn8=;
  b=TEKS2C+zlj/zwti4slUu3272K6L0VKXb52XaBMA1CRq49n5WBthqVpSw
   eBG4Vmgz8ao73barvu97RWcSyWKsS8QvYtv0iSCTq5oE7Spb8MHIJmGGn
   KniZbUA+KwbcVM9q004QDplSU9lc4HtSSwAl4jwjDWfkgO8cwQue1WYuF
   G6jyZ2HwI6ZtRkh3y8/b40NFO7hqtbO+Q02xaaDGl4tEw8Yct+xnOwF5x
   PvRRHCKiq4FZsU7JUqJyWpKMVhzLrGE007VjJ2RMgb/rPEYkyic56fs4L
   cWDVc8kIsymMvOX/6B65D8VY8JjT+sjOgrYONkCnrBdsOqz4XtPMDfM3b
   w==;
X-CSE-ConnectionGUID: S5IXxP5gS2eGyp7t3UVvJw==
X-CSE-MsgGUID: 4TB9Wx+KQB2cLq0M50N28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82514322"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82514322"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:26:34 -0800
X-CSE-ConnectionGUID: yCVN0XdJTmOo6WYVcJQQeg==
X-CSE-MsgGUID: ucXzXiRKQQyMgwG4Srt8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214712880"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:26:31 -0800
Date: Wed, 4 Feb 2026 16:26:29 +0200
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
Message-ID: <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYNWMndBWxxoPABG@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_062635_050606_14C67B72 
X-CRM114-Status: GOOD (  15.46  )
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

T24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDQ6MjI6NDdQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDAyOjE1OjEwUE0gKzAwMDAsIENvbm9y
IERvb2xleSB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDA5OjA1OjM0QU0gKzAx
MDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gT24gV2VkLCBGZWIgMDQsIDIwMjYgYXQg
MTI6MzQ6MzZBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEZl
YiAzLCAyMDI2IGF0IDU6MTfigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdy
b3RlOgoKLi4uCgo+ID4gPiBOb3RlLCBwbGVhc2UsIHJlbW92ZSBleHRyYSAnLicgKGRvdCkgaW4g
dGhlIFN1YmplY3Qubwo+ID4gCj4gPiBmd2l3LCB0aGUgLi4gd2FzIGludGVudGlvbmFsIGNvcyBJ
IHdhcyB0cnVuY2F0aW5nIHRoZSBwaW5jb25mX2dlbmVyaWMKPiA+IGZyb20gdGhlIGZ1bmN0aW9u
IHNpbmNlIHRoZSBzdWJqZWN0IHdhcyByZWFsbHkgbG9uZywgbm90IHJlZmVycmluZyB0bwo+ID4g
YSBtZW1iZXIgb2YgYW4gb3BzIHN0cnVjdC4KPiAKPiBZZXMsIGFuZCB0aGF0J3MgaG93IHdlIHJl
ZmVyIHRvIHRoZSBjYWxsYmFja3Mg4oCUIHdpdGggYSBzaW5nbGUgZG90IGFuZCBwYXJlbnRoZXNl
czoKPiAKPiAJLm15X2Nvb2xfY2IoKQo+IAo+IEFsdGVybmF0aXZlbHkKPiAKPiAJLT5teV9jb29s
X2NiKCkKPiAKPiBidXQgaXQgb25lIGNoYXJhY3RlciBsb25nZXIgYW5kIFRCSCBpdCBzbGlnaHRs
eSBsZXNzIHJlYWRhYmxlIChJIHBlcnNvbmFsbHkKPiB1c2VkIHRoZSBsYXR0ZXIgYW5kIHRoZW4g
c3dpdGNoZWQgdG8gdGhlIGZvcm1lciBpbiB0aGUgcmVjZW50IHllYXJzKS4KCkhtbS4uLiBNeSBt
ZW1vcnkgdHJpY2tlZCBtZSwgaXQgc2VlbXMgSSBzd2l0Y2hlZCB0byAtPmNiKCkgbm90YXRpb24s
IGF0IGxlYXN0CnRoZXJlIGFyZSBwYXRjaGVzIHdpdGggdGhhdCBmcm9tIE9jdG9iZXIgbGFzdCB5
ZWFyLiBXaGF0ZXZlciwgY2hvb3NlIG9uZSBhbmQKdXNlIGl0IDotKQoKLS0gCldpdGggQmVzdCBS
ZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60485C5AC82
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2026 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WratqqtjD2SRzrhDZbvVk1ZX8u2Ur1HZ0dcHS51AUXU=; b=UECjxInxEmH2ef
	U6UcjIs5przJyVWY+FbcJLAdR5qymplvDdt5RButdNxyujI/pTKfyHpAV7lW2Ism8k+cQbJeu3gis
	CwkhAfAjg5R+zaTZqDR+sBXcrnr4NkNNuKmr0nmbHrWZVhbykdzXfJ3ExBWrWwHtYnfx+eCvu56G6
	ObNq4NBC5BRA50cLOJGE0D2ysJF0/j9xF9CkGyq0EnbfOz7wZBD3/wpDxY8QS0ibY+t4WjaKGzE7v
	X8bPigJXF/oeKBi9/FGjGithTfaSd6LYVJBCVyIVzlrFK1OLC/vkOIdtXJ7vcMPyJeSJfS1RQSC5V
	k96zV5AK51CnD3njoKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMrI-0000000BSIZ-28S2;
	Mon, 10 Aug 2026 10:03:52 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMrF-0000000BSGn-2qKc;
	Mon, 10 Aug 2026 10:03:51 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 0C2B470AF95E; Mon, 10 Aug 2026 12:03:45 +0200 (CEST)
Date: Mon, 10 Aug 2026 12:03:45 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <anmiAfteOQzPXRqX@desktop>
References: <20260726131724.15299-1-linkmauve@linkmauve.fr>
 <anl9ZRM0REenBK8t@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anl9ZRM0REenBK8t@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_030349_870905_76ADD548 
X-CRM114-Status: GOOD (  18.39  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgMTA6Mjc6MzNBTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFN1biwgSnVsIDI2LCAyMDI2IGF0IDAzOjE3OjE4UE0gKzAyMDAsIExpbmsg
TWF1dmUgd3JvdGU6Cj4gPiBUaGlzIGNhbGxiYWNrIHVzZWQgdG8gdGFrZSBhIG11dGFibGUgdm9p
ZCAqIGZvciBubyByZWFzb24sIHdoaWNoIGNhdXNlcwo+ID4gdGhlIGNvbXBpbGVyIHRvIGJlIHVu
YXdhcmUgdGhhdCB0aGUgdmFsIGJ1ZmZlciBzaG91bGQgbmV2ZXIgYmUgbW9kaWZpZWQKPiA+IGJ5
IHRoZSBjYWxsYmFjay4KPiA+IAo+ID4gVGhpcyB3YXMgZm91bmQgd2hpbGUgZHJhZnRpbmcgdGhl
IG52bWVtLXByb3ZpZGVyIFJ1c3QgYWJzdHJhY3Rpb24uCj4gPiAKPiA+IFRoYW5rcyB0byB0aGUg
Z3VpZGFuY2Ugb2YgQW5keSBTaGV2Y2hlbmtvLCB0aGlzIG5vdyBpbnRyb2R1Y2VzIGEgbmV3Cj4g
PiBjYWxsYmFjayBhbmQgZGVwcmVjYXRlcyB0aGUgZXhpc3Rpbmcgb25lLCB3aXRoIHRoZSBnb2Fs
IG9mIHJlbmFtaW5nIHRoZQo+ID4gbmV3IG9uZSBpbnRvIHRoZSBvbGQgb25lIG9uY2Ugbm8gdXNl
ciByZW1haW5zIGluIHRoZSBrZXJuZWwuCj4gCj4gTEdUTSBub3csIEZXSVcsCj4gUmV2aWV3ZWQt
Ynk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPgo+IAo+IEJ1
dCBJIHRoaW5rIHlvdSBhbHNvIG5lZWQgdG8gcHJvdmlkZSBhIHJvYWQgbWFwIG9mIGZpbmlzaGlu
ZyB0aGlzIGpvYiAodGhlIGJlc3QKPiBpcyB0byBwcm92aWRlIGEgY29udGludWF0aW9uIGluIHNv
bWUgb2YgeW91cnMgcHVibGljIEdpdCB0cmVlcyB0byBwb2ludCBvdXQpLgoKSeKAmXZlIGp1c3Qg
cHVzaGVkIHRoZXNlIGNoYW5nZXMgaGVyZSwgYXMgdXN1YWwganVzdCBidWlsZC10ZXN0ZWQ6Cmh0
dHBzOi8vZ2l0aHViLmNvbS9saW5rbWF1dmUvbGludXgvY29tbWl0cy9udm1lbS12NgoKSSB3YXMg
cGxhbm5pbmcgb24gd29ya2luZyBvbiB0aG9zZSBhZnRlciB0aGUgNy4zIG1lcmdlIHdpbmRvdyBp
ZiB0aGlzCnNlcmllcyBpbmRlZWQgZ29lcyBpbnRvIDcuMywgYnV0IEkgd2FzIG5ldmVyIHdvcnJp
ZWQgdGhpcyB3b3VsZCBiZSBoYXJkCnRvIGRvLCBpdOKAmXMgYSBwcmV0dHkgbWVjaGFuaWNhbCBj
aGFuZ2UuCgo+IAo+IC0tIAo+IFdpdGggQmVzdCBSZWdhcmRzLAo+IEFuZHkgU2hldmNoZW5rbwo+
IAo+IAoKLS0gCkxpbmsgTWF1dmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK

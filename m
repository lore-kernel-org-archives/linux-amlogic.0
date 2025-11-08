Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B706FCCFA13
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICWUXBAC/x4yx7sbDtToab4YdElFvRM8HE/1eceivgM=; b=HFCcYawR99GazP
	20FQu4kQvJ4GKmYG1eE8oFnqXcHhG6pEa1mImsEvuZkDE5pALtEu+nRzXEvXx5lrzS8hwo2HDexR+
	q5sbbzH6726zK+CXtoWiSBApHupRXNXbTCK2h8OWpbovdQV6C/TARoftOJUO9Fcs8gKbOIGezDrRC
	hVpgCMtPPQKL5Bx3ET0luhL3+7inPtsiNgQnCxy3Crs1m7dQox9FCij3uoL4jUPtk29bXv9jT3Sub
	QvCWECHpu2DEiNu65mYesO7UrIVVRy/A1RiciSD7BDKEix9U78Jx1pPtwwfXvrmLDzOKt5iKXAPTH
	3b0lTdO8FcMpWYv+lIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHgMq-0000000323i-1Ngt;
	Sat, 08 Nov 2025 10:40:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHgMp-0000000323S-2UGR;
	Sat, 08 Nov 2025 10:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 428336013D;
	Sat,  8 Nov 2025 10:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C53C19421;
	Sat,  8 Nov 2025 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762598421;
	bh=zmpl9/6Gu+ycYJXFFYRN3iGuNWhx7bx2ECgx8oeCqZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydn3h6FHAWaeJdaQAb7LKY8bkJ2Mzixlyje4BUsl/nYnrBA9rZZmCGsNE6Tk9n4gW
	 NSTC+0wmoI2jU+cAywXO3Bi2C0fsrqOKmjwLYyEaw41Xx1WpXTNHQpIDwKcpr3oaJQ
	 r3vU26WNXYw14T3NfYYqu3unBjRRLUBJJVbhIISBjVg9kF4TSzcnVmBvjp21jnpt8t
	 xpRL7SqKni70GZMh+S+QHk8RtOZ4G981Sg8nCtc7iRNCc3L8E4hSM/wye60LIx5+Vx
	 st1xJe6fkLBLmGi57Sh99sl27+0qJKtO5oJBCASrJYYIHG0c+8t5+34jivkn9CIHMG
	 l2pVhVle6XvAg==
Date: Sat, 8 Nov 2025 16:10:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, 
	Jingoo Han <jingoohan1@gmail.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <65hstqcfcca7xj3cdtq7iikcdojbltfu42zlfdelskakesu3cd@hl3kydp6dw2t>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
 <20251106-positive-attractive-tiger-ec9c1c@kuoka>
 <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
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

T24gVGh1LCBOb3YgMDYsIDIwMjUgYXQgMDI6Mzc6MTdQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFRodSwgTm92IDA2LCAyMDI1IGF0IDA5OjMwOjE1QU0gKzAxMDAs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAwMywgMjAyNSBhdCAw
Mzo0Mjo1OFBNICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiA+IE9uIE1v
biwgTm92IDAzLCAyMDI1IGF0IDEwOjQ3OjM2QU0gKzAxMDAsIE5laWwgQXJtc3Ryb25nIHdyb3Rl
Ogo+ID4gPiA+IEhpIE1hbmksCj4gPiA+ID4gCj4gPiA+ID4gT24gMTEvMS8yNSAwNToyOSwgTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gPiA+ID4gQmluZGluZyBpbmNvcnJlY3RseSBz
cGVjaWZpZXMgdGhlICdEQkknIHJlZ2lvbiBhcyAnRUxCSScuIERCSSBpcyBhIG11c3QKPiA+ID4g
PiA+IGhhdmUgcmVnaW9uIGZvciBEV0MgY29udHJvbGxlcnMgYXMgaXQgaGFzIHRoZSBSb290IFBv
cnQgYW5kIGNvbnRyb2xsZXIKPiA+ID4gPiA+IHNwZWNpZmljIHJlZ2lzdGVycywgd2hpbGUgRUxC
SSBoYXMgb3B0aW9uYWwgcmVnaXN0ZXJzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIZW5jZSwgZml4
IHRoZSBiaW5kaW5nLiBUaG91Z2ggdGhpcyBpcyBhbiBBQkkgYnJlYWssIHRoaXMgY2hhbmdlIGlz
IG5lZWRlZAo+ID4gPiA+ID4gdG8gYWNjdXJhdGVseSBkZXNjcmliZSB0aGUgUENJIG1lbW9yeSBt
YXAuCj4gPiA+ID4gCj4gPiA+ID4gTm90IGZhbiBvZiB0aGlzIEFCSSBicmVhaywgdGhlIGN1cnJl
bnQgYmluZGluZ3Mgc2hvdWxkIGJlIG1hcmtlZCBhcyBkZXByZWNhdGVkIGluc3RlYWQuCj4gPiA+
ID4gCj4gPiA+IAo+ID4gPiBGYWlyIGVub3VnaC4gV2lsbCBtYWtlIGl0IGFzIGRlcHJlY2F0ZWQu
Cj4gPiAKPiA+IFRoZSB0cnVlIHF1ZXN0aW9uIGlzIHdoYXQgdmFsdWUgd2FzIGJlaW5nIHBhc3Nl
ZCBhcyB0aGF0IGl0ZW0gKEVMQkkpPwo+ID4gQmVjYXVzZSBpZiB0aGlzIHdhcyBhbHdheXMgREJJ
IC0gZGV2aWNlIGhhcyBEQkkgdGhlcmUgLSB0aGVuIHdoYXQKPiA+IGRlcHJlY2F0aW9uIHdvdWxk
IGNoYW5nZT8KPiAKPiBOb3RoaW5nLCBleGNlcHQgbm90IGJyZWFraW5nIG9sZCBEVHMgd2l0aCB0
aGUgYmluZGluZyBjaGVjay4gVGhhdCdzIHdoeSBJCj4gZGVjaWRlZCB0byByZW1vdmUgaXQgaW4g
dGhlIGZpcnN0IHBsYWNlLgo+IAoKTmVpbCwgZG8geW91IHN0aWxsIGluc2lzdCBvbiBtYXJraW5n
IHRoZSAnZWxiaScgcmVnaW9uIGRlcHJlY2F0ZWQgdGhhbiByZW1vdmluZwppdD8KCi0gTWFuaQoK
LS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

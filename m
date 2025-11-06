Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ADFCCF9F8
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Nov 2025 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpsA6+IoG+2rwtdhvuTRoKzVCVUNQgBMQD27F2AsTpk=; b=vCpTaFCE+LSqKh
	4RnCnJ+6y9X3d/B1pUMZ8CYCt7qe0XoJqjJAyXuw1grWEK0rsR6pCvmsTjolee5AvzDwN/8b+lxDY
	iqPdEU7quVJZiWoXjjuzN1WT7ScrkiTTy1dcFp3A6/gyZocddHclGHHMBXXnERFigxnJX6d2NqNAo
	xctSerPwi4nmmoa3ejcYMT10Fl/ikFkNBj7jnPZHIt776WFSFDTfE0jDf31hRaSRQfvUL5J3ANYcs
	QoqT6rPPrrH4NOgWGpNfDZZ2YstmF2he5UFjttHOrto522x5kJl2svCDO2U/3q98WOpSvg/bqBQBk
	b4WuzNS351VdSfFbAeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvxg-0000000F7wp-43sF;
	Thu, 06 Nov 2025 09:07:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvxe-0000000F7wD-16Gk;
	Thu, 06 Nov 2025 09:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 949A1438EA;
	Thu,  6 Nov 2025 09:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20083C4CEF7;
	Thu,  6 Nov 2025 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762420037;
	bh=MieKUKDPbSY+HzttPLXginlv3OHh6q6f7G1egoTKNI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9aQVLpkFlu/1ll+IAGrhZ6ghN3FIqK2wGYl2AF0vkYenPel/E8im3tlXc9H0DjS2
	 CXhoRbDPyJ/NXx08KR8rQtgc5M8gCDOJ/Tlp85TbVuvLnIBQyr3L6qyWWlvBaePJPb
	 cBqiX6e3NLgavy0KbMwuyqTmq4iDyvTvu6hrcPSZq5HrmPMmBSARZGQXYp0UU3B6ww
	 L1z6CZ3urqnNgrQWpPg+Kt4FDn5Nagf1auEfyL/QM9KklhwTEi/sCbjbAL3PHLL3At
	 HIHrPPr3NAD122CcEYD3nbt1Ds6b5anvs0ScnP69r7N2qtYimDeTHUYNSJIvA9iD/+
	 5rFTPfSyqWWAw==
Date: Thu, 6 Nov 2025 14:36:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrew Murray <amurray@thegoodpenguin.co.uk>, Jingoo Han <jingoohan1@gmail.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
 <20251106-positive-attractive-tiger-ec9c1c@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251106-positive-attractive-tiger-ec9c1c@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010718_753101_E74C2B3E 
X-CRM114-Status: GOOD (  15.09  )
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

T24gVGh1LCBOb3YgMDYsIDIwMjUgYXQgMDk6MzA6MTVBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBPbiBNb24sIE5vdiAwMywgMjAyNSBhdCAwMzo0Mjo1OFBNICswNTMwLCBN
YW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAwMywgMjAyNSBhdCAx
MDo0NzozNkFNICswMTAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiA+ID4gSGkgTWFuaSwKPiA+
ID4gCj4gPiA+IE9uIDExLzEvMjUgMDU6MjksIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToK
PiA+ID4gPiBCaW5kaW5nIGluY29ycmVjdGx5IHNwZWNpZmllcyB0aGUgJ0RCSScgcmVnaW9uIGFz
ICdFTEJJJy4gREJJIGlzIGEgbXVzdAo+ID4gPiA+IGhhdmUgcmVnaW9uIGZvciBEV0MgY29udHJv
bGxlcnMgYXMgaXQgaGFzIHRoZSBSb290IFBvcnQgYW5kIGNvbnRyb2xsZXIKPiA+ID4gPiBzcGVj
aWZpYyByZWdpc3RlcnMsIHdoaWxlIEVMQkkgaGFzIG9wdGlvbmFsIHJlZ2lzdGVycy4KPiA+ID4g
PiAKPiA+ID4gPiBIZW5jZSwgZml4IHRoZSBiaW5kaW5nLiBUaG91Z2ggdGhpcyBpcyBhbiBBQkkg
YnJlYWssIHRoaXMgY2hhbmdlIGlzIG5lZWRlZAo+ID4gPiA+IHRvIGFjY3VyYXRlbHkgZGVzY3Jp
YmUgdGhlIFBDSSBtZW1vcnkgbWFwLgo+ID4gPiAKPiA+ID4gTm90IGZhbiBvZiB0aGlzIEFCSSBi
cmVhaywgdGhlIGN1cnJlbnQgYmluZGluZ3Mgc2hvdWxkIGJlIG1hcmtlZCBhcyBkZXByZWNhdGVk
IGluc3RlYWQuCj4gPiA+IAo+ID4gCj4gPiBGYWlyIGVub3VnaC4gV2lsbCBtYWtlIGl0IGFzIGRl
cHJlY2F0ZWQuCj4gCj4gVGhlIHRydWUgcXVlc3Rpb24gaXMgd2hhdCB2YWx1ZSB3YXMgYmVpbmcg
cGFzc2VkIGFzIHRoYXQgaXRlbSAoRUxCSSk/Cj4gQmVjYXVzZSBpZiB0aGlzIHdhcyBhbHdheXMg
REJJIC0gZGV2aWNlIGhhcyBEQkkgdGhlcmUgLSB0aGVuIHdoYXQKPiBkZXByZWNhdGlvbiB3b3Vs
ZCBjaGFuZ2U/CgpOb3RoaW5nLCBleGNlcHQgbm90IGJyZWFraW5nIG9sZCBEVHMgd2l0aCB0aGUg
YmluZGluZyBjaGVjay4gVGhhdCdzIHdoeSBJCmRlY2lkZWQgdG8gcmVtb3ZlIGl0IGluIHRoZSBm
aXJzdCBwbGFjZS4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprg
rqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK

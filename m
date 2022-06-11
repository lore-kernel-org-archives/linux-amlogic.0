Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B3FC43334
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jun 2022 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17+2yz3py2WiXSDWJ1PbrJRBMnICrnQd0Fru1esXhwI=; b=Vdz1uuY85cRbmO
	VUWxO8sO9+GtLSAjEMF9yTvFvn1PbKD7+nkL8tUodrYb00bDOHJGiZcxpP23wGbspbP8ihvY5R9EZ
	XT/sdHscLn+vWUuJ0U4blOPchP/9xSQ/3DT198U7k0lR9bYINLu3Gnd701RhstHC+LY7EAncd7JB7
	qjbGl40i8QPQAev+CulK9P7MRdYI9g2Wro7CvdvH1xpD8TGJDxeT0nMjzZfUxCe6PiBwquzpADKvG
	/m1x2UxUmNvjW2GSNlDsehUB7R2qXDAt0ynHjPIr1vmk6IYyAaqQJE9nz4wlBkHi6ZgI/v0ceJd5S
	GQ1VsfJ8KW6rEdkwIBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzvcC-00BroN-JB; Sat, 11 Jun 2022 07:33:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzvc9-00BrnR-Q4
	for linux-amlogic@lists.infradead.org; Sat, 11 Jun 2022 07:32:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D043ECE39BC;
	Sat, 11 Jun 2022 07:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC21AC3411E;
	Sat, 11 Jun 2022 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654932772;
	bh=0L+NbLxu5/2Vf8Nu/sGq044kwZeuPfMPeOJvnd7ulEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1ejGEtzXQNuZ40KpwuykTjm7Xh94aS1JPxEa8XqiAsFNj20GYZ0zhdKSX4sbwvh3
	 G46dU1BG5xlQsxQd5VghamPbZf3XT2XlDg0X8hzk3NNcaaOZFovJahGEL0HQXHv1Lp
	 X15B/wwyfTXUPJrMiq0yvMdUqh4gqQLWKA2KQS8I=
Date: Sat, 11 Jun 2022 09:32:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Chris Chiu <chris.chiu@canonical.com>, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: Regression in 5.18.3 from "xhci: Set HCD flag to defer primary
 roothub registration"
Message-ID: <YqRFH2i3s/jL28ZG@kroah.com>
References: <743F7369-2794-4189-8891-5DA62E4B62DA@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <743F7369-2794-4189-8891-5DA62E4B62DA@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_003258_064917_92F78332 
X-CRM114-Status: GOOD (  11.33  )
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

T24gU2F0LCBKdW4gMTEsIDIwMjIgYXQgMTA6NDk6MjNBTSArMDQwMCwgQ2hyaXN0aWFuIEhld2l0
dCB3cm90ZToKPiBDb21taXQgNmM2NGE2NjRlMWNmZjMzOWVjNjk4ZDgwM2ZhOGNiYjlhZjVkOTVj
ZSDigJx4aGNpOiBTZXQgSENEIGZsYWcgdG8gZGVmZXIKPiBwcmltYXJ5IHJvb3RodWIgcmVnaXN0
cmF0aW9u4oCdIGFkZGVkIGZvciBMaW51eCA1LjE4LjMgY2F1c2VkIGEgcmVncmVzc2lvbiBvbgo+
IHNvbWUgQW1sb2dpYyBTOTEyIGRldmljZXMgKG9yaWdpbmFsIHVzZXIgZm9ydW0gcmVwb3J0IHdp
dGggYW4gQW5kcm9pZCBUViBib3gKPiBhbmQgY29uZmlybWVkIHdpdGggYSBLaGFkYXMgVklNMiBi
b2FyZCkuIEkgZG8gbm90IHNlZSBpc3N1ZXMgd2l0aCBvbGRlciBTOTA1Cj4gKFdlVGVLIFBsYXky
KSBvciBuZXdlciBTOTIyWCAoT2Ryb2lkIE4yKykgZGV2aWNlcyBydW5uaW5nIHRoZSBzYW1lIGtl
cm5lbC4KPiBUaGVyZSBhcmUgbm8ga2VybmVsIHNwbGF0cyBvciBlcnJvciBtZXNzYWdlcyBidXQg
bHN1c2Igc2hvd3Mgbm8gb3V0cHV0IGFuZAo+IG5vdGhpbmcgd29ya3MuIFNpbXBsZSByZXZlcnQg
cmVzdG9yZXMgdGhlIHByZXZpb3VzIGdvb2Qgd29ya2luZyBiZWhhdmlvdXIuCj4gCj4gZG1lc2cg
d2l0aCBjb21taXQgaHR0cDovL2l4LmlvLzNaVHYKPiBkbWVzZyB3aXRoIHJldmVydCBodHRwOi8v
aXguaW8vM1pUdwo+IAo+IEnigJltIG5vdCBhIGNvZGVyIHNvIHdpbGwgbmVlZCB0byBiZSBmZWQg
aW5zdHJ1Y3Rpb25zIHRvIGFzc2lzdCB3aXRoIGRlYnVnZ2luZwo+IHRoZSBpc3N1ZSBmdXJ0aGVy
IGlmIHlvdSBkb24ndCBoYXZlIGFjY2VzcyB0byBhbiBBbWxvZ2ljIFM5MTIgZGV2aWNlLiBJIGNh
bgo+IHNoYXJlIGRldmljZXMgb25saW5lIGZvciByZW1vdGUgcG9raW5nIGFyb3VuZCBpZiBuZWVk
ZWQuCgpEb2VzIDUuMTktcmMxIGFsc28gaGF2ZSB0aGlzIHByb2JsZW0/Cgp0aGFua3MsCgpncmVn
IGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8590CD98CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUs7aj//tIp983eciNvhmEqJ2MJcMO+Vf0gGs6MloDM=; b=1pI+m1e/4/HpdH
	4VgFX8BmpGLvfDR7z8yzU9K622ECxaZNqu9S4NjzdlZuDAxrYQc/9G8CeoYLo47j1uFSgFh56ivHI
	tZrUUPSP7Cjr1WWP2gRB2ibnXA9zF/130sYkdmtENHMtqk5A/6rMYWeaq678U1nfHtz3osxIrSQGJ
	67xn0RLhy507lMR0rChh6Uch2olobQLABWiWdysEEzEO4HF9tDn3BeC9V6+i9ZD2pJ13VPPLLjqOi
	B6KuNC1Zt4juvUgL8OIbWvc1oi/6BhMvbyDyPkObaPO9W9C9Zf7qcYSLJcV40B/MHuEE8U2Mes18B
	Mfmv0MKHGAWzyWGCeZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXesi-00000009RTX-1FYx;
	Thu, 11 Jun 2026 12:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXesh-00000009RSx-1ZqU
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 12:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0452436F0
	for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 12:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A4B1F008A2
	for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182294;
	bh=e9WLujsb76wJX19mGC9SDiFMCyDY7pNnF6G3yu8LFgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KwaI5VqY0p7DAHXz8MzhJMOIHJOjZed7svN8SV/HGfUR99cKVb7WfZDH2KjdGcW5r
	 +EzPcme8QoWuXMs3K+H0pPnuXJ9rFvxrqr7Of3PptQnEKQgfGJRQ+98UN4fBIGgLd4
	 DdzOYTFg8PCu4MroMNudhUK8q15qmG3405HG7hIxt+tqio+jQKNi+UUoLsCmZdON4q
	 noIDgWUwO0lhkSyJ9oM/prdrsAOcP7v02fA6KBegv70wCGCvJrDOyLUM2rf9nwWpJs
	 c0iN194kuN0GvY6G4X+fyurayXXGIuuYHXlCaEQRpcG2SyaFfbcdw66g4CkLxe0Ddl
	 VutqEYt1WmDoA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso8267468e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 05:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Daxspcd/tKIpHfrmc/m7UX0t4T9KPKZWcauXMCLrdOu1evbpHWwxAWrwj6M1qzvfnxYE3U8hAMmzjNQcP@lists.infradead.org
X-Gm-Message-State: AOJu0YxALSOgalnT6bnoki18JISkxA1ZWwf07FKNPE/scHUSf6eb1+wY
	TKZXBjIsPpklPaEGqzNGrzwCewrulRpb8EcQUa/q1nmcZHJxJJ93a8a5ZQ8njxWXi/9h6Mrxb9y
	IClS7Cc2OTPw8tkzHV4+wMeICV5C0A7s=
X-Received: by 2002:a05:6512:104f:b0:5a3:6731:910a with SMTP id
 2adb3069b0e04-5ad27ab9e1amr954915e87.11.1781182293519; Thu, 11 Jun 2026
 05:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:51:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
X-Gm-Features: AVVi8Cd-dIHDWtIpo4Lae4LYz5CqVn4HEUpS_YsaMZ1wtD9Hr9uCut8hp35HQx0
Message-ID: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

SGkgWGlhbndlaSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaGVzIQoKT24gVGh1LCBKdW4gMTEsIDIw
MjYgYXQgOTo1NOKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPGRldm51bGwreGlhbndl
aS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBTb21lIHVzZXJzIG5lZWQg
dG8gb2J0YWluIGFuIElSUSBkaXJlY3RseSBmcm9tIGEgR1BJTyBkZXNjcmlwdG9yIHRocm91Z2gg
Z3Bpb2RfdG9faXJxKCkuCj4gQWRkIHRoZSByZXF1aXJlZCBEVCBiaW5kaW5nIGFuZCBpbXBsZW1l
bnRhdGlvbiB0byBzdXBwb3J0IHRoaXMgdXNlIGNhc2UuCj4gU2luY2UgdGhpcyBpbnRyb2R1Y2Vz
IGEgbmV3IERUIHByb3BlcnR5LCB0aGUgcHJvcGVydHkgaXMga2VwdCBvcHRpb25hbCB0bwo+IG1h
aW50YWluIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBTb0NzIGFuZCBEVFMgZmlsZXMuCgpU
byBtZSBpdCBsb29rcyBsaWtlIHlvdSBoYXZlIGp1c3QgcmUtaW1wbGVtZW50ZWQgaGllcmFyY2hp
Y2FsCmlycXMuCgpMb29rIGludG8gdGhlIHNlY3Rpb24gIkluZnJhc3RydWN0dXJlIGhlbHBlcnMg
Zm9yIEdQSU8gaXJxY2hpcHMiCmluIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9ncGlvL2RyaXZl
ci5yc3QsIGVzcGVjaWFsbHkgdG93YXJkcwp0aGUgZW5kLgoKU29sdmUgdGhpcyBieSB1c2luZyBH
UElPTElCX0lSUUNISVAgYW5kIGEgY3VzdG9tCmNoaWxkX3RvX3BhcmVudF9od2lycSgpIGNhbGxi
YWNrIHRvIHRyYW5zbGF0ZSB0aGUgR1BJTyBpbnRvCmFuIElSUS4KClRvIGp1c3QgaW1wbGVtZW50
IGdwaW9kX3RvX2lycSgpIHdpdGhvdXQgYW55IGlycWNoaXAgYWJzdHJhY3Rpb24KaXMgYWxzbyBi
cm9rZW46IHlvdSBjYW4ndCBmb3JjZSBhbGwgdXNlcnMgdG8ganVzdCB1c2UgdGhpcyB3YXkKdG8g
Z2V0IGFuIElSUSBpdCdzIGV4Y2Vzc2l2ZWx5IHJlc3RyaWN0aW5nLgoKQWRkCgogIGludGVycnVw
dC1jb250cm9sbGVyOiB0cnVlCgogICIjaW50ZXJydXB0LWNlbGxzIjoKICAgIGNvbnN0OiAyCgp0
byB0aGUgcGluY3RybCBub2RlIGFzIHdlbGwgc28gdGhhdCBEVCB1c2VycyBjYW4gc2ltcGx5IHJl
cXVlc3QKdGhlIElSUSBmcm9tIHRoZSBpcnFjaGlwIGluc2lkZSBvZiB0aGUgcGluIGNvbnRyb2xs
ZXIuIEl0IHdpbGwKYmUgaGllcmFyY2hpY2FsIGFuZCBsaWdodHdlaWdodCBidXQgYW4gaXJxY2hp
cCBuZXZlcnRoZWxlc3MuCgpUaGUgR1BJT0xJQl9JUlFDSElQIGFwcHJvYWNoIHdpbGwgaGVscCB5
b3UgdG8gZ2V0IHRoaXMKcmlnaHQuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

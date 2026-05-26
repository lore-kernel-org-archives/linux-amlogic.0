Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B870FCD5BC8
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRZA3WR9U7jf4KgyNtaAKoULub2KSauN99DYP1Lscd4=; b=hbdOa2nYIncPN0
	v430+xKX1BdB26wSWutzA2+GaVaLTi1XYVdHo+WK2NT2TOdzynIllv6R5hzXkljooT73g9gYGph41
	ZTxdVfzjqzUXlo0NAS3s9PKOaFqIm2tT5vSR0cMcxW+JAwKqcNo8TlXfitp72U81vg3RUrTEiLD15
	TY2ThQ74FEfyrWr+rxiYh6Eq/93kKjlmIJTNO1Qt77eAsuiHDH8+tjuojlDDdYG7mAodbvZrLDMkn
	k11NxdU8FML+jRrARj2GbjH2K0jfE3GdWVJCcMmo/mYYSowMw/ITf0wAmjedL84GWPXQjJGB+NyyG
	1wHVOK5vJEpTa3+s7Ypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoUq-00000001a8M-2CbW;
	Tue, 26 May 2026 09:54:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoUo-00000001a7a-2nkj
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 09:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EEDF600B0
	for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 09:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC861F00A3F
	for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789285;
	bh=1ZLjE0blDgs8rIXohnrgIdGtGyxBNGZG1NuH9Cx+4Uk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dxo6ihjwxavCdVOP1XWBGE+CkJ5yd5Rv29vX2ChuIA1yStvCAP5yhZmBA2tSp+SLN
	 ZGYgq6fL8aF//hkfq4hea9/4p6nNiRRn1dd7RvQhkgriGbpd7AYgtf8nzrgv54pEkL
	 FtnwdVnuu3caxpfCEQ5XLQ6YbK2i9zWas0+SvodAnE9U43wB2ibokvXXHXRlv9SFoj
	 2ws8LUYedbQAAdtLXRPngPkW+VeYpO99ar7J/DGDCTnuVY6GIPrlTa8o3e2rGupwlQ
	 AgNihSRCENfYI7yCxNdbQIm2fOyl9OJ1LTb8E026FUtVnmeJo9h/IGPeMYHcSj1nox
	 wt4ZOQCcbEjmg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a858881ad2so12963858e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 02:54:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eLeJ/a6mEeMqpIQgSSFgPTCk8Tp6i/n5bS55KL0774Bge48pwyi7bnyye3n8VLfNXJbmHzfLGuaksNf3c@lists.infradead.org
X-Gm-Message-State: AOJu0YyD7bjrAErNrUeLVwC2suRfFriBWV7VyoAV9G1ZQ+TiTR47V+/q
	rwPpLuzPqN0JKnftpOns1wLCMRN10xnWsTtxxaJC8TUCtDonC0vYPZsckJBK9kgZhM7E7ZHAbup
	kTnu4ODzN9g8wAK4Wryx3a9y2ZkdcK6k=
X-Received: by 2002:ac2:43d3:0:b0:5a8:ee4c:8ae2 with SMTP id
 2adb3069b0e04-5aa3237c1e2mr3443175e87.30.1779789284401; Tue, 26 May 2026
 02:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:54:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0NVSdZ6jMprK0W+5h8gSoxjZRNqrHmfTSMPf0obTnJA@mail.gmail.com>
X-Gm-Features: AVHnY4LigDhYSCnaPwhQTYPGRYJs6hffPdPcGze_-mYukq-oq5Xsx1gQevrGyvU
Message-ID: <CAD++jL=0NVSdZ6jMprK0W+5h8gSoxjZRNqrHmfTSMPf0obTnJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTA6MjbigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBXaGVu
IHRoZSBzeXN0ZW0gdHJhbnNpdGlvbnMgZnJvbSBib290bG9hZGVyIHRvIGtlcm5lbCwgdGhlIEdQ
SU8gaXMKPiBleHBlY3RlZCB0byBrZWVwIGRyaXZpbmcgaGlnaC4KPgo+IEhvd2V2ZXIsIHRoZSBM
aW51eCBrZXJuZWwgZmlyc3QgY29uZmlndXJlcyB0aGUgcGluIGRpcmVjdGlvbiBhbmQgdGhlbgo+
IHNldHMgdGhlIG91dHB1dCB2YWx1ZS4gVGhpcyBtYXkgY2F1c2UgYSBicmllZiBsb3ctbGV2ZWwg
Z2xpdGNoIG9uIHRoZQo+IEdQSU8gbGluZSwgd2hpY2ggY2FuIGJlIHByb2JsZW1hdGljIGZvciBy
ZWd1bGF0b3IgY29udHJvbC4KPgo+IEJ5IGNvbmZpZ3VyaW5nIHRoZSBvdXRwdXQgdmFsdWUgYmVm
b3JlIHN3aXRjaGluZyB0aGUgcGluIGRpcmVjdGlvbiB0bwo+IG91dHB1dCwgdGhlIGdsaXRjaCBj
YW4gYmUgYXZvaWRlZC4KPgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSBzd2FwcGlu
ZyB0aGUgY29uZmlndXJhdGlvbiBvcmRlci4KPgo+IEZpeGVzOiA2ZTliZTNhYmI3OGMgKCJwaW5j
dHJsOiBBZGQgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgU29DcyIpCj4gU2lnbmVkLW9mZi1i
eTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpQYXRjaCBhcHBsaWVk
IGFzIG5vbi1jcml0aWNhbCBmaXggYmFzZWQgb24gbXkgZ3V0IGZlZWxpbmcuCgpZb3VycywKTGlu
dXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=

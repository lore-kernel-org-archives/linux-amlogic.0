Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6536CC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXp6ZPwd+meGs4z8FerkkW5U4OAGmtOaVYScXaM0+og=; b=WuUcR3/Eux+V01
	RFbdtPHUJq2LzOdHcNhUtEuZiT/36m55+NxuOK83RJS9nP+qEQeMltLDjf5P4uSEARLKmhsnLMWSB
	Q4eWpI1UE7p8hlFQb+ZLt7GnLNK4lnb0MtrUsx8WAZ5QVoDc/Im1U9SEvI4zTsBx+RCXOZVn9FLOr
	7xRqqppCu1Zgf74v2ZtyV0bdk++DvgPb8kqzz4JzjKhMQzoqgyAd3ogx+6+fpknM8pdRMujCgsxvn
	tenibveanRsBCbQcgbhjIioFNFWxZhJ1KazUJx1IevPzbXsrydXbc7lsCNH75WxMZMouhj+1wSIAw
	KSn8os8ZUjRFjvqMD/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOnUv-00E8jP-1o; Mon, 28 Feb 2022 21:24:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOnUs-00E8iZ-B6; Mon, 28 Feb 2022 21:23:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFEFE61159;
 Mon, 28 Feb 2022 21:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71692C340F1;
 Mon, 28 Feb 2022 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646083437;
 bh=7QaD+tXLqarmJbeGijWj9hiygCezLVN/S/8WqSTJVNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFXPE/4x6iPsq+Tvg1FOZcG9d1EMvmtMIgbMv5HsD83YrDCus6HxIwFZ7eVnTr7j6
 pulm9WhwkT4qv2WFDdDRqtK2QH20HQOsAjyp2eUqP81AqXbeWq6atp6h+sz//gVpDG
 4Pm1fo1MmxF/AQH2ViiXrn94NuiEt2iTtFV5IpYI=
Date: Mon, 28 Feb 2022 22:23:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Message-ID: <Yh09abhySKsjart4@kroah.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <20220228142751.GF2812@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228142751.GF2812@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_132358_448158_8557F951 
X-CRM114-Status: GOOD (  20.33  )
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

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMDU6Mjc6NTJQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBNb24sIEZlYiAyOCwgMjAyMiBhdCAwOTo1NTozMFBNICswODAwLCBZdSBUdSB3
cm90ZToKPiA+IERlc2NyaWJlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRl
IGNsb2NrIHVzaW5nIGEgY2xvY2sKPiA+IGZyYW1lLiBGb3Jnb3QgdG8gYWRkIGluIEtjb25maWcg
a2VybmVsIHRlc3QgUm9ib3QgY29tcGlsYXRpb24gZXJyb3IKPiA+IGR1ZSB0byBDT01NT05fQ0xL
IGRlcGVuZGVuY3kuCj4gPiAKPiA+IEZpeGVzOiAoInR0eTogc2VyaWFsOm1lc29uOiBEZXNjcmli
ZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jayB1c2luZyBhIGNs
b2NrIGZyYW1l4oCcKQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPgo+ID4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3Jh
Y2xlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnICAgICAgfCAgMSArCj4gPiAgZHJp
dmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZp
ZyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4gPiBpbmRleCBlOTUyZWM1YzdhN2MuLmEw
ZjJiODJmYzE4YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4g
PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+ID4gQEAgLTIwMCw2ICsyMDAsNyBA
QCBjb25maWcgU0VSSUFMX0tHREJfTk1JCj4gPiAgY29uZmlnIFNFUklBTF9NRVNPTgo+ID4gIAl0
cmlzdGF0ZSAiTWVzb24gc2VyaWFsIHBvcnQgc3VwcG9ydCIKPiA+ICAJZGVwZW5kcyBvbiBBUkNI
X01FU09OIHx8IENPTVBJTEVfVEVTVAo+ID4gKwlkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiA+ICAJ
c2VsZWN0IFNFUklBTF9DT1JFCj4gPiAgCWhlbHAKPiA+ICAJICBUaGlzIGVuYWJsZXMgdGhlIGRy
aXZlciBmb3IgdGhlIG9uLWNoaXAgVUFSVHMgb2YgdGhlIEFtbG9naWMKPiAKPiAKPiBUaGlzIGlz
IGEgbGluayBpc3N1ZS4gIFRoZSByZXN0IGlzIGFuIHVucmVsYXRlZCBlcnJvciBoYW5kbGluZyBm
aXguCj4gSXQgc2hvdWxkIHJlYWxseSBiZSBzZW50IGFzIHR3byBwYXRjaGVzLgoKSSdsbCB0YWtl
IHRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gsIHdoaWNoIGp1c3QgZGlkIHRoaXMgcG9y
dGlvbiwKYW5kIHRoZSByZXN0IGNhbiBiZSBhbiBpbmRlcGVuZGFudCBjaGFuZ2UuCgp0aGFua3Ms
CgpncmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=

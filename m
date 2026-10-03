Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F67CA5FE3
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Oct 2026 03:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGufiRWPSLcxTGCO7D0C0pTnqIVUyr0fulJi0GIaZy8=; b=MNViejFDs7F5VE
	PHFAewlEyvJiqmY3eZeKuYHcTwbXF394RMcwTysyuxycOAryGmsG9PFDIe8XNMRKNO0NM+0z5FFi5
	KMpWb7CixWwDGIjTMFTOfUfqaBx8NfOZIeEI1hQ8IQRVYiJ3zmV3VuovejHRSAp0l0IMiB0dEi8UZ
	W/NqCJqTvDOTJqb6PeRMA6+KX1nWq8buwtdppFuLdWU9YD1Y0mD3Zyo2NMPmQUkOQNmZ5/9ziMhkN
	nWirvcK4d5W6IC6AtEKGhB94Kg1gFTk0+bPaMe3urzCSeTqRE+cqfR00BARDPPpWYwiSnsDLTrgcH
	JAUTllfDXYuu7RIpAn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCqKd-0000000CzTA-2MQ4;
	Sat, 03 Oct 2026 03:22:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCqKb-0000000CzT3-3KJ9
	for linux-amlogic@lists.infradead.org;
	Sat, 03 Oct 2026 03:22:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6B68406F5;
	Sat,  3 Oct 2026 03:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604EE1F000FF;
	Sat,  3 Oct 2026 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790997756;
	bh=EP7E1etbmbXCWkaG/mUP1Rr2jtYhV8xPQuM6X0GDUM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LP66Oe2ljUk0zpDG33XyDZosWF7jof8xRLmgwQ0vaxQHt+D4g0hhDdgANDi8TZYcl
	 Wbo7YaFnvpwzBcBWt94djRa7pKjpR8G+nh/Exn3MSk6P4vrrUSVqbCZMIo1tve+cWf
	 GETTCrP4c2QTOCOqZDXS5C3RzohPMDSBZLTxU1cECxR3Ynhqggttlv+/otqDqpGIUT
	 cg9Ca3V/Przj+OwYGmkg+3hF+RXv355cWkqrqehPKPI3MFQ6jGP+QGUR28FWWmfsIC
	 LhEoKUnu9M1k9LAI9YaWe2xdMRI6UxbmjGHo1MwPBeL+vMbnuQI34kpG9uFQm/ZG/f
	 2Fumxuv1EvQDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card
 be powered down
To: "Igor Velkov" <iav@iav.lv>
Cc: robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
Date: Sat, 03 Oct 2026 03:22:35 +0000
Message-Id: <20261003032236.604EE1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGR0czogYW1sb2dpYzog
U0QgY2FyZCBiYWNrcG93ZXJpbmcgZHVlIHRvIHVucG93ZXJlZCBWTU1DIHdpdGggcG93ZXJlZCBW
UU1NQwotLQoKY29tbWl0IDRmNDQzN2FiZjU3MTM4ZjE5OGM0MDU3ZjY3MGM2YTVjMjNjM2FmNjEK
QXV0aG9yOiBJZ29yIFZlbGtvdiA8aWF2QGlhdi5sdj4KCmFybTY0OiBkdHM6IGFtbG9naWM6IG1l
c29uLXNtMS1vZHJvaWQ6IGxldCB0aGUgU0QgY2FyZCBiZSBwb3dlcmVkIGRvd24KClRoaXMgY29t
bWl0IGRyb3BzIHRoZSByZWd1bGF0b3ItYWx3YXlzLW9uIHByb3BlcnR5IGZyb20gdGhlIFNEIGNh
cmQncyBWTU1DCnN1cHBseSAodGZsYXNoX3ZkZCkgdG8gYWxsb3cgaXQgdG8gYmUgcG93ZXJlZCBk
b3duIGR1cmluZyBhIHdhcm0gcmVib290LgoKRml4ZXM6IDMyNmU1NzUxOGIwZCAoImFybTY0OiBk
dHM6IG1lc29uLXNtMTogYWRkIHN1cHBvcnQgZm9yIEhhcmRrZXJuZWwgT0RST0lELUM0IikKCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtb2Ryb2lk
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLW9kcm9pZC5kdHNp
Cj4gaW5kZXggZTZmMDJkNzM4YTIxZi4uN2RiYzc1YmZhZWEyNSAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLW9kcm9pZC5kdHNpCj4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQuZHRzaQo+IEBAIC0zOCw3
ICszOCw2IEBAIHRmbGFzaF92ZGQ6IHJlZ3VsYXRvci10Zmxhc2gtdmRkIHsKPiAgCQlncGlvID0g
PCZncGlvX2FvIEdQSU9BT18zIEdQSU9fT1BFTl9EUkFJTj47Cj4gIAkJZW5hYmxlLWFjdGl2ZS1o
aWdoOwo+ICAJCXJlZ3VsYXRvci1ib290LW9uOwo+IC0JCXJlZ3VsYXRvci1hbHdheXMtb247Cj4g
IAl9Owo+ICAKPiAgCXRmX2lvOiBncGlvLXJlZ3VsYXRvci10Zi1pbyB7CgpbU2V2ZXJpdHk6IEhp
Z2hdCkRvZXMgcmVtb3ZpbmcgcmVndWxhdG9yLWFsd2F5cy1vbiBmcm9tIHRmbGFzaF92ZGQgY2F1
c2UgdGhlIFNEIGNhcmQgdG8gYmUKYmFja3Bvd2VyZWQgZHVyaW5nIHNodXRkb3duIG9yIHdhcm0g
cmVib290PwoKTG9va2luZyBhdCB0aGUgc2RfZW1tY19iIG5vZGUsIHRmX2lvIGlzIGNvbmZpZ3Vy
ZWQgYXMgdGhlIHZxbW1jLXN1cHBseQphbG9uZ3NpZGUgdGZsYXNoX3ZkZDoKCiZzZF9lbW1jX2Ig
ewoJLi4uCgl2bW1jLXN1cHBseSA9IDwmdGZsYXNoX3ZkZD47Cgl2cW1tYy1zdXBwbHkgPSA8JnRm
X2lvPjsKfTsKCkhvd2V2ZXIsIHRoZSB0Zl9pbyBub2RlIHN0aWxsIHJldGFpbnMgaXRzIHJlZ3Vs
YXRvci1hbHdheXMtb24gcHJvcGVydHk6CgoJdGZfaW86IGdwaW8tcmVndWxhdG9yLXRmLWlvIHsK
CQkuLi4KCQllbmFibGUtYWN0aXZlLWhpZ2g7CgkJcmVndWxhdG9yLWJvb3Qtb247CgkJcmVndWxh
dG9yLWFsd2F5cy1vbjsKCX07CgpXaGVuIG1tY19wb3dlcl9vZmYoKSBkaXNhYmxlcyBWTU1DICh0
Zmxhc2hfdmRkKSwgVk1NQyB3aWxsIGRyb3AgdG8gMFYuCkJlY2F1c2UgdGZfaW8gaXMgYWx3YXlz
LW9uLCB0aGUgcmVndWxhdG9yIGNvcmUgd2lsbCBpZ25vcmUgdGhlIHJlcXVlc3QgdG8KZGlzYWJs
ZSBWUU1NQy4KCkNhbiB0aGlzIGxlYXZlIHRoZSBJL08gbGluZXMgZHJpdmVuIHdoaWxlIHRoZSBj
b3JlIHBvd2VyIGlzIHJlbW92ZWQsIGxlYWRpbmcKdG8gYW4gdW5wb3dlcmVkIFZNTUMgd2l0aCBh
IHBvd2VyZWQgVlFNTUM/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMDAzLWhjNC1zZC1wb3dlci1vZmYtdjEtMS1mN2ZmYmEwMWIz
NDhAaWF2Lmx2P3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=

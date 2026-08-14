Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D9AC5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MB2Y2ok2QPv5D00hLgIq034/IUBg699h6n6b95DbTM=; b=XZlT8cTjOFeA8R
	VS88vZ0OE6/+OE7Dop/NzHInZeIJ7VVGOjWyJnpQ9C+SP2qT6nhZS/EPIWM+p2//8oPfwn5xaDkZn
	gHNSNbPnrJ9dD5BRENtVPQUkeIkomOKB97rHXjfjDNcI33pV1owEppGIgdeZYDRfCOdu8tW2uz0o7
	leqb+d6wz/v8Uk+XscFH+SSKiMBtN5ysZRvEWZTjTZ5/IygnCko9d4H9/4sXXdVjA7e+ROcvKrUMl
	eRDNISm+s+p5ftg/n81sszn+sfERzVkKZ4Hmba93kjGfkZOvJ0bnsY+PluV6dEM5X4cMhNQC9JI8j
	DEKaEUmSlNo2cwdppcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZO-00000002S8E-3AtC;
	Fri, 14 Aug 2026 09:51:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZM-00000002S7U-3JRl
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 09:51:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7491F415C4;
	Fri, 14 Aug 2026 09:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235F21F000E9;
	Fri, 14 Aug 2026 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701080;
	bh=kwp4awOLAyYD52IaAU2wbvPHIsT9JjMbNg+yM4JCpFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3yBcyvi0DPvNMrFVZ69i+BCqyIQPjq/h+mRZqanSLA+pS0pf8PdB5fgCZinv+zDW
	 /ZZyz5duQN2mywO3+QzHNDm6P+OXQwEEo1g3HEx4HOEfg3Z2sXXiVM3e8j1/Lqaah0
	 PB2d5JF+j1fENxZOFmaiZPx/2tnIA9Tl/pUQDDPZ0UiInCWu27RIEGyHaUg03As/Qs
	 2dHsUNI8elzK+xeF2sASZqW2X9HkTQOP9Mp3gz+hUZdzzkGhMKjEfVXT0Xe7FpVyaR
	 fhUWcQBUqC1EbDzXNYPgeczsEkq/EWWHa2KSUuvmVWVd8F4h/0goMnjpmVb+pwI+KM
	 KkzhUAuaPJqzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
To: phucduc.bui@gmail.com
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260814094211.25151-2-phucduc.bui@gmail.com>
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
 <20260814094211.25151-2-phucduc.bui@gmail.com>
Date: Fri, 14 Aug 2026 09:51:19 +0000
Message-Id: <20260814095120.235F21F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBQcmVleGlzdGluZyBkYW5nbGluZyBwb2ludGVyIGRlcmVmZXJlbmNlIChVc2UtQWZ0
ZXItRnJlZSkgYW5kIGRvdWJsZS1mcmVlIGluIHRoZSBgbWVzb25fY2FyZF9yZWFsbG9jYXRlX2xp
bmtzKClgIGVycm9yIHBhdGguCi0tCgotLS0gUGF0Y2ggWzJdOiBbUEFUQ0ggMi8yXSBBU29DOiBt
ZXNvbjogbWVzb24tY2FyZC11dGlsczogRHJvcCByZWR1bmRhbnQgcHJvYmUgZXJyb3IgbWVzc2Fn
ZXMgLS0tCmNvbW1pdCA5NGRlNDJjYTBiMDk5NTA4ZTM5NjAwZDNkM2QwZDI4MmE4NjZjZmIzCkF1
dGhvcjogYnVpIGR1YyBwaHVjIDxwaHVjZHVjLmJ1aUBnbWFpbC5jb20+CgpBU29DOiBtZXNvbjog
bWVzb24tY2FyZC11dGlsczogRHJvcCByZWR1bmRhbnQgcHJvYmUgZXJyb3IgbWVzc2FnZXMKICAg
IApUaGlzIGNvbW1pdCByZW1vdmVzIHJlZHVuZGFudCBkZXZfZXJyKCkgY2FsbHMgZnJvbSBtZXNv
bl9jYXJkX3Byb2JlKCkKc2luY2UgdGhlIGVycm9ycyBhcmUgYWxyZWFkeSByZXBvcnRlZCBkZWVw
ZXIgaW4gdGhlIGNhbGwgY2hhaW4uCgo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vbWVz
b24tY2FyZC11dGlscy5jIGIvc291bmQvc29jL21lc29uL21lc29uLWNhcmQtdXRpbHMuYwo+IGlu
ZGV4IGNkYjc1OWI0NjZhZDQuLjQ4MDQ3MzEyY2Y0N2YgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29j
L21lc29uL21lc29uLWNhcmQtdXRpbHMuYwo+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9tZXNvbi1j
YXJkLXV0aWxzLmMKWyAuLi4gXQo+IEBAIC0yODksMTcgKzI4OSwxMyBAQCBpbnQgbWVzb25fY2Fy
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgCXJldCA9IG1lc29u
X2NhcmRfcGFyc2Vfb2Zfb3B0aW9uYWwoJnByaXYtPmNhcmQsICJhdWRpby13aWRnZXRzIiwKPiAg
CQkJCQkgICBzbmRfc29jX29mX3BhcnNlX2F1ZGlvX3NpbXBsZV93aWRnZXRzKTsKPiAtCWlmIChy
ZXQpIHsKPiAtCQlkZXZfZXJyKGRldiwgImVycm9yIHdoaWxlIHBhcnNpbmcgd2lkZ2V0c1xuIik7
Cj4gKwlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLQl9Cj4gIAo+ICAJcmV0ID0gbWVzb25f
Y2FyZF9hZGRfbGlua3MoJnByaXYtPmNhcmQpOwo+ICAJaWYgKHJldCkKCltTZXZlcml0eTogSGln
aF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBpZiBtZXNv
bl9jYXJkX2FkZF9saW5rcygpCmZhaWxzLCBjb3VsZCBpdCB0cmlnZ2VyIGEgdXNlLWFmdGVyLWZy
ZWUgYW5kIGRvdWJsZS1mcmVlIGluIHRoZSBlcnJvcgpoYW5kbGluZyBwYXRoPwoKSWYgbWVzb25f
Y2FyZF9yZWFsbG9jYXRlX2xpbmtzKCkgZmFpbHMgaXRzIHNlY29uZCBrcmVhbGxvYygpIGZvcgpw
cml2LT5saW5rX2RhdGEsIGl0IGp1bXBzIHRvIGVycl9sZGF0YSBhbmQgZnJlZXMgdGhlIGxpbmtz
IGFycmF5OgoKc291bmQvc29jL21lc29uL21lc29uLWNhcmQtdXRpbHMuYzptZXNvbl9jYXJkX3Jl
YWxsb2NhdGVfbGlua3MoKSB7CiAgICAuLi4KZXJyX2xkYXRhOgoJa2ZyZWUobGlua3MpOwplcnJf
bGlua3M6CglkZXZfZXJyKHByaXYtPmNhcmQuZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIGxpbmtz
XG4iKTsKCXJldHVybiAtRU5PTUVNOwp9CgpIb3dldmVyLCBwcml2LT5jYXJkLmRhaV9saW5rIHJl
dGFpbnMgaXRzIG9sZCB2YWx1ZSBwb2ludGluZyB0byB0aGUgZnJlZWQKbWVtb3J5LgoKV2hlbiB0
aGUgcHJvYmUgZnVuY3Rpb24gcmVjZWl2ZXMgdGhlIGVycm9yLCBpdCBqdW1wcyB0byBvdXRfZXJy
IGFuZCBjYWxscwptZXNvbl9jYXJkX2NsZWFuX3JlZmVyZW5jZXMoKSwgd2hpY2ggaXRlcmF0ZXMg
b3ZlciBjYXJkLT5kYWlfbGluazoKCnNvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmM6
bWVzb25fY2FyZF9jbGVhbl9yZWZlcmVuY2VzKCkgewogICAgLi4uCglpZiAoY2FyZC0+ZGFpX2xp
bmspIHsKCQlmb3JfZWFjaF9jYXJkX3ByZWxpbmtzKGNhcmQsIGksIGxpbmspIHsKCQkJLi4uCgkJ
a2ZyZWUoY2FyZC0+ZGFpX2xpbmspOwp9CgpUaGlzIGFwcGVhcnMgdG8gZGVyZWZlcmVuY2UgdGhl
IGZyZWVkIGxpbmtzIGFycmF5IGFuZCB0aGVuIGtmcmVlKCkgaXQgYWdhaW4uCgpDb3VsZCBwcml2
LT5jYXJkLmRhaV9saW5rIGJlIHNldCB0byBOVUxMIGJlZm9yZSByZXR1cm5pbmcgZnJvbSB0aGUK
ZXJyb3IgcGF0aCBpbiBtZXNvbl9jYXJkX3JlYWxsb2NhdGVfbGlua3MoKSB0byBwcmV2ZW50IHRo
aXM/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwODE0MDk0MjExLjI1MTUxLTEtcGh1Y2R1Yy5idWlAZ21haWwuY29tP3BhcnQ9MgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

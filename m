Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432F7C982DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgpf2Z6tj0MOSNWjWKRfNuMiHRdPrX1UurZk7nSZokE=; b=wOBFasD/k2n6cN
	8YZ1tYWsrpvm5HdPIcelGl4QLmmTJfBUCqyFJdJ9/MTbWmRQs7adbKznK/va9bhODzSkAgp2naVFo
	cP0kL65elPYa4jyvQFPsixazZy7jTI48K56/TM4zKli3hfJxqYJC3Y8HFc7yB9Dk4IYephnX8wJ2D
	S1nynzPuet4mkEWQ3H7kwyRsGY3vbhDCibndVjsXiTKMv8e9Rc1eaP7hXgaAdzZDpR2J5moeescPp
	fg04VxYK1vIkc7I54vREIf8+JAUid+dy5Hx4Lth5ZjzfBpl4dk275qazTAi/og9huL7O2zRJIIuPK
	4TEAKzi/FnjSZTU6xGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FaU-0000000HLii-3zeh;
	Sun, 20 Sep 2026 11:20:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FaT-0000000HLiQ-1a6b
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 11:20:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8879E6022C;
	Sun, 20 Sep 2026 11:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957A51F00893;
	Sun, 20 Sep 2026 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789903200;
	bh=343/Db1Z8S17ssk821pz0Ch5sbEg1jnS5AmNrMg2Re0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLLCmqME9mXuW6pALNbtZP1fybu4xfooXafACBbeTqWFPHvxM3Rw4zUR7EmM88WF+
	 kmReu3VZkYMvYuG2nW5NE9AlEVlSbbybeE9MksDTig9OrZhgbaemiPhNba6ns3oDNM
	 sTEwfjdYrcS6NivXxSgBefGrv7qPMdmI6a23FJ7VyURwGATioxwL1/7KoSDrtaHnyh
	 nf+Eu2TXGh/I1Pny8Dg95shsRPLuXTGua6S+bRhccDfFjwH4eCcI4gK9VOri1jWK2M
	 +YGZddoDnY25JfVZNlO8xcXYgpL5Z5UxEjcB6Dc9iLeNbBh67zFb2+6Sw0VVz3xyze
	 uEycDd0O6sLLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] nvmem: core: deprecate reg_write callback with
 reg_write_const
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: neil.armstrong@linaro.org, ojeda@kernel.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, gary@garyguo.net
In-Reply-To: <20260920111000.2404131-3-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
 <20260920111000.2404131-3-linkmauve@linkmauve.fr>
Date: Sun, 20 Sep 2026 11:19:59 +0000
Message-Id: <20260920111959.957A51F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbnZtZW06IGRldl93YXJu
IHVzZXMgdW5pbml0aWFsaXplZCBkZXZpY2UgbmFtZSBpbiBudm1lbV9yZWdpc3RlcigpCi0tCgpj
b21taXQgNzc2NTM5MjdiZGYxOWIzNmMxNTVlNDE2YTY3NjA1MTU5OGRhMDIxMwpBdXRob3I6IExp
bmsgTWF1dmUgPGxpbmttYXV2ZUBsaW5rbWF1dmUuZnI+Cgpudm1lbTogY29yZTogZGVwcmVjYXRl
IHJlZ193cml0ZSBjYWxsYmFjayB3aXRoIHJlZ193cml0ZV9jb25zdAoKVGhpcyBjb21taXQgZGVw
cmVjYXRlcyB0aGUgcmVnX3dyaXRlIGNhbGxiYWNrIGluIGZhdm9yIG9mIHJlZ193cml0ZV9jb25z
dCwKd2hpY2ggdGFrZXMgYSBjb25zdCBwb2ludGVyIGZvciB0aGUgdmFsdWUgYnVmZmVyLiBJdCBh
bHNvIGFkZHMgYSBkZXByZWNhdGlvbgp3YXJuaW5nIGluIG52bWVtX3JlZ2lzdGVyKCkgZm9yIGRy
aXZlcnMgc3RpbGwgdXNpbmcgdGhlIG9sZCBjYWxsYmFjay4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKPiBpbmRleCAwNTU2ZDE0MDE3
MGE0Li5hNDg0ZDQyNDExOWY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4g
KysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKClsgLi4uIF0KCj4gQEAgLTkzNyw2ICs5NDAsMTEg
QEAgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW1fcmVnaXN0ZXIoY29uc3Qgc3RydWN0IG52bWVt
X2NvbmZpZyAqY29uZmlnKQo+ICAKPiAgCW9wcy0+cmVnX3JlYWQgPSBjb25maWctPnJlZ19yZWFk
Owo+ICAJb3BzLT5yZWdfd3JpdGUgPSBjb25maWctPnJlZ193cml0ZTsKPiArCW9wcy0+cmVnX3dy
aXRlX2NvbnN0ID0gY29uZmlnLT5yZWdfd3JpdGVfY29uc3Q7Cj4gKwo+ICsJaWYgKG9wcy0+cmVn
X3dyaXRlKQo+ICsJCWRldl93YXJuKCZudm1lbS0+ZGV2LCAiVXNhZ2Ugb2YgcmVnX3dyaXRlIGlu
IG52bWVtIGlzIGRlcHJlY2F0ZWQsIHBsZWFzZSAiCj4gKwkJICAgICAgICAgICAgICAgICAgICAg
ICJtaWdyYXRlIHRvIHJlZ193cml0ZV9jb25zdC5cbiIpOwoKW1NldmVyaXR5OiBMb3ddCldpbGwg
dGhpcyBkZXZfd2FybigpIHByaW50IGFuIHVuaW5pdGlhbGl6ZWQgZGV2aWNlIG5hbWUsIHNpbmNl
IGRldl9zZXRfbmFtZSgpCmhhc24ndCBiZWVuIGNhbGxlZCBvbiAmbnZtZW0tPmRldiB5ZXQ/CgpM
b29raW5nIGZ1cnRoZXIgZG93biBpbiBudm1lbV9yZWdpc3RlcigpLCB0aGUgZGV2aWNlIG5hbWUg
aXMgYXNzaWduZWQgbGF0ZXIKaW4gdGhlIHN3aXRjaCBibG9jazoKCglzd2l0Y2ggKGNvbmZpZy0+
aWQpIHsKCWNhc2UgTlZNRU1fREVWSURfTk9ORToKCQlydmFsID0gZGV2X3NldF9uYW1lKCZudm1l
bS0+ZGV2LCAiJXMiLCBjb25maWctPm5hbWUpOwoJCWJyZWFrOwoJLi4uCgpDb3VsZCB0aGlzIHJl
c3VsdCBpbiB0aGUgbG9nIG1lc3NhZ2UgcHJpbnRpbmcgYW4gdW5pbml0aWFsaXplZCBuYW1lIGxp
a2UKKG51bGwpIG9yICh1bm5hbWVkKSwgbWFraW5nIGl0IGRpZmZpY3VsdCB0byBpZGVudGlmeSB3
aGljaCBkcml2ZXIgdHJpZ2dlcmVkCnRoZSBkZXByZWNhdGlvbiB3YXJuaW5nPwoKV291bGQgaXQg
bWFrZSBzZW5zZSB0byB1c2UgY29uZmlnLT5kZXYgKHRoZSBwYXJlbnQgZGV2aWNlKSBmb3IgdGhl
IHdhcm5pbmcsCm9yIG1vdmUgdGhpcyBjaGVjayBiZWxvdyB0aGUgZGV2X3NldF9uYW1lKCkgYmxv
Y2s/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwOTIwMTExMDAwLjI0MDQxMzEtMS1saW5rbWF1dmVAbGlua21hdXZlLmZyP3BhcnQ9
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

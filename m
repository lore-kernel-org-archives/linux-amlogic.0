Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3865CC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jun 2022 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W4lFtadrDdL6U/a1ao/9AuJkRMyh5ie152299Tinl2Y=; b=BKU/aH3W3lkg+E
	WJwCp1AYIlUHj6Nj12COrB10GB+DPiaKEvA2SWuTuud/nRAED8AXFab7wt7hbjE2eI2HMe5cVlLjx
	aeZfvcd1wAT5Fb7jIMaY/S2P50XZ3Hlm3UdKGJ+6/XN9pJ3fBhxYn5r+JaPWlmmB6smBvFw+1GpEc
	gvvABopKsemlhmoxVsygfnJvNVvF/1DGFZNeeX4MLSZ4s0sYA3n1DVA4JCRazVyuy5RCBGsOu1Jm7
	Gy8GrtCYKJm9lfCLYiYHN7mc7vct+NzQYl+DJM2zqhdoPuZzVW9VPixabFKv9ON5M51iSwEUpByka
	7rJcnE8SXhyHdyQuA5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o04cS-00Dujd-Da; Sat, 11 Jun 2022 17:09:52 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o04cO-00Dui5-Rw; Sat, 11 Jun 2022 17:09:50 +0000
From: Furkan Kardame <f.kardame@manjaro.org>
To: narmstrong@baylibre.com
Cc: khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH v4] arm64: dts: meson: add gpio-fan control to GS-King-X
Date: Sat, 11 Jun 2022 20:08:52 +0300
Message-Id: <20220611170852.19487-1-f.kardame@manjaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_100949_092877_CA9BDD36 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

R1MtS2luZy1YIGhhcyBhIHNpbmdsZSBzcGVlZCBHUElPIGZhbiB3aGljaCBpcyBhbHdheXMtb24g
YnkgZGVmYXVsdC4gCklmIHdlIGFkZCBjb250cm9scyBmb3IgdGhlIGZhbiBhbmQgYSB0cmlwIHBv
aW50LAp0aGUgZmFuIHN0YXlzIG9mZiBtb3N0IG9mIHRoZSB0aW1lLCByZWR1Y2luZyBiYWNrZ3Jv
dW5kIApub2lzZSBmcm9tIHRoZSB1bml0LgoKU2lnbmVkLW9mZi1ieTogRnVya2FuIEthcmRhbWUg
PGYua2FyZGFtZUBtYW5qYXJvLm9yZz4KLS0tCkNoYW5nZWxvZzoKVjE6CiogVXNpbmcgdGFicyBp
bnN0ZWFkIG9mIHNwYWNlLgoKVjI6CiogUmVtb3ZlIHVudXNlZCBtYXAuCgpWMzoKKiBGaXhlZCBz
cGVlZC1tYXAgaW5kZW50YXRpb24KKiBBbGlnbmVkIGJyYWNrZXRzCiogQ2hhbmdlZCBjb29saW5n
LWRldmljZQoqIEluY3JlYXNlZCB0ZW1wZXJhdHVyZSB0byA3MMKwQwoKVjQ6CiogRml4ZWQgc3lu
dGF4IGVycm9yLgogLi4uL2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1nc2tpbmcteC5kdHMg
IHwgMjUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1n
c2tpbmcteC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1nc2tp
bmcteC5kdHMKaW5kZXggNmM3YmZhY2JhLi4yMzU5MmFlMjEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cworKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1nc2tpbmcteC5kdHMKQEAgLTIwLDYgKzIw
LDE0IEBAIGFsaWFzZXMgewogCQlydGMxID0gJnZydGM7CiAJfTsKIAorCWdwaW9fZmFuOiBncGlv
LWZhbiB7CisJCWNvbXBhdGlibGUgPSAiZ3Bpby1mYW4iOworCQlncGlvcyA9IDwmZ3BpbyBHUElP
SF81IEdQSU9fQUNUSVZFX0hJR0g+OworCQkvKiBVc2luZyBEdW1teSBTcGVlZCAqLworCQlncGlv
LWZhbixzcGVlZC1tYXAgPSA8MCAwPiwgPDEgMT47CisJCSNjb29saW5nLWNlbGxzID0gPDI+Owor
CX07CisKIAlncGlvLWtleXMtcG9sbGVkIHsKIAkJY29tcGF0aWJsZSA9ICJncGlvLWtleXMtcG9s
bGVkIjsKIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CkBAIC05Niw2ICsxMDQsMjMgQEAgJmNsa2Nf
YXVkaW8gewogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZjcHVfdGhlcm1hbCB7CisJdHJpcHMg
eworCQljcHVfYWN0aXZlOiBjcHUtYWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJlID0gPDcwMDAwPjsg
LyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNp
dXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGluZy1tYXBzIHsK
KwkJbWFwIHsKKwkJCXRyaXAgPSA8JmNwdV9hY3RpdmU+OworCQkJY29vbGluZy1kZXZpY2UgPSA8
JmdwaW9fZmFuIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CisJCX07CisJfTsK
K307CisKICZmcmRkcl9hIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwotLSAKMi4zNi4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C538C44539
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jul 2026 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjsKiFvFnOCJLDB+g6W7FF/oLim5Klcpw6Fhqs4/Ztk=; b=PSiPlNtKMtlm1G
	U7tecRr7H0XOek0kYFCH548kJtgX0fS60rYN+y2kB/C8F8zXKnMAehOm3WCILJJtAWK/MfkqGa+g6
	K1C5YNioU/2kUJ9E07a9GKlV5nYvrx8UnekUWvJIVj9JdAghv7PVDpcV5cGJlxe53nyjmI3U0vXHa
	d4OXDs+Xe5RUAMI1adTx2ifhvlTMXJS4h8+88RtZBpopmAhC1qlm5c5WBeU0K4zYUTTDIuI4m0ClQ
	MXrCpEg+DmsCHJpf/yrObklHMclBO/juC62BPSdGyLNZKhYs7pBDIdo7mrNlWuXrWqhQgBkDkPYgx
	/bLhO/hC1BH2zNC4rigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVya-0000000BlA9-409O;
	Wed, 22 Jul 2026 12:23:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVyZ-0000000BlA1-0h2s
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Jul 2026 12:23:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71ABF600AB;
	Wed, 22 Jul 2026 12:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA3C1F00A3A;
	Wed, 22 Jul 2026 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722982;
	bh=dqPla5tp3SPuihYkRfVjabrZ0myCPTmKd7es2a8UBig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ee/LmF1bRfV4D1PsQgkngAmhscZJxQaz7OBhntH9KFenBK+zRyoql3KQhUcyCej6w
	 y420Ulbpnrq1bTT3lR5GKl41heJb3AqJ3t3mCNv3wOPGPxp5FfINBQPT4avLfitV/B
	 AC33om7QpiaYEAqUTXnC/ZwK82HkSpx2pN93K6Uu0F5wPyV9fbKT86jwnlIfyoIgHt
	 0bFXK1GcdOiTWg58brPT0fW/Kl8Sp9QVK25HheZkZ0TZz/3apcmFiZ1XzNEbseJhXk
	 0koD34oK4DO5kyDkZTL5/fujiY7c1VwWxQ7aB3XJauG4+xbfT2NhhJJVU3+sWNDa84
	 a0SuqJ9B9bw6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: meson-spifc: use
 devm_pm_runtime_set_active_enabled
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260722-spifc-v1-1-e4462a4c6a06@gmail.com>
References: <20260722-spifc-v1-1-e4462a4c6a06@gmail.com>
Date: Wed, 22 Jul 2026 12:23:01 +0000
Message-Id: <20260722122301.EEA3C1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gUmVtb3ZpbmcgYG1l
c29uX3NwaWZjX3JlbW92ZSgpYCBpbnRyb2R1Y2VzIGEgY2xvY2sgZW5hYmxlIGNvdW50IHVuZGVy
ZmxvdyAoZG91YmxlLWRpc2FibGUpIHdoZW4gdGhlIGRldmljZSBpcyB1bmJvdW5kLgotLQoKLS0t
IFBhdGNoIFsxXTogW1BBVENIXSBzcGk6IG1lc29uLXNwaWZjOiB1c2UgZGV2bV9wbV9ydW50aW1l
X3NldF9hY3RpdmVfZW5hYmxlZCAtLS0KY29tbWl0IDhiZGYwODE4ZTMxODkxYzc1MzNhYTIyZmRi
ODM5MmFjYjYxNTQ1NjcKQXV0aG9yOiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+CgpzcGk6
IG1lc29uLXNwaWZjOiB1c2UgZGV2bV9wbV9ydW50aW1lX3NldF9hY3RpdmVfZW5hYmxlZAoKVGhp
cyBjb21taXQgcmVwbGFjZXMgcG1fcnVudGltZV9zZXRfYWN0aXZlKCkgYW5kIHBtX3J1bnRpbWVf
ZW5hYmxlKCkgd2l0aApkZXZtX3BtX3J1bnRpbWVfc2V0X2FjdGl2ZV9lbmFibGVkKCkuIEl0IGFs
c28gZHJvcHMgdGhlIG91dF9wbSBlcnJvciBwYXRoCmFuZCBlbnRpcmVseSByZW1vdmVzIHRoZSBt
ZXNvbl9zcGlmY19yZW1vdmUoKSBmdW5jdGlvbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Bp
L3NwaS1tZXNvbi1zcGlmYy5jIGIvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMKPiAtLS0g
YS9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpZmMuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1t
ZXNvbi1zcGlmYy5jClsgLi4uIF0KPiAtc3RhdGljIHZvaWQgbWVzb25fc3BpZmNfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gLXsKPiAtCXBtX3J1bnRpbWVfZ2V0X3N5bmMo
JnBkZXYtPmRldik7Cj4gLQlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4gLQlwbV9y
dW50aW1lX3B1dF9ub2lkbGUoJnBkZXYtPmRldik7Cj4gLX0KCltTZXZlcml0eTogTWVkaXVtXQpE
b2VzIHJlbW92aW5nIHRoaXMgZnVuY3Rpb24gaW50cm9kdWNlIGEgY2xvY2sgZW5hYmxlIGNvdW50
IHVuZGVyZmxvdyBkdXJpbmcKZHJpdmVyIHVuYmluZD8KCldoZW4gdGhlIGRyaXZlciBpcyB1bmJv
dW5kLCB0aGUgZHJpdmVyIGNvcmUgY2FsbHMgcG1fcnVudGltZV9wdXRfc3luYygpIGluCl9fZGV2
aWNlX3JlbGVhc2VfZHJpdmVyKCkuIFNpbmNlIHRoZSBkcml2ZXIgZG9lcyBub3QgdXNlIGF1dG9z
dXNwZW5kLCB0aGlzCnN5bmNocm9ub3VzbHkgc3VzcGVuZHMgdGhlIGRldmljZSBieSBpbnZva2lu
ZyBtZXNvbl9zcGlmY19ydW50aW1lX3N1c3BlbmQoKSwKd2hpY2ggZGlzYWJsZXMgdGhlIGNsb2Nr
LgoKU3Vic2VxdWVudGx5LCB0aGUgZGV2cmVzIGNsZWFudXAgZm9yIGRldm1fY2xrX2dldF9lbmFi
bGVkKCkgZXhlY3V0ZXMgYW5kCmNhbGxzIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGEgc2Vjb25k
IHRpbWUgb24gdGhlIGFscmVhZHkgZGlzYWJsZWQgY2xvY2suCgpUaGUgcmVtb3ZlZCBtZXNvbl9z
cGlmY19yZW1vdmUoKSBmdW5jdGlvbiBwcmV2ZW50ZWQgdGhpcyBieSBjYWxsaW5nCnBtX3J1bnRp
bWVfZ2V0X3N5bmMoKSB0byB3YWtlIHRoZSBkZXZpY2UgYW5kIGtlZXAgdGhlIGNsb2NrIGFjdGl2
ZSB1bnRpbAp0aGUgZGV2cmVzIHRlYXJkb3duIHJ1bnMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzIyLXNwaWZjLXYxLTEtZTQ0
NjJhNGM2YTA2QGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

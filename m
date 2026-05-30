Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9A7CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AEVzPcMyrB2ysKq/76/IeY6hPoWvYME6erJy+t43u8=; b=gACLY9CNRxvvfn
	qCl0SCqVmp1fc+A7tmVIp1EjdwjCfpOciPxymYRPrV4fh31+oV+Q2e9iR6uDy+cYO+M0uyJZvjmFk
	6KUcjjDWoBmvlAw4GuoC8bDIINw7eXxP4tRDsm1uQYWCCUpXk/Co9m95Ivs+QMAR43M+7UMz5Mskp
	nB+0NnXEgs/kM0Hddk0xURUBbRlSWVhsg7pRtNdo3VIAo2FKojFW/NvQq1Gx8goUlHoCx166+gfM3
	nFVfoYlqFswJvcqj8X0k/O/knsiIGXsUkmgyr2Yftg/YaJUttWnvt1qjGI9QR2hmisJ9I/e9fD4b8
	4jcQu0Y7s626jCjmSJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHPw-00000008exV-3XHH;
	Sat, 30 May 2026 10:59:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHPu-00000008exA-3OtR
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 10:59:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8AED4371E;
	Sat, 30 May 2026 10:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F941F00898;
	Sat, 30 May 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780138785;
	bh=dLJElK0DaXy94pgcBF1T68oVr+X826YV1J+ElotE7A8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5XAxFWqlhK8StMCr+XCiwwAcmip+nF/LHoA7CsShuvJcrO75G1Ep28B1hwgo49wA
	 Etq3bVo5/apY9R93AUShEIijhxmGyRE61Ubef5xQGdHVHoT11DenioqaGY3G2Evfvl
	 TFzlWeKCxI0XeoMWSDl26JvlCb6uzCqa50RKD88uN5J5Z2WToNya/daRP4r2qJ3N24
	 jt9egXAsJz065D19e3NTZL5JqcBdbm2gOB8fhtJQ5s7ngaW5aceM2v9BK3+9PK04/t
	 x/NbR7u7t7UcIjPAUC4JU/3CmgIZgXdEoJH/K59bGsq6bD7wdv8icP5nurx9G/Rfr9
	 vX8tY/vx8NdtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/8] media: meson: vdec: Cancel esparser work during
 teardown
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org
In-Reply-To: <20260530094326.11892-6-linux.amoon@gmail.com>
References: <20260530094326.11892-6-linux.amoon@gmail.com>
Date: Sat, 30 May 2026 10:59:45 +0000
Message-Id: <20260530105945.95F941F00898@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_035946_921533_31CCEC8D 
X-CRM114-Status: GOOD (  14.44  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBD
YWxsaW5nIGBjYW5jZWxfd29ya19zeW5jKCZzZXNzLT5lc3BhcnNlcl9xdWV1ZV93b3JrKWAgd2hp
bGUgaG9sZGluZyB0aGUgc2Vzc2lvbiBsb2NrIChgc2Vzcy0+bG9ja2ApIGNhdXNlcyBhIGd1YXJh
bnRlZWQgQUItQkEgZGVhZGxvY2sgaWYgdGhlIGBlc3BhcnNlcl9xdWV1ZV9hbGxfc3JjYCB3b3Jr
IGlzIGV4ZWN1dGluZy4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0NyaXRpY2FsXSBQcmVtYXR1
cmVseSBjbGVhcmluZyB0aGUgaGFyZHdhcmUgb3duZXIgYGNvcmUtPmN1cl9zZXNzYCBpbnRyb2R1
Y2VzIGEgY3JpdGljYWwgcmFjZSBjb25kaXRpb24gdGhhdCBjYW4gY29ycnVwdCBoYXJkd2FyZSBz
dGF0ZSBhbmQgZGlzYWJsZSBjbG9ja3MgZm9yIGNvbmN1cnJlbnQgc2Vzc2lvbnMuCi0tCgpjb21t
aXQgMjBmMDkyNWJiMTkxZWUwNTJkZDI5MDc3NjRiMjJjMmU0YTM1MjA3NApBdXRob3I6IEFuYW5k
IE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KCm1lZGlhOiBtZXNvbjogdmRlYzogQ2FuY2Vs
IGVzcGFyc2VyIHdvcmsgZHVyaW5nIHRlYXJkb3duCgpUaGlzIGNvbW1pdCBhZGRzIGNhbmNlbF93
b3JrX3N5bmMoKSBjYWxscyBkdXJpbmcgc3RyZWFtaW5nIHN0b3AsIGVycm9yIHVud2luZCwKYW5k
IGRldmljZSBjbG9zZS4gSXQgYWltcyB0byBwcmV2ZW50IHVzZS1hZnRlci1mcmVlIGhhemFyZHMg
YnkgZW5zdXJpbmcgdGhlCmVzcGFyc2VyIHdvcmtxdWV1ZSBpcyBkcmFpbmVkIGJlZm9yZSByZWxl
YXNpbmcgc2Vzc2lvbiBzdGF0ZSBhbmQgYnVmZmVycy4KCkNsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNTIxMDkwOTQ0LkYzNTQwMUYwMEEzREBzbXRwLmtlcm5lbC5vcmcv
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMg
Yi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiBpbmRleCA2OThhOTU1
NjZhZDI3Li40ODg0ZWUwNGIzNTI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRp
YS9tZXNvbi92ZGVjL3ZkZWMuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92
ZGVjL3ZkZWMuYwo+IEBAIC0zODAsNiArMzgwLDggQEAgc3RhdGljIGludCB2ZGVjX3N0YXJ0X3N0
cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgY291bnQpCj4gIAkJCSAg
c2Vzcy0+dmlmaWZvX3ZhZGRyLCBzZXNzLT52aWZpZm9fcGFkZHIpOwo+ICAJc2Vzcy0+dmlmaWZv
X3ZhZGRyID0gTlVMTDsKPiAgYnVmc19kb25lOgo+ICsJY2FuY2VsX3dvcmtfc3luYygmc2Vzcy0+
ZXNwYXJzZXJfcXVldWVfd29yayk7Cj4gKwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29k
ZSBpbnRyb2R1Y2UgYSBkZWFkbG9jaz8gVGhlIFY0TDIgY29yZSBhY3F1aXJlcyB0aGUgcXVldWUg
bG9jawooc2Vzcy0+bG9jaykgYmVmb3JlIGNhbGxpbmcgdmRlY19zdGFydF9zdHJlYW1pbmcoKSBv
ciB2ZGVjX3N0b3Bfc3RyZWFtaW5nKCkuCgpJZiBjYW5jZWxfd29ya19zeW5jKCkgaXMgY2FsbGVk
IGhlcmUgd2hpbGUgdGhlIGlvY3RsIHRocmVhZCBob2xkcyBzZXNzLT5sb2NrLAphbmQgdGhlIHdv
cmtlciB0aHJlYWQgaXMgY3VycmVudGx5IGV4ZWN1dGluZzoKCmRyaXZlcnMvc3RhZ2luZy9tZWRp
YS9tZXNvbi92ZGVjL2VzcGFyc2VyLmM6ZXNwYXJzZXJfcXVldWVfYWxsX3NyYygpIHsKICAgIC4u
LgogICAgbXV0ZXhfbG9jaygmc2Vzcy0+bG9jayk7CiAgICAuLi4KCkNvdWxkIHRoZSB3b3JrZXIg
dGhyZWFkIGJsb2NrIGluZGVmaW5pdGVseSB3YWl0aW5nIGZvciBzZXNzLT5sb2NrLCB3aGlsZSB0
aGUKaW9jdGwgdGhyZWFkIGJsb2NrcyBpbmRlZmluaXRlbHkgaW4gY2FuY2VsX3dvcmtfc3luYygp
IHdhaXRpbmcgZm9yIHRoZSB3b3JrZXIKdG8gY29tcGxldGU/Cgo+ICAJbXV0ZXhfbG9jaygmY29y
ZS0+bG9jayk7Cj4gIAlpZiAoY29yZS0+Y3VyX3Nlc3MgPT0gc2VzcykKPiAgCQljb3JlLT5jdXJf
c2VzcyA9IE5VTEw7CgpbIC4uLiBdCgo+IEBAIC00MzcsNiArNDM5LDggQEAgc3RhdGljIHZvaWQg
dmRlY19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQo+ICAJc3RydWN0IHZiMl92
NGwyX2J1ZmZlciAqYnVmOwo+ICAJZW51bSBhbXZkZWNfc3RhdHVzIG9sZF9zdGF0dXM7Cj4gIAo+
ICsJY2FuY2VsX3dvcmtfc3luYygmc2Vzcy0+ZXNwYXJzZXJfcXVldWVfd29yayk7Cj4gKwo+ICAJ
LyoKPiAgCSAqIFNhZmVseSBzbmFwc2hvdCB0aGUgc3RhdHVzIGFuZCBjbGVhciB0aGUgaGFyZHdh
cmUgb3duZXIgaW5zaWRlCj4gIAkgKiB0aGUgbXV0ZXggdG8gcHJldmVudCBkYXRhIHJhY2VzIHdp
dGggY29uY3VycmVudCBTVFJFQU1PTiByZXF1ZXN0cy4KPiBAQCAtNDQ4LDcgKzQ1MiwxMSBAQCBz
dGF0aWMgdm9pZCB2ZGVjX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEpCj4gIAlz
ZXNzLT5zdGF0dXMgPSBTVEFUVVNfU1RPUFBFRDsKPiAgCW11dGV4X3VubG9jaygmY29yZS0+bG9j
ayk7CgpbU2V2ZXJpdHk6IENyaXRpY2FsXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkg
dGhpcyBwYXRjaCwgYnV0IGRvZXMgcHJlbWF0dXJlbHkgY2xlYXJpbmcKY29yZS0+Y3VyX3Nlc3Mg
aGVyZSBpbnRyb2R1Y2UgYSByYWNlIGNvbmRpdGlvbj8KClNpbmNlIGNvcmUtPmN1cl9zZXNzIGlz
IHNldCB0byBOVUxMIHVuZGVyIGNvcmUtPmxvY2ssIGJ1dCB0aGUgaGFyZHdhcmUKdGVhcmRvd24g
dmlhIHZkZWNfcG93ZXJvZmYoKSBleGVjdXRlcyBsYXRlciBhZnRlciByZWxlYXNpbmcgdGhlIGxv
Y2ssIGNvdWxkCmEgY29uY3VycmVudCBTVFJFQU1PTiBmcm9tIGEgZGlmZmVyZW50IHNlc3Npb24g
YWNxdWlyZSBjb3JlLT5jdXJfc2VzcyBhbmQKZXhlY3V0ZSB2ZGVjX3Bvd2Vyb24oKT8KClRoaXMg
c2VxdWVuY2Ugd291bGQgY2F1c2UgdmRlY19wb3dlcm9mZigpIG9mIHRoZSBvbGQgc2Vzc2lvbiBh
bmQKdmRlY19wb3dlcm9uKCkgb2YgdGhlIG5ldyBzZXNzaW9uIHRvIGV4ZWN1dGUgc2ltdWx0YW5l
b3VzbHksIHBvdGVudGlhbGx5CmxlYWRpbmcgdG8gY29uZmxpY3RpbmcgaGFyZHdhcmUgYWNjZXNz
ZXMgYW5kIGRpc2FibGluZyBjbG9ja3MgZm9yIHRoZQpjb25jdXJyZW50IHNlc3Npb24uCgo+IC0J
LyogRXZhbHVhdGUgdGhlIGhhcmR3YXJlIHN0YXRlIHVzaW5nIG91ciBzbmFwc2hvdCAqLwo+ICsJ
aWYgKHEtPnR5cGUgIT0gVjRMMl9CVUZfVFlQRV9WSURFT19PVVRQVVRfTVBMQU5FKSB7Cj4gKwkJ
aWYgKG9sZF9zdGF0dXMgPj0gU1RBVFVTX1JVTk5JTkcgJiYgY29kZWNfb3BzLT5kcmFpbikKPiAr
CQkJY29kZWNfb3BzLT5kcmFpbihzZXNzKTsKPiArCX0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MzAwOTQzMjYuMTE4OTItMS1s
aW51eC5hbW9vbkBnbWFpbC5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

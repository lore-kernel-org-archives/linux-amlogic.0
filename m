Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1388CCD5BD0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG18IiE8zS+B0l66W/TtSaXkSVMN/5cO+a3MZ0kcscg=; b=Ij7QpZYai9a+MK
	6lZUq2M+NOakYIZLZyml0cwC2/Wp1qjj8Wb0wlOILpCLHFKkiRu/imrqBka3q0RcRKuuLb3iBO9Dq
	vz/nYoDLQAoUKabjAiIWDCSIcnNLrasHGTM3fXq6+DLHuOz7zOxhAlC72mnyPUzS2j2V51fz6r915
	V4Vm+9s+QJaOtgEB1J1hu2wHrvamYD+1vWiG9jJ/eJesDghyM/zyRYSLhVYIUaXtBWytHIeVy/pyQ
	br3FekEYKF0XiWpTx5GX0NFY2TZ5UkV+hcuvTHNLuni/2M7E0m6usMyf0XWMvYZryQ1EIHcjCe7wK
	hgEiy7qbWrm3CoYhIh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUDk-0000000HAZZ-2llx;
	Mon, 25 May 2026 12:15:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUDi-0000000HAYu-0VrT
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 12:15:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CEB3438BF;
	Mon, 25 May 2026 12:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D094E1F000E9;
	Mon, 25 May 2026 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779711345;
	bh=UWFKW07vItF7MjUnVuUEpPX5ZN0EId0R6fQHCm09whs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOp1rU9Ro2TiH4sYA1vwypuYFBnPyznul8d+2PxA3u7BmRjRX9Ze21+3PVHMfbWoL
	 FszhMlLqUs4TcYl5aOZS84ZNv6Qf7uxSqO1ANSkgu9Qmrujw3u7qZ40fw8l+N4GT+d
	 6NuzK+3j7JvC6Z9xlFuTTvEwY13iYuVYwKX0qdco5Nl9IQt7AW44wTtwpYQJhVMSef
	 14ikzbCjIwpqYq4EPwpHsAXe4wibLFbPxOzfDzK+4n2hohHrYymT1Yava5+MSzLWz1
	 myl4UTQZk3QOOxy2ZjjESendMn2WbUvOUt0idx1N7fybWYaWkNU7pFgFzQoe+VvP5H
	 CRpGgFUNme+SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] media: meson: vdec: Handle kthread error and
 free codec private data
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260525095216.12078-5-linux.amoon@gmail.com>
References: <20260525095216.12078-5-linux.amoon@gmail.com>
Date: Mon, 25 May 2026 12:15:44 +0000
Message-Id: <20260525121544.D094E1F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_051546_204619_7E227437 
X-CRM114-Status: GOOD (  14.48  )
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBD
YWxsaW5nIGBjb2RlY19vcHMtPnN0b3AoKWAgYmVmb3JlIGB2ZGVjX3Bvd2Vyb2ZmKClgIGNhdXNl
cyBhIGhhcmR3YXJlIERNQSB1c2UtYWZ0ZXItZnJlZSB2dWxuZXJhYmlsaXR5LgotIFtNZWRpdW1d
IFRoZSBlcnJvciBwYXRoIGZhaWxzIHRvIGZyZWUgdGhlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBj
b2RlYyBjb250ZXh0IChgc2Vzcy0+cHJpdmApLCBsZWFkaW5nIHRvIGEgcGVybWFuZW50IG1lbW9y
eSBsZWFrLgoKUHJlLWV4aXN0aW5nIGlzc3VlczoKLSBbSGlnaF0gVGhlIGVycm9yIHBhdGggZmFp
bHMgdG8gZnJlZSB0aGUgaGFyZHdhcmUgY2FudmFzZXMgYWxsb2NhdGVkIGR1cmluZyBgdmRlY19w
b3dlcm9uKClgLgotLQoKY29tbWl0IDhkYzgxZDMwOTcwYzhhMGRlM2VkNWExZWJlNDk4YzA0Nzkw
MzY3NjYKQXV0aG9yOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+CgptZWRpYTog
bWVzb246IHZkZWM6IEhhbmRsZSBrdGhyZWFkIGVycm9yIGFuZCBmcmVlIGNvZGVjIHByaXZhdGUg
ZGF0YQoKVGhpcyBjb21taXQgYWRkcyBhbiBlcnJvciBoYW5kbGluZyBwYXRoIGluIHZkZWNfc3Rh
cnRfc3RyZWFtaW5nKCkgd2hlbgprdGhyZWFkX3J1bigpIGZhaWxzLiBJdCBpbnRyb2R1Y2VzIGFu
IGVycl9jbGVhbnVwIGxhYmVsIHRvIGludm9rZSB0aGUKY29kZWMncyBzdG9wIGNhbGxiYWNrIGFu
ZCBwb3dlciBvZmYgdGhlIGhhcmR3YXJlLCBhaW1pbmcgdG8gZml4IG1lbW9yeSBsZWFrcy4KCkNs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTIxMDkwOTQ0LkYzNTQwMUYw
MEEzREBzbXRwLmtlcm5lbC5vcmcvCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVk
aWEvbWVzb24vdmRlYy92ZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92
ZGVjLmMKPiBpbmRleCA1MmFjZTRkZTk2N2NiLi5iMzFiZjA4YWY4OGU2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ICsrKyBiL2RyaXZlcnMv
c3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwpbIC4uLiBdCj4gQEAgLTM0NSwxMyArMzQ1
LDI1IEBAIHN0YXRpYyBpbnQgdmRlY19zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAq
cSwgdW5zaWduZWQgaW50IGNvdW50KQpbIC4uLiBdCj4gIAlzY2hlZHVsZV93b3JrKCZzZXNzLT5l
c3BhcnNlcl9xdWV1ZV93b3JrKTsKPiAgCXJldHVybiAwOwo+ICAKPiArZXJyX2NsZWFudXA6Cj4g
KwlpZiAoY29kZWNfb3BzICYmIGNvZGVjX29wcy0+c3RvcCAmJiBzZXNzLT5wcml2KSB7Cj4gKwkJ
Y29kZWNfb3BzLT5zdG9wKHNlc3MpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGNhbGxpbmcgY29k
ZWNfb3BzLT5zdG9wKCkgYmVmb3JlIHZkZWNfcG93ZXJvZmYoKSByaXNrIGEgaGFyZHdhcmUgRE1B
IHVzZQphZnRlciBmcmVlPwoKVGhlIGNvZGVjX29wcy0+c3RvcCgpIGNhbGxiYWNrcyB1bm1hcCBh
bmQgZnJlZSBETUEgbWVtb3J5IHVzZWQgYnkgdGhlCmZpcm13YXJlLCBidXQgdmRlY19wb3dlcm9m
ZigpIGhhc24ndCBiZWVuIGNhbGxlZCB5ZXQgdG8gaGFsdCB0aGUgaGFyZHdhcmUuIFRoZQpoYXJk
d2FyZSBjb3VsZCBzdGlsbCBiZSBwb3dlcmVkIG9uIHdpdGggaXRzIERNQSBwb2ludGVycyBwb2lu
dGluZyB0byB0aGUgZnJlZWQKbWVtb3J5LgoKQ291bGQgdGhpcyBsZWFkIHRvIElPTU1VIGZhdWx0
cyBvciBtZW1vcnkgY29ycnVwdGlvbiBpZiB0aGUgYWN0aXZlIGhhcmR3YXJlCmlzc3VlcyBhbnkg
bWVtb3J5IHRyYW5zYWN0aW9ucyBiZWZvcmUgaXQgaXMgcG93ZXJlZCBvZmY/Cgo+ICsJCXNlc3Mt
PnByaXYgPSBOVUxMOwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgemVyb2luZyBvdXQgc2Vzcy0+
cHJpdiB3aXRob3V0IGZyZWVpbmcgaXQgY2F1c2UgYSBtZW1vcnkgbGVhaz8KClRoZSBjb2RlY19v
cHMtPnN0b3AoKSBpbXBsZW1lbnRhdGlvbnMgdHlwaWNhbGx5IG9ubHkgcmVsZWFzZSBpbnRlcm5h
bCBETUEKYnVmZmVycywgYnV0IGRvIG5vdCBmcmVlIHRoZSBzZXNzLT5wcml2IHN0cnVjdHVyZSBp
dHNlbGYuIE5vcm1hbGx5LCB0aGlzCm1lbW9yeSBpcyBmcmVlZCB2aWEga2ZyZWUoKSBpbiB2ZGVj
X3N0b3Bfc3RyZWFtaW5nKCkuCgpEb2VzIHNldHRpbmcgaXQgdG8gTlVMTCBoZXJlIHBlcm1hbmVu
dGx5IG9ycGhhbiB0aGUgc3RydWN0dXJlPwoKPiArCX0KPiArCXZkZWNfcG93ZXJvZmYoc2Vzcyk7
CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2Vz
IHRoaXMgZXJyb3IgcGF0aCBhbHNvIG5lZWQgdG8gZnJlZSB0aGUKaGFyZHdhcmUgY2FudmFzZXM/
CgpEdXJpbmcgdmRlY19wb3dlcm9uKCksIGNvZGVjcyBhbGxvY2F0ZSBoYXJkd2FyZSBjYW52YXMg
SURzLiBUaGUgbm9ybWFsCnNodXRkb3duIHBhdGggY2FsbHMgdmRlY19mcmVlX2NhbnZhcygpIHRv
IHJlbGVhc2UgdGhlbS4KClNpbmNlIHRoZSBoYXJkd2FyZSBoYXMgYSBsaW1pdGVkIGdsb2JhbCBw
b29sIG9mIGNhbnZhcyBJRHMsIGRvZXMgb21pdHRpbmcgdGhpcwpjYWxsIHJpc2sgcmVuZGVyaW5n
IHRoZSB2aWRlbyBkZWNvZGVyIHN1YnN5c3RlbSB1bnVzYWJsZSBieSBsZWFraW5nIHRoZSBjYW52
YXMKSURzPwoKPiAgdmlmaWZvX2ZyZWU6Cj4gIAltdXRleF9sb2NrKCZjb3JlLT5sb2NrKTsKPiAg
CWNvcmUtPmN1cl9zZXNzID0gTlVMTDsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjUwOTUyMTYuMTIwNzgtMS1saW51eC5hbW9v
bkBnbWFpbC5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B91606A32E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b9BZ1tQV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMwW649P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OSm7OUT9EfZZbVhiv5v+BMyh+hjf56o5zTqZL35g7w0=; b=b9BZ1tQVgGUkVqQQkLwChYx6e+
	95Rw7MOQnXNT3U7TPMA0R+R4NjbcO1ynh3hOCvpgtFsnHOprhS790RJGs5wN16o1c91RCeq4F7gX6
	TDZpiADDI+MkFvbtCNTtFtQGpv+kWPkXyakwPctFvE6IKVjGKn6pg4usQvnj9586HOfP3UoZkcLCC
	GkZsQ0KN8Op0WuP8WFTLGFP8REyIDjvwhDBr0/txueIWSp8wJensqkp1QjEjA6R9uf0BcQMzgzMBJ
	h8WCeGrJjkUvaysYzlDTgqAaJyIUJUWfokHV0icQOjYiaZawcKpB9dSwzrtQiUucUMdIvTLtEYjZY
	puDJGycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZv-0000000C2u2-3g3T;
	Fri, 06 Nov 2026 10:53:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZu-0000000C2st-16RP
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:53:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B64C7605EB;
	Fri,  6 Nov 2026 10:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2391A1F0089F;
	Fri,  6 Nov 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962429;
	bh=pVDfsMz8cMqWLcgS/M6OYiWrU0X+DS+oHS8BFIpnilE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMwW649PK50m55ay+OWngXKkAAbK2PbSO+12MZmKUhDoIKGca00ckLpWeN/umCTXW
	 OVHUz7a6ErJpoCBXiVtheJ0mBL2ESJgtndbH4KyUMAzZ0WsyZ5pfG4POXIiG6/3pxu
	 Uv470Y1E6anohDDu5XIPnJm4O80FSoY7z3NTpTePU/mYhD99a922pqaHC6UTig6EiB
	 FDoZakiMHWmkngbs6Hynk0QAz4h5x3LAY/zu+w6FWKutrsogf/4DhUAwpyyIW9RRqc
	 Q+fKvvfvdS1bQnP7RqxLwrBcIwBsaHJPe/OkWcQimdpudbNwd+jYmuZG2sUPAKRtWj
	 TshGeya9XvjHg==
Message-ID: <sashiko-outbox-201241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] arm64: dts: amlogic: meson-s4: add the CPU
 thermal sensor and zone
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
Date: Fri, 06 Nov 2026 10:53:48 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGFybTY0OiBkdHM6IGFtbG9n
aWM6IG1lc29uLXM0OiB1bm1hdGNoZWQgYW1sb2dpYyxzNC10aGVybWFsCiAgY29tcGF0aWJsZQot
LQoKY29tbWl0IGE5OWQyZDUxYTc2MzI5MTkwMjA0Njk4NTE4NmU5NzYzYTNmZDVkMzgKQXV0aG9y
OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KCmFy
bTY0OiBkdHM6IGFtbG9naWM6IG1lc29uLXM0OiBhZGQgdGhlIENQVSB0aGVybWFsIHNlbnNvciBh
bmQgem9uZQoKVGhpcyBjb21taXQgYWRkcyB0aGUgQ1BVIHRlbXBlcmF0dXJlIHNlbnNvciBub2Rl
IGFuZCB0aGUgY29ycmVzcG9uZGluZyBDUFUKdGhlcm1hbCB6b25lIHdpdGggdHJpcCBwb2ludHMg
YW5kIEdQVSBjb29saW5nIG1hcCB0byBtZXNvbi1zNC5kdHNpLgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+IGluZGV4IDY5MTA1YzhhYmYxMjIuLjFlOGI4NDVi
ODBjMzEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0
LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQpb
IC4uLiBdCj4gQEAgLTc0OCw2ICs3NDksMTcgQEAgZ3Bpb19pbnRjOiBpbnRlcnJ1cHQtY29udHJv
bGxlckA0MDgwIHsKPiAgCQkJCQk8MTAgMTEgMTIgMTMgMTQgMTUgMTYgMTcgMTggMTkgMjAgMjE+
Owo+ICAJCQl9Owo+ICAKPiArCQkJY3B1X3RlbXA6IHRlbXBlcmF0dXJlLXNlbnNvckAyMDAwMCB7
Cj4gKwkJCQljb21wYXRpYmxlID0gImFtbG9naWMsczQtdGhlcm1hbCI7Cj4gKwkJCQlyZWcgPSA8
MHgwIDB4MjAwMDAgMHgwIDB4NTA+Owo+ICsJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwIElS
UV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQkJY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURf
VFNfUExMPiwKPiArCQkJCQkgPCZjbGtjX3BlcmlwaHMgQ0xLSURfVFM+Owo+ICsJCQkJY2xvY2st
bmFtZXMgPSAiYnVzIiwgImNvcmUiOwo+ICsJCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDA+
Owo+ICsJCQkJYW1sb2dpYyxzZWN1cmUtbW9uaXRvciA9IDwmc20gMT47Cj4gKwkJCX07CgpbU2V2
ZXJpdHk6IEhpZ2hdCkRvZXMgY3B1X3RlbXAgZmFpbCB0byBiaW5kIHRvIGEgZHJpdmVyIGFuZCBm
YWlsIGR0YnNfY2hlY2sgYmVjYXVzZQoiYW1sb2dpYyxzNC10aGVybWFsIiBpcyBub3QgbWF0Y2hl
ZCBvciBkb2N1bWVudGVkPwoKb2ZfYW1sb2dpY190aGVybWFsX21hdGNoW10gaW4gZHJpdmVycy90
aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIG9ubHkgbGlzdHMKImFtbG9naWMsZzEyYS1kZHItdGhl
cm1hbCIsICJhbWxvZ2ljLGcxMmEtY3B1LXRoZXJtYWwiLAoiYW1sb2dpYyxhMS1jcHUtdGhlcm1h
bCIsIGFuZCAiYW1sb2dpYyx0Ny10aGVybWFsIi4gIFdpdGhvdXQgYSBtYXRjaGluZwplbnRyeSBv
ciBhIGZhbGxiYWNrIGNvbXBhdGlibGUgc3VjaCBhcyAiYW1sb2dpYyx0Ny10aGVybWFsIiAod2hp
Y2gKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVy
bWFsLnlhbWwgYWxzbwpyZXF1aXJlcyB3aGVuIHR3byBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIGFy
ZSBwcmVzZW50KSwgYW1sb2dpY190aGVybWFsX3Byb2JlKCkKbmV2ZXIgcnVucyBhbmQgdGhlIGNw
dS10aGVybWFsIHpvbmUgcmVtYWlucyBpbmFjdGl2ZS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDYxMDQ2NTkuNTQ2NTYtMS1j
aHJpc3RpYW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdD9wYXJ0PTYKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

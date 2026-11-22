Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72260A263A
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2026 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kE0qMBim;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQShpZac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zXH74ITRbqCudda10a5fyh+N9LsUDCL3s8vEUc5j2bE=; b=kE0qMBimHaKXzpMVllHUIaVC2Y
	+Q98tpkji8yJxRco615fp0pdxEyscqV0dMtVpYG/XhMI5GE6hFHchSJu7D4ACpwjwKEeAew1/E+Kz
	GMXFHgmIYdGGuZjRRfq4dZkrtRsbK3GKSVUqSl/GNDKRWuoPC2pQh8h8sjGJTq8EkWeRDqtGpGqaw
	D+CnFBw0igjuPNT8Vkrrp4CIRzIQklnsrIr8jQwSoOAtJppHt55yv0Mi7zWOvtlGuhdc8YbrL14Tl
	RslaUKTy1sKZsZe4rHcFfk6ONtrRWWBqLuYeIQLf5cPfNtNdTRjVcKXIvPQN+rfp0b1vpege7TkVz
	m21JV69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFAR-00000001nXj-36na;
	Sun, 22 Nov 2026 21:32:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFAP-00000001nXW-3F1D
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Nov 2026 21:32:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 364EA43F40;
	Sun, 22 Nov 2026 21:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C111F000C6;
	Sun, 22 Nov 2026 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383129;
	bh=t8jzp+O+1tTXSegBiANij8lOfrZfHOzBN5iwtxvu7xI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQShpZacK/qr95cnyb/V7rFAX2W5UkGTNBXcEyc1TtHQPZsD0QVpwsJliyUcxV/Fc
	 /CvDjOtv1scSrKV2A/xvE9dkIcQCWz8qbb296xcPGVuQsRxfILU6N4bWqDlYqaMhOu
	 sGGhXKkIadGWQCgtM7EDHqrQ/03uJj8C6G1hiUtPmyllhln07vmffyy4PXLWfLNTLc
	 0PvdhMO1328iChfn2bpPy9U+Bl0WV3gcpb9YBoWY1K45Dvbr1pKJALb+HHD/TMdWHR
	 qiK9mqUjHHRIdn2heAIuCxX9VABvNPAM6m9z5zV2Y4GYxf3slylA0GTTH/gkUlhban
	 zQwonmh8nHzNQ==
Message-ID: <sashiko-outbox-228358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet
 controller
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
 <20261121213102.143130-4-tanure@linux.com>
Date: Sun, 22 Nov 2026 21:32:08 +0000
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
MyBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBhcm02NDogZHRzOiBhbWxv
Z2ljOiB0NzogZXRobWFjIHVzZXMgdW5tYXRjaGVkIGNvbXBhdGlibGUKICBhbWxvZ2ljLHQ3LWR3
bWFjCi0gW0hpZ2hdIGFybTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBldGhtYWMgcGlwZWxpbmUgY2xv
Y2sgaXMgbmV2ZXIgY2xhaW1lZAogIGJ5IGRyaXZlcgotIFtNZWRpdW1dIGFybTY0OiBkdHM6IGFt
bG9naWM6IHQ3OiB1bmRvY3VtZW50ZWQgZXRobWFjIGNvbXBhdGlibGUgYW5kCiAgY2xvY2tzIGlu
IGJpbmRpbmcKLS0KCmNvbW1pdCA0ZTNjNDAxNDJjM2QwZGUyMjg3OGM1ODcyMjcxZDdhYjQxODUw
MzJmCkF1dGhvcjogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgoKYXJtNjQ6IGR0czog
YW1sb2dpYzogdDc6IGFkZCB0aGUgZXRoZXJuZXQgY29udHJvbGxlcgoKVGhpcyBjb21taXQgYWRk
cyB0aGUgRGV2aWNldHJlZSBub2RlcyBmb3IgdGhlIEFtbG9naWMgVDcgRXRoZXJuZXQgTUFDLCBp
dHMKTURJTyBidXMsIGFuZCB0aGUgTURJTyBtdWx0aXBsZXhlciB3aXRoIHRoZSBpbnRlcm5hbCAx
MDBNIFBIWS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLXQ3LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNp
Cj4gaW5kZXggN2JkNTNlYzE2NjA3MS4uZWI3ZjQ2Yzk4YjBiNCAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+IEBAIC0yNTAsNiArMjUwLDMxIEBA
IGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZmZmMDEwMDAgewo+ICAJCQlpbnRlcnJ1cHRzID0g
PEdJQ19QUEkgOSAoR0lDX0NQVV9NQVNLX1NJTVBMRSg4KSB8IElSUV9UWVBFX0xFVkVMX0hJR0gp
PjsKPiAgCQl9Owo+ICAKPiArCQlldGhtYWM6IGV0aGVybmV0QGZkYzAwMDAwIHsKPiArCQkJY29t
cGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LWR3bWFjIiwgInNucHMsZHdtYWMtNS4xMGEiOwo+ICsJCQly
ZWcgPSA8MHgwIDB4ZmRjMDAwMDAgMHgwIDB4MTAwMDA+LAo+ICsJCQkgICAgICA8MHgwIDB4ZmUw
MjQwMDAgMHgwIDB4OD47CgpbU2V2ZXJpdHk6IEhpZ2hdCkNhbiBhbnkgcGxhdGZvcm0gZHJpdmVy
IGJpbmQgdG8gZXRobWFjIHdpdGggdGhpcyBjb21wYXRpYmxlIGxpc3Q/CgptZXNvbjhiX2R3bWFj
X21hdGNoW10gaW4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVz
b244Yi5jCmhhcyBubyBlbnRyeSBmb3IgYW1sb2dpYyx0Ny1kd21hYywgYW5kIGV0aG1hYyBkb2Vz
IG5vdCBsaXN0IGEgZmFsbGJhY2sKY29tcGF0aWJsZSBzdWNoIGFzIGFtbG9naWMsbWVzb24tZzEy
YS1kd21hYy4gIE5vIHBsYXRmb3JtIGRyaXZlciBtYXRjaGVzCnNucHMsZHdtYWMtNS4xMGEgZGly
ZWN0bHkgZWl0aGVyIChpdCBpcyBvbmx5IGNoZWNrZWQgaW4Kc3RtbWFjX3Byb2JlX2NvbmZpZ19k
dCgpIGFmdGVyIGEgZ2x1ZSBkcml2ZXIgaGFzIGFscmVhZHkgYm91bmQpLCBzbwpldGhtYWMgbmV2
ZXIgcHJvYmVzIHdoZW4gZW5hYmxlZCBieSBhIGJvYXJkLgoKPiArCQkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDc0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQlpbnRlcnJ1cHQtbmFtZXMgPSAi
bWFjaXJxIjsKPiArCQkJY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfU1lTX0VUSD4sCj4g
KwkJCQkgPCZzY21pX2NsayBDTEtJRF9GQ0xLX0RJVjI+LAo+ICsJCQkJIDwmbXBsbCBDTEtJRF9N
UExMMj4sCj4gKwkJCQkgPCZjbGtjX3BlcmlwaHMgQ0xLSURfU1lTX0FNUElQRV9FVEg+LAo+ICsJ
CQkJIDwmY2xrY19wZXJpcGhzIENMS0lEX1NZU19FVEhQSFk+Owo+ICsJCQljbG9jay1uYW1lcyA9
ICJzdG1tYWNldGgiLCAiY2xraW4wIiwgImNsa2luMSIsICJwaXBlbGluZSIsCj4gKwkJCQkgICAg
ICAicGNsayI7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgYW55IGRyaXZlciBhY3R1YWxseSBjbGFp
bSBhbmQgZW5hYmxlIHRoZSAicGlwZWxpbmUiIGNsb2NrCihDTEtJRF9TWVNfQU1QSVBFX0VUSCk/
CgpOZWl0aGVyIG1lc29uOGJfZHdtYWNfcHJvYmUoKSAod2hpY2ggb25seSByZXF1ZXN0cyAidGlt
aW5nLWFkanVzdG1lbnQiLAoiY2xraW4wIiwgYW5kICJjbGtpbjEiKSBub3Igc3RtbWFjX3Byb2Jl
X2NvbmZpZ19kdCgpICh3aGljaCBvbmx5IHJlcXVlc3RzCiJzdG1tYWNldGgiLCAicGNsayIsIGFu
ZCAicHRwX3JlZiIpIGFjcXVpcmVzIGEgY2xvY2sgbmFtZWQgInBpcGVsaW5lIi4KQmVjYXVzZSB0
N19zeXNfYW1waXBlX2V0aCBpbiBkcml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFscy5jIGlz
IGRlZmluZWQKd2l0aCBmbGFncyA9IDAsIENMS0lEX1NZU19BTVBJUEVfRVRIIHJlbWFpbnMgdW5j
bGFpbWVkIGFuZCBpcyBnYXRlZCBvZmYgYnkKY2xrX2Rpc2FibGVfdW51c2VkKCksIGJyZWFraW5n
IEV0aGVybmV0IERNQSBhY2Nlc3MgdG8gbWVtb3J5LgoKW1NldmVyaXR5OiBNZWRpdW1dCkFyZSB0
aGUgbmV3IGNvbXBhdGlibGUgc3RyaW5ncyBhbmQgY2xvY2tzIGRvY3VtZW50ZWQgaW4KRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWw/
CgpUaGUgYmluZGluZyBzY2hlbWEgZG9lcyBub3QgYWxsb3cgYW1sb2dpYyx0Ny1kd21hYyBvciBz
bnBzLGR3bWFjLTUuMTBhIGluCmNvbXBhdGlibGUsIGFuZCBpdHMgY2xvY2tzIGFuZCBjbG9jay1u
YW1lcyBwcm9wZXJ0aWVzIG9ubHkgYWxsb3cgdXAgdG8gZm91cgplbnRyaWVzIChzdG1tYWNldGgs
IGNsa2luMCwgY2xraW4xLCBhbmQgdGltaW5nLWFkanVzdG1lbnQpIHdpdGhvdXQKInBpcGVsaW5l
IiBvciAicGNsayIsIGNhdXNpbmcgZHRic19jaGVjayB2YWxpZGF0aW9uIHRvIGZhaWwuCgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYx
MTIxMjEzMTAyLjE0MzEzMC0xLXRhbnVyZUBsaW51eC5jb20/cGFydD0zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

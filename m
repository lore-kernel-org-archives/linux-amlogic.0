Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0503EC98302
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbVCCPKsjhk8OC/FbLe7ZlVRIJjED7CoWPU4M7tJO68=; b=U99Zg10ZhfQnqV
	cJJIYWvHW5VJ3OiV/KQfFAZzlqVPPU5vvtcAkOzZP97IOwCOcV0O4b0v2WWzOoDbZ0o0TCE+4//zH
	taLJCK2W1PTxyAfdODnluTUMukZgILFzcTtMVce+xfQl1GKybUZybUgEYliwdM+CqWWkQ5OmilmXA
	Go/xxDseixL03Yt73R32OW/6CajzcrLRqQaQJ/12K0SC5UHkBBP2smrL7Yha+eVVxPy/JL4VEuH4/
	6P8DIKoXr+c0taDt0nBlpRErkwhPxzX+fDLdPU3D8CwVCeP5lnt828bPh2u5ot5ilNZw0/hePfyeJ
	ROLdJcyOp1tgoyWVbyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OEI-00000008ZwY-1xXA;
	Wed, 23 Sep 2026 14:45:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OEH-00000008ZwR-2Pj7
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 14:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D85DC600AA;
	Wed, 23 Sep 2026 14:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D0B1F00893;
	Wed, 23 Sep 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790174748;
	bh=Cmc8C8kN0PaFVbymjclsOxShNRPivDtpIGl2UpTFBu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ls7QUqGVWnHF7dE85zeiUK8rUAvda0xXGgtF66w5yw+MOLDLf8sIMkaFE+dZQR7K+
	 TOUSWsMarNf8KWKe1lCxBUEJtp+ALM2cOD7L/KCY8kz3Ib/WljKxL0JA56h1HJXgFs
	 +HPOAoA7VV/xi18m8j+efZRiyk+/1lvSsqdwcJggOSOdD4m/LEG2NQzj0HDZHTPKkI
	 j1sKS32g8en9FXbgG1rHa9RVVSdMxZe5kuu6cI8GPPwyD+Fh/XSo5LM39sLwfAYhpZ
	 soXtPmFAErpnLHe3QlFLPzPQyFDupSxiq10RgGJVrreg2PMueBRNb16KN9SEUKRT0a
	 6C7BgpGHD+xtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: amlogic: describe bus
 clock for t7-thermal
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-1-bff7a09eb487@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
 <20260923-fix-t7-thermal-clock-v2-1-bff7a09eb487@aliel.fr>
Date: Wed, 23 Sep 2026 14:45:47 +0000
Message-Id: <20260923144548.32D0B1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGR0LWJpbmRpbmdzOiBB
QkkgYnJlYWsgYnkgcHJlcGVuZGluZyBuZXcgY2xvY2sgaW5zdGVhZCBvZiBhcHBlbmRpbmcKLS0K
CmNvbW1pdCBlNGEwYWE1NTNjZmM2ZjUwYWJmNjM1N2Q1NTliMGFmMDAwYmExYjNiCkF1dGhvcjog
Um9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpkdC1iaW5kaW5nczog
dGhlcm1hbDogYW1sb2dpYzogZGVzY3JpYmUgYnVzIGNsb2NrIGZvciB0Ny10aGVybWFsCgpUaGlz
IGNvbW1pdCB1cGRhdGVzIHRoZSBhbWxvZ2ljIHRoZXJtYWwgYmluZGluZyB0byBkZXNjcmliZSBh
IG5ldyBidXMgY2xvY2sKcmVxdWlyZWQgYnkgdGhlIHQ3IHRoZXJtYWwgc2Vuc29yIHRvIGdhdGUg
cmVnaXN0ZXIgYWNjZXNzLiBJdCBtYWtlcyB0aGlzCnNlY29uZCBjbG9jayBtYW5kYXRvcnkgZm9y
IHRoZSB0Ny10aGVybWFsIGNvbXBhdGlibGUgd2hpbGUga2VlcGluZyBhIHNpbmdsZQpjbG9jayBm
b3Igb2xkZXIgQW1sb2dpYyBTb0NzLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhl
cm1hbC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJt
YWwvYW1sb2dpYyx0aGVybWFsLnlhbWwKPiBAQCAtMzIsNyArMzIsMTUgQEAgcHJvcGVydGllczoK
PiAgICAgIG1heEl0ZW1zOiAxCj4gIAo+ICAgIGNsb2NrczoKPiAtICAgIG1heEl0ZW1zOiAxCj4g
KyAgICBtaW5JdGVtczogMQo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEJ1
cyBjbG9jaywgZ2F0ZXMgcmVnaXN0ZXIgYWNjZXNzIHRvIHRoZSBzZW5zb3IuCj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IEZ1bmN0aW9uYWwgY2xvY2sgb2YgdGhlIHRlbXBlcmF0dXJlIHNlbnNvciwg
c2hhcmVkIGJldHdlZW4gc2Vuc29ycy4KCltTZXZlcml0eTogSGlnaF0KRG9lcyBwcmVwZW5kaW5n
IHRoZSAiYnVzIiBjbG9jayBhdCBpbmRleCAwIGJyZWFrIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
Zm9yCm9sZGVyIGRlcGxveWVkIGtlcm5lbHM/CgpPbGRlciBkcml2ZXIgdmVyc2lvbnMgdXNlIGRl
dm1fY2xrX2dldCgpIHdoaWNoIGJsaW5kbHkgZmV0Y2hlcyB0aGUgY2xvY2sgYXQKaW5kZXggMDoK
CmRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYzphbWxvZ2ljX3RoZXJtYWxfcHJvYmUo
KQogICAgLi4uCiAgICBwZGF0YS0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7CiAgICBp
ZiAoSVNfRVJSKHBkYXRhLT5jbGspKQogICAgLi4uCgpJZiBhbiBvbGRlciBrZXJuZWwgaXMgYm9v
dGVkIHdpdGggdGhpcyB1cGRhdGVkIGRldmljZSB0cmVlLCBpdCB3aWxsIGZldGNoIHRoZQoiYnVz
IiBjbG9jayBpbnN0ZWFkIG9mIHRoZSAiY29yZSIgZnVuY3Rpb25hbCBjbG9jaywgd2hpY2ggY291
bGQgY2F1c2UgdGhlCnRoZXJtYWwgc2Vuc29yIHRvIGZhaWwuIEFkZGl0aW9uYWxseSwgZG9lc24n
dCB0aGlzIG1pc2RvY3VtZW50IHRoZSBleGlzdGluZwpmdW5jdGlvbmFsIGNsb2NrIGZvciBvbGRl
ciBBbWxvZ2ljIFNvQ3MgYXMgYSAiYnVzIiBjbG9jaz8KCkV2ZW4gaWYgdGhlIGRyaXZlciBpcyBs
YXRlciB1cGRhdGVkIHRvIHVzZSBidWxrIGNsb2NrIEFQSXMsIHRoZSBkZXZpY2UgdHJlZQpBQkkg
YnJlYWsgZm9yIGV4aXN0aW5nIG9sZGVyIGtlcm5lbHMgcmVtYWlucy4gU2hvdWxkIHRoZSBuZXcg
ImJ1cyIgY2xvY2sgYmUKYXBwZW5kZWQgdG8gdGhlIGxpc3QgaW5zdGVhZCwga2VlcGluZyAiY29y
ZSIgYXQgaW5kZXggMCBhbmQgImJ1cyIgYXQgaW5kZXggMT8KCj4gKwo+ICsgIGNsb2NrLW5hbWVz
Ogo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IGJ1cwo+ICsgICAgICAtIGNvbnN0OiBj
b3JlCgpbU2V2ZXJpdHk6IEhpZ2hdClNpbmNlIHRoaXMgbmFtaW5nIGFycmF5IG1hdGNoZXMgdGhl
IGNsb2NrcyBhcnJheSBhYm92ZSwgd291bGQgaXQgYWxzbyBuZWVkIHRvCmJlIHJldmVyc2VkIHRv
ICItIGNvbnN0OiBjb3JlIiB0aGVuICItIGNvbnN0OiBidXMiIHRvIGVuc3VyZSB0aGUgZnVuY3Rp
b25hbApjbG9jayByZW1haW5zIGF0IGluZGV4IDA/CgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIzLWZpeC10Ny10
aGVybWFsLWNsb2NrLXYyLTAtYmZmN2EwOWViNDg3QGFsaWVsLmZyP3BhcnQ9MQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

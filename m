Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24177EB28FB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESqH6L3MLDx5XMBCJgb1aw3Mvq+OxiXbUNYHlRS+BMA=; b=tP2kNweBCMgX72
	BMVi56UhzlFRPRQb9meFcIxV834xNZiKmiR+AElunfrwh+NKBGLukwU9IIDYQM4aqEIT6XMGtNvdd
	JJr2JgZUZTL/RYI9EST9v579IJpVZEFAEOTyor0CS6akKLmT/gDwext2pjn4azKpDFtoGaBvqtXE+
	1fHpeC07wJ3CXo7w/zHpWhF1Lr+sfArhXystc5OGClz2Y5eRKKn2E27M9/VfZA3Ad8cA8xEGZlYxV
	Fy+mFe6CENzkxMjDwnfodpMIUOich164j+Vc1jq6+nMR/I/6oRdVbmcL2/seLQRK8ng6yhMHxA5FQ
	MV4y38WrdAfBB7XuXOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHjk-0000000B4Gt-1Raq;
	Fri, 06 Feb 2026 09:02:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHji-0000000B4Fz-2lqo
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 09:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C84CF6011F;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64912C19422;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770368565;
	bh=OO2LYP/Tb0I+6e91AEQlOJswJ6g89wXPZXWxOGQ9iPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iM11LzYKO90GFll4q8N7flSMDKe8xnB3rKfpCdaI4D/O3Z9PVDhFNdga5QIkOBA9G
	 NAViS/Axsnp1vp0rQF2YoWv++pNwKS67SESau9Xl4WEkQH8vw5KJbuyHdkO2pLZbq1
	 ktviTxwayO435YPIJsUzCBvyR9tlANukpJ0uQLKdQUvPYHqPOzSmgJHTmyjg6TGLqe
	 aTclwTx58MJYpXGSBd1wREOuaNzRQLau7v08n2a/Eo64LTJdxx9tsioKdMEsH8BWAf
	 RqL+WXfHZn4LfutHWNBlYenjidrpWsGOM71bIZfG8HLE4rSZwPOd6WWBhY9hMbOHd6
	 wOjeri+vcPzyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCA7EB28F7;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 06 Feb 2026 09:02:32 +0000
Subject: [PATCH v3 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260206-amlogic-dma-v3-1-56fb9f59ed22@amlogic.com>
References: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
In-Reply-To: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770368563; l=2154;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=KKG30sNDMKwUEsaooUR8f4bvhWXtqrK9G8Cq30l/PK8=;
 b=VFLaFNwFVnC8YY6CLU/Fo7QfyXgFEiGUj6Y87skZ4P+CkOzgR+V6fm3X7G5ehMWzPeYMdk4AC
 UchpQ8Au+WUADJgcivRZyux8uzbvqYGEd97cjBHBZD1ZAg3ZkdDF8Wf
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpBZGQgZG9jdW1l
bnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIEE5IFNvQyBETUEuCgpTaWduZWQtb2ZmLWJ5
OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KLS0tCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEueWFtbCAgICB8IDY2ICsrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRt
YS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMzE1OGQ5OWEz
MTk1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCkBAIC0wLDAgKzEsNjYgQEAKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyVZQU1MIDEuMgorLS0t
CiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2RtYS9hbWxvZ2ljLGE5LWRtYS55
YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCisKK3RpdGxlOiBBbWxvZ2ljIGdlbmVyYWwgRE1BIGNvbnRyb2xsZXIKKworZGVzY3JpcHRp
b246CisgIFRoaXMgaXMgYSBnZW5lcmFsLXB1cnBvc2UgcGVyaXBoZXJhbCBETUEgY29udHJvbGxl
ci4gSXQgY3VycmVudGx5IHN1cHBvcnRzCisgIG1ham9yIHBlcmlwaGVyYWxzIGluY2x1ZGluZyBJ
MkMsIEkzQywgUElPLCBhbmQgQ0FOLUJVUy4gVHJhbnNtaXQgYW5kIHJlY2VpdmUKKyAgZm9yIHRo
ZSBzYW1lIHBlcmlwaGVyYWwgdXNlIHR3byBzZXBhcmF0ZSBjaGFubmVscywgY29udHJvbGxlZCBi
eSBkaWZmZXJlbnQKKyAgcmVnaXN0ZXIgc2V0cy4gSTJDIGFuZCBJM0MgdHJhbnNmZXIgZGF0YSBp
biAxLWJ5dGUgdW5pdHMsIHdoaWxlIFBJTyBhbmQKKyAgQ0FOLUJVUyB0cmFuc2ZlciBkYXRhIGlu
IDQtYnl0ZSB1bml0cy4gRnJvbSB0aGUgY29udHJvbGxlcuKAmXMgcGVyc3BlY3RpdmUsCisgIHRo
ZXJlIGlzIG5vIHNpZ25pZmljYW50IGRpZmZlcmVuY2UuCisKK21haW50YWluZXJzOgorICAtIFhp
YW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgorCitwcm9wZXJ0aWVzOgorICBj
b21wYXRpYmxlOgorICAgIGNvbnN0OiBhbWxvZ2ljLGE5LWRtYQorCisgIHJlZzoKKyAgICBtYXhJ
dGVtczogMQorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6Cisg
ICAgbWF4SXRlbXM6IDEKKworICBjbG9jay1uYW1lczoKKyAgICBjb25zdDogc3lzCisKKyAgJyNk
bWEtY2VsbHMnOgorICAgIGNvbnN0OiAyCisKKyAgZG1hLWNoYW5uZWxzOgorICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1heGltdW06IDY0CisK
K3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBpbnRlcnJ1cHRzCisgIC0g
Y2xvY2tzCisgIC0gJyNkbWEtY2VsbHMnCisgIC0gZG1hLWNoYW5uZWxzCisKK2FsbE9mOgorICAt
ICRyZWY6IGRtYS1jb250cm9sbGVyLnlhbWwjCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+CisgICAgZG1hLWNvbnRyb2xsZXJAZmU0MDAwMDB7Cisg
ICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhOS1kbWEiOworICAgICAgICByZWcgPSA8MHhm
ZTQwMDAwMCAweDQwMDA+OworICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzUgSVJRX1RZ
UEVfRURHRV9SSVNJTkc+OworICAgICAgICBjbG9ja3MgPSA8JmNsa2MgNDU+OworICAgICAgICAj
ZG1hLWNlbGxzID0gPDI+OworICAgICAgICBkbWEtY2hhbm5lbHMgPSA8Mjg+OworICAgIH07Cgot
LSAKMi41Mi4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK

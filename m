Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EF2C44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbIuQLbtpvpb8Tnb7H+y+UqnxMV0/CZu+g2nhuxq1Qg=; b=qvY2s8Xrb9yQfp
	IDLrx39xstZwZL3FVpCN14p3dNzDoytxmYP2zTVS99qeG6q3oFitrmq4Uyu8i8oPhE+pDvAy6hj8n
	XMDFNSbWGgkBr4J0BYvjj/Fy3KoF/Vakodbov2h9kIgqxBLGk9dGftLSJ/dzhvtAFN2VtgfspU1TM
	/bBW6KLzbSUu4iHpd0m8qCJDg8NcFOgimUY1qQRobTdUco7OrBKlTKiUBgjhHH5+pWsIK/6PBRKw+
	Q9b5hf//YAMGUtg2X7cu+KYjLbuJPvTatBE3YNDkpge2cTSfHzSayulLzq7rhDDrMTu4wjh/ttrt0
	MvUPAJpaC70IEJjt1A7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfHA-0000000CZKO-0I6G;
	Tue, 14 Jul 2026 15:42:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfH8-0000000CZJv-3iDO
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 15:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1EDA4389F;
	Tue, 14 Jul 2026 15:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CDF1F00A3E;
	Tue, 14 Jul 2026 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043746;
	bh=h1jl/MaLKetDl0dySqCl9UjmTtIv8JQ09lo0H+A0TRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcpxwEyN5N71uxm4ski6Paen3vGnwsiFeLe1Gpv69NEjR6oNgmnOeBpGDw7oMQow9
	 eJeqpHKvF15i3bKhEU43VWbPAV2J2wAqHPMmeZSXpvteI24pOgIEDQFSHZoQ09cLSa
	 TtEun4vp6UFZtuBIVXkVdEdGQQePjfvrlvhOco0t1hwxwnhCpuPeRxv9Hg5kdDslSO
	 6oSw6c/DjXWigmc9TkkbnzkorklzfMc9pzxSFj6NZTtM6Ee6l3afWOYPVOMSes4eiR
	 /D1Z7hwj30LWITysMFZGX/Brm+Phvh73uIrqXcrKZldUFcnWNZZunhTsrbglGXwczZ
	 /0PABbAE8U4iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 04/10] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-4-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-4-119f8699ef8e@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:42:25 +0000
Message-Id: <20260714154226.09CDF1F00A3E@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVHdvIGJpbmRpbmdz
IHJlZmVyZW5jaW5nIHNucHMsZHdtYWMueWFtbCB3ZXJlIG1pc3NlZCB3aGVuIHVwZGF0aW5nIGV4
aXN0aW5nIGJpbmRpbmdzIHdpdGggdGhlIGBtYXhJdGVtczogMWAgY29uc3RyYWludCBmb3IgYHBv
d2VyLWRvbWFpbnNgLCB1bmludGVudGlvbmFsbHkgcmVsYXhpbmcgdGhlaXIgdmFsaWRhdGlvbiBi
b3VuZHMuCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0ggbmV0LW5leHQgdjEzIDA0LzEwXSBkdC1i
aW5kaW5nczogbmV0OiBxY29tOiBkb2N1bWVudCB0aGUgZXRocW9zIGRldmljZSBmb3IgU0NNSS1i
YXNlZCBzeXN0ZW1zIC0tLQpjb21taXQgZjE0ZDUxOThhYmQxYzBmNTRmYmI4ZTlkODY5ODJiOTQw
YTVhNmJjMApBdXRob3I6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4KCmR0
LWJpbmRpbmdzOiBuZXQ6IHFjb206IGRvY3VtZW50IHRoZSBldGhxb3MgZGV2aWNlIGZvciBTQ01J
LWJhc2VkIHN5c3RlbXMKCkRlc2NyaWJlIHRoZSBmaXJtd2FyZS1tYW5hZ2VkIHZhcmlhbnQgb2Yg
dGhlIFFDb20gRGVzaWduV2FyZSBNQUMgaW4gYSBzZXBhcmF0ZQpmaWxlLiBUaGlzIGFsc28gdXBk
YXRlcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgcG93ZXIgZG9tYWlucyBpbiBzbnBzLGR3bWFjLnlh
bWwKYW5kIGxpbWl0cyBtYXhJdGVtcyB0byAxIGZvciBleGlzdGluZyBiaW5kaW5ncyByZWZlcmVu
Y2luZyBpdC4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvc25wcyxkd21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9zbnBzLGR3bWFjLnlhbWwKPiBpbmRleCAyNDQ5MzExYzZkMjhlLi5kM2FmZjFkZjMwNzBk
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25w
cyxkd21hYy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zbnBzLGR3bWFjLnlhbWwKWyAuLi4gXQo+IEBAIC0xODUsNyArMTg2LDggQEAgcHJvcGVydGll
czoKPiAgICAgICAgICAgIC0gY29uc3Q6IGFoYgo+ICAKPiAgICBwb3dlci1kb21haW5zOgo+IC0g
ICAgbWF4SXRlbXM6IDEKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBtYXhJdGVtczogMgoKW1Nl
dmVyaXR5OiBNZWRpdW1dClRoZSBjb21taXQgbWVzc2FnZSBtZW50aW9ucyB1cGRhdGluZyBleGlz
dGluZyBiaW5kaW5ncyByZWZlcmVuY2luZwpzbnBzLGR3bWFjLnlhbWwgdG8gbGltaXQgdGhlaXIg
cG93ZXItZG9tYWlucyBtYXhJdGVtcyB0byAxLiBIb3dldmVyLCBpdCBsb29rcwpsaWtlIG51dm90
b24sbWEzNWQxLWR3bWFjLnlhbWwgYW5kIHNwYWNlbWl0LGszLWR3bWFjLnlhbWwgd2VyZSBtaXNz
ZWQuCgpCZWNhdXNlIHRoZXkgcmVseSBvbiBzbnBzLGR3bWFjLnlhbWwgYW5kIGxhY2sgYW4gZXhw
bGljaXQgcG93ZXItZG9tYWlucwpkZWZpbml0aW9uLCBkbyB0aGV5IG5vdyB1bmludGVudGlvbmFs
bHkgaW5oZXJpdCB0aGlzIG5ld2x5IHJlbGF4ZWQgbWF4SXRlbXM6IDIKbGltaXQ/CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzEz
LXFjb20tc2E4MjU1cC1lbWFjLXYxMy0wLTExOWY4Njk5ZWY4ZUBvc3MucXVhbGNvbW0uY29tP3Bh
cnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=

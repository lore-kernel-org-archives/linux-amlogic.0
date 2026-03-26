Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F73C10A62D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSPCDdEjY7KvPdQkcluca9ODki72YYXTKbxiS+yKyFE=; b=mhJPunaIHJh3SA
	6wXiTyYMMekWXXwU8oeMEo3Ln0XWklQNwyGJctg1CcbqCZnfEHpCE+KIMlqeuc9rdrPFfIfIOOpEm
	6EUlO+CxbfYaMvAFQGcksB4oGePCgQJqNSDKG0UwVY22bhdy4tDBLeuxS1lfnRv8yUj73/MraApuW
	xjFGGSSih0htU6QKTYnAUKmXCxECdAeCsm7r9PXY9dC58c0dW6M6e24FrBoziaYItJQ5Um6JMB/8T
	2M5o1/vJQAkcGLGKYSp3MdVdawIo7CGU/De+CjQXhOe+z9e+vppyvp8uovhp+2x4t2n7B170rYq7q
	332ycBx6h6Lx1D0pxvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lJD-00000005bee-02E3;
	Thu, 26 Mar 2026 14:03:39 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lJ6-00000005beB-1B9E;
	Thu, 26 Mar 2026 14:03:37 +0000
Message-ID: <4a04d4bd-969e-4804-b938-cda8c0a626b6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774533805;
	bh=dkjZs7WKD/WSTNflqzehy3i+/gd5KrtTWk6FaK4d2QU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZLSd5s8BdQiW9ocJjlKnLqH32gFxNFAOO5OIbBvOxlv1Zk3WFgq+EpGIoDQ21dKd1
	 sPWfR7l2Eph+/s0n9YTDOJvIxR2QnkybNVD0aRjrD7Jhj+bMXAeg6M8Xb8igIPeq9C
	 lrMZsbUdJOmdU9lpoRZ674Lx9vmrUslRFJ45td1I=
Date: Thu, 26 Mar 2026 15:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v5 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-8-d3f182b48e9d@aliel.fr>
 <9bc23f1e-1cf3-43d1-935a-c4738d576c29@linaro.org>
Content-Language: en-US
In-Reply-To: <9bc23f1e-1cf3-43d1-935a-c4738d576c29@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_070332_787226_9DD19C45 
X-CRM114-Status: UNSURE (   9.23  )
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

T24gMy8yNi8yNiAxOjU1IFBNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiAzLzI2LzI2IDEw
OjU5LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4gQWRkIGJjbTQzNzUyIGNvbXBhdGlibGUgd2l0
aCBpdHMgYmNtNDMyOSBjb21wYXRpYmxlIGZhbGxiYWNrLgo+Pgo+PiBBY2tlZC1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9u
YWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4+IC0tLQo+PiDCoCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL2JyY20sYmNtNDMyOS0K
Pj4gZm1hYy55YW1sIHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC93
aXJlbGVzcy8KPj4gYnJjbSxiY200MzI5LWZtYWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvCj4+IHdpcmVsZXNzL2JyY20sYmNtNDMyOS1mbWFjLnlhbWwKPj4g
aW5kZXggM2JlNzU3Njc4NzY0NC4uODFmZDNlMzc0NTJhNiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC93aXJlbGVzcy9icmNtLGJjbTQzMjktCj4+
IGZtYWMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L3dpcmVsZXNzL2JyY20sYmNtNDMyOS0KPj4gZm1hYy55YW1sCj4+IEBAIC00Miw2ICs0Miw3IEBA
IHByb3BlcnRpZXM6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJyY20sYmNt
NDM1Ni1mbWFjCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJyY20sYmNtNDM1
OS1mbWFjCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJyY20sYmNtNDM2Ni1m
bWFjCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJyY20sYmNtNDM3NTItZm1hYwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjeXByZXNzLGN5dzQzNzMtZm1hYwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjeXByZXNzLGN5dzQzMDEyLWZtYWMK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gaW5maW5lb24sY3l3NDM0MzktZm1h
Ywo+Pgo+IAo+IEknbGwgYXBwbHkgYWxsIHRoZSBvdGhlciBEVCBwYXRjaGVzLCBwbGVhc2Ugc2Vu
ZCB0aGlzIG9uZSBhbG9uZSB3aXRoIHRoZQo+IFtQQVRDSCBuZXQtbmV4dF0gcHJlZml4IHNvIGl0
IGdldHMgcGlja2VkIGJ5IHRoZSB3aXJlbGVzcy9uZXQgcGVvcGxlLgo+IAo+IFRoYW5rcywKPiBO
ZWlsCgpJJ20gb24gaXQsIHRoYW5rIHlvdS4KCi0tIApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D241C28B2F
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Mar 2025 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XG04Nowf1lGJg2AWdRHx1Dyn7J9QiA+2gb9qNrxZRM=; b=Di9bf6F20Ordnu
	J3ilkptlaD4mnxYxrgr6/6leogjWgXh92C4iHFKXdMa+hm6mHHjEKynIdljN60kSPfypLZq3DECIt
	rcqD9HDQECZHwxx3jxYN1yxuf0gsYseE7KTgGYX8TAJnK0DCKXEXe6DBS7l/sjy7PJ5C5FVDOlwLm
	Asq32z9Pl88o2RK/w5fhJ9MYx8kvn4xUQUSR2Ng57y3TRgQR6sO1mD1MJ49ov9wNMUMWuE0lZId1c
	hvOfjvbPThNjuCLshpXt70Wyle6zon3poF1HPhdA8UUDZixg4yDVTeZZBL3Rcpm0ra1iewj7DXDK2
	FPt+TuJhxUJmClakU34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGXi-00000000YzY-2zTY;
	Sun, 09 Mar 2025 13:18:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW3-00000000YeD-3y20;
	Sun, 09 Mar 2025 13:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4EC1A45BD1;
	Sun,  9 Mar 2025 13:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 715BDC4CEE5;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741526185;
	bh=PoF8AvGS4wt5+cR37V0qaAD2Fcupg7Px2u0q9M3aolg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dm2b6DhjwyWpdZ36SDGlonr6xvckWaUBh0BCVRppKwuI1jaVzfSxd2GaRKCdw3Sqw
	 +fa9YwsdY42lY8fT5SW7/LUbeJ5CafICKhNlKlR3g7wAxHlk10WoLH1w1bB/VxNow0
	 zRPZaJxms9za9ikLeHkVeTQgptw445CdIuTlkyaSjCUUHyEF+JJgFuGcL4ihBL24Jp
	 0ZT4Eu7viAnlIs1BrwGjPA56sfSfe6DKnwK4h/J8lvEl3NjPYwXL4fY2bJZiXwK0bd
	 R7e1hRP2JIvzdDIZgxghUiVgm1syMtiWG7ODmjf+A1ntfjDNMTKbBxSjleNfK0uA4U
	 Gv6+TbQBC4/Eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58638C28B30;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Mar 2025 14:16:20 +0100
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: Add Ogoos AM3
MIME-Version: 1.0
Message-Id: <20250309-ugoos-am3-v1-1-38cab5a4725b@posteo.net>
References: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
In-Reply-To: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741526184; l=888;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cqqIMQAjsp7Lgq4pj0jk6mh06cp/exYekgA28kwLzGU=;
 b=MQdcbQ2DByDgPVBjz4/nCnfDMhGmDOXtL9cjBlqd/eSMIt6t2TQd3pYRCHyLK2iNWWYrpO+kI
 EHtBqcvSJfVAnhfzDFzxTwEEF+ptaGvBd6jxsVOa1Y/4QUCAeLFM1zN
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_061628_071494_FA6D2EF3 
X-CRM114-Status: UNSURE (   7.11  )
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKVGhlIFVnb29zIEFNMyBp
cyBhIHNtYWxsIHNldC10b3AgYm94IGJhc2VkIG9uIHRoZSBBbWxvZ2ljIFM5MTIgU29DLgoKICBo
dHRwczovL3Vnb29zLmNvbS91Z29vcy1hbTMtMTZnCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jD
pGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYW1sb2dpYy55YW1sIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2Ft
bG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dp
Yy55YW1sCmluZGV4IDA2NDc4NTFhZTFmNTVhMjdiZmIxNDgyNTI1MzJiY2YxNWNhOTA1YmYuLjc3
OTU2OGYxNThjZTk4NWUxZDEyZmJlZTczNDE4NTQ5Y2ZjNTg3MDUgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCkBAIC0xMjcsNiAr
MTI3LDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgICAgLSBtaW5peCxuZW8tdTloCiAgICAg
ICAgICAgICAgIC0gbmV4Ym94LGExCiAgICAgICAgICAgICAgIC0gdHJvbnNtYXJ0LHZlZ2Etczk2
CisgICAgICAgICAgICAgIC0gdWdvb3MsYW0zCiAgICAgICAgICAgICAgIC0gdmlkZW9zdHJvbmcs
Z3htLWtpaWktcHJvCiAgICAgICAgICAgICAgIC0gd2V0ZWssY29yZTIKICAgICAgICAgICAtIGNv
bnN0OiBhbWxvZ2ljLHM5MTIKCi0tIAoyLjQ4LjAucmMxLjIxOS5nYjZiNjc1N2Q3NzIKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

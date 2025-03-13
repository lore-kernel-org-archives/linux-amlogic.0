Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91E9C282DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Mar 2025 23:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3veuEz7PdxtMnA0o/YaJ2sGLDaGEViLBx3XKcPhhrok=; b=aBMm+4vgI/G2ts
	PJKI4RgUEXvIVjkFuBoujiEWW0FZrf0S4VPHE2+s/eI0lkhxdeCyg8Y35Nf/43UACHx62TfIHkak2
	NGYlOgDojGDkWwf33Hm83ArE3yUDur1gqe8w4CW7BilCi78NBSLEjzyrI/TocvVDRZnuxWfbsIv3T
	IcKP0hE9yYqIHDEOUmI2uEy6iXylFaWOGzYASPI5vLVfMzMN3QS44N5ysgJ4YmwSSArBAW7b6Gqiu
	NFhtqC6OCQgbR7vJmoWFy6FXTzn5U6cfldJx0DwRCB+Cb0vF8XQQmMknpteqiDniMdQ7AxVglt7AS
	ryjKaXDBFTMG0U2m6N/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrmE-0000000Cghv-2eHt;
	Thu, 13 Mar 2025 23:15:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhe-0000000CgFm-3WKO;
	Thu, 13 Mar 2025 23:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D6B4A4879C;
	Thu, 13 Mar 2025 23:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E3B9C4CEEA;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907461;
	bh=KS2yDSQRD5SU3vS+jOOmaz2xUBc5Ay1LiOZbJ7uVdFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a59F3BN171SoZoup7W9FWYHJcR8PQGpl6JPxtnoxyZPBNUjWX6rbyR5Zu8vUTs0dL
	 xDTyYTJVxLzo6fJsnxgq8j/xXYfawBkAVLJViLcpnrbQhf+aUieNVKa5WOP8GDtjQJ
	 LdkTVIl6BjSgVU2KZd4c9hx11KNuv232dgdYMm7aQuhT/ZveugX3t7hgO11CMQ2r3e
	 CO+nZkt+tjBBdn04FXZ6ICJHAv8PWgdSMnl5AoFGbCgd0umHu0eMU4hpYxDkAY+Ppc
	 9/7pjZlrHrw7WJkZ99quN7C7gqQLSjvy5OU/bzpzlnTcLFuPqnnte1tObQL+Aqieol
	 Ynoat3pThlyWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15474C35FF1;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 14 Mar 2025 00:10:59 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Message-Id: <20250314-ugoos-am3-v2-1-422104b0cec5@posteo.net>
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
In-Reply-To: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741907460; l=1023;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=5cSMNKg21bi7irPRvrIi1guYYUp67v6kD7IHJg+8xbU=;
 b=S/2RElaFOIwhwBy1p6gnq2FHNtTl0Uwx3R6e3so2rZAQV8z0N2wsMMgJYBCTdflA9hpgYFjTm
 AQ6jHvEW98wCFgHgmzwBOhBDYAHDhGe0ZIp8jON8TyS/urBQ8mzmEyr
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161102_944243_6B69AB7E 
X-CRM114-Status: UNSURE (   6.79  )
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
dHRwczovL3Vnb29zLmNvbS91Z29vcy1hbTMtMTZnCgpBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBKLiBO
ZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KClYyOgotIGZpeCB2ZW5kb3IgbmFtZSBp
biBwYXRjaCBzdWJqZWN0Ci0gYWRkIEtyenlzenRvZidzIEFDSwotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYW1sb2dpYy55YW1sCmluZGV4IDA2NDc4NTFhZTFmNTVhMjdiZmIxNDgyNTI1MzJi
Y2YxNWNhOTA1YmYuLjc3OTU2OGYxNThjZTk4NWUxZDEyZmJlZTczNDE4NTQ5Y2ZjNTg3MDUgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55
YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55
YW1sCkBAIC0xMjcsNiArMTI3LDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgICAgLSBtaW5p
eCxuZW8tdTloCiAgICAgICAgICAgICAgIC0gbmV4Ym94LGExCiAgICAgICAgICAgICAgIC0gdHJv
bnNtYXJ0LHZlZ2Etczk2CisgICAgICAgICAgICAgIC0gdWdvb3MsYW0zCiAgICAgICAgICAgICAg
IC0gdmlkZW9zdHJvbmcsZ3htLWtpaWktcHJvCiAgICAgICAgICAgICAgIC0gd2V0ZWssY29yZTIK
ICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM5MTIKCi0tIAoyLjQ4LjAucmMxLjIxOS5nYjZi
Njc1N2Q3NzIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EF560A2613
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j4ASfgYA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=FjwiwajX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zRYcyZiqJB2/NaJ5PdnLKPSX1JMiZH1HpGxdngiwWGc=; b=j4ASfgYAyiUeMPW2qD1j7InLjM
	wohuPn406Ci69yj0CXGaQX2MVp+ygFK+LtrtL6fNgo1WDaWh1JzV15nFiDw3jmbsksowI55/U0JX4
	57iogcd3Y1E6ogKrt1zhj+uYujdvdIJEVBxtkVcV6JIbyceQgnG5C2Bv2Xto3L21tU+7/Z5ZwKTc9
	4pWXpYv/woF7JNOoTfbxjhiS6kwjuYvIIY0fC1/EL4EWsSqdDJXIj+hjlu/wm1NBX5dvFQNAeq8cY
	alQZ/ef7ybkRaMRbcav3pTCmkwW8AcsqdGO2OZ8ki+8wAGlUVJrueGVW5RZBAwZDqbGXyEMnwgeVp
	OLV3PWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pX-00000001MlU-1C5T;
	Sun, 25 Oct 2026 19:24:31 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pQ-00000001MfB-2NZc;
	Sun, 25 Oct 2026 19:24:25 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ib518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:12 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ib518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956253;
	bh=NJPxs/DZ0HjQlCbUBgtmSDlVuqx+ElkjMOR/IqIVZf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FjwiwajXkgQagVzbN+XIIegq9IWfswZwGq9FRqHTBx9x7Q9G6Ki5wDmeIaJK3OxoJ
	 RNGyel9n+nlf2dicGavNJqDCCbmnGERaNCHYOZZr8meXyuY9zlVFTxeGJ6wLGNok96
	 Lk/xzOLN+l8Cm9brfiJx2MOZSbfU+TKUzsu9Bt2w=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 2/7] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Date: Sun, 25 Oct 2026 20:23:59 +0100
Message-ID: <20261025192404.209695-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122424_776232_35C33A4F 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+CgpBZGQgUzQgU29D
IHRvY29kZWMgY29tcGF0aWJpbGl0eSBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogSmllYmluZyBD
aGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBT
dGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL2FtbG9naWMsZzEyYS10b2Fjb2RlYy55YW1sICAgICAgICAgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hbWxvZ2ljLGcxMmEtdG9hY29kZWMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hbWxvZ2ljLGcxMmEt
dG9hY29kZWMueWFtbAppbmRleCAyM2Y4MmJiODk3NTAuLjdlMDUzYWFhMGY1OSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FtbG9naWMsZzEyYS10
b2Fjb2RlYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9hbWxvZ2ljLGcxMmEtdG9hY29kZWMueWFtbApAQCAtMjUsNiArMjUsNyBAQCBwcm9wZXJ0aWVz
OgogICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsZzEyYS10b2Fjb2RlYwogICAgICAgLSBpdGVt
czoKICAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gYW1sb2dpYyxzNC10b2Fjb2Rl
YwogICAgICAgICAgICAgICAtIGFtbG9naWMsc20xLXRvYWNvZGVjCiAgICAgICAgICAgLSBjb25z
dDogYW1sb2dpYyxnMTJhLXRvYWNvZGVjCiAKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

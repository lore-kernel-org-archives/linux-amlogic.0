Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F680606A33E
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=riJ4kIjN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LWzyWMI6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EVSpzFNFFS3APjYAh0UfvpECbhK7VI2lcC4J0wuYNro=; b=riJ4kIjN6aQ8IXFVQSsdyCdCLF
	9Je2w+xSEUdYwFn5U2YIUIa2BsYzzaLsvxgQTpyQZRCoxwg/S+I4nX8/9uL+EUjPNGABUGKekJKXU
	wRn6jYmuUCt/ejNMEBn+9f10CFP5jWllF87N3lprz1Ow/YWa1m7Bj6Pm4HgsmvFBloBoewAbOTa+1
	adSvniO4uvCmCA2hz3njIptXrMgRoyl9u5VI0jaa6kOuzWsvM6yUAa/uQIdtY91Of74o9U420/F65
	d9U7fp5s7+woNeEy7OqhTyCyuoCDj0Ymk6woC74VwdlkBoQaQ9baA1aGW1UR/3lw8Oe8waQ9MEPOw
	G2EcPiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pc-00000001Mqt-3ddN;
	Sun, 25 Oct 2026 19:24:36 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pU-00000001Mis-1obU;
	Sun, 25 Oct 2026 19:24:29 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5If518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:19 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5If518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956260;
	bh=bj6KPWTo+LHMG++Y0e1ZCHYnbGpBM6MvTOvl5Aw9wpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWzyWMI6J5a0mUiatjH6qhN4sQFR2QFkXuJmA8GrsbpCN7uq9KOfNrlHQ8VJDOxnO
	 pTPrV6Wh9HYWAAqImr8CMUoDM0Lb1JWkriB1Yh764aNMSG/RnrgncF/Oa/riO+7/HM
	 DGJjnh06KhGm7aBfvLTkwynH63VzxwBbvyi0qMGw=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 6/7] ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
Date: Sun, 25 Oct 2026 20:24:03 +0100
Message-ID: <20261025192404.209695-7-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122428_809066_33331667 
X-CRM114-Status: GOOD (  11.58  )
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

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgUzQgd2lkZ2V0IHJldXNlcyB0aGUgU00xIG11eCwgd2hvc2UgZW51bSByZWFkcyB0aGUg
ZGF0YSBzZWxlY3RvciBhdApiaXRzIDE5OjE4LCB3aGlsZSB0aGUgUzQgbWF0Y2ggZGF0YSB3cml0
ZXMgaXQgYXQgYml0cyAyMDoxOTogdGhlIFM0IGxhbmUKc2VsZWN0b3IgaXMgdGhyZWUgYml0cyB3
aWRlIGluc3RlYWQgb2YgdHdvLCB3aGljaCBtb3ZlcyB0aGUgZGF0YQpzZWxlY3RvciB1cCBieSBv
bmUgYml0LgoKV3JpdGVzIHRoZXJlZm9yZSBsYW5kIGluIHRoZSByaWdodCBwbGFjZSBidXQgcmVh
ZHMgY29tZSBmcm9tIHRoZSB3cm9uZwpiaXRzOiBzZWxlY3RpbmcgSTJTIEMgcHJvZ3JhbXMgdGhl
IGhhcmR3YXJlIGNvcnJlY3RseSwgeWV0IHRoZSBjb250cm9sCnJlcG9ydHMgSTJTIEEuIGFsc2Fj
dGwgdGhlbiBzdG9yZXMgdGhlIHdyb25nIHZhbHVlIGFuZCBicmVha3MgdGhlCnJvdXRpbmcgd2hl
biBpdCByZXN0b3JlcyBpdCBvbiB0aGUgbmV4dCBib290LgoKR2l2ZSBTNCBpdHMgb3duIGVudW0g
YXQgdGhlIHJpZ2h0IG9mZnNldC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2
dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIHNvdW5kL3NvYy9tZXNvbi9nMTJh
LXRvYWNvZGVjLmMgfCAxNyArKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24v
ZzEyYS10b2Fjb2RlYy5jIGIvc291bmQvc29jL21lc29uL2cxMmEtdG9hY29kZWMuYwppbmRleCAy
MDRiZjg2NTRkMmUuLmRiN2E0NDcwMzk1ZiAxMDA2NDQKLS0tIGEvc291bmQvc29jL21lc29uL2cx
MmEtdG9hY29kZWMuYworKysgYi9zb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jCkBAIC0y
MSw2ICsyMSw4IEBACiAKICNkZWZpbmUgVE9BQ09ERUNfQ1RSTDAJCQkweDAKICNkZWZpbmUgIENU
UkwwX0VOQUJMRV9TSElGVAkJMzEKKyNkZWZpbmUgIENUUkwwX0RBVF9TRUxfUzRfTVNCCQkyMAor
I2RlZmluZSAgQ1RSTDBfREFUX1NFTF9TNF9MU0IJCTE5CiAjZGVmaW5lICBDVFJMMF9EQVRfU0VM
X1NNMV9NU0IJCTE5CiAjZGVmaW5lICBDVFJMMF9EQVRfU0VMX1NNMV9MU0IJCTE4CiAjZGVmaW5l
ICBDVFJMMF9EQVRfU0VMX01TQgkJMTUKQEAgLTEyNiw2ICsxMjgsMTkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHNtMV90b2Fjb2RlY19tdXggPQogCQkJICBzbmRfc29j
X2RhcG1fZ2V0X2VudW1fZG91YmxlLAogCQkJICBnMTJhX3RvYWNvZGVjX211eF9wdXRfZW51bSk7
CiAKKy8qCisgKiBUaGUgUzQgbGFuZSBzZWxlY3RvciBpcyBvbmUgYml0IHdpZGVyIHRoYW4gdGhl
IFNNMSBvbmUsIHdoaWNoIHB1c2hlcyB0aGUKKyAqIGRhdGEgc2VsZWN0b3IgdXAgYnkgb25lIGJp
dCBhcyB3ZWxsLgorICovCitzdGF0aWMgU09DX0VOVU1fU0lOR0xFX0RFQ0woczRfdG9hY29kZWNf
bXV4X2VudW0sIFRPQUNPREVDX0NUUkwwLAorCQkJICAgIENUUkwwX0RBVF9TRUxfUzRfTFNCLAor
CQkJICAgIGcxMmFfdG9hY29kZWNfbXV4X3RleHRzKTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBz
bmRfa2NvbnRyb2xfbmV3IHM0X3RvYWNvZGVjX211eCA9CisJU09DX0RBUE1fRU5VTV9FWFQoIlNv
dXJjZSIsIHM0X3RvYWNvZGVjX211eF9lbnVtLAorCQkJICBzbmRfc29jX2RhcG1fZ2V0X2VudW1f
ZG91YmxlLAorCQkJICBnMTJhX3RvYWNvZGVjX211eF9wdXRfZW51bSk7CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBnMTJhX3RvYWNvZGVjX291dF9lbmFibGUgPQogCVNP
Q19EQVBNX1NJTkdMRV9BVVRPRElTQUJMRSgiU3dpdGNoIiwgVE9BQ09ERUNfQ1RSTDAsCiAJCQkJ
ICAgIENUUkwwX0VOQUJMRV9TSElGVCwgMSwgMCk7CkBAIC0xNDYsNyArMTYxLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IHNtMV90b2Fjb2RlY193aWRnZXRzW10g
PSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBzNF90b2Fjb2Rl
Y193aWRnZXRzW10gPSB7CiAJU05EX1NPQ19EQVBNX01VWCgiU1JDIiwgVE9BQ09ERUNfQ1RSTDAs
IENUUkwwX0JDTEtfRU5BQkxFX1NISUZULCAwLAotCQkJICZzbTFfdG9hY29kZWNfbXV4KSwKKwkJ
CSAmczRfdG9hY29kZWNfbXV4KSwKIAlTTkRfU09DX0RBUE1fU1dJVENIKCJPVVQgRU4iLCBUT0FD
T0RFQ19DVFJMMCwgQ1RSTDBfTUNMS19FTkFCTEVfU0hJRlQsIDAsCiAJCQkgICAgJmcxMmFfdG9h
Y29kZWNfb3V0X2VuYWJsZSksCiB9OwotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB74606EEBD
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jkOq2vqE;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=G3EOz9Ac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=isnpHnOdPyX58i58ArNkFsKSerC1fkECksJoB2MmL3M=; b=jkOq2vqEnuLxdCWzUne/esNd23
	E5uOm/ZAHQt4OpPtOpBBxjh+ReWkf0NpV5cqE6QHLOC7M8yDZUB5Woc3cU93JzebeykKeKDTprfyj
	t/Dw1BnXogF2HvKkBdct6+1iN5AYIYuGUxZIiIs70ulTqbc0ZrqWHTRvvWU5HZSRx2LPgaMzoPM+J
	tE1ETj5yCWj5+8i42a+peSXi9NHBIfiD1+/TmdJi4DkjAfhJgz4trk9hKGo+V8cWk3EGhNvoaRepC
	Nc8ZxPGnnhmDhAplr94R+PkWr+DmO9wp1+puFTym/UKvYRfi/wrT7uWYMGxUNlumVk5tQpF7MGF9p
	ZTYKWU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTk-0000000C0Xr-49UB;
	Fri, 06 Nov 2026 10:47:28 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTb-0000000C0C2-1uJh;
	Fri, 06 Nov 2026 10:47:22 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07N1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:12 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07N1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962033;
	bh=u0/1yZqyMqZgrqdKxjA/v+I1p+wWzkCYmQc60+OXlpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G3EOz9Ac458kVeD1Ou6QJVwzbATectXcOTrc3xZpBpbWUV3PIiiqDARCf3SCm87TE
	 59x2hBYH0F0rv4VGZOf+p5xA+byFm34VZRBiwLsb5fhr09uwqeHEcTPf0s49JfWfI+
	 jHOZRWO9Apek3y8+MOG4eoW9X37WHACPZ+xp4jnk=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
Date: Fri,  6 Nov 2026 11:46:57 +0100
Message-ID: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024719_910653_8238D872 
X-CRM114-Status: UNSURE (   8.96  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpBZGQgdGhlIHR3byBVU0IyIFBIWXMgYW5kIHRoZSBVU0IgZ2x1ZSB3aXRoIGl0cyB4SENJIGhv
c3QgY29udHJvbGxlci4KVGhlIFM0IGhhcyBubyBVU0IzIFBIWSwgc28gdGhlIGhvc3QgcnVucyBV
U0IyIG9ubHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwg
PGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tczQuZHRzaSB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0
c2kKaW5kZXggOGJiZDcwZTUyYTI5Li4xNTU5OTc2NDlkYzMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCkBAIC03NzAsNiArNzcwLDI2IEBAIGNwdV90ZW1wOiB0
ZW1wZXJhdHVyZS1zZW5zb3JAMjAwMDAgewogCQkJCWFtbG9naWMsc2VjdXJlLW1vbml0b3IgPSA8
JnNtIDE+OwogCQkJfTsKIAorCQkJdXNiMl9waHkwOiBwaHlAM2MwMDAgeworCQkJCWNvbXBhdGli
bGUgPSAiYW1sb2dpYyxzNC11c2IyLXBoeSI7CisJCQkJcmVnID0gPDB4MCAweDNjMDAwIDB4MCAw
eDIwMDA+OworCQkJCWNsb2NrcyA9IDwmeHRhbD47CisJCQkJY2xvY2stbmFtZXMgPSAieHRhbCI7
CisJCQkJcmVzZXRzID0gPCZyZXNldCBSRVNFVF9VU0JQSFkyMD47CisJCQkJcmVzZXQtbmFtZXMg
PSAicGh5IjsKKwkJCQkjcGh5LWNlbGxzID0gPDA+OworCQkJfTsKKworCQkJdXNiMl9waHkxOiBw
aHlAM2UwMDAgeworCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC11c2IyLXBoeSI7CisJCQkJ
cmVnID0gPDB4MCAweDNlMDAwIDB4MCAweDIwMDA+OworCQkJCWNsb2NrcyA9IDwmeHRhbD47CisJ
CQkJY2xvY2stbmFtZXMgPSAieHRhbCI7CisJCQkJcmVzZXRzID0gPCZyZXNldCBSRVNFVF9VU0JQ
SFkyMT47CisJCQkJcmVzZXQtbmFtZXMgPSAicGh5IjsKKwkJCQkjcGh5LWNlbGxzID0gPDA+Owor
CQkJfTsKKwogCQkJZXRoX3BoeTogbWRpby1tdWx0aXBsZXhlckAyODAwMCB7CiAJCQkJY29tcGF0
aWJsZSA9ICJhbWxvZ2ljLGcxMmEtbWRpby1tdXgiOwogCQkJCXJlZyA9IDwweDAgMHgyODAwMCAw
eDAgMHhhND47CkBAIC05ODgsNiArMTAwOCwzMSBAQCBtZGlvMDogbWRpbyB7CiAJCQl9OwogCQl9
OwogCisJCXVzYjogdXNiQGZlMDNhMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNv
bi1zNC11c2ItY3RybCIsCisJCQkJICAgICAiYW1sb2dpYyxtZXNvbi1nMTJhLXVzYi1jdHJsIjsK
KwkJCXJlZyA9IDwweDAgMHhmZTAzYTAwMCAweDAgMHhhMD47CisJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTI5IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47
CisJCQkjc2l6ZS1jZWxscyA9IDwyPjsKKwkJCXJhbmdlczsKKwkJCWNsb2NrcyA9IDwmY2xrY19w
ZXJpcGhzIENMS0lEX1VTQj47CisJCQlyZXNldHMgPSA8JnJlc2V0IFJFU0VUX1VTQkNUUkw+Owor
CQkJcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX1M0X1VTQl9DT01CX0lEPjsKKwkJCWRyX21v
ZGUgPSAiaG9zdCI7CisJCQlwaHlzID0gPCZ1c2IyX3BoeTA+LCA8JnVzYjJfcGh5MT47CisJCQlw
aHktbmFtZXMgPSAidXNiMi1waHkwIiwgInVzYjItcGh5MSI7CisJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOworCisJCQljcmdfeGhjaTogdXNiQGZkZTAwMDAwIHsKKwkJCQljb21wYXRpYmxlID0gImdl
bmVyaWMteGhjaSI7CisJCQkJcmVnID0gPDB4MCAweGZkZTAwMDAwIDB4MCAweDEwMDAwMD47CisJ
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEzMCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQlj
bG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9VU0IxX1RPX0REUj47CisJCQkJc3RhdHVzID0g
Im9rYXkiOworCQkJfTsKKwkJfTsKKwogCQl1YXJ0X2E6IHNlcmlhbEBmZTA3ODAwMCB7CiAJCQlj
b21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tczQtdWFydCIsCiAJCQkJICAgICAiYW1sb2dpYyxt
ZXNvbi1hby11YXJ0IjsKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

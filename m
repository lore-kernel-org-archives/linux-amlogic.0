Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C975A606D833
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yxb4b9Au;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=UmF8bcF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8mIk6Knkq6JVFahJ+ZA0bqrJawkGU34CdqD18f9ukUg=; b=yxb4b9AuaesAPDLbOKRWxUn9UB
	F3n7+1hTbLuJJCzkNbz46HRZ5BmPdgyPjVZkalUntTJTCIBQxA5QKYEL/QJg9APjy/y0OHUQewwvZ
	DtlJLQeUOi1loYFQNn5yr8OS1V3BiQ/AGUHCAbVyW5jeu492OQ5Lh2Rl5AHXcuYfyeP5VSFSZm5Xi
	c4tZvLk1yrfjpnzolifsNPb9I4ZO4hK8WMxkdrS9ohjRaYmRe1jt4QGB51d/Y+CHmfV5EuITaQFy5
	uxHlOqgqr1j7UGcY60e7qOmYCYjJPGXu9mLBQ20M/1RM2pmEDsKWea5H7iPaSJVR2Rg5eKYF06tcP
	WTEB23sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTf-0000000C0MC-0AEW;
	Fri, 06 Nov 2026 10:47:23 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTZ-0000000C09K-2bzm;
	Fri, 06 Nov 2026 10:47:19 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07L1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07L1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962030;
	bh=tcFiQk9INcP1NyiO/VB8I2WdTS9SqK6ZO3Kat/I+crQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UmF8bcF1e1gKyJgQXP8empdFqOyOuLai7XBv+uhWBnnSA6fBJJ4q/L/CQDcT8P1JS
	 T9EaiOHxI3Q28di/59Fo14aWXU2MLypxBq48S9khE8HlAR2/GvRDCPGljeNFEgwgn7
	 FHT1lB0anQLHGRYlWJ7QEG4D2jrFuivTkTbAzl/E=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 06/10] arm64: dts: amlogic: meson-s4: add the CPU thermal sensor and zone
Date: Fri,  6 Nov 2026 11:46:55 +0100
Message-ID: <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024718_008966_0C358776 
X-CRM114-Status: GOOD (  10.97  )
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
CgpBZGQgdGhlIENQVSB0ZW1wZXJhdHVyZSBzZW5zb3Igd2l0aCBpdHMgYnVzIGFuZCBmdW5jdGlv
bmFsIGNsb2NrczsgaXQKcmVhZHMgaXRzIGNhbGlicmF0aW9uIHRocm91Z2ggdGhlIHNlY3VyZSBt
b25pdG9yLiBBZGQgYSBDUFUgdGhlcm1hbAp6b25lIHdpdGggYSBwYXNzaXZlIHRyaXAgdGhhdCB0
aHJvdHRsZXMgdGhlIEdQVSwgd2hpY2ggc2hhcmVzIHRoZSBkaWUsCmFuZCBhIGhvdCBhbmQgYSBj
cml0aWNhbCB0cmlwLiBUaGUgQ1BVcyBjYW4gam9pbiB0aGUgcGFzc2l2ZSB0cmlwIG9uY2UKQ1BV
IGZyZXF1ZW5jeSBzY2FsaW5nIGlzIGluIHBsYWNlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgfCA0OCArKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCmluZGV4IDY5MTA1YzhhYmYxMi4uMWU4Yjg0NWI4MGMz
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQpAQCAtMTEsNiAr
MTEsNyBAQAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGVyaXBoZXJh
bHMtY2xrYy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL21lc29uLXM0LXBvd2VyLmg+
CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1zNC1yZXNldC5oPgor
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPgogCiAvIHsKIAljcHVzIHsK
QEAgLTc0OCw2ICs3NDksMTcgQEAgZ3Bpb19pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0MDgw
IHsKIAkJCQkJPDEwIDExIDEyIDEzIDE0IDE1IDE2IDE3IDE4IDE5IDIwIDIxPjsKIAkJCX07CiAK
KwkJCWNwdV90ZW1wOiB0ZW1wZXJhdHVyZS1zZW5zb3JAMjAwMDAgeworCQkJCWNvbXBhdGlibGUg
PSAiYW1sb2dpYyxzNC10aGVybWFsIjsKKwkJCQlyZWcgPSA8MHgwIDB4MjAwMDAgMHgwIDB4NTA+
OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJ
CQljbG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9UU19QTEw+LAorCQkJCQkgPCZjbGtjX3Bl
cmlwaHMgQ0xLSURfVFM+OworCQkJCWNsb2NrLW5hbWVzID0gImJ1cyIsICJjb3JlIjsKKwkJCQkj
dGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MD47CisJCQkJYW1sb2dpYyxzZWN1cmUtbW9uaXRvciA9
IDwmc20gMT47CisJCQl9OworCiAJCQlldGhfcGh5OiBtZGlvLW11bHRpcGxleGVyQDI4MDAwIHsK
IAkJCQljb21wYXRpYmxlID0gImFtbG9naWMsZzEyYS1tZGlvLW11eCI7CiAJCQkJcmVnID0gPDB4
MCAweDI4MDAwIDB4MCAweGE0PjsKQEAgLTEwMjUsNCArMTAzNyw0MCBAQCBlbW1jOiBtbWNAZmUw
OGMwMDAgewogCQkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+OwogCQl9OwogCX07
CisKKwl0aGVybWFsLXpvbmVzIHsKKwkJY3B1LXRoZXJtYWwgeworCQkJcG9sbGluZy1kZWxheSA9
IDwxMDAwPjsKKwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwxMDA+OworCQkJdGhlcm1hbC1z
ZW5zb3JzID0gPCZjcHVfdGVtcD47CisKKwkJCXRyaXBzIHsKKwkJCQljcHVfcGFzc2l2ZTogY3B1
LXBhc3NpdmUgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDw4NTAwMD47CisJCQkJCWh5c3RlcmVzaXMg
PSA8NTAwMD47CisJCQkJCXR5cGUgPSAicGFzc2l2ZSI7CisJCQkJfTsKKworCQkJCWNwdV9ob3Q6
IGNwdS1ob3QgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDw5NTAwMD47CisJCQkJCWh5c3RlcmVzaXMg
PSA8NTAwMD47CisJCQkJCXR5cGUgPSAiaG90IjsKKwkJCQl9OworCisJCQkJY3B1X2NyaXRpY2Fs
OiBjcHUtY3JpdGljYWwgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDwxMDUwMDA+OworCQkJCQloeXN0
ZXJlc2lzID0gPDEwMDA+OworCQkJCQl0eXBlID0gImNyaXRpY2FsIjsKKwkJCQl9OworCQkJfTsK
KwkJCWNvb2xpbmctbWFwcyB7CisJCQkJLyogdGhlIEdQVSBzaGFyZXMgdGhlIGRpZSBhbmQgdGhl
IHNlbnNvciAqLworCQkJCW1hcDAgeworCQkJCQl0cmlwID0gPCZjcHVfcGFzc2l2ZT47CisJCQkJ
CWNvb2xpbmctZGV2aWNlID0gPCZncHUgVEhFUk1BTF9OT19MSU1JVAorCQkJCQkJCSAgVEhFUk1B
TF9OT19MSU1JVD47CisJCQkJfTsKKwkJCX07CisJCX07CisJfTsKIH07Ci0tIAoyLjU2LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

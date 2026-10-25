Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77415606A330
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cLXXZxkk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=FPRPiAoC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YnizUZgwgZSGFmZ0QF8YFy20b6JcVGJVgG7nWvpZgCY=; b=cLXXZxkkz5AHp5tMbo7JXaRxiZ
	ijMX8PDef1LCA83FgykJ7lmfYn20Ocbb+nWxee0rl5Mv0b/uR5zu0zy2v9sbO5Tcp0N5KLaHC0yK/
	ohub+/wj4iIXyNpXs+GclQXTunLmWbpp3L4tKSrOvdq+i637jGxwglWBcIkhnf4OyXAW588VAvG8E
	V86RdUQIrCyHVr9AuZtltb+VHCRAgvjLQLIVcmuSlXkVUOxLSTogsQoIQ7j435iZog96a1AlwTJ0e
	w/tN09vMn2J9C+zhrrLDuAzf8gq5nzFtBCroGas7khaq30Y4zNrAvUt7p8G00QEnM8GbyReUgBqOa
	LE1U46rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mS-00000001KY0-0kJJ;
	Sun, 25 Oct 2026 19:21:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mN-00000001KRn-19UG;
	Sun, 25 Oct 2026 19:21:16 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJL1Gv515970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJL1Gv515970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956068;
	bh=VZCgXEGk8gn25schLnnYeMptMnn1cMJhy1WitpRraNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FPRPiAoCzBC0ddZb05Ox6Fz/koxRK8hNOj7ZmWMpMpuuWJJXb7hczGOsFWMGm84ry
	 Iqn8LNjmYpyHsih7cgwah5EzjUGccxiQUHaQ8TWxl+/dk8uLsA/pwpDaPZRPcwd+1a
	 tZoqbTpylLIa/EYPHjaSi3rfWcHWJ3jAYkDvutyY=
From: christian.koever-draxl@student.uibk.ac.at
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] mmc: meson-gx: allow the core clock phase to be set from DT
Date: Sun, 25 Oct 2026 20:20:59 +0100
Message-ID: <20261025192059.208792-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122115_774751_5791BB99 
X-CRM114-Status: GOOD (  11.84  )
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
CgpUaGUgY29yZSBwaGFzZSBpcyBoYXJkY29kZWQgdG8gMTgwIGRlZ3JlZXMuIE9uIGFuIFM5MDVX
MiBib2FyZCB0aGUgU0QKY2FyZCBmYWlscyB3aXRoIENSQyBlcnJvcnMgKC1FSUxTRVEpIHJpZ2h0
IGFmdGVyIHN3aXRjaGluZyB0byBoaWdoCnNwZWVkIGF0IDUwIE1Iei4KClN3ZWVwaW5nIHRoZSBj
b3JlIHBoYXNlIG9uIHRoZSBsaXZlIGNvbnRyb2xsZXIgc2hvd2VkIHRoYXQgMjcwIGRlZ3JlZXMK
d29ya3Mgb24gdGhhdCBzbG90LCBhcyB0aGUgdmVuZG9yIGtlcm5lbCdzIGluaXRfY29yZV9waGFz
ZSBzZXR0aW5nCmRvZXMuIFdpdGggaXQgdGhlIGNhcmQgcnVucyBhdCA1MCBNSHo6IDIxLjcgTUIv
cyBzZXF1ZW50aWFsIHJlYWQsCjYuMyBNQi9zIHdyaXRlLCBkYXRhIHZlcmlmaWVkIGJ5IGNoZWNr
c3VtLgoKUmVhZCB0aGUgb3B0aW9uYWwgYW1sb2dpYyxjb3JlLXBoYXNlLWRlZ3JlZXMgcHJvcGVy
dHkgYW5kIGtlZXAgMTgwCmRlZ3JlZXMgYXMgdGhlIGRlZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBk
cml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIHwgMTcgKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9kcml2ZXJzL21tYy9ob3N0L21l
c29uLWd4LW1tYy5jCmluZGV4IDY5NGJiNDQzZDVmMy4uNDJjODU1MjQ4Njc1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCisrKyBiL2RyaXZlcnMvbW1jL2hvc3Qv
bWVzb24tZ3gtbW1jLmMKQEAgLTQyNSwxMiArNDI1LDI1IEBAIHN0YXRpYyBpbnQgbWVzb25fbW1j
X2Nsa19pbml0KHN0cnVjdCBtZXNvbl9ob3N0ICpob3N0KQogCWludCBpLCByZXQgPSAwOwogCWNv
bnN0IGNoYXIgKm11eF9wYXJlbnRfbmFtZXNbTVVYX0NMS19OVU1fUEFSRU5UU107CiAJY29uc3Qg
Y2hhciAqY2xrX3BhcmVudFsxXTsKLQl1MzIgY2xrX3JlZzsKKwl1MzIgY2xrX3JlZywgY29yZV9w
aGFzZSA9IDE4MDsKKworCS8qCisJICogMTgwIGRlZ3JlZXMgc3VpdHMgbW9zdCBib2FyZHMsIGJ1
dCBzb21lIG9ubHkgc2FtcGxlIHJlbGlhYmx5IGF0CisJICogaGlnaCBzcGVlZCB3aXRoIGFub3Ro
ZXIgY29yZSBwaGFzZSAodGhlIHZlbmRvciB0cmVlcyBjYXJyeSB0aGlzIGFzCisJICogImluaXRf
Y29yZV9waGFzZSIpLiBUaGUgZmllbGQgaXMgaW4gOTAgZGVncmVlIHN0ZXBzLgorCSAqLworCWRl
dmljZV9wcm9wZXJ0eV9yZWFkX3UzMihob3N0LT5kZXYsICJhbWxvZ2ljLGNvcmUtcGhhc2UtZGVn
cmVlcyIsCisJCQkJICZjb3JlX3BoYXNlKTsKKwlpZiAoY29yZV9waGFzZSAlIDkwIHx8IGNvcmVf
cGhhc2UgPiAyNzApIHsKKwkJZGV2X3dhcm4oaG9zdC0+ZGV2LCAiaW52YWxpZCBhbWxvZ2ljLGNv
cmUtcGhhc2UtZGVncmVlcyAldSwgdXNpbmcgMTgwXG4iLAorCQkJIGNvcmVfcGhhc2UpOworCQlj
b3JlX3BoYXNlID0gMTgwOworCX0KIAogCS8qIGluaXQgU0RfRU1NQ19DTE9DSyB0byBzYW5lIGRl
ZmF1bHRzIHcvbWluIGNsb2NrIHJhdGUgKi8KIAljbGtfcmVnID0gQ0xLX0FMV0FZU19PTihob3N0
KTsKIAljbGtfcmVnIHw9IENMS19ESVZfTUFTSzsKLQljbGtfcmVnIHw9IEZJRUxEX1BSRVAoQ0xL
X0NPUkVfUEhBU0VfTUFTSywgQ0xLX1BIQVNFXzE4MCk7CisJY2xrX3JlZyB8PSBGSUVMRF9QUkVQ
KENMS19DT1JFX1BIQVNFX01BU0ssIGNvcmVfcGhhc2UgLyA5MCk7CiAJY2xrX3JlZyB8PSBGSUVM
RF9QUkVQKENMS19UWF9QSEFTRV9NQVNLLCBDTEtfUEhBU0VfMCk7CiAJY2xrX3JlZyB8PSBGSUVM
RF9QUkVQKENMS19SWF9QSEFTRV9NQVNLLCBDTEtfUEhBU0VfMCk7CiAJaWYgKGhvc3QtPm1tYy0+
Y2FwcyAmIE1NQ19DQVBfU0RJT19JUlEpCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

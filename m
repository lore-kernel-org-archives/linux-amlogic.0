Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7DA606A31A
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADwYBtWZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=fmtS+6Dn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MZ2CC04SguZpoF7GFdeYJ0Kqc+F6wQHMVv21kcEHZ0w=; b=ADwYBtWZ6u+wwpiBCHwiftTiRL
	YOkJ3DZ8IJX80Ga8ylAUc2Bz8GY1gPFYe6Zc3Od9aBcqUE3NjfRyQwPvJwARz7dKLWNUPiNdQWbug
	L5riV+E75LlhmPEWNOT9HYWSTT6glhTlqMQTGcuH1o408sPwK8LfQrmXknuLNHpPjSpWlj0hl7E3m
	lyxXptNQf5ZEPl/hStqduUa4GHnYslY68BHpaJdSDtkHwYOR0wbeSRa/gkQkbW6/b1OzgWTYLJS1y
	bENYni43WBUxZD5h63j5+CVKILSe9uzA4P5W2xp0/UVxeZK7Gko6TvIxzocNdX2bpfO4cBfdxKrW2
	3K4ApXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mA-00000001KOX-1AdE;
	Sun, 25 Oct 2026 19:21:02 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3m7-00000001KNM-1iOG;
	Sun, 25 Oct 2026 19:21:00 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJKmsL515844
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:20:52 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJKmsL515844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956052;
	bh=75Y6P3mxr5SFh4Kr/TaY5+EyHwuhs2vmH3vTMgy6sd0=;
	h=From:To:Cc:Subject:Date;
	b=fmtS+6DnQnxdLoC9LXUAPC6Bg1qkXx+UyFJenZYDVVjWZqIywInzr3jKJbpf14NGo
	 106vHdwuGOgQYVjgW54nW/xlh9wJkVzGgJ5W1QszLR18EsmU1L9zuA3nllLcP3hRpb
	 LwbvOLIJZZ+8OuYd6AWZYminhro6O6XsMaLbnt/E=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, hverkuil@kernel.org, mchehab@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] media: cec: meson: ao-cec: enable the controller clock at probe
Date: Sun, 25 Oct 2026 20:20:46 +0100
Message-ID: <20261025192046.208710-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122059_778614_0D508FC3 
X-CRM114-Status: GOOD (  16.34  )
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
CgpUaGUgQ0VDIGNvcmUgY2FsbHMgLmFkYXBfbG9nX2FkZHIoKSBiZWZvcmUgLmFkYXBfZW5hYmxl
KCksIHNvIHRoZSBmaXJzdApyZWdpc3RlciBhY2Nlc3MgY2FuIGhhcHBlbiB3aGlsZSB0aGUgY29u
dHJvbGxlciBpcyBzdGlsbCBpbiBwb3dlci1vZmYKbW9kZSAoQ0VDX0dFTl9DTlRMIGNsb2NrIGZp
ZWxkIDApLiBUaGUgcHJvYmUgb25seSBwdWxzZXMgdGhlIHJlc2V0IGJpdAphbmQgbGVhdmVzIHRo
ZSBjbG9jayBmaWVsZCBhdCB6ZXJvLgoKT24gUzQgYW4gYWNjZXNzIHRvIHRoZSBwb3dlcmVkLW9m
ZiBjb250cm9sbGVyIG5ldmVyIGNvbXBsZXRlczogaXQKc3RhbGxzIHRoZSBBTyBidXMgYW5kIGhh
cmQtaGFuZ3MgdGhlIFNvQy4gVGhpcyB0cmlnZ2VycyBvbiBldmVyeSBIRE1JCnVucGx1ZywgYmVj
YXVzZSB0aGF0IGludmFsaWRhdGVzIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBtYWtlcyB0aGUK
Y29yZSByZXdyaXRlIHRoZSBsb2dpY2FsIGFkZHJlc3MuCgpMZWF2ZSB0aGUgY29udHJvbGxlciB3
aXRoIGl0cyBjbG9jayBydW5uaW5nIGFmdGVyIHRoZSByZXNldCBhdCBwcm9iZSwKYXMgLmFkYXBf
ZW5hYmxlKCkgd291bGQuCgpGaXhlczogN2VjMmMwZjcyY2IxICgibWVkaWE6IHBsYXRmb3JtOiBB
ZGQgQW1sb2dpYyBNZXNvbiBBTyBDRUMgQ29udHJvbGxlciBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0t
ClRvb2wgdXNlIChEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQucnN0KToK
VGhpcyB3b3JrIHdhcyBkb25lIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkgY29kaW5nIGFzc2lzdGFu
dCwgQ2xhdWRlCihBbnRocm9waWMpLCB1c2VkIHRocm91Z2ggQ2xhdWRlIENvZGUgb3ZlciBtYW55
IHNlc3Npb25zLiBJdCBkaWQgYSBsYXJnZQpwYXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3JrOiBpdCBy
ZWFkIHRoZSB2ZW5kb3Iga2VybmVsIGFuZCB0aGUgZmlybXdhcmUKaW50ZXJmYWNlcywgcHJvYmVk
IHJlZ2lzdGVycyBvbiB0aGUgYm9hcmQsIGRyYWZ0ZWQgdGhlIGNvZGUgYW5kIHRoZQpjaGFuZ2Vs
b2dzLCBhbmQgcmFuIHRoZSBidWlsZHMsIGNoZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hlY2sgYW5k
IHRoZQp0ZXN0cyBvbiB0aGUgaGFyZHdhcmUuIEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJldmlld2Vk
IGV2ZXJ5IGNoYW5nZSBhbmQKdGhlIGZpbmFsIHBhdGNoZXMsIGFuZCB0YWtlIHJlc3BvbnNpYmls
aXR5IGZvciB0aGVtLiBUaGVyZSBpcyBubyBzaW5nbGUKcHJvbXB0IHRvIHF1b3RlOyB0aGUgc2Vz
c2lvbnMgd2VyZSBvZiB0aGUgZm9ybSAiZmluZCBvdXQgd2h5IFggZmFpbHMgb24KdGhpcyBib2Fy
ZCwgZml4IGl0LCB0ZXN0IGl0IG9uIHRoZSBib3giLgoKVGVzdGVkIG9uIGFuIEFtZWRpYXRlY2gg
WDk4USBUViBib3ggKEFtbG9naWMgUzkwNVcyLCBTNCBmYW1pbHksIDIgR2lCKSwKdmVuZG9yIFUt
Qm9vdCBhbmQgQkwzMS9PUC1URUUsIExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KCiBkcml2ZXJz
L21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYyB8IDIxICsrKysrKysrKysrKysrKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmMgYi9k
cml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYwppbmRleCAyZGYwZDM3NDMw
NzcuLmRkNGQ5MWQ3YjkyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0v
bWVzb24vYW8tY2VjLmMKKysrIGIvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8t
Y2VjLmMKQEAgLTY3NCw4ICs2NzQsMjUgQEAgc3RhdGljIGludCBtZXNvbl9hb19jZWNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0IDwgMCkKIAkJZ290byBvdXRf
cHJvYmVfbm90aWZ5OwogCi0JLyogU2V0dXAgSGFyZHdhcmUgKi8KLQl3cml0ZWxfcmVsYXhlZChD
RUNfR0VOX0NOVExfUkVTRVQsCisJLyoKKwkgKiBTZXR1cCBIYXJkd2FyZS4KKwkgKgorCSAqIExl
YXZlIHRoZSBjb250cm9sbGVyIHdpdGggaXRzIGdhdGVkIGNsb2NrIHJ1bm5pbmcuIFRoZSBDRUMg
Y29yZQorCSAqIGNhbGxzIC5hZGFwX2xvZ19hZGRyKCkgYmVmb3JlIGl0IGV2ZXIgY2FsbHMgLmFk
YXBfZW5hYmxlKCksIHNvIHRoZQorCSAqIGZpcnN0IHJlZ2lzdGVyIGFjY2VzcyBoYXBwZW5zIHdo
aWxlIHRoZSBibG9jayB3b3VsZCBvdGhlcndpc2Ugc3RpbGwKKwkgKiBiZSBpbiBwb3dlci1vZmYg
bW9kZSAoQ0VDX0dFTl9DTlRMIGNsayBmaWVsZCA9PSAwKS4gT24gQW1sb2dpYyBTNAorCSAqIHRo
YXQgYWNjZXNzIG5ldmVyIGNvbXBsZXRlczogaXQgc3RhbGxzIHRoZSBBTyBidXMgYW5kIGhhcmQt
aGFuZ3MgdGhlCisJICogU29DIC0gZXZlcnkgQ1BVIHN0b3BzLCBJUlFzIGluY2x1ZGVkIC0gd2hp
Y2ggaGFwcGVucyBvbiBldmVyeSBIRE1JCisJICogaG90LXVucGx1ZywgYmVjYXVzZSB0aGF0IGlz
IHdoYXQgaW52YWxpZGF0ZXMgdGhlIENFQyBwaHlzaWNhbAorCSAqIGFkZHJlc3MuCisJICovCisJ
d3JpdGVsX3JlbGF4ZWQoQ0VDX0dFTl9DTlRMX1JFU0VUIHwKKwkJICAgICAgIEZJRUxEX1BSRVAo
Q0VDX0dFTl9DTlRMX0NMS19DVFJMX01BU0ssCisJCQkJICBDRUNfR0VOX0NOVExfQ0xLX0VOQUJM
RSksCisJCSAgICAgICBhb19jZWMtPmJhc2UgKyBDRUNfR0VOX0NOVExfUkVHKTsKKwlmc2xlZXAo
MTAwKTsKKwl3cml0ZWxfcmVsYXhlZChGSUVMRF9QUkVQKENFQ19HRU5fQ05UTF9DTEtfQ1RSTF9N
QVNLLAorCQkJCSAgQ0VDX0dFTl9DTlRMX0NMS19FTkFCTEUpLAogCQkgICAgICAgYW9fY2VjLT5i
YXNlICsgQ0VDX0dFTl9DTlRMX1JFRyk7CiAKIAlyZXR1cm4gMDsKCmJhc2UtY29tbWl0OiA3YmU0
YmM1MmZkOWUwZTU1ZGM5YTJlMDIzMmI4OTQyN2QyYzRiNjE0Ci0tIAoyLjU2LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

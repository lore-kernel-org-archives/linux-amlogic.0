Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE36D606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SMl7q03o;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Wq7bNyJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AggZHwqI+RYZsjEbMhPt1fy9trdX7kaD93lWHNmAz30=; b=SMl7q03olpTVzJD4es42+W2dDK
	3QysGHf57TMFE/Nu8ejV1lxVs+eUHfZtftSnXfBVIR449Qkl4A+HVuRdu7yTgTEoVQmIitvDDENTd
	8qZ8mbdN0I1Y7SnNsvrt6hFp1jvj5Sa96IDNdNm0oJsS+UrGwdpJxh4s6y4Dz2HcaOB+MejXsR4VE
	I/Wr9aR5QsflCsx7dnJDJkgrKinJCmP3/MTWY4f93Hv2Na07NRPTR8l/HD6s0+QeuNM1Rum54aBGD
	ogSC+1WTejDyI+D7h6RTPBLjTSjnszdwiAiYlLUh0f+mLXg2u5TE4cfaC3qA3QxksghHYIntT9XQK
	ZWw9YefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTU-0000000C05l-0k4O;
	Fri, 06 Nov 2026 10:47:14 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTR-0000000C03k-1zQ9;
	Fri, 06 Nov 2026 10:47:10 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07F1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:02 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07F1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962023;
	bh=6lyfZkMaV5efFDaQd+IxuIBt8CTl0E0w6j7qjN8lYSE=;
	h=From:To:Cc:Subject:Date;
	b=Wq7bNyJISiqD46Vv+Cx/w4pTAF5EVD47JK+PiaLtg3hRh5M4Ydpm6SyyydhNvAE59
	 vqwskoeRDqCvBUSJiOEqfGTLVy81l0p+dE7kEbNS5YUBRshgF/qq9IQ19qpuZsdwMC
	 /osCFy+pii6znpq6aKE4hLilv8s9/xCP1bsUBiuE=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 00/10] arm64: dts: amlogic: S4 SoC additions and the Amediatech X98Q
Date: Fri,  6 Nov 2026 11:46:49 +0100
Message-ID: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024709_848041_763228D0 
X-CRM114-Status: GOOD (  13.29  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpQYXRjaGVzIDItOSBhZGQgUzQgU29DIGJsb2NrcyB0byBtZXNvbi1zNC5kdHNpLCBvbmUgZmVh
dHVyZSBwZXIgcGF0Y2g6CmNhY2hlcywgUFNDSSBpZGxlIHN0YXRlLCBTNCBzZWN1cmUgbW9uaXRv
ciBjb21wYXRpYmxlLCBNYWxpIEdQVSwgQ1BVCnRoZXJtYWwgc2Vuc29yIGFuZCB6b25lLCBHRTJE
LCBVU0IgaG9zdCBhbmQgQU8gQ0VDLiBQYXRjaCAxMCBhZGRzIHRoZQpBbWVkaWF0ZWNoIFg5OFEg
VFYgYm94IChTOTA1VzIpIHRoYXQgYWxsIG9mIGl0IHdhcyB0ZXN0ZWQgb247IHBhdGNoIDEKaXRz
IGJpbmRpbmcuCgpUaGUgYm9hcmQgaGFzIHR3byBVU0IgcG9ydHMsIGFuIFNEIHNsb3QsIEV0aGVy
bmV0LCBIRE1JLCBhIHBvd2VyIExFRAphbmQgYW4gSVIgcmVjZWl2ZXIsIGFuZCBubyBhbmFsb2cg
YXVkaW8gb3V0cHV0LiBDUFUgZnJlcXVlbmN5IHNjYWxpbmcsCmF1ZGlvIGFuZCB0aGUgdmlkZW8g
ZGVjb2RlciBhcmUgbGVmdCBvdXQgdW50aWwgdGhlaXIgZHJpdmVycyBhbmQKYmluZGluZ3MgYXJl
IHNldHRsZWQ7IHRoZSBIRE1JIGRpc3BsYXkgcGF0aCBpcyBub3QgaW4gbWFpbmxpbmUgZm9yIFM0
LgoKRGVwZW5kZW5jaWVzIChiaW5kaW5ncywgc2VudCBzZXBhcmF0ZWx5KToKIC0gYW1sb2dpYyxt
ZXNvbi1zNC1zbSAgICAgICAgICAgICAgICAgICAgIChmaXJtd2FyZTogbWVzb246IHNtIHBvd2Vy
LW9mZikKIC0gYW1sb2dpYyxzNC10aGVybWFsICAgICAgICAgICAgICAgICAgICAgICh0aGVybWFs
IFM0KQogLSBhbWxvZ2ljLHM0LWdlMmQgICAgICAgICAgICAgICAgICAgICAgICAgKGdlMmQgYmlu
ZGluZykKIC0gYW1sb2dpYyxtZXNvbi1zNC11c2ItY3RybCwgczQtdXNiMi1waHkgICh1c2ItY3Ry
bCwgdXNiMiBwaHkgUzQpCiAtIGFtbG9naWMsY29yZS1waGFzZS1kZWdyZWVzICAgICAgICAgICAg
ICAobW1jIGNvcmUgcGhhc2UpCiAtIHdha2V1cC1zb3VyY2Ugb24gbWVzb24taXIsIHJjLXg5OHEg
ICAgICAobWVzb24taXIsIHJjIGtleXRhYmxlKQogLSBhbWxvZ2ljLHNoYXJlZC1hbnRlbm5hICAg
ICAgICAgICAgICAgICAgKEJsdWV0b290aCBXMSkKClRvb2wgdXNlIChEb2N1bWVudGF0aW9uL3By
b2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQucnN0KToKVGhpcyB3b3JrIHdhcyBkb25lIHdpdGggdGhl
IGhlbHAgb2YgYW4gQUkgY29kaW5nIGFzc2lzdGFudCwgQ2xhdWRlCihBbnRocm9waWMpLCB1c2Vk
IHRocm91Z2ggQ2xhdWRlIENvZGUgb3ZlciBtYW55IHNlc3Npb25zLiBJdCBkaWQgYSBsYXJnZQpw
YXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3JrOiBpdCByZWFkIHRoZSB2ZW5kb3Iga2VybmVsIGFuZCB0
aGUgZmlybXdhcmUKaW50ZXJmYWNlcywgcHJvYmVkIHJlZ2lzdGVycyBvbiB0aGUgYm9hcmQsIGRy
YWZ0ZWQgdGhlIGNvZGUgYW5kIHRoZQpjaGFuZ2Vsb2dzLCBhbmQgcmFuIHRoZSBidWlsZHMsIGNo
ZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hlY2sgYW5kIHRoZQp0ZXN0cyBvbiB0aGUgaGFyZHdhcmUu
IEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJldmlld2VkIGV2ZXJ5IGNoYW5nZSBhbmQKdGhlIGZpbmFs
IHBhdGNoZXMsIGFuZCB0YWtlIHJlc3BvbnNpYmlsaXR5IGZvciB0aGVtLiBUaGVyZSBpcyBubyBz
aW5nbGUKcHJvbXB0IHRvIHF1b3RlOyB0aGUgc2Vzc2lvbnMgd2VyZSBvZiB0aGUgZm9ybSAiZmlu
ZCBvdXQgd2h5IFggZmFpbHMgb24KdGhpcyBib2FyZCwgZml4IGl0LCB0ZXN0IGl0IG9uIHRoZSBi
b3giLgoKVGVzdGVkIG9uIGFuIEFtZWRpYXRlY2ggWDk4USBUViBib3ggKEFtbG9naWMgUzkwNVcy
LCBTNCBmYW1pbHksIDIgR2lCKSwKdmVuZG9yIFUtQm9vdCBhbmQgQkwzMS9PUC1URUUsIExpbnV4
IDcuMyBwbHVzIHRoaXMgd29yay4KCkNocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMTAp
OgogIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6IGFkZCB0aGUgQW1lZGlhdGVjaCBYOThRCiAg
YXJtNjQ6IGR0czogYW1sb2dpYzogbWVzb24tczQ6IGRlc2NyaWJlIHRoZSBDUFUgY2FjaGVzCiAg
YXJtNjQ6IGR0czogYW1sb2dpYzogbWVzb24tczQ6IGFkZCB0aGUgUFNDSSBDUFUgaWRsZSBzdGF0
ZQogIGFybTY0OiBkdHM6IGFtbG9naWM6IG1lc29uLXM0OiB1c2UgdGhlIFM0IHNlY3VyZSBtb25p
dG9yIGNvbXBhdGlibGUKICBhcm02NDogZHRzOiBhbWxvZ2ljOiBtZXNvbi1zNDogYWRkIHRoZSBN
YWxpIEdQVQogIGFybTY0OiBkdHM6IGFtbG9naWM6IG1lc29uLXM0OiBhZGQgdGhlIENQVSB0aGVy
bWFsIHNlbnNvciBhbmQgem9uZQogIGFybTY0OiBkdHM6IGFtbG9naWM6IG1lc29uLXM0OiBhZGQg
dGhlIEdFMkQKICBhcm02NDogZHRzOiBhbWxvZ2ljOiBtZXNvbi1zNDogYWRkIHRoZSBVU0IgaG9z
dAogIGFybTY0OiBkdHM6IGFtbG9naWM6IG1lc29uLXM0OiBhZGQgdGhlIEFPIENFQyBjb250cm9s
bGVyCiAgYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIHRoZSBBbWVkaWF0ZWNoIFg5OFEKCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sICAgICAgfCAgIDcgKwogYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAgIHwgICAxICsKIC4uLi9ib290
L2R0cy9hbWxvZ2ljL21lc29uLXM0LXM5MDV3Mi14OThxLmR0cyB8IDMxMCArKysrKysrKysrKysr
KysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpICAgICB8IDI0
NiArKysrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA1NjMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1zNC1zOTA1dzIteDk4cS5kdHMKCgpiYXNlLWNvbW1pdDogN2JlNGJjNTJmZDllMGU1
NWRjOWEyZTAyMzJiODk0MjdkMmM0YjYxNAotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

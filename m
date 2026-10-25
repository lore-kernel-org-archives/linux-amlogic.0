Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E25606A31B
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DTMYV0Aa;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=p6TpQbUE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NNUE7nxEzV5JIcrkHfitAYg7IkPZ620d/rtQvFUcdPQ=; b=DTMYV0AauaLBFCC5XDm0K5sLuT
	qCBWrbl+A1l6yBYiv6uPchnsDV8Rdby+ZzOFMZ5pCOsAlOlumeRcH4iZkm2RCEgpMeIVrK5ghcOu9
	4L7HlVqdrroTUC+L/lvdROR2MeVdFQD4FW3RDdUtTFob/HnKb8+IaLjjS8DHlD9eMtGnjaeCPxiRS
	Oy/rWtyUlQQnnTDe9EpbsNumRidM/JhwWRta62d3w42sFrO4HmLYFI3jSA2TxnriNKEqrAUsv5+Fr
	9kB1lisdzwcYSnh8rgvVPsyQSmR2LU2ufPCR2Z6QSf7i1/q10123bcf8M4vOvGS52byxe+9Tj/PN7
	ecAHOnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mL-00000001KRi-2ggO;
	Sun, 25 Oct 2026 19:21:13 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mJ-00000001KQn-0hFB;
	Sun, 25 Oct 2026 19:21:12 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJL1Gt515970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJL1Gt515970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956065;
	bh=gPVDVkRJaq4Rb+X6fDN8QSB/oUifhBEsOEHySvrZXRo=;
	h=From:To:Cc:Subject:Date;
	b=p6TpQbUEPz5mfy4/LMfnjk1g0APkK4RYhQxSPjJmbRvDjPTva1D6zOd3wEDKhF9sP
	 JoyL8fmW4LKqXy5PU+ZfhqjhcAqE+d1yn5uOUX7f4oHsSrWEsSNOZscRN2P4vCH/qG
	 ubMmnhuMcaDGvwiedXDXCA+BR5zodwc9mfiO+m5w=
From: christian.koever-draxl@student.uibk.ac.at
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] mmc: meson-gx: make the core clock phase configurable
Date: Sun, 25 Oct 2026 20:20:57 +0100
Message-ID: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122111_370287_D51A699A 
X-CRM114-Status: UNSURE (   9.87  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgY29yZSBjbG9jayBwaGFzZSBpcyBmaXhlZCBhdCAxODAgZGVncmVlcy4gVGhlIFNEIHNs
b3Qgb2YgYW4gUzkwNVcyClRWIGJveCBmYWlscyB3aXRoIENSQyBlcnJvcnMgYXQgNTAgTUh6IHdp
dGggdGhhdCBwaGFzZSBhbmQgd29ya3MgYXQgMjcwCmRlZ3JlZXMsIHRoZSB2YWx1ZSB0aGUgdmVu
ZG9yIGtlcm5lbCBwcm9ncmFtcy4gQWRkIGFuIG9wdGlvbmFsIERUCnByb3BlcnR5IGZvciBpdCBh
bmQga2VlcCAxODAgZGVncmVlcyBhcyB0aGUgZGVmYXVsdC4KClRvb2wgdXNlIChEb2N1bWVudGF0
aW9uL3Byb2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQucnN0KToKVGhpcyB3b3JrIHdhcyBkb25lIHdp
dGggdGhlIGhlbHAgb2YgYW4gQUkgY29kaW5nIGFzc2lzdGFudCwgQ2xhdWRlCihBbnRocm9waWMp
LCB1c2VkIHRocm91Z2ggQ2xhdWRlIENvZGUgb3ZlciBtYW55IHNlc3Npb25zLiBJdCBkaWQgYSBs
YXJnZQpwYXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3JrOiBpdCByZWFkIHRoZSB2ZW5kb3Iga2VybmVs
IGFuZCB0aGUgZmlybXdhcmUKaW50ZXJmYWNlcywgcHJvYmVkIHJlZ2lzdGVycyBvbiB0aGUgYm9h
cmQsIGRyYWZ0ZWQgdGhlIGNvZGUgYW5kIHRoZQpjaGFuZ2Vsb2dzLCBhbmQgcmFuIHRoZSBidWls
ZHMsIGNoZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hlY2sgYW5kIHRoZQp0ZXN0cyBvbiB0aGUgaGFy
ZHdhcmUuIEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJldmlld2VkIGV2ZXJ5IGNoYW5nZSBhbmQKdGhl
IGZpbmFsIHBhdGNoZXMsIGFuZCB0YWtlIHJlc3BvbnNpYmlsaXR5IGZvciB0aGVtLiBUaGVyZSBp
cyBubyBzaW5nbGUKcHJvbXB0IHRvIHF1b3RlOyB0aGUgc2Vzc2lvbnMgd2VyZSBvZiB0aGUgZm9y
bSAiZmluZCBvdXQgd2h5IFggZmFpbHMgb24KdGhpcyBib2FyZCwgZml4IGl0LCB0ZXN0IGl0IG9u
IHRoZSBib3giLgoKVGVzdGVkIG9uIGFuIEFtZWRpYXRlY2ggWDk4USBUViBib3ggKEFtbG9naWMg
UzkwNVcyLCBTNCBmYW1pbHksIDIgR2lCKSwKdmVuZG9yIFUtQm9vdCBhbmQgQkwzMS9PUC1URUUs
IExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KCkNocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4
bCAoMik6CiAgZHQtYmluZGluZ3M6IG1tYzogYW1sb2dpYyxtZXNvbi1neC1tbWM6IGFkZCBhbWxv
Z2ljLGNvcmUtcGhhc2UtZGVncmVlcwogIG1tYzogbWVzb24tZ3g6IGFsbG93IHRoZSBjb3JlIGNs
b2NrIHBoYXNlIHRvIGJlIHNldCBmcm9tIERUCgogLi4uL2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1l
c29uLWd4LW1tYy55YW1sICAgICAgfCAgOSArKysrKysrKysKIGRyaXZlcnMvbW1jL2hvc3QvbWVz
b24tZ3gtbW1jLmMgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1p
dDogN2JlNGJjNTJmZDllMGU1NWRjOWEyZTAyMzJiODk0MjdkMmM0YjYxNAotLSAKMi41Ni4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

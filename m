Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312F606A31A
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ECGaUWX7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=qpoU0FLP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OSJXYN3O2IonSrqBx5KEPeBdnu/1PxR9LNoKXT2bJEo=; b=ECGaUWX7Cl5cBZWdDkqfVe/Bib
	kafNYToM6MAsD8zEvNgFRlT2aGhHClKwg58lQ1lBm3jETjoa+QA3iMm0Matnsc6+f6VhE0CT7XCHD
	h8hfFYclPJsA4ZzhFyO8JP2iclsL9KThFBd1t8N+yodY8HRQuIhQbmNNLJwNURbeBh6o4Uxiait7p
	9989QRLBrww2RnXz+swRlLWnx7+9fQtHdy3lO01Vmaj2ixOyYlGBKnD63/DY8TfSi8hEmsnDJXjhX
	wglj1GiZuxBNJuozB2I5XcphE8/M+yNHxxRKGtIbVTskfDywvuK3V6a3yoe/nPrbLq/YtITklKXmr
	7DY0Bl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3n6-00000001KnL-2IuJ;
	Sun, 25 Oct 2026 19:22:00 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3n2-00000001Km2-4C7D;
	Sun, 25 Oct 2026 19:21:58 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko3516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:49 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko3516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956110;
	bh=Ayp/Q9Y1tgzFXIHVZ1yEQTHN8mO9FQgwx4GJ190p2IM=;
	h=From:To:Cc:Subject:Date;
	b=qpoU0FLPWW86wR12vYlkvJARkAb7TNCYFRYBTSIibxu9PqzmHz6ttAmUQBeVR4uCQ
	 QpUW7w34VDqyhxDtN/90AjbVu4lDE06DbH8LZ9JuJvgTRvz5Ahb92tCUHbKxHH6rRT
	 VpAPX8H7xw1Ad47/WGe3N96ckM1hR6NRmxrj7PSA=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] firmware: meson: sm: make power-off work on S4
Date: Sun, 25 Oct 2026 20:21:42 +0100
Message-ID: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122157_205095_1F964107 
X-CRM114-Status: GOOD (  11.85  )
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
CgpPbiBTNCB0aGUgZmlybXdhcmUgaW1wbGVtZW50cyBQU0NJIFNZU1RFTV9PRkYgYXMgRERSIHNl
bGYtcmVmcmVzaCwgYW5kCnRoZSBwb3dlciBrZXkgdGhlbiByZXN1bWVzIGludG8gYSBrZXJuZWwg
dGhhdCBpcyBnb25lLCBzbyB0aGUgYm9hcmQKaGFuZ3MgdW50aWwgaXQgaXMgdW5wbHVnZ2VkLiBU
aGUgdmVuZG9yIGtlcm5lbCBzZXRzIGEgZmlybXdhcmUgc2h1dGRvd24KZmxhZyBmaXJzdCBhbmQg
dGFrZXMgdGhlIHNlY29uZGFyeSBDUFVzIGRvd24gdGhyb3VnaCBQU0NJOyBkbyB0aGUgc2FtZSwK
a2V5ZWQgb24gYSBuZXcgYW1sb2dpYyxtZXNvbi1zNC1zbSBjb21wYXRpYmxlLgoKVGVzdGVkOiBw
b3dlcm9mZiBmb2xsb3dlZCBieSB0aGUgcmVtb3RlJ3MgcG93ZXIga2V5IGNvbGQtYm9vdHMgdGhl
IGJveC4KClRvb2wgdXNlIChEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQu
cnN0KToKVGhpcyB3b3JrIHdhcyBkb25lIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkgY29kaW5nIGFz
c2lzdGFudCwgQ2xhdWRlCihBbnRocm9waWMpLCB1c2VkIHRocm91Z2ggQ2xhdWRlIENvZGUgb3Zl
ciBtYW55IHNlc3Npb25zLiBJdCBkaWQgYSBsYXJnZQpwYXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3Jr
OiBpdCByZWFkIHRoZSB2ZW5kb3Iga2VybmVsIGFuZCB0aGUgZmlybXdhcmUKaW50ZXJmYWNlcywg
cHJvYmVkIHJlZ2lzdGVycyBvbiB0aGUgYm9hcmQsIGRyYWZ0ZWQgdGhlIGNvZGUgYW5kIHRoZQpj
aGFuZ2Vsb2dzLCBhbmQgcmFuIHRoZSBidWlsZHMsIGNoZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hl
Y2sgYW5kIHRoZQp0ZXN0cyBvbiB0aGUgaGFyZHdhcmUuIEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJl
dmlld2VkIGV2ZXJ5IGNoYW5nZSBhbmQKdGhlIGZpbmFsIHBhdGNoZXMsIGFuZCB0YWtlIHJlc3Bv
bnNpYmlsaXR5IGZvciB0aGVtLiBUaGVyZSBpcyBubyBzaW5nbGUKcHJvbXB0IHRvIHF1b3RlOyB0
aGUgc2Vzc2lvbnMgd2VyZSBvZiB0aGUgZm9ybSAiZmluZCBvdXQgd2h5IFggZmFpbHMgb24KdGhp
cyBib2FyZCwgZml4IGl0LCB0ZXN0IGl0IG9uIHRoZSBib3giLgoKVGVzdGVkIG9uIGFuIEFtZWRp
YXRlY2ggWDk4USBUViBib3ggKEFtbG9naWMgUzkwNVcyLCBTNCBmYW1pbHksIDIgR2lCKSwKdmVu
ZG9yIFUtQm9vdCBhbmQgQkwzMS9PUC1URUUsIExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KCkNo
cmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6CiAgZHQtYmluZGluZ3M6IGZpcm13YXJl
OiBhbWxvZ2ljLG1lc29uLWd4YmItc206IGFkZCBhbWxvZ2ljLG1lc29uLXM0LXNtCiAgZmlybXdh
cmU6IG1lc29uOiBzbTogbWFrZSBwb3dlci1vZmYgd29yayBvbiBTNAoKIC4uLi9maXJtd2FyZS9h
bWxvZ2ljLG1lc29uLWd4YmItc20ueWFtbCAgICAgICB8ICA0ICstCiBkcml2ZXJzL2Zpcm13YXJl
L21lc29uL21lc29uX3NtLmMgICAgICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmggICAgICAgfCAgMSArCiAzIGZp
bGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCgpiYXNlLWNvbW1p
dDogN2JlNGJjNTJmZDllMGU1NWRjOWEyZTAyMzJiODk0MjdkMmM0YjYxNAotLSAKMi41Ni4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

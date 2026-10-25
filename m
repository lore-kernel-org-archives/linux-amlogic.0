Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056860A2624
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dru31Rez;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Qv0RepYa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dXD4BVViB2eIF4Ibq9rtppHpMrSfdJaNggUFPW3nJWY=; b=dru31RezWuBkXJFfV6NM0SWsLz
	JkBn4wnmAsOaDI1CU9h0B+QtbneSCM3qncIhAMEQ+PUJ6PFMhbYlpuUbmlwz2rj1aU8Sw3IAkZ2K9
	uTVfJYq22sYWJL9HbL6RQegk59NW2jKOIGGO3eQvGDMP0PN+rQebOj5sa3Y1BkSsCMwR4BhlyYY9E
	tyuUvPI8Iys+KFiuLatAq4VvftE859EppGpB7oZv3X0EOYLDFLxrt5ub/+1z0h5EW/fpNjLF7a21+
	kEsjEBX6MyLImHwd4QhOwJ43S46InW2y8RkQVcrXwH1jVy0W9THXdowRL6aZOgVmEtNG6xaGW3nu6
	y+EAE8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3oI-00000001M6H-312o;
	Sun, 25 Oct 2026 19:23:14 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3oF-00000001M1Z-43SU
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:23:13 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJN4g8517646
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJN4g8517646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956187;
	bh=OePOO/AairIE6VYNQHXufMPh7i0CvJP15rs8HYGLpJo=;
	h=From:To:Cc:Subject:Date;
	b=Qv0RepYagJAYvsdZs6Q1nFPq8slv2305eQ7/o24xSrfYbAMaeNb+xkmJ84kpYhjtx
	 ntJh1Tw3FypJGfTgyDhlD6PGM3+UjjmIljwMduwTNMXp9z9LrH3CrPc8/hSOd2Rf1T
	 uDc/6965zP/WvoFcAFQ2sPMAoSlRoWh7VdgZ9VEs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Date: Sun, 25 Oct 2026 20:23:02 +0100
Message-ID: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122312_233393_310D2324 
X-CRM114-Status: GOOD (  11.74  )
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
CgpUaGUgUzQgR0UyRCBpcyBjb21wYXRpYmxlIHdpdGggdGhlIEFYRyBvbmUsIGJ1dCBzaXRzIGlu
IGEgcG93ZXIgZG9tYWluCm9mIGl0cyBvd24uIEFkZCBhbiBTNCBjb21wYXRpYmxlIHdpdGggdGhl
IEFYRyBvbmUgYXMgZmFsbGJhY2ssIGFuZAphbGxvdyBhIHBvd2VyIGRvbWFpbi4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRl
PgotLS0KVG9vbCB1c2UgKERvY3VtZW50YXRpb24vcHJvY2Vzcy9nZW5lcmF0ZWQtY29udGVudC5y
c3QpOgpUaGlzIHdvcmsgd2FzIGRvbmUgd2l0aCB0aGUgaGVscCBvZiBhbiBBSSBjb2RpbmcgYXNz
aXN0YW50LCBDbGF1ZGUKKEFudGhyb3BpYyksIHVzZWQgdGhyb3VnaCBDbGF1ZGUgQ29kZSBvdmVy
IG1hbnkgc2Vzc2lvbnMuIEl0IGRpZCBhIGxhcmdlCnBhcnQgb2YgdGhlIGhhbmRzLW9uIHdvcms6
IGl0IHJlYWQgdGhlIHZlbmRvciBrZXJuZWwgYW5kIHRoZSBmaXJtd2FyZQppbnRlcmZhY2VzLCBw
cm9iZWQgcmVnaXN0ZXJzIG9uIHRoZSBib2FyZCwgZHJhZnRlZCB0aGUgY29kZSBhbmQgdGhlCmNo
YW5nZWxvZ3MsIGFuZCByYW4gdGhlIGJ1aWxkcywgY2hlY2twYXRjaCwgZHRfYmluZGluZ19jaGVj
ayBhbmQgdGhlCnRlc3RzIG9uIHRoZSBoYXJkd2FyZS4gSSBkaXJlY3RlZCB0aGUgd29yaywgcmV2
aWV3ZWQgZXZlcnkgY2hhbmdlIGFuZAp0aGUgZmluYWwgcGF0Y2hlcywgYW5kIHRha2UgcmVzcG9u
c2liaWxpdHkgZm9yIHRoZW0uIFRoZXJlIGlzIG5vIHNpbmdsZQpwcm9tcHQgdG8gcXVvdGU7IHRo
ZSBzZXNzaW9ucyB3ZXJlIG9mIHRoZSBmb3JtICJmaW5kIG91dCB3aHkgWCBmYWlscyBvbgp0aGlz
IGJvYXJkLCBmaXggaXQsIHRlc3QgaXQgb24gdGhlIGJveCIuCgpUZXN0ZWQgb24gYW4gQW1lZGlh
dGVjaCBYOThRIFRWIGJveCAoQW1sb2dpYyBTOTA1VzIsIFM0IGZhbWlseSwgMiBHaUIpLAp2ZW5k
b3IgVS1Cb290IGFuZCBCTDMxL09QLVRFRSwgTGludXggNy4zIHBsdXMgdGhpcyB3b3JrLgoKIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsYXhnLWdlMmQueWFtbCAgICB8IDEw
ICsrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2FtbG9naWMsYXhnLWdlMmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9hbWxvZ2ljLGF4Zy1nZTJkLnlhbWwKaW5kZXggZjIzZmE2ZDA2YWQwLi4yMmRlY2I2
Nzg3OWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9hbWxvZ2ljLGF4Zy1nZTJkLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2FtbG9naWMsYXhnLWdlMmQueWFtbApAQCAtMTIsOCArMTIsMTEgQEAgbWFp
bnRhaW5lcnM6CiAKIHByb3BlcnRpZXM6CiAgIGNvbXBhdGlibGU6Ci0gICAgZW51bToKLSAgICAg
IC0gYW1sb2dpYyxheGctZ2UyZAorICAgIG9uZU9mOgorICAgICAgLSBjb25zdDogYW1sb2dpYyxh
eGctZ2UyZAorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM0LWdl
MmQKKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLGF4Zy1nZTJkCiAKICAgaW50ZXJydXB0czoK
ICAgICBtaW5JdGVtczogMQpAQCAtMjcsNiArMzAsOSBAQCBwcm9wZXJ0aWVzOgogICBjbG9ja3M6
CiAgICAgbWluSXRlbXM6IDEKIAorICBwb3dlci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAxCisK
IHJlcXVpcmVkOgogICAtIGNvbXBhdGlibGUKICAgLSByZWcKCmJhc2UtY29tbWl0OiA3YmU0YmM1
MmZkOWUwZTU1ZGM5YTJlMDIzMmI4OTQyN2QyYzRiNjE0Ci0tIAoyLjU2LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

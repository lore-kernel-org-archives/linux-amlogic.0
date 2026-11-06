Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6A606A33A
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qIj03PMY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=L/WdqTbN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yRQhCikKGwRl/TzAX3MMhEKeyYILYHkgLtBcIkLh9BQ=; b=qIj03PMYTw3IB6+RAJhtBQRuFp
	X3WuRXCmHwqMmN8BwxcmG2pehav9zUCV3LES8Dl0vEhjMDQvt1wOkHOVt7wlnRQaSw1JLMVcxj7q/
	7UH8v9i0cBrLmCbzdEK7RUlDI5QCvu6fVLO/FVTO1ty+iJ3JUoJH6tBDOAW/nLZUxgZ61QCRF2bLh
	mUihWXJ9fV4XEBCS7Lwg+Qet+Tc60yJsIn6+Ui5kNb7Pgq4v18ckxi85va0KDoP1r1FJTX2SzAiMH
	1F4yhEr62MCc+1T/W+vTFStxR93NTHREgjR6QB08f6Qkng69rYdQZnAabVsB5g0NDYXTmUZK0OKA3
	2DwRaeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2x-0000000Btno-21c6;
	Fri, 06 Nov 2026 10:19:47 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2u-0000000Btkj-1rgC
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:19:45 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJaEC1864224
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:38 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJaEC1864224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960379;
	bh=B4LJ/E2CNayxcnde10w3NEe0+jzbRDwBsFbsVBG7Tl0=;
	h=From:To:Cc:Subject:Date;
	b=L/WdqTbNaikvEwen+wMG8wZAlMDjoSPap+nH+YLn4wGByY+R7zdrU9ymS10kfAL1F
	 +nFY7WK0XiEMjevUvy9Y1Bdoicm57cVjbesq0CL+NYcjKTqlErLPAq2CPz+6n0zJ3y
	 9lHbCApdogmnZuSnZ0dY3HT6ilOj1Qn42cN/8B1k=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Date: Fri,  6 Nov 2026 11:19:35 +0100
Message-ID: <20261106101935.46816-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021944_817820_C41B87A9 
X-CRM114-Status: GOOD (  13.51  )
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
CgpBZGQgYSBjb21wYXRpYmxlIGZvciB0aGUgUzQgR0UyRCBhbmQgYWxsb3cgYSBwb3dlciBkb21h
aW4sIHdoaWNoIHRoZSBTNApibG9jayBzaXRzIGluLgoKVGhlIEFYRyBHRTJEIGlzIGEgc3BlY2lh
bCB2ZXJzaW9uIHRoYXQgZG9lcyBub3QgdXNlIHRoZSBjYW52YXMgdG8gcmVhZAphbmQgd3JpdGUg
YnVmZmVycywgc28gdGhlIFM0IG9uZSBpcyBub3Qgc3RyaWN0bHkgY29tcGF0aWJsZSB3aXRoIGl0
IGFuZApnZXRzIG5vIGZhbGxiYWNrLgoKT25seSB0aGUgUzQgYmxvY2sgc2l0cyBpbiBhIHBvd2Vy
IGRvbWFpbiBvZiBpdHMgb3duLCBzbyByZXF1aXJlIG9uZQp0aGVyZSBhbmQgZGlzYWxsb3cgaXQg
Zm9yIEFYRy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8
Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBTZXBhcmF0ZSBjb21wYXRp
YmxlLCBubyBhbWxvZ2ljLGF4Zy1nZTJkIGZhbGxiYWNrOiB0aGUgQVhHIEdFMkQgZG9lcwogIG5v
dCB1c2UgdGhlIGNhbnZhcywgc28gdGhlIHR3byBhcmUgbm90IGNvbXBhdGlibGUgKE5laWwpLgot
IHBvd2VyLWRvbWFpbnMgaXMgcmVxdWlyZWQgZm9yIGFtbG9naWMsczQtZ2UyZCBhbmQgbm90IGFs
bG93ZWQgZm9yCiAgQVhHLCB3aGljaCBoYXMgbm9uZSAoS3J6eXN6dG9mKS4KLSBMaW5rIHRvIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYxMDI1MTkyMzAyLjIwOTM1NC0xLWNocmlz
dGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0CgpUb29sIHVzZSAoRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL2dlbmVyYXRlZC1jb250ZW50LnJzdCk6ClRoaXMgd29yayB3YXMgZG9uZSB3
aXRoIHRoZSBoZWxwIG9mIGFuIEFJIGNvZGluZyBhc3Npc3RhbnQsIENsYXVkZQooQW50aHJvcGlj
KSwgdXNlZCB0aHJvdWdoIENsYXVkZSBDb2RlIG92ZXIgbWFueSBzZXNzaW9ucy4gSXQgZGlkIGEg
bGFyZ2UKcGFydCBvZiB0aGUgaGFuZHMtb24gd29yazogaXQgcmVhZCB0aGUgdmVuZG9yIGtlcm5l
bCBhbmQgdGhlIGZpcm13YXJlCmludGVyZmFjZXMsIHByb2JlZCByZWdpc3RlcnMgb24gdGhlIGJv
YXJkLCBkcmFmdGVkIHRoZSBjb2RlIGFuZCB0aGUKY2hhbmdlbG9ncywgYW5kIHJhbiB0aGUgYnVp
bGRzLCBjaGVja3BhdGNoLCBkdF9iaW5kaW5nX2NoZWNrIGFuZCB0aGUKdGVzdHMgb24gdGhlIGhh
cmR3YXJlLiBJIGRpcmVjdGVkIHRoZSB3b3JrLCByZXZpZXdlZCBldmVyeSBjaGFuZ2UgYW5kCnRo
ZSBmaW5hbCBwYXRjaGVzLCBhbmQgdGFrZSByZXNwb25zaWJpbGl0eSBmb3IgdGhlbS4gVGhlcmUg
aXMgbm8gc2luZ2xlCnByb21wdCB0byBxdW90ZTsgdGhlIHNlc3Npb25zIHdlcmUgb2YgdGhlIGZv
cm0gImZpbmQgb3V0IHdoeSBYIGZhaWxzIG9uCnRoaXMgYm9hcmQsIGZpeCBpdCwgdGVzdCBpdCBv
biB0aGUgYm94Ii4KClRlc3RlZCBvbiBhbiBBbWVkaWF0ZWNoIFg5OFEgVFYgYm94IChBbWxvZ2lj
IFM5MDVXMiwgUzQgZmFtaWx5LCAyIEdpQiksCnZlbmRvciBVLUJvb3QgYW5kIEJMMzEvT1AtVEVF
LCBMaW51eCA3LjMgcGx1cyB0aGlzIHdvcmsuCgogLi4uL2JpbmRpbmdzL21lZGlhL2FtbG9naWMs
YXhnLWdlMmQueWFtbCAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxheGctZ2UyZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsYXhnLWdlMmQueWFtbAppbmRleCBmMjNm
YTZkMDZhZDAuLmYzZmU5OWYxZmM5NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsYXhnLWdlMmQueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxheGctZ2UyZC55YW1sCkBAIC0x
NCw2ICsxNCw3IEBAIHByb3BlcnRpZXM6CiAgIGNvbXBhdGlibGU6CiAgICAgZW51bToKICAgICAg
IC0gYW1sb2dpYyxheGctZ2UyZAorICAgICAgLSBhbWxvZ2ljLHM0LWdlMmQKIAogICBpbnRlcnJ1
cHRzOgogICAgIG1pbkl0ZW1zOiAxCkBAIC0yNyw2ICsyOCw5IEBAIHByb3BlcnRpZXM6CiAgIGNs
b2NrczoKICAgICBtaW5JdGVtczogMQogCisgIHBvd2VyLWRvbWFpbnM6CisgICAgbWF4SXRlbXM6
IDEKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJlZwpAQCAtMzQsNiArMzgsMTkg
QEAgcmVxdWlyZWQ6CiAgIC0gY2xvY2tzCiAgIC0gcmVzZXRzCiAKK2FsbE9mOgorICAtIGlmOgor
ICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBjb250YWlu
czoKKyAgICAgICAgICAgIGNvbnN0OiBhbWxvZ2ljLHM0LWdlMmQKKyAgICB0aGVuOgorICAgICAg
cmVxdWlyZWQ6CisgICAgICAgIC0gcG93ZXItZG9tYWlucworICAgIGVsc2U6CisgICAgICBwcm9w
ZXJ0aWVzOgorICAgICAgICBwb3dlci1kb21haW5zOiBmYWxzZQorCiBhZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKIAogZXhhbXBsZXM6CgpiYXNlLWNvbW1pdDogN2JlNGJjNTJmZDllMGU1NWRj
OWEyZTAyMzJiODk0MjdkMmM0YjYxNAotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

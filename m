Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149DF6083602
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3D9hPKa;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QlPXC/8+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g1oBSKbevGN+zgFVo3gDXAUmUN7DYh7EOGI1tGBwojg=; b=t3D9hPKa8VpQh1nsarvWSREfmA
	BVjxi2K1IyH0rLlamYngPdC8+bqWhUMyaF9OsPNE9/X/fvOfOKGhN/0U8akP6IItGTCsQa9nNyaqI
	9cvF/LLWECOl9nhheLbxASJg5bAcXjrs/GMqQzvijR2Jt5gtV+0JH57KGVZe8KTdJkKogleTjxX3V
	KkCxUkPbjpWFhumQkQC5cbsz0dXpPezoy+pWuCZr2Xi+FQ5g8BwYLzR8iACTz+JmrmU+5vOpuEzJm
	WpZcFe8r5/0nC+0iGehZ8jmq2jH1Z/UXhnYsaOL0jit6QJleHEFMmLqlMiSaa0A7TewRjNk/BBSxe
	PsHJY9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH3I-0000000BtzO-3HSf;
	Fri, 06 Nov 2026 10:20:08 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH3F-0000000BtxA-3FMP;
	Fri, 06 Nov 2026 10:20:07 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJteW1864372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:59 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJteW1864372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960399;
	bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QlPXC/8+dDJj3K5S0vS/N62vX44X+i/lrh3UbZbPtoiLzWpJ9KXFacJpm6HnDs9D8
	 I6p8icqS9UPRewn0cEYMrZ7Jmt18dVO9tqM6/l+7UikELm0GbMfJrHXLgWklTlp/HI
	 Glcw/5GoZUJ9BKp1mVws6M3XEP/+MaF6pBBRA/VI=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
Date: Fri,  6 Nov 2026 11:19:53 +0100
Message-ID: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022006_146039_8B79BDF5 
X-CRM114-Status: UNSURE (   8.39  )
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
CgpUaGUgcmVjZWl2ZXIgY2FuIHN0YXkgcG93ZXJlZCBhY3Jvc3Mgc3VzcGVuZCBhbmQgd2FrZSB0
aGUgc3lzdGVtIHdoZW4KYSByZW1vdGUgY29udHJvbCBrZXkgaXMgcHJlc3NlZC4gQWxsb3cgYm9h
cmRzIHRvIG1hcmsgaXQgYXMgYSB3YWtldXAKc291cmNlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Ci0tLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsbWVzb242LWlyLnlhbWwg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsbWVzb242LWlyLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxtZXNv
bjYtaXIueWFtbAppbmRleCAwZjk1ZmU4ZGQ5YWMuLjI3Yzg5ZjhmOGMzZCAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsbWVzb242LWly
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9n
aWMsbWVzb242LWlyLnlhbWwKQEAgLTMwLDYgKzMwLDggQEAgcHJvcGVydGllczoKICAgaW50ZXJy
dXB0czoKICAgICBtYXhJdGVtczogMQogCisgIHdha2V1cC1zb3VyY2U6IHRydWUKKwogcmVxdWly
ZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJlZwotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

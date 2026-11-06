Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3413E606D825
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXG71vWf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QV5zVbqx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xtlz8P1UN/1oNiR6UUl4F44Bl/zSchBPN3VakyqN0fQ=; b=rXG71vWf8qva0+2WxKL/1Xw5Df
	XLWCXAYVBq19TgO5PLEM45OLyFRIXL0Is+evTspFF1CSmOqVrGo4dNy/EYXj/17tPYDaoMFrjaXbV
	I2Usrwabi1oQKTf8SRAAyUuVGj30AZeUUdCsoMYjwbJUu4+6jPOuUveI8N9oJ7Fdaavz84BDJbRSQ
	RsZHrLruH8yBwtSQXdTiFbQTwbA0zfYEh0H9gh/hvdiHY2xznvzp/DyfVWG7dY8v8iDRkGln/vkzc
	2T3WtbU0xiZ/rrr+OR90AxHzkYBTBja7LJlL0BkWHqX9bQzHVXNqaEbYpAwrAcFJv/7JvbMO7Jipd
	2iHN5suw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTk-0000000C0XA-2zxo;
	Fri, 06 Nov 2026 10:47:28 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTa-0000000C0Aw-1gzl;
	Fri, 06 Nov 2026 10:47:20 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07M1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:11 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07M1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962032;
	bh=1aOQMD6JlTDLVsQjQedtpJM3c2lEIuqtDtE0HdhEhiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QV5zVbqxanNS1CeFFjg+76A+oNaXC5XKw8wiH1xXRkYtRe6w30RTfhZ/lm6yVCNUK
	 uBitPPczjeZRTuRgC9NDz4yfT+smLsMEWnP8Yau3JEkJEoSGdsvmGgVhlnJpcQl0qN
	 5bHlOfkk7zDvwrfnC2HNZxwLbNrZoyhPACg5rrpY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 07/10] arm64: dts: amlogic: meson-s4: add the GE2D
Date: Fri,  6 Nov 2026 11:46:56 +0100
Message-ID: <20261106104659.54656-8-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024718_656498_65C1C26E 
X-CRM114-Status: UNSURE (   8.44  )
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
CgpBZGQgdGhlIEdFMkQgMkQgZ3JhcGhpY3MgYWNjZWxlcmF0b3IsIGNvbXBhdGlibGUgd2l0aCB0
aGUgQVhHIG9uZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4
bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1zNC5kdHNpIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCmluZGV4IDFl
OGI4NDViODBjMy4uOGJiZDcwZTUyYTI5IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tczQuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tczQuZHRzaQpAQCAtMTk5LDYgKzE5OSwxNiBAQCBzb2MgewogCQkjc2l6ZS1jZWxscyA9
IDwyPjsKIAkJcmFuZ2VzOwogCisJCWdlMmQ6IGdlMmRAZmYwNDAwMDAgeworCQkJY29tcGF0aWJs
ZSA9ICJhbWxvZ2ljLHM0LWdlMmQiOworCQkJcmVnID0gPDB4MCAweGZmMDQwMDAwIDB4MCAweDEw
MDAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyMTcgSVJRX1RZUEVfRURHRV9SSVNJTkc+
OworCQkJY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfR0UyRD47CisJCQlyZXNldHMgPSA8
JnJlc2V0IFJFU0VUX0dFMkQ+OworCQkJcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX1M0X0dF
MkRfSUQ+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKwogCQlncHU6IGdwdUBmZTQw
MDAwMCB7CiAJCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZzEyYS1tYWxpIiwgImFybSxt
YWxpLWJpZnJvc3QiOwogCQkJcmVnID0gPDB4MCAweGZlNDAwMDAwIDB4MCAweDQwMDAwPjsKLS0g
CjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK

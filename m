Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB9606A322
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1E8otqRD;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=EdUZDh+U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G5jX1FHSTZEWy0seUFA19DX9sxLSRJLJs54GQ6nWkss=; b=1E8otqRDeSKjsBIvy+2MoX7QHe
	hr2QqAwPNJJH1gJyv6bBRFW3h9JNSTYMPcmJKc3lGmFah0vCFJiO5LXm1Qyed4QUgeAyyrsq48U3H
	VY3ZPDlL25nllngPcGNLeweYEu9iVj1BLSoj/vfAVDdr111aIkPsqvMCBf8ds5X+KHy85PHK5mn6C
	xfogvnF3dWFexcSKMzMBP/NVIPR70tYw8g5s06vxWzok9rEVqtaYvSD0eUtcOJcTfE1zRoHm+plSH
	nqSSS4RlzobU09pk6DNi5GM6Ns9tBlYFQmKEBPNjIiOerOFYXHahmO5CSVrIS3tuJ04IqXLN96As8
	BmP6FAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ni-00000001LNJ-0jUy;
	Sun, 25 Oct 2026 19:22:38 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nc-00000001LGF-2Q52;
	Sun, 25 Oct 2026 19:22:35 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMK11517096
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:25 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMK11517096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956146;
	bh=Um/nwS5ME7MphJPeuJrjAiVQ3qj8NO8BRpGBgBHMR7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EdUZDh+Uwc2of9wlbsu6R7rGAUZWfj/KgpHZTQx7v4H0+fsAlPcyQhxIZEOoJeX9K
	 jp6+xQmMl80CzhpeFUJ4pNbN68eGiAVa4EvgDZzyRP/UGD4z24T3Pj/4fuSanrq5ji
	 jKCwz4GoQ4Zw9+dMLtaxTPEtTEVW7Xr2CwIE+IJA=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/4] dt-bindings: clock: amlogic,s4-pll-clkc: add the CPU clock
Date: Sun, 25 Oct 2026 20:22:16 +0100
Message-ID: <20261025192219.209137-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122233_719318_BFBF6199 
X-CRM114-Status: UNSURE (   8.37  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpBZGQgYW4gaWRlbnRpZmllciBmb3IgdGhlIFM0IENQVSBjbG9jayBzbyB0aGF0IHRoZSBDUFUg
bm9kZXMgY2FuCnJlZmVyZW5jZSBpdCBmb3IgZnJlcXVlbmN5IHNjYWxpbmcuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4K
LS0tCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MuaCB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmggYi9pbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MuaAppbmRleCBhZjlmMTEwZjhiNjIuLjgxNDNj
NmMxNDg2YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0
LXBsbC1jbGtjLmgKKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBs
bC1jbGtjLmgKQEAgLTM5LDUgKzM5LDYgQEAKICNkZWZpbmUgQ0xLSURfTVBMTDIJCQkyOQogI2Rl
ZmluZSBDTEtJRF9NUExMM19ESVYJCQkzMAogI2RlZmluZSBDTEtJRF9NUExMMwkJCTMxCisjZGVm
aW5lIENMS0lEX0NQVV9DTEsJCQkzMgogCiAjZW5kaWYgLyogX0RUX0JJTkRJTkdTX0NMT0NLX0FN
TE9HSUNfUzRfUExMX0NMS0NfSCAqLwotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

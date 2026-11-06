Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A6606A338
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GcwRIrBo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=q8BZ1Wj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2M0sVraxMhFlmsdlroVu0VLPehXvnffHGHOval28EUA=; b=GcwRIrBockMI+70lupYLyFJRoa
	TgbfyntjoWmZKKiA6Cxl1/UeWg07XaUcCb0ar4Xig3vRkCJ8txmwjvVB+WNaFnPowyFi8fSYNhJAR
	R7Mza1Fcm4guRSF2lCJV3E2yxMwyT9JiOvJaLcc5UDEwM/Or55yq5vDNYcwLQoe/eUeQRIVT6etTW
	BiIwgiXhPclt1Y092egS56RTKm0kCBq7OMORNqcsmk562Tm08WyScgO2AvBqQZxCklqwppDeHoHFn
	auRy2jwpDrgIGQaXbu3Hnb4fJcDN+NXCkFFqrP53OZR1oIZ4pOEbL6Vi45pas2UDUgie8RqJqgj/v
	dDK9l3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2l-0000000Btcb-0qNN;
	Fri, 06 Nov 2026 10:19:35 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2g-0000000BtZK-2UCe
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:19:34 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJFCV1863929
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:19 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJFCV1863929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960359;
	bh=6QgvRhlzOA/wreBqMg52QNgHYNNm7XlsRj0cgRLIaiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=q8BZ1Wj35fLCS3WMlUsfr+GVTwFzd7K5aqk9Vw4j2NPOIdz+gpLHyPrBJkdqFDXpr
	 8zjahMZw8EWwrumwt0pcZFxiOfAKD0Q959Qbc932gMNnP+DBkSGHgK7sToEYdjTs71
	 YiPmhy2AsRgGNDw6iifS+YpMgHYbqVkwhsNozh8k=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 1/3] dt-bindings: thermal: amlogic: add S4
Date: Fri,  6 Nov 2026 11:19:11 +0100
Message-ID: <20261106101913.46664-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021930_971660_595B3785 
X-CRM114-Status: GOOD (  11.25  )
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
CgpUaGUgUzQgdGVtcGVyYXR1cmUgc2Vuc29ycyBhcmUgdGhlIEcxMkEgZGVzaWduLCBidXQgbGlr
ZSBvbiBUNyB0aGVpcgpjYWxpYnJhdGlvbiB2YWx1ZSBpcyBvbmx5IGF2YWlsYWJsZSB0aHJvdWdo
IHRoZSBzZWN1cmUgbW9uaXRvcjogdGhlCmFvLXNlY3VyZSByZWdpc3RlciB1c2VkIG9uIEcxMkEg
aG9sZHMgdW5yZWxhdGVkIGRhdGEgb24gUzQuIEFkZCBhCmNvbXBhdGlibGUgZm9yIHRoZW0uIEFz
IG9uIFQ3IHRoZSBzZW5zb3IgaW5kZXggaXMgdGhlIGFyZ3VtZW50IG9mIHRoZQpzZWN1cmUgbW9u
aXRvciBwaGFuZGxlLCBzbyBvbmUgY29tcGF0aWJsZSBzZXJ2ZXMgdGhlIENQVSBhbmQgdGhlIERE
UgpzZW5zb3IuIEVhY2ggc2Vuc29yIGhhcyBhIGJ1cyBjbG9jayBnYXRpbmcgcmVnaXN0ZXIgYWNj
ZXNzICh0c19wbGwgLwp0c19kZHIgaW4gdGhlIFM0IHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxl
cikgYmVzaWRlcyB0aGUgZnVuY3Rpb25hbApjbG9jaywgc28gaXQgdGFrZXMgYm90aCwgbmFtZWQu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJA
b3V0bG9vay5kZT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMs
dGhlcm1hbC55YW1sICAgICAgICAgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbAppbmRleCBl
NzJjYjM5YWM2MzUuLjY2ZGQ1NzJmZjQ0YiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwK
QEAgLTIzLDYgKzIzLDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2lj
LGcxMmEtdGhlcm1hbAogICAgICAgLSBlbnVtOgogICAgICAgICAgIC0gYW1sb2dpYyxhMS1jcHUt
dGhlcm1hbAorICAgICAgICAgIC0gYW1sb2dpYyxzNC10aGVybWFsCiAgICAgICAgICAgLSBhbWxv
Z2ljLHQ3LXRoZXJtYWwKIAogICByZWc6CkBAIC04NCw3ICs4NSw5IEBAIGFsbE9mOgogICAgICAg
cHJvcGVydGllczoKICAgICAgICAgY29tcGF0aWJsZToKICAgICAgICAgICBjb250YWluczoKLSAg
ICAgICAgICAgIGNvbnN0OiBhbWxvZ2ljLHQ3LXRoZXJtYWwKKyAgICAgICAgICAgIGVudW06Cisg
ICAgICAgICAgICAgIC0gYW1sb2dpYyxzNC10aGVybWFsCisgICAgICAgICAgICAgIC0gYW1sb2dp
Yyx0Ny10aGVybWFsCiAgICAgdGhlbjoKICAgICAgIHByb3BlcnRpZXM6CiAgICAgICAgIGNsb2Nr
czoKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK

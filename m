Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4123606A329
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EeCPNDTt;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=H4gaF3kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oQ+dwxHlhsqRV4KM5dlQSmsZMok3oXFvHu/20awUpsw=; b=EeCPNDTtd38YlKuqrDb2uQ8m7s
	W5JAxSb6odTAmDIj/sIkyHYx8DSdgcPKuIH/PQwxHNH32X0YfDYx1XR3gEdwLTB9SdEtu2NAH4uOU
	s7BI5YvQoqIQKrZ/kQupoem6HwgMLdxcCzXqt9m3VRg4Xc3NgjLUyiy8vCYDXFIkbWCOca9/fF7mA
	qlta8Gv+lspAH66UfwtVY3DKAAhNxFKCIXnXAzHQT+v4oGy1yaA4ubTdo9a4mrDfC61q4arEo1nfR
	f+oYh2bEqONfAkL72Rm/1TltLlVJN6HBhEw9fLDTW7WvR6hXGG6PYrMZlPBIi3WMY3dDed7ejJiA+
	FNv6IpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH4S-0000000BuS0-1b68;
	Fri, 06 Nov 2026 10:21:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH4O-0000000BuQm-3SX7;
	Fri, 06 Nov 2026 10:21:18 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AL6f81868854
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:21:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AL6f81868854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960470;
	bh=gJc6Vw+f+t179NkK673wH0DPl0vWcqe86Z5EpJ6b2Pg=;
	h=From:To:Cc:Subject:Date;
	b=H4gaF3kqEW31uWchGw9J23gcpiLOH9aisl4OpFNaa48GupXaE21ApN4y4llIUU3YO
	 2hU31zTGvikSXV01/u5dv1sFeSDZQgdOLK06Y7LSX5Ovzorn/rOunt2D8ov4gBZ33i
	 tHbLls+gUAq32350bm0y8xzRNDbqK8zHhEULtyL4=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, hverkuil@kernel.org, mchehab@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2] media: cec: meson: ao-cec: enable the controller clock at probe
Date: Fri,  6 Nov 2026 11:21:05 +0100
Message-ID: <20261106102105.47244-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022117_196982_3179130F 
X-CRM114-Status: GOOD (  18.94  )
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
CgpUaGUgQ0VDIGNvcmUgY2FsbHMgLmFkYXBfbG9nX2FkZHIoKSBiZWZvcmUgLmFkYXBfZW5hYmxl
KCksIHNvIHRoZSBmaXJzdApyZWdpc3RlciBhY2Nlc3MgY2FuIGhhcHBlbiB3aGlsZSB0aGUgY29u
dHJvbGxlciBpcyBzdGlsbCBpbiBwb3dlci1vZmYKbW9kZSAoQ0VDX0dFTl9DTlRMIGNsb2NrIGZp
ZWxkIDApLiBUaGUgcHJvYmUgb25seSBwdWxzZXMgdGhlIHJlc2V0IGJpdCwKbGVhdmVzIHRoZSBj
bG9jayBmaWVsZCBhdCB6ZXJvLCBhbmQgZG9lcyBzbyBvbmx5IGFmdGVyIHRoZSBhZGFwdGVyIGhh
cwpiZWVuIHJlZ2lzdGVyZWQsIHdoZW4gdGhlIGNvcmUgbWF5IGFscmVhZHkgYmUgdXNpbmcgaXQu
CgpPbiBTNCBhbiBhY2Nlc3MgdG8gdGhlIHBvd2VyZWQtb2ZmIGNvbnRyb2xsZXIgbmV2ZXIgY29t
cGxldGVzOiBpdApzdGFsbHMgdGhlIEFPIGJ1cyBhbmQgaGFyZC1oYW5ncyB0aGUgU29DLiBUaGlz
IHRyaWdnZXJzIG9uIGV2ZXJ5IEhETUkKdW5wbHVnLCBiZWNhdXNlIHRoYXQgaW52YWxpZGF0ZXMg
dGhlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIG1ha2VzIHRoZQpjb3JlIHJld3JpdGUgdGhlIGxvZ2lj
YWwgYWRkcmVzcy4KClJlc2V0IHRoZSBjb250cm9sbGVyIGFuZCBsZWF2ZSBpdHMgY2xvY2sgcnVu
bmluZyBiZWZvcmUgdGhlIGFkYXB0ZXIgaXMKcmVnaXN0ZXJlZCwgYXMgLmFkYXBfZW5hYmxlKCkg
d291bGQuCgpGaXhlczogN2VjMmMwZjcyY2IxICgibWVkaWE6IHBsYXRmb3JtOiBBZGQgQW1sb2dp
YyBNZXNvbiBBTyBDRUMgQ29udHJvbGxlciBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCkNoYW5nZXMg
aW4gdjI6Ci0gU2V0IHVwIHRoZSBjb250cm9sbGVyIGJlZm9yZSBjZWNfbm90aWZpZXJfY2VjX2Fk
YXBfcmVnaXN0ZXIoKSBhbmQKICBjZWNfcmVnaXN0ZXJfYWRhcHRlcigpLCBub3QgYWZ0ZXI6IG9u
Y2UgcmVnaXN0ZXJlZCwgdGhlIGNvcmUgbWF5IGNhbGwKICAuYWRhcF9sb2dfYWRkcigpIHN0cmFp
Z2h0IGF3YXkgKHJlcG9ydGVkIGJ5IHRoZSBTYXNoaWtvIEFJIHJldmlldykuCi0gTGluayB0byB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MTAyNTE5MjA0Ni4yMDg3MTAtMS1jaHJp
c3RpYW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdAoKVG9vbCB1c2UgKERvY3VtZW50
YXRpb24vcHJvY2Vzcy9nZW5lcmF0ZWQtY29udGVudC5yc3QpOgpUaGlzIHdvcmsgd2FzIGRvbmUg
d2l0aCB0aGUgaGVscCBvZiBhbiBBSSBjb2RpbmcgYXNzaXN0YW50LCBDbGF1ZGUKKEFudGhyb3Bp
YyksIHVzZWQgdGhyb3VnaCBDbGF1ZGUgQ29kZSBvdmVyIG1hbnkgc2Vzc2lvbnMuIEl0IGRpZCBh
IGxhcmdlCnBhcnQgb2YgdGhlIGhhbmRzLW9uIHdvcms6IGl0IHJlYWQgdGhlIHZlbmRvciBrZXJu
ZWwgYW5kIHRoZSBmaXJtd2FyZQppbnRlcmZhY2VzLCBwcm9iZWQgcmVnaXN0ZXJzIG9uIHRoZSBi
b2FyZCwgZHJhZnRlZCB0aGUgY29kZSBhbmQgdGhlCmNoYW5nZWxvZ3MsIGFuZCByYW4gdGhlIGJ1
aWxkcywgY2hlY2twYXRjaCwgZHRfYmluZGluZ19jaGVjayBhbmQgdGhlCnRlc3RzIG9uIHRoZSBo
YXJkd2FyZS4gSSBkaXJlY3RlZCB0aGUgd29yaywgcmV2aWV3ZWQgZXZlcnkgY2hhbmdlIGFuZAp0
aGUgZmluYWwgcGF0Y2hlcywgYW5kIHRha2UgcmVzcG9uc2liaWxpdHkgZm9yIHRoZW0uIFRoZXJl
IGlzIG5vIHNpbmdsZQpwcm9tcHQgdG8gcXVvdGU7IHRoZSBzZXNzaW9ucyB3ZXJlIG9mIHRoZSBm
b3JtICJmaW5kIG91dCB3aHkgWCBmYWlscyBvbgp0aGlzIGJvYXJkLCBmaXggaXQsIHRlc3QgaXQg
b24gdGhlIGJveCIuCgpUZXN0ZWQgb24gYW4gQW1lZGlhdGVjaCBYOThRIFRWIGJveCAoQW1sb2dp
YyBTOTA1VzIsIFM0IGZhbWlseSwgMiBHaUIpLAp2ZW5kb3IgVS1Cb290IGFuZCBCTDMxL09QLVRF
RSwgTGludXggNy4zIHBsdXMgdGhpcyB3b3JrLgoKIGRyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3Jt
L21lc29uL2FvLWNlYy5jIHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jIGIvZHJpdmVycy9tZWRpYS9jZWMv
cGxhdGZvcm0vbWVzb24vYW8tY2VjLmMKaW5kZXggMmRmMGQzNzQzMDc3Li40YzAzYzgyOWZlODYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jCisr
KyBiL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jCkBAIC02NjAsNiAr
NjYwLDI4IEBAIHN0YXRpYyBpbnQgbWVzb25fYW9fY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAKIAlkZXZpY2VfcmVzZXRfb3B0aW9uYWwoJnBkZXYtPmRldik7CiAKKwkv
KgorCSAqIFNldHVwIEhhcmR3YXJlLCBiZWZvcmUgdGhlIGFkYXB0ZXIgaXMgcmVnaXN0ZXJlZDog
ZnJvbSB0aGVuIG9uIHRoZQorCSAqIENFQyBjb3JlIG1heSBjYWxsIC5hZGFwX2xvZ19hZGRyKCkg
YXQgYW55IHRpbWUuCisJICoKKwkgKiBMZWF2ZSB0aGUgY29udHJvbGxlciB3aXRoIGl0cyBnYXRl
ZCBjbG9jayBydW5uaW5nLiBUaGUgQ0VDIGNvcmUKKwkgKiBjYWxscyAuYWRhcF9sb2dfYWRkcigp
IGJlZm9yZSBpdCBldmVyIGNhbGxzIC5hZGFwX2VuYWJsZSgpLCBzbyB0aGUKKwkgKiBmaXJzdCBy
ZWdpc3RlciBhY2Nlc3MgaGFwcGVucyB3aGlsZSB0aGUgYmxvY2sgd291bGQgb3RoZXJ3aXNlIHN0
aWxsCisJICogYmUgaW4gcG93ZXItb2ZmIG1vZGUgKENFQ19HRU5fQ05UTCBjbGsgZmllbGQgPT0g
MCkuIE9uIEFtbG9naWMgUzQKKwkgKiB0aGF0IGFjY2VzcyBuZXZlciBjb21wbGV0ZXM6IGl0IHN0
YWxscyB0aGUgQU8gYnVzIGFuZCBoYXJkLWhhbmdzIHRoZQorCSAqIFNvQyAtIGV2ZXJ5IENQVSBz
dG9wcywgSVJRcyBpbmNsdWRlZCAtIHdoaWNoIGhhcHBlbnMgb24gZXZlcnkgSERNSQorCSAqIGhv
dC11bnBsdWcsIGJlY2F1c2UgdGhhdCBpcyB3aGF0IGludmFsaWRhdGVzIHRoZSBDRUMgcGh5c2lj
YWwKKwkgKiBhZGRyZXNzLgorCSAqLworCXdyaXRlbF9yZWxheGVkKENFQ19HRU5fQ05UTF9SRVNF
VCB8CisJCSAgICAgICBGSUVMRF9QUkVQKENFQ19HRU5fQ05UTF9DTEtfQ1RSTF9NQVNLLAorCQkJ
CSAgQ0VDX0dFTl9DTlRMX0NMS19FTkFCTEUpLAorCQkgICAgICAgYW9fY2VjLT5iYXNlICsgQ0VD
X0dFTl9DTlRMX1JFRyk7CisJZnNsZWVwKDEwMCk7CisJd3JpdGVsX3JlbGF4ZWQoRklFTERfUFJF
UChDRUNfR0VOX0NOVExfQ0xLX0NUUkxfTUFTSywKKwkJCQkgIENFQ19HRU5fQ05UTF9DTEtfRU5B
QkxFKSwKKwkJICAgICAgIGFvX2NlYy0+YmFzZSArIENFQ19HRU5fQ05UTF9SRUcpOworCiAJYW9f
Y2VjLT5wZGV2ID0gcGRldjsKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBhb19jZWMpOwog
CkBAIC02NzQsMTAgKzY5Niw2IEBAIHN0YXRpYyBpbnQgbWVzb25fYW9fY2VjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHJldCA8IDApCiAJCWdvdG8gb3V0X3Byb2Jl
X25vdGlmeTsKIAotCS8qIFNldHVwIEhhcmR3YXJlICovCi0Jd3JpdGVsX3JlbGF4ZWQoQ0VDX0dF
Tl9DTlRMX1JFU0VULAotCQkgICAgICAgYW9fY2VjLT5iYXNlICsgQ0VDX0dFTl9DTlRMX1JFRyk7
Ci0KIAlyZXR1cm4gMDsKIAogb3V0X3Byb2JlX25vdGlmeToKCmJhc2UtY29tbWl0OiA3YmU0YmM1
MmZkOWUwZTU1ZGM5YTJlMDIzMmI4OTQyN2QyYzRiNjE0Ci0tIAoyLjU2LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB68606A328
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b69GKlsF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=tA4kVeKE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IqlDniQki4rZZi3xmGh1TTRmvPWLW2FWhtnW/xevcv4=; b=b69GKlsFRfbTgfXQra6tZHW5Pa
	j/3alm8Lt+a32pMTrBhYsPxU79P0g/IhxywUvlsAr2LegdV/ilWrzRLPDyEYI8qFXRet/RpICXQtm
	oTNt66W2JmJLTotUezZVBIwSMrIb0zw+7N3DQ9gku2DRjQRBc5/hAkr+POKRikPDcVv6tMdE96BvI
	6UpB4RHfHzxBupvj4ZW6xErBcLM/cwA4xIN+Q/J9A1JKfidUzUwrYhjxUvu/v0zy2+u7gnxmeh2Nk
	HkJBcEqq+hpLVRD5JXC9EU9OsUfLVPhe8+/kUiS4AEl07CnIWXKzHz6TAhQF/Lw+728qgt5fIaoAa
	PSlO4Z7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3kl-00000001Jzf-2TCH;
	Sun, 25 Oct 2026 19:19:35 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3kh-00000001Jyh-3sDA;
	Sun, 25 Oct 2026 19:19:33 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJJ1eT514480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:19:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJJ1eT514480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792955945;
	bh=Dqs4z2NY1rb7FbmpNSV5YxzKzMNh1uksqRMZQL4TgK8=;
	h=From:To:Cc:Subject:Date;
	b=tA4kVeKENgDnCqlEJ4/6yeAWjQe5GPl9K8OgiL9OoWKSllIreQ9QS+7hgJIIE1sI1
	 pwhNYsgj5KbD4nNXXPpaJhuN9xkgr6XWQ0toQo/CC5+j1pfAWjpT5Yvg3hWqpTRnfQ
	 2nlmye3svoCEB8XtpL+QrxHI5cMN5OtfdetVsQEo=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] clk: meson: s4: two peripheral clock fixes
Date: Sun, 25 Oct 2026 20:18:50 +0100
Message-ID: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_121932_185317_128DE0B9 
X-CRM114-Status: UNSURE (   9.32  )
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
CgpUd28gZml4ZXMgZm9yIHRoZSBTNCBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIgZm91bmQg
d2hpbGUgYnJpbmdpbmcKdXAgYW4gUzkwNVcyIFRWIGJveDoKCiAtIHRoZSBQV00gbXV4ZXMgbWF5
IHBpY2sgdmlkX3BsbCwgd2hpY2ggaXMgcmVwcm9ncmFtbWVkIG9uIGV2ZXJ5IEhETUkKICAgbW9k
ZSBzZXQgYW5kIHNvIGNoYW5nZXMgdGhlIHBlcmlvZCBvZiBhbnkgUFdNIHRoYXQgcnVucyBmcm9t
IGl0LiBPbgogICB0aGlzIGJvYXJkIHRoYXQgY29ycnVwdGVkIHRoZSBQV00gQ1BVIHJlZ3VsYXRv
ciAoZmlyc3QgY3B1ZnJlcQogICB0cmFuc2l0aW9uIGh1bmcgdGhlIFNvQykgYW5kIHRoZSAzMi43
Njgga0h6IGNsb2NrIG9mIHRoZSBTRElPIHdpZmkKICAgY2hpcDsKIC0gdGhlIENFQyAzMmsgc2Vs
ZWN0b3JzIGxhY2sgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgc28gQU8tQ0VDIGNhbm5vdCBzZXQKICAg
aXRzIDMyNzY4IEh6IHJhdGUgYW5kIGZhaWxzIHRvIHByb2JlLgoKVG9vbCB1c2UgKERvY3VtZW50
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
RSwgTGludXggNy4zIHBsdXMgdGhpcyB3b3JrLgoKQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURy
YXhsICgyKToKICBjbGs6IG1lc29uOiBzNDoga2VlcCB0aGUgUFdNIGNsb2NrcyBvZmYgdmlkX3Bs
bAogIGNsazogbWVzb246IHM0OiBwcm9wYWdhdGUgcmF0ZSByZXF1ZXN0cyB0aHJvdWdoIHRoZSBD
RUMgMzJrIG11eGVzCgogZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYyB8IDQwICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA3YmU0YmM1MmZkOWUwZTU1ZGM5
YTJlMDIzMmI4OTQyN2QyYzRiNjE0Ci0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

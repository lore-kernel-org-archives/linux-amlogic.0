Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58C2606D80E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jpeUF13D;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=OTr64l7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sTjgHNkiPMgdQvD45dlHOQ/xBF6mkYlZClPi21BfExA=; b=jpeUF13DvrrnI07addK8GN4Ica
	AzMFeR6ETqkfwY8fO1WIga6M9YZz9ZQa+rwtkojzmWnOQ8P1i5Lzf+Zkk4q360N9ft+Aw3K1zDobx
	VMeS51Trs9Z3W29sZ/jqF5BNRXOXJJfE6o5TlM+QH0mWID3JBx6CoZNPUuYyMYwZM1E4g76jyaxg2
	FpHydqRnp/IdhOExfjZ7VhvDmWelglv8CI+3wKaEKjYk0yvG7Ij59kWP7/KVtWE9f4LYJ3vmIkkL4
	QcM6U2IfAxLaLSv1BjYmh/mIGqncshwa54hGrACLp8CQbWBo3fuvc/Gz5Rt4KmKcRzodJ9uEQasmB
	+d8ynmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2o-0000000Btfb-17b0;
	Fri, 06 Nov 2026 10:19:38 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2i-0000000BtZk-0H7I
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:19:34 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJFCX1863929
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:22 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJFCX1863929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960362;
	bh=dSK6Qss+gWvybGICqOwyGsIjhnfJGdmoQt5OqdnLTHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OTr64l7Gdgk015jkXzpixEqd+24O/Iq8jMLOKPXrL6CcfNItxL+l92pF93/aP1Yz+
	 TBt7ML469pTLmGeYHsv+uCEVdfb9J3qsRRKUiXt7QNP+lgjxNKNTDUzIS/Z28h7aSa
	 ENho7H32ZN3yslUMDapFe0e/zH1SBNjEddNtfPwg=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 3/3] thermal/drivers/amlogic: do not log the secure monitor deferral as an error
Date: Fri,  6 Nov 2026 11:19:13 +0100
Message-ID: <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021932_344992_FE6E7E29 
X-CRM114-Status: GOOD (  10.20  )
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
CgpUaGUgdGhlcm1hbCBzZW5zb3IgdXN1YWxseSBwcm9iZXMgYmVmb3JlIHRoZSBzZWN1cmUgbW9u
aXRvciwgc28gdGhlCmZpcnN0IGF0dGVtcHQgYWx3YXlzIGRlZmVycyBhbmQgbG9ncyAiRmFpbGVk
IHRvIGdldCBzZWN1cmUgbW9uaXRvcgpmaXJtd2FyZSIgYXMgYW4gZXJyb3Igb24gZXZlcnkgYm9v
dCwgYWx0aG91Z2ggdGhlIHNlY29uZCBhdHRlbXB0CnN1Y2NlZWRzLiBVc2UgZGV2X2Vycl9wcm9i
ZSgpLCB3aGljaCByZWNvcmRzIHRoZSByZWFzb24gZm9yIHRoZQpkZWZlcnJhbCBpbnN0ZWFkIG9m
IGxvZ2dpbmcgaXQuCgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4
bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIGRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJt
YWwuYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMg
Yi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKaW5kZXggNGMxMDdiMzEwMGMwLi5i
YmY5MTBiYTg1MTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwu
YworKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKQEAgLTE5NiwxMCArMTk2
LDkgQEAgc3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxfcHJvYmVfc20oc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwKIAogCXBkYXRhLT5zbV9mdyA9IG1lc29uX3NtX2dldChwaF9hcmdzLm5w
KTsKIAlvZl9ub2RlX3B1dChwaF9hcmdzLm5wKTsKLQlpZiAoIXBkYXRhLT5zbV9mdykgewotCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgc2VjdXJlIG1vbml0b3IgZmlybXdhcmVcbiIpOwot
CQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKLQl9CisJaWYgKCFwZGF0YS0+c21fZncpCisJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgLUVQUk9CRV9ERUZFUiwKKwkJCQkgICAgICJGYWlsZWQgdG8g
Z2V0IHNlY3VyZSBtb25pdG9yIGZpcm13YXJlXG4iKTsKIAogCXBkYXRhLT50c2Vuc29yX2lkID0g
cGhfYXJncy5hcmdzWzBdOwogCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

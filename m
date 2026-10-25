Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552C606A31D
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XjehMxbB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=BnEbK9UU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xni7E1v9JWB/CAVYdJ0z6uKpvUrjvnVfqvEsQpDfl0A=; b=XjehMxbBAKTHLnKpFCAXvkhaCG
	V+CbpQ32Zj9u7UwxmTuaifS6VWNcj5Jv5vQNxoEJVoii84h9Y9/cHiYeyMdBoG8hLxEEXqS6Ledcf
	EoJyvkYgSYWTybQ+QJnJREAzARqSpf+V66WlzD8+X352uXErtuCyIqTpwVOKECTXXBhyGuppJFaOm
	hyspTHUDH/LJX6LHQEZjGcZFSuKLxZk6pCr+AvhYb1vOlAHn9gYP/HWwKepJo5jFc/nBYQIfSzEoK
	GT57bYcVtQ8esUYWkZu3tHXLa9+2TOEnbjzYs1wqR8JmEv94OnmZ67TIEdmbX5PRdYMcuztKO+gvd
	dBvPpMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mN-00000001KUM-46bl;
	Sun, 25 Oct 2026 19:21:15 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mL-00000001KRH-1aTv;
	Sun, 25 Oct 2026 19:21:14 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJL1Gu515970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJL1Gu515970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956067;
	bh=83TKF6OdDojPyY1KN+pzZOnG66a9l945Oy7xFtIvD9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BnEbK9UU57qCvwyEN0pfU2mltlTqSviXEx7oX5BC7t5Mq0q9eQg6M72LE9D17Ancr
	 bdzMEHSo5XEBbJGYmuAMhsZ8rSa6PnZfI9JRa4xrxymlJ0l5Zj0X/27hsMTRY/gTL2
	 NtKgZ7U7h1dbThIOfrW89w162D67kc+2zcs2msfc=
From: christian.koever-draxl@student.uibk.ac.at
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: mmc: amlogic,meson-gx-mmc: add amlogic,core-phase-degrees
Date: Sun, 25 Oct 2026 20:20:58 +0100
Message-ID: <20261025192059.208792-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -10.0 ALL_TRUSTED,DIPLOMAS1,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122113_581929_14889733 
X-CRM114-Status: UNSURE (   9.65  )
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
CgpUaGUgY29udHJvbGxlciBzYW1wbGVzIHdpdGggYSBjb3JlIGNsb2NrIHBoYXNlIHRoYXQgaXMg
Zml4ZWQgYXQgMTgwCmRlZ3JlZXMgaW4gdGhlIGRyaXZlci4gU29tZSBib2FyZHMgbmVlZCBhbm90
aGVyIHBoYXNlIHRvIHdvcmsgYXQgaGlnaApzcGVlZDogYW4gU0Qgc2xvdCBvbiBhbiBTOTA1VzIg
VFYgYm94IGZhaWxzIHdpdGggQ1JDIGVycm9ycyBhdCA1MCBNSHoKYXQgMTgwIGRlZ3JlZXMgYnV0
IHdvcmtzIHJlbGlhYmx5IGF0IDI3MCBkZWdyZWVzLCB3aGljaCBpcyBhbHNvIHdoYXQKdGhlIHZl
bmRvciBrZXJuZWwgcHJvZ3JhbXMgZm9yIGl0LgoKQWRkIGFuIG9wdGlvbmFsIHByb3BlcnR5IHRv
IGRlc2NyaWJlIHRoZSBwaGFzZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2
dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21tYy9hbWxvZ2ljLG1lc29uLWd4LW1tYy55YW1sICAgIHwgOSArKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gtbW1jLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gtbW1jLnlhbWwK
aW5kZXggOTc2ZjM2ZGUyMDkxLi44MTIzMzc1YTY2ZTAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYW1sb2dpYyxtZXNvbi1neC1tbWMueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gt
bW1jLnlhbWwKQEAgLTU4LDYgKzU4LDE1IEBAIHByb3BlcnRpZXM6CiAgIHBvd2VyLWRvbWFpbnM6
CiAgICAgbWF4SXRlbXM6IDEKIAorICBhbWxvZ2ljLGNvcmUtcGhhc2UtZGVncmVlczoKKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBkZXNjcmlw
dGlvbjoKKyAgICAgIFBoYXNlIG9mIHRoZSBjb250cm9sbGVyIGNvcmUgY2xvY2sgcmVsYXRpdmUg
dG8gdGhlIGNhcmQgY2xvY2suIFNvbWUKKyAgICAgIGJvYXJkcyBvbmx5IHNhbXBsZSByZWxpYWJs
eSBhdCBoaWdoIHNwZWVkIHdpdGggYSBwaGFzZSBvdGhlciB0aGFuCisgICAgICB0aGUgZGVmYXVs
dC4KKyAgICBlbnVtOiBbMCwgOTAsIDE4MCwgMjcwXQorICAgIGRlZmF1bHQ6IDE4MAorCiByZXF1
aXJlZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVnCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

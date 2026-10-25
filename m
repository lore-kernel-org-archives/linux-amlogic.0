Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47750606A33B
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sVZD6ANi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LY4iS6qT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uQwm3eHA5jJk5nRjF08nUDP9WUQKU77CpjUgTeVPTdc=; b=sVZD6ANibSp+dXxnWmT87Gebb8
	DpBw/3nUorKqDiCruNNH8bHBYq13FVVO6iMgxZ+BCu4EQ7BW5WxVZB4MOyHXG5mIgi6jP6Tkf+xf7
	c5NYJSt4qYbqrqlvVS0zDRAEFqE+0OyQiVngPXQ3nG+MaCfBC+oVksxuQg8mNQzZPupCGdHs9tzPR
	SIE95ydaDL3XmqkTPoEHuOIlKU6GILAsa8ONXFhNcugyl5Suo7JMlwqKMQCaW1sX4g16jj7b0ni5a
	yAL2RyXoHVwLrjYuC6u9d3P2ZoNMjv0pqx8Srm/a2pgDSKSvRSS2xyNlxy0/rNf0jbEaodSwn19mP
	xq5wzmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pR-00000001MgV-01Ht;
	Sun, 25 Oct 2026 19:24:25 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pO-00000001MdF-1GBf;
	Sun, 25 Oct 2026 19:24:23 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ia518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ia518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956251;
	bh=pBGg+7YBv7mCvyQ0Rvya67DnT4i0HOQlxmouxQbSJR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LY4iS6qTFogv92Q0h2JBUTh6d74cfOefsnuvQXK2FB1vZEaKSvFm8yU/kCbrAuDNB
	 kgyFnb2KQUZ8FopwEbHFCYBboO4UXYh5TjjSwMdTuRMhDmpO/JRP5o6Yfpg8yEr0AP
	 sTQYxiROXDamFikedGCjJuo8H7YzD766jVVsDXLk=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 1/7] dt-bindings: clock: meson: Add audio power domain for S4 soc
Date: Sun, 25 Oct 2026 20:23:58 +0100
Message-ID: <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122422_717409_F86B974A 
X-CRM114-Status: UNSURE (   7.78  )
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

RnJvbTogSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+CgpUaGUgYXVkaW8g
cG93ZXIgZG9tYWluIGhhcyBiZWVuIGZvdW5kIG9uIFM0IGRldmljZS4KSXQgbXVzdCBiZSBlbmFi
bGVkIHByaW9yIHRvIGF1ZGlvIG9wZXJhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBKaWViaW5nIENo
ZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0
ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Ci0tLQogLi4uL2JpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsYXhnLWF1ZGlvLWNsa2MueWFtbCB8IDE4ICsrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
YXhnLWF1ZGlvLWNsa2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwKaW5kZXggZmQ3OTgyZGQ0Y2VhLi4xY2Q5
YTk5ZTVmZjMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYXhnLWF1ZGlvLWNsa2MueWFtbApAQCAtMjAs
NiArMjAsNyBAQCBwcm9wZXJ0aWVzOgogICAgIGVudW06CiAgICAgICAtIGFtbG9naWMsYXhnLWF1
ZGlvLWNsa2MKICAgICAgIC0gYW1sb2dpYyxnMTJhLWF1ZGlvLWNsa2MKKyAgICAgIC0gYW1sb2dp
YyxzNC1hdWRpby1jbGtjCiAgICAgICAtIGFtbG9naWMsc20xLWF1ZGlvLWNsa2MKIAogICAnI2Ns
b2NrLWNlbGxzJzoKQEAgLTk5LDcgKzEwMCw4IEBAIHByb3BlcnRpZXM6CiAKICAgcmVzZXRzOgog
ICAgIGRlc2NyaXB0aW9uOiBpbnRlcm5hbCByZXNldCBsaW5lCi0KKyAgcG93ZXItZG9tYWluczoK
KyAgICBtYXhJdGVtczogMQogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtICcjY2xvY2st
Y2VsbHMnCkBAIC0xMTUsNiArMTE3LDcgQEAgYWxsT2Y6CiAgICAgICAgICAgY29udGFpbnM6CiAg
ICAgICAgICAgICBlbnVtOgogICAgICAgICAgICAgICAtIGFtbG9naWMsZzEyYS1hdWRpby1jbGtj
CisgICAgICAgICAgICAgIC0gYW1sb2dpYyxzNC1hdWRpby1jbGtjCiAgICAgICAgICAgICAgIC0g
YW1sb2dpYyxzbTEtYXVkaW8tY2xrYwogICAgIHRoZW46CiAgICAgICByZXF1aXJlZDoKQEAgLTEy
Miw3ICsxMjUsMTggQEAgYWxsT2Y6CiAgICAgZWxzZToKICAgICAgIHByb3BlcnRpZXM6CiAgICAg
ICAgICcjcmVzZXQtY2VsbHMnOiBmYWxzZQotCisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgor
ICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgZW51
bToKKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLHM0LWF1ZGlvLWNsa2MKKyAgICB0aGVuOgorICAg
ICAgcmVxdWlyZWQ6CisgICAgICAgIC0gcG93ZXItZG9tYWlucworICAgIGVsc2U6CisgICAgICBw
cm9wZXJ0aWVzOgorICAgICAgICBwb3dlci1kb21haW5zOiBmYWxzZQogYWRkaXRpb25hbFByb3Bl
cnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

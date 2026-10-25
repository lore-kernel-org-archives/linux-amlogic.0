Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F75606A321
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=irKYqBQp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=f2af8oWI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8ROAdwjYj2YvlVQqicRC58krzsrI678/sh8l8Rl5r14=; b=irKYqBQpr844eehaBv1I4TcgU9
	kmyVFjBXSYirX3ZtFRUf/uoHsL9frqTY6+5KV+0UBGzefGjSsE43wFzl+WL3xte37vujwwsfygvxW
	4Z57GUl5Q5NHTzn3/HoitvqnwDuSCNcv52N/TBB4e64p++sp9JOnJNb6MbU6qZpdNVXGKbmL4EF3B
	6rFAZB6GEsi9yWbSrGAk1yN2JZ0de3R21XyI2qCVmvz3MtJuazrZoRh3YlhyAN+ASB3ooZ7hcVLPK
	ChsjMuM5oRSFgJ4C2lBpnuU7CB/vzAStGwmx7URJxAVEZjQVmgnHBej/dlbR9bCoKCyO4ZpoSY30d
	CAFQu22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o9-00000001Lv2-3MBL;
	Sun, 25 Oct 2026 19:23:05 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o6-00000001Lpm-3ES5
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:23:03 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMjmg517433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:53 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMjmg517433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956174;
	bh=9CpTE3EsuiVeioMoENebfi+wDB7/prDssc24llsmjUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f2af8oWI8Bj5yefR0ntGcuiBhw+8M/a4n2a9RQlT6iJsdZwVvmVd7uulWPYjptXdE
	 kdSloqKJSoWUDwEaDuxRHn2RIThbLG7WPivpGeIaPV+ZffQLjAfvxo/yZGby4N44oN
	 nm30Zrp92fmoYSg0JHPSskUHZ3+qgcEoYbCeR2wo=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 3/3] thermal/drivers/amlogic: do not log the secure monitor deferral as an error
Date: Sun, 25 Oct 2026 20:22:44 +0100
Message-ID: <20261025192244.209256-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122302_989765_0EB5DC38 
X-CRM114-Status: UNSURE (   9.92  )
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
CgpUaGUgdGhlcm1hbCBzZW5zb3IgdXN1YWxseSBwcm9iZXMgYmVmb3JlIHRoZSBzZWN1cmUgbW9u
aXRvciwgc28gdGhlCmZpcnN0IGF0dGVtcHQgYWx3YXlzIGRlZmVycyBhbmQgbG9ncyAiRmFpbGVk
IHRvIGdldCBzZWN1cmUgbW9uaXRvcgpmaXJtd2FyZSIgYXMgYW4gZXJyb3Igb24gZXZlcnkgYm9v
dCwgYWx0aG91Z2ggdGhlIHNlY29uZCBhdHRlbXB0CnN1Y2NlZWRzLiBVc2UgZGV2X2Vycl9wcm9i
ZSgpLCB3aGljaCByZWNvcmRzIHRoZSByZWFzb24gZm9yIHRoZQpkZWZlcnJhbCBpbnN0ZWFkIG9m
IGxvZ2dpbmcgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJh
eGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KLS0tCiBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVy
bWFsLmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5j
IGIvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCmluZGV4IGM1OGJhYzYzM2JlZC4u
NTRlNTlmNDQ0ZDQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFs
LmMKKysrIGIvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCkBAIC0xOTYsMTAgKzE5
Niw5IEBAIHN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX3Byb2JlX3NtKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYsCiAKIAlwZGF0YS0+c21fZncgPSBtZXNvbl9zbV9nZXQocGhfYXJncy5u
cCk7CiAJb2Zfbm9kZV9wdXQocGhfYXJncy5ucCk7Ci0JaWYgKCFwZGF0YS0+c21fZncpIHsKLQkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IHNlY3VyZSBtb25pdG9yIGZpcm13YXJlXG4iKTsK
LQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Ci0JfQorCWlmICghcGRhdGEtPnNtX2Z3KQorCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FUFJPQkVfREVGRVIsCisJCQkJICAgICAiRmFpbGVkIHRv
IGdldCBzZWN1cmUgbW9uaXRvciBmaXJtd2FyZVxuIik7CiAKIAlwZGF0YS0+dHNlbnNvcl9pZCA9
IHBoX2FyZ3MuYXJnc1swXTsKIAotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

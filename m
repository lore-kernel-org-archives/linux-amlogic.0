Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C0606A321
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AVhVvwJg;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=jIyeHP3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WPA3lab8uc+mgy8fZ8fT3eO8GsipxooSi42Emt7FDcU=; b=AVhVvwJgyloR07R0q1XOcsI2kt
	flgCmh/HkLbljb1u8bTZ9qm0CxiNDwmUQMJHes/Y/ib/opKeF6j779RTQS6jcyGzqpl5VpFObj0mB
	plkd2OAPyUySSDxw3oLzcp/2+7IX7M7hC0RyBrfjBmyxrZi8C147DZL7aoV63zIgNJdVvxdxGUlEO
	yIKZPRoihkl5RhcJ0mtR0JhUn9fJ9biOoDR+youL0OWfnw9SDi8MAqqYu2PWCvJPtYVPp3JP6iouR
	CPUxdSo8ntWowre6JZKSOhacziqW1Q753VfjRHER8lL2tqQkh6NTUiQfuQRC7gWNXKpOfmUEunN/4
	hslI+X2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o8-00000001LsQ-0n1D;
	Sun, 25 Oct 2026 19:23:04 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3o4-00000001Lne-1miu
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:23:02 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMjmf517433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:51 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMjmf517433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956172;
	bh=KV2tJWX3GZgizgB/kHWHuWKUwWkaZ5sjdsGk4tS9Lgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jIyeHP3EF1VIiqpDABSPnuY48Iid+umjYgS56VzJlqRx1px2wHO1zETcb56B2n05N
	 tn22m+w87UpLDNX5FRhhqqNqfoets7BEm5HN5IGvDVlRrpBn4liy0YGN9QLtgueI/V
	 NotJRmwN9CRCJCpfDCLHfy42ojFy1/5JGMsHyDso=
From: christian.koever-draxl@student.uibk.ac.at
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/3] thermal/drivers/amlogic: add S4 support
Date: Sun, 25 Oct 2026 20:22:43 +0100
Message-ID: <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122300_666886_A0748A64 
X-CRM114-Status: UNSURE (   9.52  )
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
CgpUaGUgUzQgQ1BVIHNlbnNvciByZWFkcyBpdHMgY2FsaWJyYXRpb24gdGhyb3VnaCB0aGUgc2Vj
dXJlIG1vbml0b3IgYW5kCm90aGVyd2lzZSBtYXRjaGVzIHRoZSBUNyBzZXR1cCwgc28gcmV1c2Ug
dGhlIFQ3IGRhdGEgZm9yIGl0LgoKV2l0aG91dCB0aGUgY2FsaWJyYXRpb24gdGhlIGRyaXZlciBy
ZXBvcnRlZCBhYm91dCAtMTQ0IGRlZ3JlZXMgQ2Vsc2l1cwpvbiBhbiBTOTA1VzIgYm9hcmQ7IHdp
dGggaXQgdGhlIHJlYWRpbmdzIGFyZSBwbGF1c2libGUgYW5kIENQVQp0aHJvdHRsaW5nIGVuZ2Fn
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2
ZXJAb3V0bG9vay5kZT4KLS0tCiBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190
aGVybWFsLmMKaW5kZXggNjA3MjhkZTY5NjhhLi5jNThiYWM2MzNiZWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYworKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1s
b2dpY190aGVybWFsLmMKQEAgLTI5Miw2ICsyOTIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgb2ZfYW1sb2dpY190aGVybWFsX21hdGNoW10gPSB7CiAJCS5jb21wYXRpYmxl
ID0gImFtbG9naWMsYTEtY3B1LXRoZXJtYWwiLAogCQkuZGF0YSA9ICZhbWxvZ2ljX3RoZXJtYWxf
YTFfY3B1X3BhcmFtLAogCX0sCisJeworCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LWNwdS10
aGVybWFsIiwKKwkJLmRhdGEgPSAmYW1sb2dpY190aGVybWFsX3Q3X3BhcmFtLAorCX0sCiAJewog
CQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LXRoZXJtYWwiLAogCQkuZGF0YSA9ICZhbWxvZ2lj
X3RoZXJtYWxfdDdfcGFyYW0sCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

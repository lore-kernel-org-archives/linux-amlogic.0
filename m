Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A97F8FA9A
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cqqa5xQ7MNouOTNMt52HipFWVnNB9Ow9KAJ3duhL4pA=; b=iGHqvRtaKNKsGb
	FFRWtRsgoyBjlnJqKhxhtejpvsz3a97HMDFDKQSbKLuNVzGbmfTA/pCoq1ElkxvWtYoicr0gniQhg
	LI+ebBCOPDXeU1l+UJ4unDsKLo7VjhcoxSq3RBSEaZffJveyZFEIWTtczuay1kFvX5c8epSphpAtr
	ND5NTrVEA5uH0ie/DpWh/mHTE6fzZYXVo9r3cR8QCEg7/5z/Imf++HcXlDQlOX8PHQnpNZ5LBe80t
	lbCiGRwxvCxQ7rZ+w/lmsz3KZaPpXxpX6RYLUReZGaiPfRrEOSR7HbK9MYFcTCEAyuLowInBLIw6T
	ScLNWDxOhIFG1KsBmE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQA-00000008rO1-2c5t;
	Tue, 21 Apr 2026 15:53:54 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQ7-00000008rMF-0SYh;
	Tue, 21 Apr 2026 15:53:53 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63LFrULx2501267
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 21 Apr 2026 17:53:34 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63LFrULx2501267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776786814;
	bh=Naa1oyRkUNUVOUuBidaVs+/e9mdftRGQ/QJOlDTjJok=;
	h=From:To:Cc:Subject:Date;
	b=rC6wgR+n8nQ04Vk1M06RCP83Gq9TpqmcSbqHKmGkUHwZ5DShA49cGzvjbjLWMwroS
	 MGjcs+Zm9tvWUEYjErRHbFrfBzmblSP9Y/iL1z1s7opBkR3RpYEC1ybD+TDNVrgLbd
	 e4A+eBcmCF+EKTDGVIl7+lmXnD+X/xymCwgB7KKY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v3 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Tue, 21 Apr 2026 17:53:26 +0200
Message-ID: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085351_936160_E007EE4E 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxjaHJpc3RpYW4ua29ldmVyLWRy
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KCkNoYW5nZXMgaW4gdjM6Ci0gQ2hhbmdlIHBvc2l0aW9u
IG9mIHRoZSBlbnRyeSBpbiB0aGUgYW1sb2dpYy55YW1sLgotIENoYW5nZSBmb3JtYXR0aW5nIG9m
IHRoZSBBbWxvZ2ljIFcxNTBTMSBXaS1GaSBtb2R1bGUgY29tbWVudC4KLSBGaXggc2V2ZXJhbCBm
b3JtYXR0aW5nIGlzc3Vlcy4KCkNoYW5nZXMgaW4gdjI6Ci0gU3BsaXQgZHQtYmluZGluZ3MgYW5k
IGR0cyBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4KLSBVcGRhdGVkIG1vZGVsIHN0cmlu
ZyB0byBtYXRjaCBkb2N1bWVudGVkIHZlbmRvciBwcmVmaXguCi0gUHV0IHZkZGlvX3NkIHN0YXRl
cyBhcnJheSBpbiBhIHNpbmdsZSBsaW5lLgotIEFkZGVkIGEgY29tbWVudCBmb3IgdGhlIHVuc3Vw
cG9ydGVkIEFtbG9naWMgVzE1MFMxIFdpLUZpIG1vZHVsZS4KCkNocmlzdGlhbiBTdGVmYW4gS8O2
dsOpci1EcmF4bCAoMik6CiAgZHQtYmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIHN1cHBvcnQg
Zm9yIEFtZWRpYXRlY2ggWDk4UQogIGFybTY0OiBkdHM6IGFtbG9naWM6IGFkZCBzdXBwb3J0IGZv
ciBYOThRCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCAgICAgIHwg
ICA3ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAgICAgICAgICB8ICAg
MSArCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1zOTA1dzIteDk4cS5kdHMgfCAyNDkg
KysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI1NyBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LXM5
MDV3Mi14OThxLmR0cwoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

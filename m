Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E980BF36C21
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jrFwGvZSbWoPg2SDQTLjxJIntuZtkpSkYbueXQYKLrc=; b=3C7NxBw3e8u4wN
	G6kVMGI90hdQa2Zje5oN6yp3s7fs521RQB98MbHmz9jfFRsig+qUHFi9gOcKp+UPcA2jOsBizjsxK
	fogWUvM040Bhb3wG78y7JLvAUgg+BmkFaYardpwjXmesp+k+UXatgiXiWAcxvoJmhmXHZAZbeHR42
	uIErs4NiEgG23ctth3GOUEc7m8OE2mE5gqHp3g1Of6m7qJo/kGf4ozC9E2UYD7NgnI6mNMKpwMWtr
	RMdKd5MyFth4vThMAB0dpfNi6/lGFmFkHRofB0mUF1PaM7xYG5HCixtVC8TLUdG0dR2u8CG31ZxTJ
	NllJwow1ItbvINYYLiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyc-00000006TpK-3v4X;
	Mon, 20 Apr 2026 06:19:23 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyY-00000006Tnh-3Cqi;
	Mon, 20 Apr 2026 06:19:20 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63K6Ito71297669
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 08:18:57 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63K6Ito71297669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776665938;
	bh=pu7HWhTqWQ7BHlILw0Z+vWuQ8U236tlaz1nProDAHKs=;
	h=From:To:Cc:Subject:Date;
	b=cYvsKqJKSLTcwHL9tkPzvzh9V52iR2k44mmV8grFJL983e7DbzToqAJ2ecPio6WhG
	 8G4Zd8EQnW1nf4K0q5jQYRdBAtlN11cbSw0Ak3HxD5wgB5fCILlJwwN+uTbkF8TOPa
	 w47mSqGtZ0s7lUECXVgsfL5iveJYFOS5usPWGrwY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        funderscore@postmarketos.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        christian.koever-draxl@student.uibk.ac.at
Subject: [PATCH v2 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Mon, 20 Apr 2026 08:18:52 +0200
Message-ID: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0*
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_231919_626905_45B290F6 
X-CRM114-Status: GOOD (  10.06  )
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
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KClN1cHBvcnRlZCBmZWF0dXJlczoKLSAxR0IvMkdCIFJB
TSAodmlhIFUtQm9vdCBtZW1vcnkgZml4dXApCi0gMTAvMTAwIEV0aGVybmV0IChJbnRlcm5hbCBQ
SFkpCi0gZU1NQyBhbmQgU0QgY2FyZCBzdG9yYWdlCi0gUFdNLWJhc2VkIENQVSB2b2x0YWdlIHJl
Z3VsYXRpb24KLSBVQVJUIChTZXJpYWwgY29uc29sZSkKCkNoYW5nZXMgaW4gdjI6Ci0gU3BsaXQg
ZHQtYmluZGluZ3MgYW5kIGR0cyBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4KLSBVcGRh
dGVkIG1vZGVsIHN0cmluZyB0byBtYXRjaCBkb2N1bWVudGVkIHZlbmRvciBwcmVmaXguCi0gUHV0
IHZkZGlvX3NkIHN0YXRlcyBhcnJheSBpbiBhIHNpbmdsZSBsaW5lLgotIEFkZGVkIGEgY2xhcmlm
eWluZyBjb21tZW50IGZvciB0aGUgdW5zdXBwb3J0ZWQgQW1sb2dpYyBXMTUwUzEgV2ktRmkgbW9k
dWxlLgoKTm90ZXM6Ci0gVGhlIGNvbnNvbGUgdXNlcyB1YXJ0X2IgYXQgOTIxNjAwIGJhdWQuCi0g
VmVyaWZpZWQgbWVtb3J5IHZpYSAvcHJvYy9kZXZpY2UtdHJlZTsgVS1Cb290IHBhdGNoZXMgdGhl
IG5vZGUgdG8gYXJvdW5kIDJHQi4KLSBUZXN0ZWQgb24gdGhlIDJHQiBSQU0gcGx1cyAxNkdCIGVN
TUMgdmFyaWFudC4KCkNocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6CiAgZHQtYmlu
ZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIFg5OFEgY29tcGF0aWJsZQogIGFybTY0OiBkdHM6IGFt
bG9naWM6IGFkZCBzdXBwb3J0IGZvciBYOThRCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2FtbG9naWMueWFtbCAgICAgIHwgICA3ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9N
YWtlZmlsZSAgICAgICAgICB8ICAgMSArCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1z
OTA1dzIteDk4cS5kdHMgfCAyNTAgKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDI1OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLXM0LXM5MDV3Mi14OThxLmR0cwoKLS0gCjIuNTMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

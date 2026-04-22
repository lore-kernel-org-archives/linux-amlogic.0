Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F070F9B607
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2026 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PcRWpqoAE+Bk0Xhqha16h3wEtqCAqRX270ywFHQlji0=; b=OmtEGNMWRa2R0P
	8S+66Y3vzWbu3DCOTli3BHnTMc+BBFJcKYHZn4k0d+O+NEBuFWldnGqib6FyY+u16zojQufk954s9
	338aGp4pb6yKqPq6wIschuaoXmSKsT9ALNPCoajWFUBOaD4QHvbOVPW/JdAbZle0JbtCMKUJjRngX
	pXnS+o2xdc8zjHAVd8aBEl1fCHpLKatFSq1AYDl3pLwHb3tDX1DPLbqAZx0wncjCrdFi5/3XdIhAJ
	BsknzskVYBqnwER2WCxHaLcIkJOwB9mpPwXD52sw32z5pR8VOM8pa8CojXjIqe45++YngO1j4Qamk
	o3v/6vbvGnJi+GgLjv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUNC-00000009uER-0KTX;
	Wed, 22 Apr 2026 09:59:58 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUN4-00000009uB5-1isg;
	Wed, 22 Apr 2026 09:59:52 +0000
Received: from surface-pro-5 (77.119.189.253.wireless.dyn.drei.com [77.119.189.253])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63M9xVO33161132
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 11:59:37 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63M9xVO33161132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776851977;
	bh=tn+I0RwhjcyEY1SEHCW91SYXCaTMDaSeSYmqa9W39E8=;
	h=From:To:Cc:Subject:Date;
	b=SbodHl7OClX+T7qnFasIRVquRisYzMKFr1cYjbfuJKUHAo4W5Ss0ljghL9+XuwnLh
	 tF5n5+mkSKWQJe4Zo8EgoZUJZwgppp9Amgtq8Vrk/OvmVF2r+UXGWcqo6OY5Fx8d2d
	 jYv9GUCDkwUsZPI9qNKTZRAQzG5t54+bkik3lQVo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v4 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Wed, 22 Apr 2026 11:58:38 +0200
Message-ID: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_025951_055012_B1E73B8B 
X-CRM114-Status: GOOD (  10.39  )
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
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KClN1cHBvcnRlZCBmZWF0dXJlczoKLSAxR0IgUkFNICgy
R0IgdmFyaWFudHMgZXhpc3QpCi0gMTAvMTAwIEV0aGVybmV0IChJbnRlcm5hbCBQSFkpCi0gZU1N
QyBhbmQgU0QgY2FyZCBzdG9yYWdlCi0gUFdNLWJhc2VkIENQVSB2b2x0YWdlIHJlZ3VsYXRpb24K
LSBVQVJUIChTZXJpYWwgY29uc29sZSkKCk5vdGVzOgotIFRoZSBjb25zb2xlIHVzZXMgdWFydF9i
IGF0IDkyMTYwMCBiYXVkLgotIFZlcmlmaWVkIG1lbW9yeSB2aWEgL3Byb2MvZGV2aWNlLXRyZWU7
IFUtQm9vdCBwYXRjaGVzIHRoZSBub2RlLgotIFRlc3RlZCBvbiB0aGUgMkdCIFJBTSBwbHVzIDE2
R0IgZU1NQyB2YXJpYW50LiAKCkNoYW5nZXMgaW4gdjQ6Ci0gQWRkL0NoYW5nZSBoYXJkd2FyZSBk
ZXNjcmlwdGlvbiB0byBjb3ZlciBsZXR0ZXIgYW5kIGR0cyBwYXRjaC4KCkNoYW5nZXMgaW4gdjM6
Ci0gQ2hhbmdlIHBvc2l0aW9uIG9mIHRoZSBlbnRyeSBpbiB0aGUgYW1sb2dpYy55YW1sLgotIENo
YW5nZSBmb3JtYXR0aW5nIG9mIHRoZSBBbWxvZ2ljIFcxNTBTMSBXaS1GaSBtb2R1bGUgY29tbWVu
dC4KLSBGaXggc2V2ZXJhbCBmb3JtYXR0aW5nIGlzc3Vlcy4KCkNoYW5nZXMgaW4gdjI6Ci0gU3Bs
aXQgZHQtYmluZGluZ3MgYW5kIGR0cyBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4KLSBV
cGRhdGVkIG1vZGVsIHN0cmluZyB0byBtYXRjaCBkb2N1bWVudGVkIHZlbmRvciBwcmVmaXguCi0g
UHV0IHZkZGlvX3NkIHN0YXRlcyBhcnJheSBpbiBhIHNpbmdsZSBsaW5lLgotIEFkZGVkIGEgY29t
bWVudCBmb3IgdGhlIHVuc3VwcG9ydGVkIEFtbG9naWMgVzE1MFMxIFdpLUZpIG1vZHVsZS4gCgpD
aHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgKDIpOgogIGR0LWJpbmRpbmdzOiBhcm06IGFt
bG9naWM6IGFkZCBzdXBwb3J0IGZvciBBbWVkaWF0ZWNoIFg5OFEKICBhcm02NDogZHRzOiBhbWxv
Z2ljOiBhZGQgc3VwcG9ydCBmb3IgQW1lZGlhdGVjaCBYOThRCgogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FtbG9naWMueWFtbCAgICAgIHwgICA3ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9NYWtlZmlsZSAgICAgICAgICB8ICAgMSArCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1zNC1zOTA1dzIteDk4cS5kdHMgfCAyNDkgKysrKysrKysrKysrKysrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDI1NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LXM5MDV3Mi14OThxLmR0cwoKLS0gCjIuNTMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

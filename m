Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9B7FE51F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G2k5TlLbmdb6ZZEwrAGaW8WArR1KaGFGQ0QcBOwpPDU=; b=OPPNgtQKMdav1O
	8JVmDUlt1mbzezpPNHHC7BL8OSbWsBs2jyp1bxhiCvejjjahmYzJN1z2crMAvi84xBjZRJ2DoRcBm
	aMh8B+y8TUiOaTIax7hkfaHWITLFjVKJc23LR9EqOSKn8Hdn6X8abIIq+rLBlM1jno+BVySbAm/Kn
	+trtjnaQxvaaYbi0hyGpzP43f318bjXFqMQxq4ZDlV1QrxdCz4DKI4E/65y7QOqB9/qAL703g402b
	tEffye8PmIayM6DVNvUDHwJFPnokDlDiEqlFi/Kqrp6cYLsJvkBY3ezM8qn5UMQHGZeVSDOUdBAR1
	XZVVWflPFVqbZ+uRBj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCyH-0000000CwXy-2Nnl;
	Fri, 24 Apr 2026 09:37:13 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCyC-0000000CwWm-1Om7;
	Fri, 24 Apr 2026 09:37:10 +0000
Received: from surface-pro-5 (77.119.189.242.wireless.dyn.drei.com [77.119.189.242])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63O9ago91184944
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 11:36:46 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63O9ago91184944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1777023407;
	bh=HLJxDrkixMXPsXH2OAxwjljjHn3k7qhworZTCrexYVc=;
	h=From:To:Cc:Subject:Date;
	b=Y9PgnblUa1aoWUyT4wfZFk1xG6xiLaUU2qK8P8+PJj4faPENA0jwl2SscxzAirL1r
	 /Wgx4AX4FggpC5APoG++uocqDPU3c0VV1GnCbBGnNJVYxBzQaqkIztS8gLzgOHBLO8
	 rUQb8OhDskM2nyo0cnYtnK32bZh6n9S6+GVyCgZA=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v5 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Fri, 24 Apr 2026 11:36:31 +0200
Message-ID: <20260424093633.10734-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_023708_983532_126FBD0F 
X-CRM114-Status: UNSURE (   9.85  )
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
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KClN1cHBvcnRlZCBmZWF0dXJlczoKLSAxR0IgUkFNICgy
R0IgdmFyaWFudHMgZXhpc3QpCi0gMTAvMTAwIEV0aGVybmV0IChJbnRlcm5hbCBQSFkpCi0gZU1N
QyBhbmQgU0QgY2FyZCBzdG9yYWdlCi0gUFdNLWJhc2VkIENQVSB2b2x0YWdlIHJlZ3VsYXRpb24K
LSBVQVJUIChTZXJpYWwgY29uc29sZSkKCk5vdGVzOgotIFRoZSBjb25zb2xlIHVzZXMgdWFydF9i
IGF0IDkyMTYwMCBiYXVkLgotIFZlcmlmaWVkIG1lbW9yeSB2aWEgL3Byb2MvZGV2aWNlLXRyZWU7
IFUtQm9vdCBwYXRjaGVzIHRoZSBub2RlLgotIFRlc3RlZCBvbiB0aGUgMkdCIFJBTSBwbHVzIDE2
R0IgZU1NQyB2YXJpYW50LgoKQ2hhbmdlcyBpbiB2NToKLSBEcm9wIFdpcmVsZXNzIFNESU8gTW9k
dWxlIGNvbW1lbnQuCi0gQWRkIGdlbmVyaWMgZGVzY3JpcHRpb24gb2YgV2lyZWxlc3MgU0RJTyBN
b2R1bGUgaW4gZHRzLgoKQ2hhbmdlcyBpbiB2NDoKLSBBZGQvQ2hhbmdlIGhhcmR3YXJlIGRlc2Ny
aXB0aW9uIHRvIGNvdmVyIGxldHRlciBhbmQgZHRzIHBhdGNoLgoKQ2hhbmdlcyBpbiB2MzoKLSBD
aGFuZ2UgcG9zaXRpb24gb2YgdGhlIGVudHJ5IGluIHRoZSBhbWxvZ2ljLnlhbWwuCi0gQ2hhbmdl
IGZvcm1hdHRpbmcgb2YgdGhlIEFtbG9naWMgVzE1MFMxIFdpLUZpIG1vZHVsZSBjb21tZW50Lgot
IEZpeCBzZXZlcmFsIGZvcm1hdHRpbmcgaXNzdWVzLgoKQ2hhbmdlcyBpbiB2MjoKLSBTcGxpdCBk
dC1iaW5kaW5ncyBhbmQgZHRzIGNoYW5nZXMgaW50byBzZXBhcmF0ZSBwYXRjaGVzLgotIFVwZGF0
ZWQgbW9kZWwgc3RyaW5nIHRvIG1hdGNoIGRvY3VtZW50ZWQgdmVuZG9yIHByZWZpeC4KLSBQdXQg
dmRkaW9fc2Qgc3RhdGVzIGFycmF5IGluIGEgc2luZ2xlIGxpbmUuCi0gQWRkZWQgYSBjb21tZW50
IGZvciB0aGUgdW5zdXBwb3J0ZWQgQW1sb2dpYyBXMTUwUzEgV2ktRmkgbW9kdWxlLiAKCkNocmlz
dGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6CiAgZHQtYmluZGluZ3M6IGFybTogYW1sb2dp
YzogYWRkIHN1cHBvcnQgZm9yIEFtZWRpYXRlY2ggWDk4UQogIGFybTY0OiBkdHM6IGFtbG9naWM6
IGFkZCBzdXBwb3J0IGZvciBBbWVkaWF0ZWNoIFg5OFEKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYW1sb2dpYy55YW1sICAgICAgfCAgIDcgKwogYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL01ha2VmaWxlICAgICAgICAgIHwgICAxICsKIC4uLi9ib290L2R0cy9hbWxvZ2ljL21lc29u
LXM0LXM5MDV3Mi14OThxLmR0cyB8IDI0OSArKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgMjU3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQtczkwNXcyLXg5OHEuZHRzCgotLSAKMi41NC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

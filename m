Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E0EC43217
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F88207CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F88207CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYVA7GHcJmKvs2fyKw13G1ovNZL19nbvDiVcZDIOMow=; b=XII3w4RZXBU+GwhJeqgtoKy4GF
	REvpGtB5mC6SRX79KdOA4RXAfszdHRLGQgaUc0H6OJNcCBsTKD45eU3g9CgYPB3pfuZl0kTn4dEST
	HhCj3Dpsa/loTFZk3afWLqdSERYf7gRtLPUHHxk5DLu7XDe5ARRHnVe6byZppD303TGovs3/9AKDO
	7K9xbD8VH6Y02woKthfzAsav6T+TuKYWizTZfaj3PLNcb1tqU6bw6o7svTcOttIEPIIy/74r/I2QD
	2YAFarQq/juaANEOiTHc+F46rxt9lONjrCO+oPwU2NUBvQUwZX2ND787gOAyowL0G903cM4uM46NR
	R6dMhLrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvSR-0005aU-6F; Mon, 28 Dec 2020 16:33:19 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvSL-0005UL-Rl; Mon, 28 Dec 2020 16:33:14 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhFpq-1kOjYv2tNq-00eJLS; Mon, 28 Dec 2020 17:32:59 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS2-0002GJ-5N; Mon, 28 Dec 2020 17:32:55 +0100
Received: (nullmailer pid 32604 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:53 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 0/4] leds: pwm: Make automatic labels work
Date: Mon, 28 Dec 2020 17:32:13 +0100
Message-Id: <20201228163217.32520-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: e9056562e10c809dee3344e50e145a1f
X-Provags-ID: V03:K1:ztIxjkZXmzA4zIV1xgFd+DY20dZqEQMIRVMHSPYRMW3VFcqIiZw
 n9f6GRjs+5QUaQjm5RvcphCke18ZeRqeibmGi/uiyzWXTS3qJGNYbEJTzYwZZyL2xi/5G5X
 pk07IfD1zPx2OQ/t6ey+RPliD/dYCy/vL/hJgUMbQpEKtWbAii+kSAMSx2pEizt+uTt6Qug
 59hx5SzeZ4RSpArkPg95g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RQlq3c2RuHM=:OfzQvvbw4nmVmbV7Hct3WL
 kvLq1UK438l/NeFTcb9L1gMen7sj2Isbqok1YD9HEv6/3VMu5HBYcwLm0pVbKrjRIRdlUhnyz
 0uccCuUAJiOJU0sNmXI7NxnJypmSoCuvWw7zIy7fMctiYakM/rROpU2DqN4JQtMwWg+kSJZQX
 rsnx+iIRuDLY0GClkUhhZS4Jk4dCzXlpCIMdOnRyjbGONzPjp5nm+IGGoOneMutjYUYDg0v+s
 NWby0pvE0EZl8f2z8JNZpAuep5fJ8oqHWmW59sCOTyCq354LoLuSLZu1NzUJYj+IRy4SIX0K4
 fP+1t/FNaHhAFSphWcp36/4dAO4JzsqEPZDgWXttXZCukJqfDQd8oavxpSLvY+Zssh8v1N3Rn
 D7GVGANRiNTlmphvMDw6PkO7wIVTr6/ihboppxpBQtUB1YZU6ol8ISg+m0Wrdd6yVkYN807cK
 s2wYjuyqUQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_113314_148644_43F2D3AB 
X-CRM114-Status: GOOD (  15.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVpIGhlaSwKCnRoZXNlIGFyZSB0aGUgbm90IHlldCB0YWtlbiBwYXRjaGVzIGZyb20gYSBzZXJp
ZXMgd2hpY2ggb3JpZ2luYWxseSBmaXhlZAphIG1pbm9yIGlzc3VlIGluIHRoZSBsZWRzIHB3bSBk
cml2ZXIsIHRoZW4gbWlncmF0ZWQgdGhlIGxlZHMgcHdtIGR0cwpkb2NzIHRvIHlhbWwgKGJ5IHJl
cXVlc3QpLCBhbmQgdGhlbiBmaXhlZCBhbGwgdGhlIGR0cyBmaWxlcyB0cmlnZ2VyaW5nCndhcm5p
bmdzIG9uIHRob3NlIG5ldyBiaW5kaW5ncy4gIFRoZSByZW1haW5pbmcgZm91ciBwYXRjaGVzIG5v
dyBvbmx5IGZpeApkdHMgd2FybmluZ3MsIHRoZSBiYXNlIGZpeCBhbmQgdGhlIHlhbWwgY29udmVy
c2lvbiBpcyBhbHJlYWR5IG1lcmdlZCB0bwptYXN0ZXIuCgpTZXJpZXMgY2hhbmdlbG9nIGJlbG93
IOKApgoKR3JlZXRzCkFsZXgKCnY5OgotIHJlYmFzZWQgc2VyaWVzIG9uIHY1LjExLXJjMQotIHJl
bW92ZWQgYWxyZWFkeSBhcHBsaWVkIHBhdGNoZXMKLSBhZGRlZCBzb21lIG1vcmUgQWNrZWQtYnkK
CnY4OgotIHJlYmFzZWQgc2VyaWVzIG9uIHJlY2VudCBwYXZlbC9mb3ItbmV4dCAocG9zdCB2NS4x
MC1yYzEpCi0gcmVtb3ZlZCBhbHJlYWR5IGFwcGxpZWQgcGF0Y2hlcwotIGFkZGVkIEFja2VkLWJ5
IG9uIHBhdGNoIDEvNQotIHVwZGF0ZWQgcGF0Y2ggMy81IGJhc2VkIG9uIGNvbW1lbnRzIGJ5IEFo
bWFkIEZhdG91bQoKdjc6Ci0gcmViYXNlZCBzZXJpZXMgb24gcmVjZW50IHBhdmVsL2Zvci1uZXh0
Ci0gc3BsaXQgdXAgYXJtIGR0cyBwYXRjaCBieSBhcm0gc3ViIGFyY2ggKHN1Z2dlc3RlZCBieSBL
cnp5c3p0b2YgS296bG93c2tpKQotIGFkZGVkIG11bHRpcGxlIFJldmlld2VkLWJ5IHRhZ3MKLSBz
bGlnaHRseSByZXdvcmRlZCBjb21taXQgbWVzc2FnZXMgKHN1Z2dlc3RlZCBieSBLcnp5c3p0b2Yg
S296bG93c2tpKQotIGFkZGVkIGFjdHVhbCBkdGJzX2NoZWNrIHdhcm5pbmdzIHRvIGNvbW1pdCBt
ZXNzYWdlcwotIGFkZGVkIFJ1c3NlbGwgS2luZyB0byBDYyBmb3IgYmluZGluZyBjb252ZXJzaW9u
IHBhdGNoIChiZWNhdXNlIGxpY2Vuc2UpCgp2NjoKLSByZWJhc2VkIHNlcmllcyBvbiByZWNlbnQg
cGF2ZWwvZm9yLW5leHQKLSBhZGRlZCBSZXZpZXdlZC1ieSBmcm9tIE1hcmVrIHRvIHBhdGNoIDEK
LSBwYXRjaCAyIGZyb20gdjUgd2FzIHBpY2tlZCBieSBQYXZlbCBhbmQgaXMgYWxyZWFkeSBpbiBo
aXMgZm9yLW5leHQKICBicmFuY2gKLSBwcmV2aW91cyBwYXRjaCAzLzMgKG5vdyAyLzcpIHdhcyBy
ZXdvcmtlZCBiYXNlZCBvbiBmZWVkYmFjayBieSBSb2IKLSBhZGRlZCBtb3JlIGR0IHBhdGNoZXMg
Zml4aW5nIHdhcm5pbmdzIGFmdGVyIGJpbmRpbmcgY29udmVyc2lvbiB0byB5YW1sCgp2NToKLSBy
ZXBsYWNlZCBwYXRjaCAxLzMgYnkgYSBuZXcgcGF0Y2ggcmVtb3ZpbmcgcGxhdGZvcm1fZGF0YSBz
dXBwb3J0IGZvcgogIHRoZSBsZWRzLXB3bSBkcml2ZXIKLSBsaXR0bGUgcmV3b3JkaW5nIG9mIGNv
bW1pdCBtZXNzYWdlIGluIHBhdGNoIDIvMwotIHVwZGF0ZWQgcGF0Y2ggMy8zIGJhc2VkIG9uIGZl
ZWRiYWNrIGJ5IFJvYiBIZXJyaW5nCi0gYWRkZWQgTWFyZWsgQmVow7puIHRvIENjLCBiZWNhdXNl
IGhlIGFsc28gd29ya3Mgb24gcmVtb3ZpbmcKICBwbGF0Zm9ybV9kYXRhIHN1cHBvcnQKLSByZWJh
c2VkIHNlcmllcyBvbiBwYXZlbC9mb3ItbmV4dAoKdjQ6Ci0gYWRkZWQgbGVkLWNsYXNzIHBhdGNo
IGhhbmRsaW5nIGZ3bm9kZSBwYXNzaW5nIGRpZmZlcmVudGx5IChwYXRjaCAxLzMpCi0gYWRhcHRl
ZCBsZWRzLXB3bSBwYXRjaCB0byBuZXcgbGVkLWNsYXNzIChwYXRjaCAyLzMpCi0gY29udGFjdGVk
IG9yaWdpbmFsIGF1dGhvciBvZiBsZWRzLXB3bSBkdCBiaW5kaW5nIG9uIGxpY2Vuc2UgaXNzdWUK
ICAocGF0Y2ggMy8zKQoKdjM6Ci0gc2VyaWVzIHJlYmFzZWQgb24gdjUuOS1yYzQKLSBjaGFuZ2Vk
IGxpY2Vuc2Ugb2YgLnlhbWwgZmlsZSB0byByZWNvbW1lbmRlZCBvbmUgKHBhdGNoIDIvMikKLSBh
ZGRlZCBBY2tlZC1ieSB0byBib3RoIHBhdGNoZXMKCnYyOgotIHNlcmllcyByZWJhc2VkIG9uIHY1
LjktcmMzCi0gYWRkZWQgdGhlIGR0LWJpbmRpbmdzIHVwZGF0ZSBwYXRjaCAoMi8yKQoKdjE6Ci0g
YmFzZWQgb24gdjUuOS1yYzIKLSBiYWNrcG9ydCBvbiB2NS40LjU5IHRlc3RlZCBhbmQgd29ya2lu
ZwoKQ2M6IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnCkNjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCkNjOiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKCgpBbGV4
YW5kZXIgRGFobCAoNCk6CiAgZHQtYmluZGluZ3M6IG1mZDogRml4IHNjaGVtYSB3YXJuaW5ncyBm
b3IgcHdtLWxlZHMKICBBUk06IGR0czogYmVybGluOiBGaXggc2NoZW1hIHdhcm5pbmdzIGZvciBw
d20tbGVkcwogIEFSTTogZHRzOiBzdG0zMjogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxl
ZHMKICBhcm02NDogZHRzOiBtZXNvbjogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxlZHMK
CiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sICAgfCAg
NSArKystLQogYXJjaC9hcm0vYm9vdC9kdHMvYmVybGluMmNkLWdvb2dsZS1jaHJvbWVjYXN0LmR0
cyAgIHwgIDYgKysrLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0
cyAgICAgICAgICAgfCAxMyArKysrKysrLS0tLS0tCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neGwtczkwNXgta2hhZGFzLXZpbS5kdHMgfCAgNCArKy0tCiAuLi4vYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1neG0ta2hhZGFzLXZpbTIuZHRzICAgICAgfCAgNCArKy0tCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tc20xLXNlaTYxMC5kdHMgICAgfCAgOCArKysrLS0tLQogNiBm
aWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCgpiYXNlLWNv
bW1pdDogNWM4ZmU1ODNjY2U1NDJhYTBiODRhZGM5MzljZTg1MjkzZGUzNmU1ZQotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

Return-Path: <SRS0=wDd0=FC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E429C63798
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:54:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBFB120857
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:54:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zbz61uVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBFB120857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I6OvA3ipbaAAfjbyFjli83WiUJryrwE0YEcD7KpdxHs=; b=zbz61uVv7qgwa2r2O/rKThSV0+
	PCPybWYDP+W6emJM3DJYf91Dhng/FB1PYVabRhIjJBeVm9hn5gpWnqK0bS/pO3E3SrwXOgNw5hVOV
	5z1/ILeLLjTOhYP6OGK73BlTR66dBYHvHr1edCX32ATOutItF2PUhtOhrmqv4MrUIrJ5OM8Uc7Aed
	GhVnTXx5UyQ5nv+PdSxMZWo2o7vpHooZCGTRfWUcS/R00YB4IyD3n5tMjLoGFUSK4nKtq0Ak6CGYK
	ccFtfqCrmzQ91OALMOQBDD0rgd+MSHgh6jti2w2AWPFsGAvE80392NYb1rRa0Y7tb2XQV9Xu5uiE6
	DbtBT1JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj8Ax-00044O-Vt; Sat, 28 Nov 2020 21:54:40 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj8Aq-00041t-Ut; Sat, 28 Nov 2020 21:54:34 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdwRi-1kAL7K2rmY-00b77Y; Sat, 28 Nov 2020 22:54:20 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8AZ-00027T-9a; Sat, 28 Nov 2020 22:54:16 +0100
Received: (nullmailer pid 4070 invoked by uid 2001);
 Sat, 28 Nov 2020 21:54:14 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 0/5] leds: pwm: Make automatic labels work
Date: Sat, 28 Nov 2020 22:53:48 +0100
Message-Id: <20201128215353.3991-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: e9056562e10c809dee3344e50e145a1f
X-Provags-ID: V03:K1:QBfiUPuOf14kX4Nz47jAYJt1cUoOTDn1E/pEQC0D93UIwKSk9LO
 pApkfselXX82TbxUTNh8KHQ+CU+2c4pzwJtAt9bworExKtWkMMo11sQBGbbaRZV4CvXMvnA
 9YBrjc9ERoyaWnteYtxeb1ArUz7jfIMFuB3eBRAU64w3d7VMMmtayx6rnaFNch45egLYrE8
 ndlA9RHZPJuId6tbeCmew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:db2FVXCJ0IQ=:rGUF+QkkUhs0EKaPyIQuUg
 ybFnHRPwkBnLFoJzP1nJuiDJYGMjkgvpHNfYJxhkOZGHhhqCNRb0Ltb6SZlhGIYo9iYB/4GV/
 4hCM3Vpve/XfUOsEGEpDlviPUYPXT+dRUt+wvBYHXc9TFbAJKTYR0QXj33O1ix2/YHCZRiFMS
 13KuMpQPkCGx3Y9ZbSTiEEW4els06BHzfagxTp1J+uTDlYI2xG0g8t1MOgFafvkwk0EEHc6K8
 ZyoznGlLSkcEWOEJgdDfnffdgfsM2u+zzIfNIF+RXTUvJV5Ij1AgcURwSHcbZqBEC5zjUs+p6
 sprAnKWfh3tMH+DBc8RM0osqot7HMr6L633xcdNiBzLSws/ycSa1TWmphHF/JLCakwdGNVq+b
 6V9cGMQzbwbU8Ae1QPCF5ke3HFEBTQDThzImW9foPNqjDdH9no6dCZ1GYks3quFcTwkKsosxR
 tdtiik2UTg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_165433_407005_AE759146 
X-CRM114-Status: GOOD (  16.62  )
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
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVpIGhlaSwKCnRoZXNlIGFyZSB0aGUgbm90IHlldCB0YWtlbiBwYXRjaGVzIGZyb20gYSBzZXJp
ZXMgd2hpY2ggb3JpZ2luYWxseSBmaXhlZAphIG1pbm9yIGlzc3VlIGluIHRoZSBsZWRzIHB3bSBk
cml2ZXIsIHRoZW4gbWlncmF0ZWQgdGhlIGxlZHMgcHdtIGR0cwpkb2NzIHRvIHlhbWwgKGJ5IHJl
cXVlc3QpLCBhbmQgdGhlbiBmaXhlZCBhbGwgdGhlIGR0cyBmaWxlcyB0cmlnZ2VyaW5nCndhcm5p
bmdzIG9uIHRob3NlIG5ldyBiaW5kaW5ncy4gIFRoZSByZW1haW5pbmcgZml2ZSBwYXRjaGVzIG5v
dyBvbmx5IGZpeAp3YXJuaW5ncywgdGhlIGJhc2UgZml4IGFuZCB0aGUgeWFtbCBjb252ZXJzaW9u
IGlzIGFscmVhZHkgdGFrZW4gYnkKc3Vic3lzdGVtIG1haW50YWluZXJzLiAgQWx0aG91Z2ggdGhp
cyBpcyBvbmx5IGR0cyBjb250ZW50IG5vdywgSSByZWJhc2VkCml0IG9uIHRoZSBjdXJyZW50IGZv
ci1uZXh0IHRyZWUgb2YgdGhlIGxlZHMgc3Vic3lzdGVtIG1haW50YWluZXIsCmJlY2F1c2UgdGhh
dCBjb250YWlucyB0aGUgeWFtbC1jb252ZXJzaW9uIGNoYW5nZXNldC4KClNlcmllcyBjaGFuZ2Vs
b2cgYmVsb3cg4oCmCgpHcmVldHMKQWxleAoKdjg6Ci0gcmViYXNlZCBzZXJpZXMgb24gcmVjZW50
IHBhdmVsL2Zvci1uZXh0IChwb3N0IHY1LjEwLXJjMSkKLSByZW1vdmVkIGFscmVhZHkgYXBwbGll
ZCBwYXRjaGVzCi0gYWRkZWQgQWNrZWQtYnkgb24gcGF0Y2ggMS81Ci0gdXBkYXRlZCBwYXRjaCAz
LzUgYmFzZWQgb24gY29tbWVudHMgYnkgQWhtYWQgRmF0b3VtCgp2NzoKLSByZWJhc2VkIHNlcmll
cyBvbiByZWNlbnQgcGF2ZWwvZm9yLW5leHQKLSBzcGxpdCB1cCBhcm0gZHRzIHBhdGNoIGJ5IGFy
bSBzdWIgYXJjaCAoc3VnZ2VzdGVkIGJ5IEtyenlzenRvZiBLb3psb3dza2kpCi0gYWRkZWQgbXVs
dGlwbGUgUmV2aWV3ZWQtYnkgdGFncwotIHNsaWdodGx5IHJld29yZGVkIGNvbW1pdCBtZXNzYWdl
cyAoc3VnZ2VzdGVkIGJ5IEtyenlzenRvZiBLb3psb3dza2kpCi0gYWRkZWQgYWN0dWFsIGR0YnNf
Y2hlY2sgd2FybmluZ3MgdG8gY29tbWl0IG1lc3NhZ2VzCi0gYWRkZWQgUnVzc2VsbCBLaW5nIHRv
IENjIGZvciBiaW5kaW5nIGNvbnZlcnNpb24gcGF0Y2ggKGJlY2F1c2UgbGljZW5zZSkKCnY2Ogot
IHJlYmFzZWQgc2VyaWVzIG9uIHJlY2VudCBwYXZlbC9mb3ItbmV4dAotIGFkZGVkIFJldmlld2Vk
LWJ5IGZyb20gTWFyZWsgdG8gcGF0Y2ggMQotIHBhdGNoIDIgZnJvbSB2NSB3YXMgcGlja2VkIGJ5
IFBhdmVsIGFuZCBpcyBhbHJlYWR5IGluIGhpcyBmb3ItbmV4dAogIGJyYW5jaAotIHByZXZpb3Vz
IHBhdGNoIDMvMyAobm93IDIvNykgd2FzIHJld29ya2VkIGJhc2VkIG9uIGZlZWRiYWNrIGJ5IFJv
YgotIGFkZGVkIG1vcmUgZHQgcGF0Y2hlcyBmaXhpbmcgd2FybmluZ3MgYWZ0ZXIgYmluZGluZyBj
b252ZXJzaW9uIHRvIHlhbWwKCnY1OgotIHJlcGxhY2VkIHBhdGNoIDEvMyBieSBhIG5ldyBwYXRj
aCByZW1vdmluZyBwbGF0Zm9ybV9kYXRhIHN1cHBvcnQgZm9yCiAgdGhlIGxlZHMtcHdtIGRyaXZl
cgotIGxpdHRsZSByZXdvcmRpbmcgb2YgY29tbWl0IG1lc3NhZ2UgaW4gcGF0Y2ggMi8zCi0gdXBk
YXRlZCBwYXRjaCAzLzMgYmFzZWQgb24gZmVlZGJhY2sgYnkgUm9iIEhlcnJpbmcKLSBhZGRlZCBN
YXJlayBCZWjDum4gdG8gQ2MsIGJlY2F1c2UgaGUgYWxzbyB3b3JrcyBvbiByZW1vdmluZwogIHBs
YXRmb3JtX2RhdGEgc3VwcG9ydAotIHJlYmFzZWQgc2VyaWVzIG9uIHBhdmVsL2Zvci1uZXh0Cgp2
NDoKLSBhZGRlZCBsZWQtY2xhc3MgcGF0Y2ggaGFuZGxpbmcgZndub2RlIHBhc3NpbmcgZGlmZmVy
ZW50bHkgKHBhdGNoIDEvMykKLSBhZGFwdGVkIGxlZHMtcHdtIHBhdGNoIHRvIG5ldyBsZWQtY2xh
c3MgKHBhdGNoIDIvMykKLSBjb250YWN0ZWQgb3JpZ2luYWwgYXV0aG9yIG9mIGxlZHMtcHdtIGR0
IGJpbmRpbmcgb24gbGljZW5zZSBpc3N1ZQogIChwYXRjaCAzLzMpCgp2MzoKLSBzZXJpZXMgcmVi
YXNlZCBvbiB2NS45LXJjNAotIGNoYW5nZWQgbGljZW5zZSBvZiAueWFtbCBmaWxlIHRvIHJlY29t
bWVuZGVkIG9uZSAocGF0Y2ggMi8yKQotIGFkZGVkIEFja2VkLWJ5IHRvIGJvdGggcGF0Y2hlcwoK
djI6Ci0gc2VyaWVzIHJlYmFzZWQgb24gdjUuOS1yYzMKLSBhZGRlZCB0aGUgZHQtYmluZGluZ3Mg
dXBkYXRlIHBhdGNoICgyLzIpCgp2MToKLSBiYXNlZCBvbiB2NS45LXJjMgotIGJhY2twb3J0IG9u
IHY1LjQuNTkgdGVzdGVkIGFuZCB3b3JraW5nCgpDYzogbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KQ2M6IGxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmcKCgpBbGV4
YW5kZXIgRGFobCAoNSk6CiAgZHQtYmluZGluZ3M6IG1mZDogRml4IHNjaGVtYSB3YXJuaW5ncyBm
b3IgcHdtLWxlZHMKICBBUk06IGR0czogYmVybGluOiBGaXggc2NoZW1hIHdhcm5pbmdzIGZvciBw
d20tbGVkcwogIEFSTTogZHRzOiBzdG0zMjogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxl
ZHMKICBhcm02NDogZHRzOiBtZXNvbjogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxlZHMK
ICBNSVBTOiBEVFM6IGltZzogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxlZHMKCiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sICAgfCAgNSArKyst
LQogYXJjaC9hcm0vYm9vdC9kdHMvYmVybGluMmNkLWdvb2dsZS1jaHJvbWVjYXN0LmR0cyAgIHwg
IDYgKysrLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0cyAgICAg
ICAgICAgfCAxMyArKysrKysrLS0tLS0tCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwt
czkwNXgta2hhZGFzLXZpbS5kdHMgfCAgNCArKy0tCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neG0ta2hhZGFzLXZpbTIuZHRzICAgICAgfCAgNCArKy0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tc20xLXNlaTYxMC5kdHMgICAgfCAgOCArKysrLS0tLQogYXJjaC9taXBz
L2Jvb3QvZHRzL2ltZy9waXN0YWNoaW9fbWFyZHVrLmR0cyAgICAgICAgIHwgIDUgKysrLS0KIDcg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgoKYmFzZS1j
b21taXQ6IDk4NjUwYjA4NzQxNzFjYzQ0MzI1MWY3YjM2OWQzYjE1NDRkYjlkNGUKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

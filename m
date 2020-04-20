Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6BCC3815B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 08:51:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A135620A8B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 08:51:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mnHYyhPE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfSKR5Iw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A135620A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D3FR/tFYnVWkbypTT9gbwYSQva1TzqeF3NsNEl3Rwgs=; b=mnHYyhPE/7eA+d
	wQapvm/boOlzG4zzJEjw29gWZpPGqnBSYcgI35O02lH2OZpjFdXoJkmjZTlBHcy4RRb9My/BQzIv1
	/Q4WbMaQyr/94FBPiXh4Mbx0ovFn04nmufZFvGNmyzBYxo9ocxAY/J19aDClB3dD+OFYpkV+ykvWA
	2uUPhnKjFTa1oJ6QFJORTxadCTAkgaRt2JYBrOltpVLkp6i9xJ4RqY1iACpIeESnMlXiDb2cRg5uB
	F5xkt2dNH+SwBisgLhswcm8GoB1OcFezmrHezsZkRTRH4I61L6iv0BCK5Cud4Eu4NNcF5+im9Jk6Y
	UauAPeo8MkRN9MTgGXWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQS90-0000tB-NX; Mon, 20 Apr 2020 08:51:10 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQS8x-0000sL-PN; Mon, 20 Apr 2020 08:51:09 +0000
Received: by mail-lj1-x244.google.com with SMTP id u15so9032455ljd.3;
 Mon, 20 Apr 2020 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=3SQVi3mviWeg4CS1cwBmZBBpKg+8/akNu+v9myGu7iY=;
 b=pfSKR5IwwyY5eTlx21cr9CVFgg/2tp5X45Q5uU83a6eNO1wBR1ZhbSVvJoGQu+w6T6
 gbe9hbXknxGjQxNs3hNXQAa353vErY9Fjwr/23YNbecaMpqR3fn9/NT0k0WzlE2wREUz
 xVWlJcgonaQZ5tYecx8OrTS3p/c3+qO6rFgDHMIyfECBcSo3BYTKlyvX3+YQPqFSoGhS
 lrEcoQpHeW52OHqsEVfEley4PD43VsfgrQXSZ7P/llfITN2HO3HRpoWRh/DwvgjVyBmI
 7pPpY/U74e8AF4FWrLC/SPuyZPC0Mx6AES8kR/GukT5o3atrQd306DTMwh1xdvmUg7PD
 1byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=3SQVi3mviWeg4CS1cwBmZBBpKg+8/akNu+v9myGu7iY=;
 b=bR27CHzChM7zBnfv4mBl+4ds7fbw7XOj65K3Z9kVXvkfuQHNzvpA3ETMSInst6JtMb
 Tn/d5yeGtJ9HwrEKcb6DqiADh/UR4vnmYjOlcUP4TfjjZWQvOIxgGiW7QKS/F5Q5MJed
 2A79gNtZN3v1PpN2yqlERgkHgCMshNf83cLN0WVU+jWRUGqf8HKOI3g/QKP/YRXORvnY
 NCJAwlAUWs0Dwm/RHZFXBcGQpmkdeNiaNgKGeIPpoXCpjSmEWTM6pGsONi4uyGTiREq2
 o5jojxU+QaJAnf5nJ5NicInltBDxh+3TxSVK7XYutB5sTlYb8cJCckKt457+G49iEdid
 O1Qg==
X-Gm-Message-State: AGi0PubR656C+lKiKU1Nmm1aAQKUy2H3LrQvZq72SD2Bs7B2MitGQcZc
 6a6WFLWQIbg3qW621WugZaY=
X-Google-Smtp-Source: APiQypLG8MOu1MOzX5sCFP/mBG9YNnnspTnLAhadXmwEtuT/kuRiMYklHB9w2VlvghfQCoorkmChtg==
X-Received: by 2002:a05:651c:30b:: with SMTP id
 a11mr9387168ljp.164.1587372665259; 
 Mon, 20 Apr 2020 01:51:05 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 73sm479895ljj.72.2020.04.20.01.51.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 01:51:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: How to handle different operating speed for QCA9377 SDIO BT module?
Message-Id: <F208C554-13FE-4943-9DA0-21A280E0DB09@gmail.com>
Date: Mon, 20 Apr 2020 12:51:01 +0400
To: linux-bluetooth@vger.kernel.org, linux-amlogic@lists.infradead.org,
 ath10k@lists.infradead.org
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_015107_822230_05BFD850 
X-CRM114-Status: GOOD (  10.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

UmVzZW5kIHRvIGV4cGFuZCB0aGUgYXVkaWVuY2UgYW5kIGluY2x1ZGUgdGhlIGxpbnV4LWFtbG9n
aWMgYW5kIGF0aDEwayBsaXN0cy4KCj4+Pj4+CgpJ4oCZbSB3b3JraW5nIHdpdGggYSBRQ0E5MzM3
IFNESU8gZGV2aWNlIG9uIGFuIEFuZHJvaWQgKG5vdyBMaW51eCkgc2V0LXRvcCBib3ggd2l0aCBh
biBBbWxvZ2ljIFM5MDVEIFNvQy4KClNESU8gV2lGaSAoYXRoMTBrKSBpcyB3b3JraW5nIHNpbmNl
IDUuNy1yYzEsIGJ1dCB0aGUgQlQgc2lkZSBvZiB0aGUgbW9kdWxlIGlzIHN0aWxsIG1pc3Npbmcu
CgpNb3N0IEFtbG9naWMgZGV2aWNlcyAoOTUlKykgdXNlIEJyb2FkY29tIFNESU8gbW9kdWxlcyB3
aXRoIHRoZSBmb2xsb3dpbmcgZGV2aWNlIHRyZWUgY29udGVudDoKCiZ1YXJ0X0EgewoJYmx1ZXRv
b3RoIHsKCQljb21wYXRpYmxlID0gImJyY20sYmNtNDM0MzgtYnQiOwoJCXNodXRkb3duLWdwaW9z
ID0gPCZncGlvIEdQSU9YXzE3IEdQSU9fQUNUSVZFX0hJR0g+OwoJCW1heC1zcGVlZCA9IDwyMDAw
MDAwPjsKCQljbG9ja3MgPSA8JndpZmkzMms+OwoJCWNsb2NrLW5hbWVzID0gImxwbyI7Cgl9Owp9
OwoKSSBjaGFuZ2VkIHRoZSBjb21wYXRpYmxlIHRvICJxY29tLHFjYTkzNzctYnTigJ0gYW5kIGFw
cGxpZWQgdGhlIGZvbGxvd2luZyBwYXRjaDoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290
aC9oY2lfcWNhLmMgYi9kcml2ZXJzL2JsdWV0b290aC9oY2lfcWNhLmMKaW5kZXggNDM5MzkyYjFj
MDQzLi42ZjAzNTBmYmRjZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2hjaV9xY2Eu
YworKysgYi9kcml2ZXJzL2JsdWV0b290aC9oY2lfcWNhLmMKQEAgLTIwNDYsNiArMjA0Niw3IEBA
IHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhxY2FfcG1fb3BzLCBxY2Ffc3VzcGVuZCwgcWNhX3Jl
c3VtZSk7CgpzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBxY2FfYmx1ZXRvb3RoX29m
X21hdGNoW10gPSB7CiAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20scWNhNjE3NC1idCIgfSwK
KyAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20scWNhOTM3Ny1idCIgfSwKICAgICAgIHsgLmNv
bXBhdGlibGUgPSAicWNvbSx3Y24zOTkwLWJ0IiwgLmRhdGEgPSAmcWNhX3NvY19kYXRhX3djbjM5
OTB9LAogICAgICAgeyAuY29tcGF0aWJsZSA9ICJxY29tLHdjbjM5OTEtYnQiLCAuZGF0YSA9ICZx
Y2Ffc29jX2RhdGFfd2NuMzk5MX0sCiAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20sd2NuMzk5
OC1idCIsIC5kYXRhID0gJnFjYV9zb2NfZGF0YV93Y24zOTk4fSwKClRoaXMgcmVzdWx0cyBpbiBw
cm9iaW5nIHdpdGggZXJyb3JzOiBodHRwOi8vaXguaW8vMmk2UAoKSSBub3RpY2VkICJtYXgtc3Bl
ZWQgPSA8MjAwMDAwMD474oCdIHdoaWxlIGhjaV9xY2EuYyBzZXRzIDMwMDAwMDAuIEkgYXR0ZW1w
dGVkIHRvIHNldCAibWF4LXNwZWVkID0gPDMwMDAwMDA+O+KAnSBidXQgdGhpcyBtYWRlIG5vIGRp
ZmZlcmVuY2UsIHNvIEkgcGF0Y2hlZCBhIGxvd2VyIHZhbHVlIGluIGhjaV9xY2E6CgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ibHVldG9vdGgvaGNpX3FjYS5jIGIvZHJpdmVycy9ibHVldG9vdGgvaGNp
X3FjYS5jCmluZGV4IDZmMDM1MGZiZGNkNi4uYjdlYTFlOWY0OTA0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2JsdWV0b290aC9oY2lfcWNhLmMKKysrIGIvZHJpdmVycy9ibHVldG9vdGgvaGNpX3FjYS5j
CkBAIC0xNjc4LDcgKzE2NzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhjaV91YXJ0X3Byb3Rv
IHFjYV9wcm90byA9IHsKICAgICAgIC5uYW1lICAgICAgICAgICA9ICJRQ0EiLAogICAgICAgLm1h
bnVmYWN0dXJlciAgID0gMjksCiAgICAgICAuaW5pdF9zcGVlZCAgICAgPSAxMTUyMDAsCi0gICAg
ICAgLm9wZXJfc3BlZWQgICAgID0gMzAwMDAwMCwKKyAgICAgICAub3Blcl9zcGVlZCAgICAgPSAy
MDAwMDAwLAogICAgICAgLm9wZW4gICAgICAgICAgID0gcWNhX29wZW4sCiAgICAgICAuY2xvc2Ug
ICAgICAgICAgPSBxY2FfY2xvc2UsCiAgICAgICAuZmx1c2ggICAgICAgICAgPSBxY2FfZmx1c2gs
CgpUaGlzIHJlc3VsdHMgaW4gYW4gYXR0ZW1wdCB0byBsb2FkIGZpcm13YXJlLCBzZWU6IGh0dHA6
Ly9peC5pby8yaTZRIGFuZCB1c2luZyByZW5hbWVkIGZpbGVzIGZyb20gaHR0cHM6Ly9naXRodWIu
Y29tL2JvdW5kYXJ5ZGV2aWNlcy9xY2EtZmlybXdhcmUvdHJlZS9iZC1zZG1hYy1hdGgxMGsvcWNh
IHRoZSBtb2R1bGUgaXMgbm93IG90aGVyd2lzZSB1cC93b3JraW5nIC0gSSBjYW4gc2Nhbi9zZWUv
cGFpciBvdGhlciBCVCBkZXZpY2VzLgoKc2VlOiBodHRwOi8vaXguaW8vMmk2UyBhbmQ6CgpTTUw1
NDQyVFc6fiAjIGJsdWV0b290aGN0bCBzaG93CkNvbnRyb2xsZXIgOTE6MDg6MDA6MDA6MDA6MDAg
KHB1YmxpYykKCU5hbWU6IFNNTDU0NDJUVwoJQWxpYXM6IFNNTDU0NDJUVwoJQ2xhc3M6IDB4MDAw
YzAwMDAKCVBvd2VyZWQ6IHllcwoJRGlzY292ZXJhYmxlOiBubwoJRGlzY292ZXJhYmxlVGltZW91
dDogMHgwMDAwMDBiNAoJUGFpcmFibGU6IHllcwoJVVVJRDogQXVkaW8gU291cmNlICAgICAgICAg
ICAgICAoMDAwMDExMGEtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQoJVVVJRDogR2VuZXJp
YyBBdHRyaWJ1dGUgUHJvZmlsZSAoMDAwMDE4MDEtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZi
KQoJVVVJRDogR2VuZXJpYyBBY2Nlc3MgUHJvZmlsZSAgICAoMDAwMDE4MDAtMDAwMC0xMDAwLTgw
MDAtMDA4MDVmOWIzNGZiKQoJVVVJRDogUG5QIEluZm9ybWF0aW9uICAgICAgICAgICAoMDAwMDEy
MDAtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQoJVVVJRDogQS9WIFJlbW90ZSBDb250cm9s
IFRhcmdldCAoMDAwMDExMGMtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQoJVVVJRDogQS9W
IFJlbW90ZSBDb250cm9sICAgICAgICAoMDAwMDExMGUtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIz
NGZiKQoJVVVJRDogQXVkaW8gU2luayAgICAgICAgICAgICAgICAoMDAwMDExMGItMDAwMC0xMDAw
LTgwMDAtMDA4MDVmOWIzNGZiKQoJTW9kYWxpYXM6IHVzYjp2MUQ2QnAwMjQ2ZDA1MzYKCURpc2Nv
dmVyaW5nOiBubwpBZHZlcnRpc2luZyBGZWF0dXJlczoKCUFjdGl2ZUluc3RhbmNlczogMHgwMAoJ
U3VwcG9ydGVkSW5zdGFuY2VzOiAweDA1CglTdXBwb3J0ZWRJbmNsdWRlczogdHgtcG93ZXIKCVN1
cHBvcnRlZEluY2x1ZGVzOiBhcHBlYXJhbmNlCglTdXBwb3J0ZWRJbmNsdWRlczogbG9jYWwtbmFt
ZQoKU28gaXQgbG9va3MgbGlrZSBoY2lfcWNhLmMgbmVlZHMgbW9kaWZpY2F0aW9uIHRvIGhhbmRs
ZSBtdWx0aXBsZSBvcGVyYXRpbmcgc3BlZWRzLCBwZXJoYXBzIHVzaW5nIHRoZSBtYXgtc3BlZWQg
ZGVzY3JpcHRpb24gZnJvbSBkZXZpY2UtdHJlZSBpZiBhdmFpbGFibGUsIG9yIGRlZmF1bHRpbmcg
dG8gdGhlIGN1cnJlbnQgMzAwMDAwMCB2YWx1ZSBpZiBub3QuCgpJ4oCZbSBub3QgYSBjb2Rpbmcg
ZGV2ZWxvcGVyIHNvIGlmIHNvbWVvbmUgY2FuIHN1Z2dlc3QgYSBwYXRjaCAtIEkgY2FuIHRlc3Qg
YW5kIGNvbmZpcm0gaXQgd29ya3MuIE9yIGlmIHNvbWVvbmUgY2FuIGV4cGxhaW4gaG93IHRoaXMg
c2hvdWxkIGJlIGltcGxlbWVudGVkIEkgd2lsbCBzZWUgaWYgSSBjYW4gZmluZCBzb21lb25lIHRv
IGhlbHAgd2l0aCB0aGUgdGFzay4KCkNocmlzdGlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

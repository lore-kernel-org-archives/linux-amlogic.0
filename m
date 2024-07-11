Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE261C3DA47
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kOPIgEhKp5dQXcF9gCAHDX5W8xQW87C7V5YEKa/832w=; b=nIifqlWdYTAbI/
	2K+zbTYCB4jvViO5l3LdXmn108TyBm7VI98swPLc1KUAJOqHxNqg40Vpj1xGegqPFwGGgH35SYMOt
	OHxnv5PGte478+M7avdScsHIGdefzPlvk+PPWqxydDbUjiUwXjHy9pZrtZR+Swi3ru1fSnCPCzG3i
	mTnoslOqnxQ2sHfqUXE8bM8J7Jyc30HLbwBrFSQnWQ+ULnSzAcfhh4LhHNzEGJ3ZJF9Yv/Au4XBXM
	XAeemqbrKxyURPstIADysR6k2H02R99Pw4knK+RGZqCaI8yiVb0UHHLseajaU8ZcparF7MOH6xgnR
	ZWWqLhfx8J7Y6hidn1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRouC-0000000D80D-1mqJ;
	Thu, 11 Jul 2024 08:11:56 +0000
Received: from mail.brighttrade.pl ([217.61.16.186])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRou8-0000000D7y0-0Sbp
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 08:11:54 +0000
Received: by mail.brighttrade.pl (Postfix, from userid 1002)
	id CFAAD83991; Thu, 11 Jul 2024 10:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=brighttrade.pl;
	s=mail; t=1720685457;
	bh=ScLLIv22FPvQjBaBdaqJtjlkSh+AbT2GCazIm57lmoM=;
	h=Date:From:To:Subject:From;
	b=pSasQPrtvMd0FrS33GwfP3xVZTN9Hi7E/PCxepmB6I8gu5b2fN574VkeILv1ekBN+
	 3oVZDWXECz7OW0Shkx1Hah4/mAB1pC781J9el1LRliX6P22vDYh/JgKh20ido0kFgw
	 4xdjIY8D2SwsURpsiaoLB3rHr7l8zpAEI9K2+2dwWr/zaDPSqdNisHfedthLOakg+E
	 rAcSQqy1NTAK9RFKjj0XUSL+ZQxzfOEdRBmKbcOVoFm8tUAHWOHeLrmUOBQ7XEsxme
	 1XyI6Gwe3HEwdh6kRQJkqBiwmhMUGyqqiQ7JMEePWywFbVXKWfO0PIpgfwEtp6d1J3
	 G19j5cW3FFLYQ==
Received: by mail.brighttrade.pl for <linux-amlogic@lists.infradead.org>; Thu, 11 Jul 2024 08:10:22 GMT
Message-ID: <20240711084500-0.1.1b.3gb2.0.ztporp5n02@brighttrade.pl>
Date: Thu, 11 Jul 2024 08:10:22 GMT
From: "Wiktor Jonis" <wiktor.jonis@brighttrade.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Dostawa_komputer=C3=B3w_?=
X-Mailer: mail.brighttrade.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_011152_842008_592A78FE 
X-CRM114-Status: UNSURE (  -0.16  )
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

RHppZcWEIGRvYnJ5LAoKbWFtIHByenlqZW1ub8WbxIcgcHJ6ZWRzdGF3acSHIG9mZXJ0xJkgbmFz
emVqIGZpcm15LCBrdMOzcmEgc3BlY2phbGl6dWplIHNpxJkgdyBkb3N0YXJjemFuaXUga29tcGxl
dG55Y2ggc3Rhbm93aXNrIGtvbXB1dGVyb3d5Y2ggd3JheiB6IG9wcm9ncmFtb3dhbmllbSBvcmF6
IHBlxYJueW0gd3NwYXJjaWVtIHNlcndpc293eW0uCgpEemnEmWtpIG5hc3p5bSBrb21wbGVrc293
eW0gcm96d2nEhXphbmlvbSBJVCwgemFwZXduaWFteSBQYcWEc3R3dSBzcHJ6xJl0IG5hand5xbxz
emVqIGpha2/Fm2NpLCBnb3Rvd3kgZG8gbmF0eWNobWlhc3Rvd2VnbyB1xbx5Y2lhLCBjbyBwb3p3
YWxhIG5hIGVmZWt0eXduxIUgaSBiZXpwcm9ibGVtb3fEhSBwcmFjxJkuCgpOYXN6ZSBwcm9kdWt0
eSBwb2Nob2R6xIUgb2QgcmVub21vd2FueWNoIHByb2R1Y2VudMOzdywgY28gZ3dhcmFudHVqZSBp
Y2ggdHJ3YcWCb8WbxIcgaSB3eXNva8SFIHd5ZGFqbm/Fm8SHLgoKSmVzdGXFm215IHByemVrb25h
bmksIMW8ZSBuYXN6ZSByb3p3acSFemFuaWEgSVQgbW9nxIUgcHJ6eWN6eW5pxIcgc2nEmSBkbyB6
d2nEmWtzemVuaWEgZWZla3R5d25vxZtjaSBpIGtvbWZvcnR1IHByYWN5IHcgUGHFhHN0d2EgZmly
bWllLiBDaMSZdG5pZSBwcnplZHN0YXdpxJkgc3pjemVnw7PFgm93ZSBpbmZvcm1hY2plIG5hIHRl
bWF0IG5hc3plaiBvZmVydHkgaSBvbcOzd2nEmSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5LgoK
Q3p5IGJ5xYJhYnkgbW/FvGxpd2/Fm8SHIHVtw7N3aWVuaWEgc2nEmSBuYSByb3ptb3fEmSB0ZWxl
Zm9uaWN6bsSFIGx1YiBzcG90a2FuaWUsIGFieSBzemN6ZWfDs8WCb3dvIHByemVkeXNrdXRvd2HE
hyBuYXN6ZSBwcm9wb3p5Y2plPwoKClBvemRyYXdpYW0KV2lrdG9yIEpvbmlzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

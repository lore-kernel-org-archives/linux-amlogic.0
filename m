Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E16C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 May 2022 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NicfVkDtoAcvQ/RlB3ZvTbRQOlCOhBR71rqUl21H6J0=; b=zO726qqYAa7/A4
	leCTBa9+zTVS34/F+EGjNkTOH1hPPm09pFQKs1x1NfI39z0fphZaN8AB/5EFmPcM5VxXJIHS5Qxj0
	8FB92Vf4Zd9BMIsJQ6CgEQu+gAAp06jbj2JJXONOidOK8gWjL2Ai7dqTmTjZzNOFkaowd/ppwmspT
	8Nme4LtZ+jj9PyxxGNiz8M9O9IUiIwbWVsoQk0VPjGBxtHDr+CIhJPs3UGC8KxRqE05W/3XXgRTLO
	tsdMCGtOatCTLwqKI08d7M8FpPnzgoXQc9X47qw5zMp5jjUAiDoQXNzEge4jMin6U/WVREnbVGj6X
	BBZhsRKWSHEOeTVV4xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRWy-007b4D-Da; Tue, 24 May 2022 10:12:48 +0000
Received: from hwsrv-970840.hostwindsdns.com ([104.168.149.109]
 helo=box.indicandustries.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRWw-007b2w-4I
 for linux-amlogic@lists.infradead.org; Tue, 24 May 2022 10:12:47 +0000
Received: from authenticated-user (box.indicandustries.com [104.168.149.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by box.indicandustries.com (Postfix) with ESMTPSA id 3586B10785C
 for <linux-amlogic@lists.infradead.org>; Tue, 24 May 2022 03:25:26 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=box.indicandustries.com; s=mail; t=1653384326;
 bh=V6VCn7WEbqHjVVQ20/+SYu6rwS1WmTHcxX88g+j430s=;
 h=Reply-To:From:To:Subject:Date:From;
 b=fHag0cApoAJ9MZDX6KkuatBPtbaorPb7jZ0z1FXwf5j9xzgyFXxhOgM+nRVLeWVDT
 9qbBNC4KyDgy8sw4QlMyKWT1/UiZgVGJY7SPhyn3ItjM9nMDxi1HluxISBS1wLL/Z4
 yLHUkgJC4qnpDChFkLnL8A0V7QmIt/kn30fI/aS+1LsOLrDP087dkZfySRhw9B7z+3
 QhiUDIqZlCf4tm34d4Dqoz4lrA6YsLpI6M6UwZ692UAoBK4O1uS76yhVNrUHQ3WZIY
 OwJ+KNEW1JineIkS7DitQnTADiXj8UNfv/4ei+ptST4AdDhIgjO2PHrcKypp9wsb90
 t94HWSTVlOj3g==
From: amjad.ali@box.indicandustries.com
To: linux-amlogic@lists.infradead.org
Subject: Hello Sir, I seek your urgent consideration.
Date: 24 May 2022 11:25:25 +0200
Message-ID: <20220524112525.FA2281C0E6B80F8C@box.indicandustries.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_031246_204430_4A647DA6 
X-CRM114-Status: UNSURE (   1.39  )
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
Reply-To: amjalia90@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpHcmVldGluZ3M/IEkgYW0gQW1qYWQuIEkgd29yayB3aXRoIGEgbGVhZGluZyBCaW8g
RmlybS4gIER1ZSB0byAKdGhlIHNldGJhY2tzIG9mIHRoZSBwYW5kZW1pYywgbXkgY29tcGFueSBo
YXMgb3BlbmVkIGEgYmlkIGluIApzZWFyY2ggb2YgbmV3IHN1cHBsaWVycyBmb3IgYmFzaWMgcmF3
IG1hdGVyaWFscyBuZWVkZWQgaW4gCnByb2R1Y3Rpb24uCgpJIGFtIHNlZWtpbmcgYSByZXByZXNl
bnRhdGl2ZcKgYXMgSSBhbSBhIHN0YWZmLCBJIGNhbiBub3QgYmUgCmludm9sdmVkIGRpcmVjdGx5
LiBJdCBtYXkgbm90IGJlIHlvdXIgYXJlYSBvZiB3b3JrIGJ1dCB0aGUgCnByb2ZpdHMgYXJlIGdy
ZWF0IGFuZCBJIHdpbGwgZ3VpZGUgeW91IHRocm91Z2guIEkgaGF2ZSBhbHJlYWR5IApzb3VyY2Vk
IGEgbG9jYWwgc3VwcGxpZXIgZm9yIHRoaXMuIEkgb25seSBuZWVkIGEgcmVsaWFibGUgCnJlcHJl
c2VudGF0aXZlLgoKUGxlYXNlIGdldCBiYWNrIHRvIG1lIHNvIEkgY2FuIGV4cGxhaW4gdGhpcyBp
biBmdWxsLgoKQW1qYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
